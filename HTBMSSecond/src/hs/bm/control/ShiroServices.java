package hs.bm.control;

import java.sql.ResultSet;

import hs.bm.bean.SysUsrUsrInfo;
import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;

public class ShiroServices {
	
	public static SysUsrUsrInfo getUserByName(String username){
		String sql = "select * from sys_usr_usr_info where usr_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{username});
		SysUsrUsrInfo user = null;
		try {
			while(rs.next()){
				user = new SysUsrUsrInfo();
				user.setUsr_name(username);
				user.setUsr_pwd(rs.getString("usr_pwd"));
			}
		} catch (Exception e) {
			user = null;
		}
		dataOperation.close();
		return user;
	}

}
