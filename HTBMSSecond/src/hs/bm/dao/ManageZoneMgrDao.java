package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicManageZone;

public class ManageZoneMgrDao {
	private static ManageZoneMgrDao manageZoneMgrDao;

	public static ManageZoneMgrDao getInstance() {
		if (manageZoneMgrDao == null) {
			manageZoneMgrDao = new ManageZoneMgrDao();
		}
		return manageZoneMgrDao;
	}
	
	public int addZone(DicManageZone dmo) {
		String sql = "insert into dic_manage_zone (zone_id,zone_no,zone_name,manage_id) values(?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmo.getZone_id(), dmo.getZone_no(), dmo.getZone_name(), dmo.getManage_id() });
		dataOperation.close();
		return i;
	}
	
	
	public List<DicManageZone> initTable() {
		List<DicManageZone> ll = new ArrayList<DicManageZone>();
		String sql = "SELECT a.zone_id,a.zone_no,a.zone_name,a.manage_id,b.manage_no,b.manage_name FROM dic_manage_zone a, dic_manage_org b where a.manage_id = b.manage_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {});
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicManageZone dmo = new DicManageZone();
				dmo.setZone_id(rs.getString("zone_id"));
				dmo.setZone_no(rs.getString("zone_no"));
				dmo.setZone_name(rs.getString("zone_name"));
				dmo.setManage_id(rs.getString("manage_id"));
				dmo.setManage_no(rs.getString("manage_no"));
				dmo.setManage_name(rs.getString("manage_name"));
				ll.add(dmo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return ll;
	}
	
	public int editZone(DicManageZone dmo) {
		String sql = "UPDATE dic_manage_zone set zone_no=?,zone_name=? where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmo.getZone_no(), dmo.getZone_name(), dmo.getZone_id() });
		dataOperation.close();
		return i;
	}

	public int delZone(String zone_id) {
		String sql = "delete from dic_manage_zone where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { zone_id });
		dataOperation.close();
		return i;
	}
	
}
