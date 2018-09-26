package hs.bm.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;


import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgHealthStatistic;
import hs.bm.bean.BrgWeightStatistic;
import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;

public class FtpFileUtil {
	/**
	*  检验指定路径的文件是否存在ftp服务器中
	* @param filePath--指定绝对路径的文件
	* @param user--ftp服务器登陆用户名
	* @param passward--ftp服务器登陆密码
	* @param ip--ftp的IP地址
	* @param port--ftp的端口号
	* @return
	*/

	public static boolean isFileExist(String filePath){
		File file = new File(filePath);
		if(file.exists()){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isFTPFileExist(String filePath,String user,String passward,String ip){
	        FTPClient ftp = new FTPClient();
	        try {
	        	//
	            ftp.connect(ip);
	            // 登陆    
	            ftp.login(user, passward);
	           // 检验登陆操作的返回码是否正确
	            if(!FTPReply.isPositiveCompletion(ftp.getReplyCode())){
	                ftp.disconnect();
	                return false;
	            }
	            
	            ftp.enterLocalActiveMode();
	            // 设置文件类型为二进制，与ASCII有区别
	            ftp.setFileType(FTP.BINARY_FILE_TYPE);
	            // 设置编码格式
	            ftp.setControlEncoding("GBK");
	            
	            // 提取绝对地址的目录以及文件名
	            filePath = filePath.replace("ftp://"+ip+"/", "");
	            String dir = filePath.substring(0, filePath.lastIndexOf("/"));
	            String file = filePath.substring(filePath.lastIndexOf("/")+1);
	            
	            // 进入文件所在目录，注意编码格式，以能够正确识别中文目录
	            ftp.changeWorkingDirectory(new String(dir.getBytes("GBK"),FTP.DEFAULT_CONTROL_ENCODING));

	            // 检验文件是否存在
	            InputStream is = ftp.retrieveFileStream(new String(file.getBytes("GBK"),FTP.DEFAULT_CONTROL_ENCODING));
	            if(is == null || ftp.getReplyCode() == FTPReply.FILE_UNAVAILABLE){
	                return false;
	            }
	            
	            if(is != null){
	                is.close();
	                ftp.completePendingCommand();
	            }
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            if(ftp != null){
	                try {
	                    ftp.disconnect();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	        return false;
	}
	 public List<BrgHealthStatistic> getHealthList(){
		 List<BrgHealthStatistic> lb=new ArrayList<BrgHealthStatistic>();
	    	Connection conn = MyDataSource.getInstance().getConnection();
			MyDataOperation mdo = new MyDataOperation(conn);
			String sql="select * from brg_health_statistic where is_download=0 and file_time between '2017-11-01' and '2018-02-01'";
			ResultSet rs=mdo.executeQuery(sql,new String[]{});
			try {
				while (rs.next()) {
					BrgHealthStatistic bs=new BrgHealthStatistic();
					bs.setBridge_id(rs.getString("bridge_id"));
					String bridge_id = rs.getString("bridge_id");
					bs.setR_id(rs.getString("r_id"));
					bs.setData_file(rs.getString("data_file"));
					bs.setEnd_time(rs.getString("end_time"));
					bs.setFile_size(rs.getInt("file_size"));
					bs.setFile_time(rs.getString("file_time"));
					bs.setStart_time(rs.getString("start_time"));
					bs.setBridge_no(this.getBrgCardAdminIdData(bridge_id).get(0).getBridge_no());
					lb.add(bs);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				mdo.close();
			}
			return lb;
	 }
	 
	 public List<BrgWeightStatistic> getWeightList(){
		 List<BrgWeightStatistic> lb=new ArrayList<BrgWeightStatistic>();
	    	Connection conn = MyDataSource.getInstance().getConnection();
			MyDataOperation mdo = new MyDataOperation(conn);
			String sql="select * from brg_weight_statistic where is_download=0 and file_time between '2017-11-01' and '2018-02-01'";
			ResultSet rs=mdo.executeQuery(sql,new String[]{});
			try {
				while (rs.next()) {
					BrgWeightStatistic bs=new BrgWeightStatistic();
					bs.setBridge_id(rs.getString("bridge_id"));
					String bridge_id = rs.getString("bridge_id");
					bs.setR_id(rs.getString("r_id"));
					bs.setData_file(rs.getString("data_file"));
					bs.setEnd_time(rs.getString("end_time"));
					bs.setFile_size(rs.getInt("file_size"));
					bs.setFile_time(rs.getString("file_time"));
					bs.setStart_time(rs.getString("start_time"));
					bs.setBridge_no(this.getBrgCardAdminIdData(bridge_id).get(0).getBridge_no());
					lb.add(bs);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				mdo.close();
			}
			return lb;
	 }
	 
	 public int deleteBrgWeightStatistic(String r_id){
	    	Connection conn = MyDataSource.getInstance().getConnection();
			MyDataOperation mdo = new MyDataOperation(conn);
			String sql="delete from brg_weight_statistic where r_id=?";
			int i =mdo.executeUpdate(sql, new Object[]{r_id});
			mdo.close();
			return i;
	 }
	 public int deleteBrgHealthStatistic(String r_id){
	    	Connection conn = MyDataSource.getInstance().getConnection();
			MyDataOperation mdo = new MyDataOperation(conn);
			String sql="delete from brg_health_statistic where r_id=?";
			int i =mdo.executeUpdate(sql, new Object[]{r_id});
			mdo.close();
			return i;
	 }
		public ArrayList<BrgCardAdminId> getBrgCardAdminIdData(String bridge_id)
		{
			ArrayList<BrgCardAdminId> brgCardAdminId = new ArrayList<BrgCardAdminId>();
			String sql = " SELECT * FROM brg_card_admin_id WHERE bridge_id=? ";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
			ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
			try
			{
				while (rs.next())
				{
					BrgCardAdminId entity = new BrgCardAdminId();
					entity.setBridge_no(Nullchange.NulltoString(rs.getString("bridge_no")));
					entity.setBridge_name(Nullchange.NulltoString(rs.getString("bridge_name")));
					entity.setCharge_man(Nullchange.NulltoString(rs.getString("charge_man")));
					entity.setFill_date(Nullchange.NulltoString(rs.getString("fill_date")));
					entity.setFill_man(Nullchange.NulltoString(rs.getString("fill_man")));
					entity.setZone_id(Nullchange.NulltoString(rs.getString("zone_id")));
					brgCardAdminId.add(entity);
				}
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
			dataOperation.close();
			return brgCardAdminId;
		}
	public static void main(String[] args) {
		//"115.159.109.101", "htbms", "htbms123"
		///G25LR0040320800S/2018-01-03 22-18-13.rar
		FtpFileUtil fileUtil = new FtpFileUtil();
		//boolean boolean2 = FtpFileUtil.isFTPFileExist("ftp://115.159.109.101/G25LR0040320800S/2018-04-11 17-40-25.rar", "htbms", "htbms123", "115.159.109.101");
		List<BrgHealthStatistic> healthStatistics = fileUtil.getHealthList();
		List<BrgWeightStatistic> weightStatistics = fileUtil.getWeightList();
		boolean flag = fileUtil.isFileExist("D:/htbms/S38LR0710320281W/2017-12-05 08-20-59.txt");
		
	   
		for(BrgHealthStatistic healthStatistic : healthStatistics){
			 String base_path = "ftp://115.159.109.101/"+healthStatistic.getBridge_no()+"S/"+healthStatistic.getData_file();
			 System.out.println(base_path);
	    	boolean boolean1 = FtpFileUtil.isFTPFileExist("ftp://115.159.109.101/"+healthStatistic.getBridge_no()+"S/"+healthStatistic.getData_file(), "htbms", "htbms123", "115.159.109.101");
		    if(!boolean1){
		    	int i = fileUtil.deleteBrgHealthStatistic(healthStatistic.getR_id());
		    	if(i>0){
		    		System.out.println("删除成功,桥梁主键为："+healthStatistic.getR_id());
		    	}
		    }
	    }
		
		for(BrgWeightStatistic brgWeightStatistic : weightStatistics){
			 String base_path = "ftp://115.159.109.101/"+brgWeightStatistic.getBridge_no()+"W/"+brgWeightStatistic.getData_file();
			 System.out.println(base_path);
	    	boolean boolean1 = FtpFileUtil.isFTPFileExist("ftp://115.159.109.101/"+brgWeightStatistic.getBridge_no()+"W/"+brgWeightStatistic.getData_file(), "htbms", "htbms123", "115.159.109.101");
		    if(!boolean1){
		    	int i = fileUtil.deleteBrgWeightStatistic(brgWeightStatistic.getR_id());
		    	if(i>0){
		    		System.out.println("删除成功,桥梁主键为："+brgWeightStatistic.getR_id());
		    	}
		    }
	    }
	}
}
