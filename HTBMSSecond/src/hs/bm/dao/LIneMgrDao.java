package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicHwInfo;

public class LIneMgrDao {
	private static LIneMgrDao lIneMgrDao;

	public static LIneMgrDao getInstance() {
		if (lIneMgrDao == null) {
			lIneMgrDao = new LIneMgrDao();
		}
		return lIneMgrDao;
	}

	public int addHighWay(DicHwInfo dhi) {
		String sql = "insert into dic_hw_info (highway_id,highway_no,highway_name,highway_level) values(?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dhi.getHighway_id(), dhi.getHighway_no(), dhi.getHighway_name(),
				dhi.getHighway_level()});
		dataOperation.close();
		return i;
	}
	
	
	public List<DicHwInfo> initTable() {
		List<DicHwInfo> ll = new ArrayList<DicHwInfo>();
		String sql = "select highway_id,highway_no,highway_name,highway_level from dic_hw_info";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {});
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicHwInfo dhi = new DicHwInfo();
				dhi.setHighway_id(rs.getString("highway_id"));
				dhi.setHighway_no(rs.getString("highway_no"));
				dhi.setHighway_name(rs.getString("highway_name"));
				dhi.setHighway_level(rs.getString("highway_level"));
				ll.add(dhi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return ll;
	}
	
	public int editHighWay(DicHwInfo dhi) {
		String sql = "UPDATE dic_hw_info set highway_no=?,highway_name=?,highway_level=? where highway_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dhi.getHighway_no() ,dhi.getHighway_name(), dhi.getHighway_level(),dhi.getHighway_id() });
		dataOperation.close();
		return i;
	}

	public int delHighway(String highway_id) {
		String sql = "delete from dic_hw_info where highway_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { highway_id });
		dataOperation.close();
		return i;
	}
}
