package hs.bm.server;

import java.io.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import hs.bm.bean.BrgHealthStatistic;
import hs.bm.bean.BrgSystem;
import hs.bm.bean.BrgWeightStatistic;
import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;

public class DownloadFromFTP implements Runnable{
	private static boolean state=false;
	private static FTPClient ftpClient = new FTPClient();
	public boolean connect(String hostname, String username, String password) throws IOException
	{
		// 连接到FTP服务器
		ftpClient.connect(hostname);
		// 如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器
		if (FTPReply.isPositiveCompletion(ftpClient.getReplyCode()))
		{
			if (ftpClient.login(username, password))
			{
				return true;
			}
		}
		disconnect();
		return false;
	}
	
	
	public void disconnect() throws IOException
	{
		if (ftpClient.isConnected())
		{
			ftpClient.disconnect();
		}
	}
	
	 public List<BrgSystem> getBSAll(){
	    	List<BrgSystem> lb=new ArrayList<BrgSystem>();
	    	Connection conn = MyDataSource.getInstance().getConnection();
			MyDataOperation mdo = new MyDataOperation(conn);
			String sql="select * from brg_system";
			ResultSet rs=mdo.executeQuery(sql,null);
			try {
				while (rs.next()) {
					BrgSystem bs=new BrgSystem();
					bs.setBridge_id(rs.getString("bridge_id"));
					bs.setDir_name(rs.getString("dir_name"));
					bs.setId(rs.getString("id"));
					bs.setMode(rs.getString("mode"));
					lb.add(bs);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				mdo.close();
			}
			return lb;
	    }
	 public List<String> getDirList(){
		 List<BrgSystem> lb=getBSAll();
		 List<String> ls=new ArrayList<>();
		 for(BrgSystem bs:lb){
			 ls.add(bs.getDir_name());
		 }
		 return ls;
	 }
	 public List<BrgWeightStatistic> getWeightList(String bridge_id){
		 List<BrgWeightStatistic> lb=new ArrayList<BrgWeightStatistic>();
	    	Connection conn = MyDataSource.getInstance().getConnection();
			MyDataOperation mdo = new MyDataOperation(conn);
			String sql="select * from brg_weight_statistic where bridge_id=? and is_download=0";
			ResultSet rs=mdo.executeQuery(sql,new String[]{bridge_id});
			try {
				while (rs.next()) {
					BrgWeightStatistic bs=new BrgWeightStatistic();
					bs.setBridge_id(rs.getString("bridge_id"));
					bs.setR_id(rs.getString("r_id"));
					bs.setData_file(rs.getString("data_file"));
					bs.setEnd_time(rs.getString("end_time"));
					bs.setFile_size(rs.getInt("file_size"));
					bs.setFile_time(rs.getString("file_time"));
					bs.setStart_time(rs.getString("start_time"));
					lb.add(bs);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				mdo.close();
			}
			return lb;
	 }
	 public List<BrgHealthStatistic> getHealthList(String bridge_id){
		 List<BrgHealthStatistic> lb=new ArrayList<BrgHealthStatistic>();
	    	Connection conn = MyDataSource.getInstance().getConnection();
			MyDataOperation mdo = new MyDataOperation(conn);
			String sql="select * from brg_health_statistic where bridge_id=? and is_download=0";
			ResultSet rs=mdo.executeQuery(sql,new String[]{bridge_id});
			try {
				while (rs.next()) {
					BrgHealthStatistic bs=new BrgHealthStatistic();
					bs.setBridge_id(rs.getString("bridge_id"));
					bs.setR_id(rs.getString("r_id"));
					bs.setData_file(rs.getString("data_file"));
					bs.setEnd_time(rs.getString("end_time"));
					bs.setFile_size(rs.getInt("file_size"));
					bs.setFile_time(rs.getString("file_time"));
					bs.setStart_time(rs.getString("start_time"));
					lb.add(bs);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				mdo.close();
			}
			return lb;
	 }
	 public List<String> getFileList(String bridge_id,String mode){
		 List<String> ls=new ArrayList<>();
		 if(mode.equals("weight")){
			 List<BrgWeightStatistic> lb=getWeightList(bridge_id);
			 for(BrgWeightStatistic bs:lb){
				 ls.add(bs.getData_file());
			 }
		 }else if(mode.equals("health")){
			 List<BrgHealthStatistic> lb=getHealthList(bridge_id);
			 for(BrgHealthStatistic bs:lb){
				 ls.add(bs.getData_file());
			 }
		 }
		 return ls;
	 }
	 
	 public Map<String, String> getFileMap(String bridge_id,String mode){
		 Map<String, String> map=new HashMap<>();
		 if(mode.equals("weight")){
			 List<BrgWeightStatistic> lb=getWeightList(bridge_id);
			 for(BrgWeightStatistic bs:lb){
				 map.put(bs.getData_file(), bs.getR_id());
			 }
		 }else if(mode.equals("health")){
			 List<BrgHealthStatistic> lb=getHealthList(bridge_id);
			 for(BrgHealthStatistic bs:lb){
				 map.put(bs.getData_file(), bs.getR_id());
			 }
		 }
		 return map;
	 }
	 public int updateIsDownload(String r_id,String mode){
		 String sql = "";
		 if(mode.equals("weight")){
			 sql="update brg_weight_statistic set is_download=1 where r_id=?";
		 }else if(mode.equals("health")){
			 sql="update brg_health_statistic set is_download=1 where r_id=?";
		 }
		 if(sql.equals("")){
			 return 0;
		 }
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		Object[] obj=new Object[]{r_id};
		int i=dataOperation.executeUpdate(sql, obj);
		dataOperation.close();
		return i;
	 }
	 
	 public List<String> getFtpDirList(){
		 List<String> ls=new ArrayList<>();
		 if(!ftpClient.isConnected()){
		 try {
			 //connect("10.154.39.197", "htbms", "htbms123");
			 connect("115.159.78.246", "chen", "chen");
			} catch (IOException e) {
				e.printStackTrace();
			}
		 }
		 try {
			ftpClient.changeWorkingDirectory("/");
			FTPFile[] files =ftpClient.listFiles();  
            for(FTPFile file:files){
            	ls.add(file.getName());
            }
		} catch (IOException e) {
			e.printStackTrace();
		}
		 return ls;
	 }
	 
	   @Override
		public void run(){
		   System.out.println("开始本次下载"+new Date());
			boolean bl=false;
			try {
				//bl=connect("10.154.39.197", "htbms", "htbms123");
				bl=connect("115.159.109.101", "htbms", "htbms123");
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(bl){
				System.out.println("连接ftp服务器成功");
			}else{
				System.out.println("连接ftp服务器失败");
				return;
			}
			List<BrgSystem> lb=getBSAll();
			for(BrgSystem bs:lb){
				String dir=bs.getDir_name();
				try {
					boolean b=false;
					List<String> ftpdirlist=getFtpDirList();
					if(!ftpdirlist.contains(dir)){
						System.out.println("当前目录不存在:"+dir);
						continue;
					}else{
						b=ftpClient.changeWorkingDirectory("/"+dir+"/");
					}
					if(b){
						System.out.println("开始下载目录:"+dir);
						String mode="health";
						if(dir.toLowerCase().endsWith("w")){
							mode="weight";
						}
						Map<String, String> map=getFileMap(bs.getBridge_id(), mode);
						FTPFile[] files =ftpClient.listFiles();  
			            for(FTPFile file:files){  
			            	if(!map.containsKey(file.getName())){
			            		continue;
			            	}
			            	File f1=new File("D:\\htbms\\"+dir+"\\");
			            	if(!f1.exists()){
			            		f1.mkdirs();
			            	}
			            	File localFile = new File("D:\\htbms\\"+dir+"\\"+file.getName());    
		                    OutputStream is = new FileOutputStream(localFile); 
		                    boolean dl=ftpClient.retrieveFile(file.getName(), is);
		                    
		                    if(dl&&localFile.length()==file.getSize()){
		                    	System.out.println("下载成功----"+dir+"---"+file.getName()+"---"+file.getSize());
		                    	int i=updateIsDownload(map.get(file.getName()), mode);
		                    	if(i>0){
		                    		System.out.println("修改入库成功");
		                    		/*if(ftpClient.deleteFile("/"+dir+"/"+file.getName())){
		                    			System.out.println("删除"+file.getName()+"成功");
		                    		}*/
		                    	}
		                    }
		                    is.close();
			            } 
					}
				} catch (IOException e) {
					e.printStackTrace();
				}finally {
					try {
						disconnect();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			System.out.println("结束本次下载"+new Date());
	 }
	public static void main(String[] args) {
		
		ScheduledThreadPoolExecutor schedule=new ScheduledThreadPoolExecutor(5);
		schedule.scheduleWithFixedDelay(new DownloadFromFTP(), 0, 7, TimeUnit.DAYS);
	}

}
