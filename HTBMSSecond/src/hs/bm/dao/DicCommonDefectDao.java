package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import hs.bm.bean.DicBrgStructComponentDef;
import hs.bm.bean.DicMbrDefectDef;
import hs.bm.bean.DicMbrDefectF;

public class DicCommonDefectDao {

	
	private static DicCommonDefectDao dicCommonDefectDao;

	public static DicCommonDefectDao getInstance() {
		if (dicCommonDefectDao == null) {
			dicCommonDefectDao = new DicCommonDefectDao();
		}
		return dicCommonDefectDao;
	}
	
	
	/**
	 * 初始化部件和病害关系
	 * 
	 * @author mao
	 * @param defect_id
	 * @return List<DicMbrDefectDef>
	 */
	public List<Map<String, String>> initMbrDefectDef(String component_id) {
		String sql = "select dd.component_id,dd.defect_f_id,dt.defect_f_name,dd.ratio from dic_mbr_defect_f dt,dic_mbr_defect_def dd where dd.component_id=? and dt.defect_f_id=dd.defect_f_id ORDER BY dd.ratio";
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { component_id });
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("defect_f_id", rs.getString("defect_f_id"));
				map.put("defect_f_name", rs.getString("defect_f_name"));
				map.put("ratio", rs.getString("ratio"));
				ll.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	
	/** 初始化部件列表组 */
	public List<DicBrgStructComponentDef> initComponentItems(String specification) {
		List<DicBrgStructComponentDef> ll = new ArrayList<DicBrgStructComponentDef>();
		String sql = "select component_id,component_name,specification from dic_brg_struct_component_def where specification like '%?%'";
		sql = sql.replace("?", specification);
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicBrgStructComponentDef dbs = new DicBrgStructComponentDef();
				dbs.setComponent_id(rs.getString("component_id"));
				dbs.setComponent_name(rs.getString("component_name"));
				dbs.setSpecification(rs.getString("specification"));
				ll.add(dbs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}


	public List<DicMbrDefectF> initDefectOption() {
		List<DicMbrDefectF> ll = new ArrayList<DicMbrDefectF>();
		String sql = "select defect_f_id,defect_f_name from dic_mbr_defect_f";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicMbrDefectF dmd = new DicMbrDefectF();
				dmd.setDefect_f_id(rs.getString("defect_f_id"));
				dmd.setDefect_f_name(rs.getString("defect_f_name"));
				ll.add(dmd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	/** 保存部件和病害的关系 */
	public int saveMbrDefectDef(List<DicMbrDefectDef> ll, String component_id) {
		String sql = "delete from dic_mbr_defect_def where component_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = dataOperation.executeUpdate(sql, new String[] { component_id });
		if (i == -1) {
			dataOperation.close();
			return i;
		}
		sql = "insert into dic_mbr_defect_def set component_id=?,defect_f_id=?,ratio=?";
		for (int j = 0; j < ll.size(); j++) {
			i = dataOperation.executeUpdate(sql,
					new Object[] { component_id, ll.get(j).getDefect_f_id(), ll.get(j).getRatio() });
			if (i == -1) {
				break;
			}
		}
		dataOperation.close();
		return i;

	}
	
}
