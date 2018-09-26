package hs.bm.control;

import java.sql.ResultSet;
import java.sql.SQLException;

import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;

public class ControlServices {
	
	public static int MANAGE = 1;//管理者
	public static int MEMBER = 2;//参与者
	public static int MANAGEANDMEMBER = 3;//同时管理和参与
	public static int NONE = 4;//没有权限

	
	public static String getBaseRole(String username){
		String res = "";
		String sql = "select usr_role from sys_usr_usr_info where usr_name=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{username});
		try {
			if(rs.next()){
				res = rs.getString("usr_role");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return res;
	}
	
	public static int getPrjRole(String username, String prj_id){
		boolean manage = false;
		boolean member = false;
		String sql = "select * from chk_project_info where prj_id=? and prj_charge_man like '%"+username+"%'";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id});
		try {
			if(rs.next()){
				manage = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sql = "select * from chk_project_info where prj_id=? and prj_member like '%"+username+"%'";
		rs = dataOperation.executeQuery(sql, new String[]{prj_id});
		try {
			if(rs.next()){
				member = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		if(manage&&member){
			return MANAGEANDMEMBER;
		}
		if(manage){
			return MANAGE;
		}
		if(member){
			return MEMBER;
		}
		return NONE;
	}
	
	
}
