package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import hs.bm.bean.SysLogLog;
import hs.bm.util.ToJSONStr;

public class GetLogDao {
	private static GetLogDao getLogDao;
	public static GetLogDao getInstance(){
		if(getLogDao==null){
			getLogDao=new GetLogDao();
		}
		return getLogDao;
	}
   public Map<String, List<SysLogLog>> GetLog(){
	   Map<String, List<SysLogLog>> map=new HashMap<String, List<SysLogLog>>();
	   List<SysLogLog> lm=new ArrayList<SysLogLog>();
	   String sql="select * from sys_log_log ORDER BY log_time DESC LIMIT 50";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		ResultSet rs=dataOperation.executeQuery(sql,null);
		try {
			while (rs.next()) {
				SysLogLog sl=new SysLogLog();
				sl.setLog_content(rs.getString("log_content"));
				String time=rs.getString("log_time");
				time=time.split("(" + (char)32 + "|" + (char)9 + ")+")[0];
				sl.setLog_time(time);
				lm.add(sl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		map.put("log", lm);
		dataOperation.close();
		return map;
   }
   
   public int setLog(String log){
	   String sql = "insert into sys_log_log(log_id, log_content, log_time) values (?,?,?)";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
	   int i = dataOperation.executeUpdate(sql, new String[]{
			   UUID.randomUUID().toString().replaceAll("-", ""),
			   log,
			   new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())
	   });
	   dataOperation.close();
	   return i;
   }
	public static void main(String[] args) {
    System.out.println(ToJSONStr.getJSON(GetLogDao.getInstance().GetLog(), null));
	}

}
