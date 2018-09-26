package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicManageOrg;

public class ManageOrgMgrDao {
	private static ManageOrgMgrDao manageOrgMgrDao;

	public static ManageOrgMgrDao getInstance() {
		if (manageOrgMgrDao == null) {
			manageOrgMgrDao = new ManageOrgMgrDao();
		}
		return manageOrgMgrDao;
	}
	
	public int addManage(DicManageOrg dmo) {
		String sql = "insert into dic_manage_org (manage_id,manage_no,manage_name,manage_short_name) values(?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmo.getManage_id(), dmo.getManage_no(), dmo.getManage_name(), dmo.getManage_short_name() });
		dataOperation.close();
		return i;
	}
	
	
	public List<DicManageOrg> initTable() {
		List<DicManageOrg> ll = new ArrayList<DicManageOrg>();
		String sql = "select * from dic_manage_org ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {});
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicManageOrg dmo = new DicManageOrg();
				dmo.setManage_id(rs.getString("manage_id"));
				dmo.setManage_no(rs.getString("manage_no"));
				dmo.setManage_name(rs.getString("manage_name"));
				dmo.setManage_short_name(rs.getString("manage_short_name"));
				ll.add(dmo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return ll;
	}
	
	public int editManage(DicManageOrg dmo) {
		String sql = "UPDATE dic_manage_org set manage_no=?,manage_name=?,manage_short_name=? where manage_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmo.getManage_no(), dmo.getManage_name(), dmo.getManage_short_name(), dmo.getManage_id() });
		dataOperation.close();
		return i;
	}

	public int delManage(String manage_id) {
		String sql = "delete from dic_manage_org where manage_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { manage_id });
		dataOperation.close();
		return i;
	}
	
}
