package hs.bm.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class LogDao {

	private static LogDao logdao;
	public static LogDao getInstance(){
		if(logdao==null){
			logdao=new LogDao();
		}
		return logdao;
	}
	
	public int addLogInfo(String log_user,String log_type,String log_state,String log_info){
		int i=0;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String log_id=UUID.randomUUID().toString().replaceAll("-", "");
		String log_time=sdf.format(new Date());
		String sql="insert into log_info(log_id,log_user,log_time,log_type,log_state,log_info) values(?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		i=dataOperation.executeUpdate(sql, new String[]{log_id,log_user,log_time,log_type,log_state,log_info});
		dataOperation.close();
		return i;
	}
}
