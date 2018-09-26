package hs.bm.server;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.tools.ant.taskdefs.Get;

import com.sun.xml.internal.ws.api.addressing.AddressingPropertySet;

import hs.bm.bean.BrgGpsStatistic;
import hs.bm.bean.BrgHealthStatistic;
import hs.bm.bean.BrgSystem;
import hs.bm.bean.BrgWeightStatistic;
import hs.bm.bean.BrgWindStatistic;
import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;

public class GetFTPFile implements Runnable{
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
    public int addWeightData(BrgWeightStatistic bws){
    	String sql = "insert into brg_weight_statistic(r_id,bridge_id,start_time,end_time,data_file,file_size,file_time) values(?,?,?,?,?,?,now())";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String uuid=UUID.randomUUID().toString();
		Object[] obj=new Object[]{uuid,bws.getBridge_id(),bws.getStart_time(),bws.getEnd_time(),bws.getData_file(),bws.getFile_size()};
		int i=dataOperation.executeUpdate(sql, obj);
		dataOperation.close();
		return i;
    }
    public int addHealthData(BrgHealthStatistic bhs){
   	 	String sql = "insert into brg_health_statistic(r_id,bridge_id,start_time,end_time,data_file,file_size,file_time) values(?,?,?,?,?,?,now())";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String uuid=UUID.randomUUID().toString();
		Object[] obj=new Object[]{uuid,bhs.getBridge_id(),bhs.getStart_time(),bhs.getEnd_time(),bhs.getData_file(),bhs.getFile_size()};
		int i=dataOperation.executeUpdate(sql, obj);
		dataOperation.close();
		return i;
   }
    public int addWindData(BrgWindStatistic bwis) {
    	String sql = "insert into brg_wind_statistic(r_id,bridge_id,start_time,end_time,data_file,file_size,file_time) values(?,?,?,?,?,?,now())";
    	MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
    	String uuid = UUID.randomUUID().toString();
    	Object[] obj = new Object[] {uuid,bwis.getBridge_id(),bwis.getStart_time(),bwis.getEnd_time(),bwis.getData_file(),bwis.getFile_size()};
    	int i = dataOperation.executeUpdate(sql, obj);
    	dataOperation.close();
    	return i;
    }
    public int addGpsData(BrgGpsStatistic bgs) {
    	String sql = "insert into brg_gps_statistic(r_id,bridge_id,start_time,end_time,data_file,file_size,file_time) values(?,?,?,?,?,?,now())";
    	MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
    	String uuid = UUID.randomUUID().toString();
    	Object[] obj = new Object[] {uuid,bgs.getBridge_id(),bgs.getStart_time(),bgs.getEnd_time(),bgs.getData_file(),bgs.getFile_size()};
    	int i = dataOperation.executeUpdate(sql, obj);
    	dataOperation.close();
    	return i;
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
    public void List(String pathName) throws IOException{  
        if(pathName.startsWith("/")&&pathName.endsWith("/")){  
            String directory = pathName;  
            //更换目录到当前目录  
            ftpClient.changeWorkingDirectory(directory);  
            FTPFile[] files =ftpClient.listFiles();  
            for(FTPFile file:files){  
                if(file.isFile()){  
                    System.out.println(file.getName());
                }else if(file.isDirectory()){  
                    List(directory+file.getName()+"/");  
                }  
            }  
        }  
    } 
    public Set<String> getDataSet(String bridge_id,String mode){
    	Set<String> set=new HashSet<>();
    	String sql="";
    	if(mode.equals("s")){
    		sql="select * from brg_health_statistic where bridge_id=?";
    	}else if(mode.equals("w")){
    		sql="select * from brg_weight_statistic where bridge_id=?";
    	}else if(mode.equals("g")) {
    		sql = "select * from brg_gps_statistic where bridge_id=?";
    	}else{
    		return set;
    	}
    	Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn);
		ResultSet rs=mdo.executeQuery(sql,new String[]{bridge_id});
		try {
			while (rs.next()) {
				set.add(rs.getString("start_time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
		return set;
    }
    public String getDateFormat(String s){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
    	SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String re="*";
    	try {
    		Date date=sdf.parse(s);
    		re=sdf1.format(date);
		} catch (Exception e) {
			return "*";
		}
    	return re;
    }
    public String getGpsDateFormat(String s){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
    	SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String re="*";
    	try {
    		Date date=sdf.parse(s);
    		re=sdf1.format(date);
		} catch (Exception e) {
			return "*";
		}
    	return re;
    }
    public String getEndTime(String start){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	try {
			Date date=sdf.parse(start);
			long time=date.getTime();
			long end=time+30*60*1000;
			Date date2=new Date(end);
			return sdf.format(date2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	return "*";
    }
	@Override
	public void run() {
		if(state){
			return;
		}else{
			state=true;
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
				
				String dir="/"+bs.getDir_name()+"/";
				Set<String> set=getDataSet(bs.getBridge_id(), bs.getMode());
			
				try {
					boolean b=ftpClient.changeWorkingDirectory(dir);
					if(!b){
						continue;
					}
					
					FTPFile[] files = ftpClient.listFiles();
					for(FTPFile file:files){
						if(file.isDirectory()){
							continue;
						}
						if((int)file.getSize()/1024==0){
							continue;
						}
						String fn=file.getName();
						fn=fn.substring(0,fn.lastIndexOf("."));
						String re;
						if(fn.startsWith("GPS")) {
							fn = fn.substring(5);
							re = getGpsDateFormat(fn);
						}else {
							re=getDateFormat(fn);
						}
							
						
						if(re.equals("*")||set.contains(re)){
							continue;
						}
						
						if(bs.getMode().equals("s")){
							BrgHealthStatistic bw=new BrgHealthStatistic();
							bw.setBridge_id(bs.getBridge_id());
							bw.setData_file(file.getName());
							int fs=(int)file.getSize()/1024+1;
							bw.setFile_size(fs);
							bw.setStart_time(re);
							bw.setEnd_time(getEndTime(re));
							String uuid=UUID.randomUUID().toString();
							bw.setR_id(uuid);
							addHealthData(bw);
						}else if(bs.getMode().equals("w")){
							BrgWeightStatistic bw=new BrgWeightStatistic();
							bw.setBridge_id(bs.getBridge_id());
							bw.setData_file(file.getName());
							int fs=(int)file.getSize()/1024+1;
							bw.setFile_size(fs);
							bw.setStart_time(re);
							bw.setEnd_time(getEndTime(re));
							String uuid=UUID.randomUUID().toString();
							bw.setR_id(uuid);
							addWeightData(bw);
						}else if(bs.getMode().equals("g")) {					
							BrgGpsStatistic bw = new BrgGpsStatistic();
							bw.setBridge_id(bs.getBridge_id());
							bw.setData_file(file.getName());
							int fs = (int)file.getSize()/1024+1;
							bw.setFile_size(fs);
							bw.setStart_time(re);
							bw.setEnd_time(getEndTime(re));
							String uuid = UUID.randomUUID().toString();
							bw.setR_id(uuid);
							addGpsData(bw);
						}else if(bs.getMode().equals("f")) {
							BrgWindStatistic bw = new BrgWindStatistic();
							bw.setBridge_id(bs.getBridge_id());
							bw.setData_file(file.getName());
							int fs = (int)file.getSize()/1024+1;
							bw.setFile_size(fs);
							bw.setStart_time(re);
							bw.setEnd_time(getEndTime(re));
							String uuid = UUID.randomUUID().toString();
							bw.setR_id(uuid);
							addWindData(bw);
						}
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			try {
				disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
			state=false;
			System.out.println("本次ftp入库结束"+new Date().toString());
		}
	}
	public static void main(String[] args) {
		new GetFTPFile().run();
	}

}
