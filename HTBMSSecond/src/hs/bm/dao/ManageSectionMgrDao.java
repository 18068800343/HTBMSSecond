package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicManageSection;

public class ManageSectionMgrDao {
	private static ManageSectionMgrDao manageSectionMgrDao;

	public static ManageSectionMgrDao getInstance() {
		if (manageSectionMgrDao == null) {
			manageSectionMgrDao = new ManageSectionMgrDao();
		}
		return manageSectionMgrDao;
	}
	
	public int addSection(DicManageSection dmo) {
		String sql = "insert into dic_manage_section (section_id,section_no,section_name,manage_id) values(?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmo.getSection_id(), dmo.getSection_no(), dmo.getSection_name(), dmo.getManage_id() });
		dataOperation.close();
		return i;
	}
	
	
	public List<DicManageSection> initTable() {
		List<DicManageSection> ll = new ArrayList<DicManageSection>();
		String sql = "SELECT a.section_id,a.section_no,a.section_name,a.manage_id,b.manage_no,b.manage_name FROM dic_manage_section a, dic_manage_org b where a.manage_id = b.manage_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {});
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicManageSection dmo = new DicManageSection();
				dmo.setSection_id(rs.getString("section_id"));
				dmo.setSection_no(rs.getString("section_no"));
				dmo.setSection_name(rs.getString("section_name"));
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
	
	public int editSection(DicManageSection dmo) {
		String sql = "UPDATE dic_manage_section set section_no=?,section_name=? where section_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmo.getSection_no(), dmo.getSection_name(), dmo.getSection_id() });
		dataOperation.close();
		return i;
	}

	public int delSection(String section_id) {
		String sql = "delete from dic_manage_section where section_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { section_id });
		dataOperation.close();
		return i;
	}
	
}
