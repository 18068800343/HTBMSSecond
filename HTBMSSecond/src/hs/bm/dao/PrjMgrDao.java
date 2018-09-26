package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.ChkBrgRegular;
import hs.bm.bean.ChkProjectInfo;
import hs.bm.bean.ChkSpanRecord;
import hs.bm.bean.SysOrgInfo;
import hs.bm.bean.SysZoneInfo;
import hs.bm.util.GetMacAndNetCard;
import hs.bm.util.Nullchange;
import hs.bm.vo.StructInformation;
import hs.bm.vo.ZoneInfoVo;

public class PrjMgrDao {
	private static PrjMgrDao prjMgrDao;

	public static PrjMgrDao getInstance() {
		if (prjMgrDao == null) {
			prjMgrDao = new PrjMgrDao();
		}
		return prjMgrDao;
	}

	public List<StructInformation> initStructTable(String chk_type,String maintain_org) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		ll.addAll(getBridgeInfos(chk_type,maintain_org));
		ll.addAll(getPassInfos(chk_type,maintain_org));
		ll.addAll(getCulvertInfos(chk_type,maintain_org));
		return ll;
	}
	
	public List<StructInformation> initStructTable2(String zoneId,String chk_type) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		ll.addAll(getBridgeInfosByZone(zoneId,chk_type));
		//ll.addAll(getPassInfos(chk_type));
		ll.addAll(getCulvertInfosByZone(chk_type,zoneId));
		return ll;
	}

	public List<StructInformation> initAllStructTable() {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		ll.addAll(getBridgeInfos2());
		ll.addAll(getPassInfos2());
		ll.addAll(getCulvertInfos2());
		return ll;
	}

	public List<StructInformation> getBridgeInfos(String chk_type,String maintain_org) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT\n" +
				"	a.bridge_id,\n" +
				"	a.bridge_no,\n" +
				"	a.bridge_name,\n" +
				"	a.bridge_pile_no,\n" +
				"	b.org_id,\n" +
				"	b.org_name,\n" +
				"	b.org_name_short,\n" +
				"	c.zone_id,\n" +
				"	c.zone_name,\n" +
				"	d.section_id,\n" +
				"	d.section_name,\n" +
				"	e.highway_id,\n" +
				"	e.highway_name\n" +
				"FROM\n" +
				"	brg_card_admin_id a,\n" +
				"	sys_org_info b,\n" +
				"	sys_zone_info c,\n" +
				"	sys_section_info d,\n" +
				"	dic_hw_info e\n" +
				"WHERE\n" +
				"	a.manage_id = b.org_id\n" +
				"AND a.zone_id = c.zone_id\n" +
				"AND a.section_id = d.section_id\n" +
				"AND a.highway_id = e.highway_id\n" +
				"AND b.org_id = ?\n" +
				"AND a.bridge_id NOT IN (\n" +
				"	SELECT\n" +
				"		br.bridge_id\n" +
				"	FROM\n" +
				"		chk_brg_regular br,\n" +
				"		chk_project_info pi\n" +
				"	WHERE\n" +
				"		pi.chk_type = ?\n" +
				"	AND br.prj_id = pi.prj_id\n" +
				"	AND pi.prj_state != '1'\n" +
				")";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { maintain_org,chk_type});
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("bridge_id"));
				sm.setStruct_no(rs.getString("bridge_no"));
				sm.setStruct_name(rs.getString("bridge_name"));
				sm.setStruct_mode("bridge");
				sm.setStub_no(rs.getString("bridge_pile_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	public List<StructInformation> getBridgeInfosByZone(String zoneId, String chk_type) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT\n" +
				"	a.bridge_id,\n" +
				"	a.bridge_no,\n" +
				"	a.bridge_name,\n" +
				"	a.bridge_pile_no,\n" +
				"	b.org_id,\n" +
				"	b.org_name,\n" +
				"	b.org_name_short,\n" +
				"	c.zone_id,\n" +
				"	c.zone_name,\n" +
				"	d.section_id,\n" +
				"	d.section_name,\n" +
				"	e.highway_id,\n" +
				"	e.highway_name\n" +
				"FROM\n" +
				"	brg_card_admin_id a,\n" +
				"	sys_org_info b,\n" +
				"	sys_zone_info c,\n" +
				"	sys_section_info d,\n" +
				"	dic_hw_info e\n" +
				"WHERE\n" +
				"	a.manage_id = b.org_id\n" +
				"AND c.zone_id= ?\n"+
				"AND a.zone_id = c.zone_id\n" +
				"AND a.section_id = d.section_id\n" +
				"AND a.highway_id = e.highway_id\n" +
				"AND a.bridge_id NOT IN (\n" +
				"	SELECT\n" +
				"		br.bridge_id\n" +
				"	FROM\n" +
				"		chk_brg_regular br,\n" +
				"		chk_project_info pi\n" +
				"	WHERE\n" +
				"		pi.chk_type = ?\n" +
				"	AND br.prj_id = pi.prj_id\n" +
				"	AND pi.prj_state != '1'\n" +
				")";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { zoneId,chk_type });
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("bridge_id"));
				sm.setStruct_no(rs.getString("bridge_no"));
				sm.setStruct_name(rs.getString("bridge_name"));
				sm.setStruct_mode("bridge");
				sm.setStub_no(rs.getString("bridge_pile_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<StructInformation> getBridgeInfos2() {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT\n" +
				"	a.bridge_id,\n" +
				"	a.bridge_no,\n" +
				"	a.bridge_name,\n" +
				"	a.bridge_pile_no,\n" +
				"	b.org_id,\n" +
				"	b.org_name,\n" +
				"	b.org_name_short,\n" +
				"	c.zone_id,\n" +
				"	c.zone_name,\n" +
				"	d.section_id,\n" +
				"	d.section_name,\n" +
				"	e.highway_id,\n" +
				"	e.highway_name\n" +
				"FROM\n" +
				"	brg_card_admin_id a,\n" +
				"	sys_org_info b,\n" +
				"	sys_zone_info c,\n" +
				"	sys_section_info d,\n" +
				"	dic_hw_info e\n" +
				"WHERE\n" +
				"	a.manage_id = b.org_id\n" +
				"AND a.zone_id = c.zone_id\n" +
				"AND a.section_id = d.section_id\n" +
				"AND a.highway_id = e.highway_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("bridge_id"));
				sm.setStruct_no(rs.getString("bridge_no"));
				sm.setStruct_name(rs.getString("bridge_name"));
				sm.setStruct_mode("bridge");
				sm.setStub_no(rs.getString("bridge_pile_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<StructInformation> getPassInfos(String chk_type,String org_id){
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT"
			+" 	a.pass_id,"
			+" 	a.pass_no,"
			+" 	a.pass_name,"
			+" 	a.stub_no,"
			+" 	b.org_id,"
			+" 	b.org_name,"
			+" 	b.org_name_short,"
			+" 	c.zone_id,"
			+" 	c.zone_name,"
			+" 	d.section_id,"
			+" 	d.section_name,"
			+" 	e.highway_id,"
			+" 	e.highway_name"
			+" FROM"
			+" 	pass_info a,"
			+" 	sys_org_info b,"
			+" 	sys_zone_info c,"
			+" 	sys_section_info d,"
			+" 	dic_hw_info e"
			+" WHERE"
			+" 	a.manage_id = b.org_id"
			+" AND a.zone_id = c.zone_id"
			+" AND a.section_id = d.section_id"
			+" AND a.highway_id = e.highway_id"
			+" AND b.org_id = ? "
			+" AND a.pass_id NOT IN ("
			+" 	SELECT"
			+" 		br.pass_id"
			+" 	FROM"
			+" 		chk_pass_regular br,"
			+" 		chk_project_info pi"
			+" 	WHERE"
			+" 		pi.chk_type = ?"
			+" 	AND br.prj_id = pi.prj_id"
			+" 	AND pi.prj_state != '1'"
			+" )";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{org_id,chk_type});
		try {
			while(rs.next()){
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("pass_id"));
				sm.setStruct_no(rs.getString("pass_no"));
				sm.setStruct_name(rs.getString("pass_name"));
				sm.setStruct_mode("pass");
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<StructInformation> getPassInfos2() {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT"
			+" 	a.pass_id,"
			+" 	a.pass_no,"
			+" 	a.pass_name,"
			+" 	a.stub_no,"
			+" 	b.org_id,"
			+" 	b.org_name,"
			+" 	b.org_name_short,"
			+" 	c.zone_id,"
			+" 	c.zone_name,"
			+" 	d.section_id,"
			+" 	d.section_name,"
			+" 	e.highway_id,"
			+" 	e.highway_name"
			+" FROM"
			+" 	pass_info a,"
			+" 	sys_org_info b,"
			+" 	sys_zone_info c,"
			+" 	sys_section_info d,"
			+" 	dic_hw_info e"
			+" WHERE"
			+" 	a.manage_id = b.org_name"
			+" AND a.zone_id = c.zone_id"
			+" AND a.section_id = d.section_id"
			+" AND a.highway_id = e.highway_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("pass_id"));
				sm.setStruct_no(rs.getString("pass_no"));
				sm.setStruct_name(rs.getString("pass_name"));
				sm.setStruct_mode("pass");
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<StructInformation> getCulvertInfos(String chk_type,String org_id) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT\n" +
				"	a.culvert_id,\n" +
				"	a.culvert_no,\n" +
				"	a.culvert_name,\n" +
				"	a.stub_no,\n" +
				"	b.org_id,\n" +
				"	b.org_name,\n" +
				"	b.org_name_short,\n" +
				"	c.zone_id,\n" +
				"	c.zone_name,\n" +
				"	d.section_id,\n" +
				"	d.section_name,\n" +
				"	e.highway_id,\n" +
				"	e.highway_name\n" +
				"FROM\n" +
				"	cul_info a,\n" +
				"	sys_org_info b,\n" +
				"	sys_zone_info c,\n" +
				"	sys_section_info d,\n" +
				"	dic_hw_info e\n" +
				"WHERE\n" +
				"	a.manage_id = b.org_id\n" +
				"AND a.zone_id = c.zone_id\n" +
				"AND a.section_id = d.section_id\n" +
				"AND a.highway_id = e.highway_id\n" +
				"AND b.org_id = ?\n" +
				"AND a.culvert_id NOT IN (\n" +
				"	SELECT\n" +
				"		br.culvert_id\n" +
				"	FROM\n" +
				"		chk_culvert_regular br,\n" +
				"		chk_project_info pi\n" +
				"	WHERE\n" +
				"		pi.chk_type = ?\n" +
				"	AND br.prj_id = pi.prj_id\n" +
				"	AND pi.prj_state != '1'\n" +
				")";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {org_id, chk_type });
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("culvert_id"));
				sm.setStruct_no(rs.getString("culvert_no"));
				sm.setStruct_name(rs.getString("culvert_name"));
				sm.setStruct_mode("culvert");
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<StructInformation> getCulvertInfosByZone(String chk_type,String zone_id) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT\n" +
				"	a.culvert_id,\n" +
				"	a.culvert_no,\n" +
				"	a.culvert_name,\n" +
				"	a.stub_no,\n" +
				"	b.org_id,\n" +
				"	b.org_name,\n" +
				"	b.org_name_short,\n" +
				"	c.zone_id,\n" +
				"	c.zone_name,\n" +
				"	d.section_id,\n" +
				"	d.section_name,\n" +
				"	e.highway_id,\n" +
				"	e.highway_name\n" +
				"FROM\n" +
				"	cul_info a,\n" +
				"	sys_org_info b,\n" +
				"	sys_zone_info c,\n" +
				"	sys_section_info d,\n" +
				"	dic_hw_info e\n" +
				"WHERE\n" +
				"	a.manage_id = b.org_id\n" +
				"AND a.zone_id = c.zone_id\n" +
				"AND a.section_id = d.section_id\n" +
				"AND a.highway_id = e.highway_id\n" +
				"AND a.zone_id = ?\n" +
				"AND a.culvert_id NOT IN (\n" +
				"	SELECT\n" +
				"		br.culvert_id\n" +
				"	FROM\n" +
				"		chk_culvert_regular br,\n" +
				"		chk_project_info pi\n" +
				"	WHERE\n" +
				"		pi.chk_type = ?\n" +
				"	AND br.prj_id = pi.prj_id\n" +
				"	AND pi.prj_state != '1'\n" +
				")";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {zone_id, chk_type });
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("culvert_id"));
				sm.setStruct_no(rs.getString("culvert_no"));
				sm.setStruct_name(rs.getString("culvert_name"));
				sm.setStruct_mode("culvert");
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	
	public List<StructInformation> getCulvertInfos2() {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT\n" +
				"	a.culvert_id,\n" +
				"	a.culvert_no,\n" +
				"	a.culvert_name,\n" +
				"	a.stub_no,\n" +
				"	b.org_id,\n" +
				"	b.org_name,\n" +
				"	b.org_name_short,\n" +
				"	c.zone_id,\n" +
				"	c.zone_name,\n" +
				"	d.section_id,\n" +
				"	d.section_name,\n" +
				"	e.highway_id,\n" +
				"	e.highway_name\n" +
				"FROM\n" +
				"	cul_info a,\n" +
				"	sys_org_info b,\n" +
				"	sys_zone_info c,\n" +
				"	sys_section_info d,\n" +
				"	dic_hw_info e\n" +
				"WHERE\n" +
				"	a.manage_id = b.org_id\n" +
				"AND a.zone_id = c.zone_id\n" +
				"AND a.section_id = d.section_id\n" +
				"AND a.highway_id = e.highway_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("culvert_id"));
				sm.setStruct_no(rs.getString("culvert_no"));
				sm.setStruct_name(rs.getString("culvert_name"));
				sm.setStruct_mode("culvert");
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public Map<String, Integer> getStructCount(String prj_id){
		Map<String, Integer> map = new HashMap<String, Integer>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "select count(1) from brg_card_admin_id where bridge_id in (select bridge_id from chk_brg_regular where prj_id=?)";
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { prj_id });

		try {
			while (rs.next()) {
				int brgCount=rs.getInt(1);
				map.put("bridge", brgCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		sql = "select count(1) from cul_info where culvert_id in (select culvert_id from chk_culvert_regular where prj_id=?)";
		rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				int culsCount=rs.getInt(1);
				map.put("culvert", culsCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		
		sql = "select count(1) from pass_info where pass_id in (select pass_id from chk_pass_regular where prj_id=?)";
		rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				int passCount=rs.getInt(1);
				map.put("pass", passCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql="select COUNT(1) from chk_pass_regular where audit_state='1' and prj_id=?";
		rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				int passChkCount=rs.getInt(1);
				map.put("passChk", passChkCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql="select COUNT(1) from chk_brg_regular where audit_state='1' and prj_id=?";
		rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				int brgChkCount=rs.getInt(1);
				map.put("brgChk", brgChkCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql="select COUNT(1) from chk_culvert_regular where audit_state='1' and prj_id=?";
		rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				int culvertChkCount=rs.getInt(1);
				map.put("culvertChk", culvertChkCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql="select COUNT(1) from eva_brg_rec where audit_state='1' and prj_id=?";
		rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				int brgEva=rs.getInt(1);
				map.put("brgEva", brgEva);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		dataOperation.close();
		return map;
	}
	
	
	public Map<String, List<String>> getStruct(String prj_id) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "select * from brg_card_admin_id where bridge_id in (select bridge_id from chk_brg_regular where prj_id=?)";
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		List<String> brgs = new ArrayList<>();
		try {
			while (rs.next()) {
				String bridge_name = rs.getString("bridge_name");
				brgs.add(bridge_name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (brgs.size() > 0) {
			map.put("bridge", brgs);
		}

		List<String> culs = new ArrayList<>();
		sql = "select * from cul_info where culvert_id in (select culvert_id from chk_culvert_regular where prj_id=?)";
		rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				String culvert_name = rs.getString("culvert_name");
				culs.add(culvert_name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (culs.size() > 0) {
			map.put("culvert", culs);
		}

		List<String> pass = new ArrayList<>();
		sql = "select * from pass_info where pass_id in (select pass_id from chk_pass_regular where prj_id=?)";
		rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				String pass_name = rs.getString("pass_name");
				pass.add(pass_name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (pass.size() > 0) {
			map.put("pass", pass);
		}
		dataOperation.close();
		return map;
	}

	public List<String> initUser() {
		List<String> ll = new ArrayList<String>();
		String sql = "select usr_name from sys_usr_usr_info where usr_role='guest' or usr_role='admin'";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				String name = rs.getString("usr_name");
				ll.add(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<SysOrgInfo> initOrg() {
		List<SysOrgInfo> ll = new ArrayList<>();
		String sql = "select * from sys_org_info";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				String org_name = rs.getString("org_name");
				String org_name_short = rs.getString("org_name_short");
				String org_id = rs.getString("org_id");
				SysOrgInfo sysOrgInfo = new SysOrgInfo();
				sysOrgInfo.setOrg_id(org_id);
				sysOrgInfo.setOrg_name(org_name);
				sysOrgInfo.setOrg_name_short(org_name_short);
				ll.add(sysOrgInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	public List<String> initStruPersion(String type,String departmentId) {
		List<String> ll = new ArrayList<String>();
		String sql = "SELECT\n" +
				"	b.*\n" +
				"FROM\n" +
				"	sys_org_usr_info AS a\n" +
				"RIGHT JOIN sys_usr_usr_info AS b ON a.org_usr_id = b.org_usr_id\n" +
				"WHERE\n" +
				"	b.usr_role = ? AND a.department_id like ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {type,departmentId});
		try {
			while (rs.next()) {
				String name = rs.getString("usr_name");
				ll.add(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	
	public List<String> initCheckPeople() {
		List<String> ll = new ArrayList<String>();
		String sql = " select * from sys_usr_usr_info where usr_role = 'guest' ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {});
		try {
			while (rs.next()) {
				String name = rs.getString("usr_name");
				ll.add(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	public int saveNewPrj(String prj_id, String prj_desc, String chk_type, String maintain_org, String zone_id, String prj_charge_man,
			String prj_member, List<StructInformation> ll,String ht) {
		if(ht==null){
			ht="";
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "insert into chk_project_info(prj_id,prj_desc,chk_type,struct_no,prj_charge_man,prj_member,prj_state,maintain_org,prj_establish_tm, zone_id,ht_input) values(?,?,?,?,?,?,?,?,CURDATE(),?,?)";
		int i = 0;
		i = dataOperation.executeUpdate(sql,
				new Object[] { prj_id, prj_desc, chk_type, ll.size(), prj_charge_man, prj_member, 0, maintain_org,zone_id,ht });

		//@author xianing
		/*if("daily".equals(chk_type)||"often".equals(chk_type)){
	    String sql1 = " update chk_project_info set struct_eva = '1' where prj_id =? ";
	    dataOperation.executeUpdate(sql1,
				new Object[] {prj_id});
		}*/
		
		
		
		if (i < 0) {
			dataOperation.close();
			return i;
		}

		for (StructInformation sf : ll) {
			
			if (sf.getStruct_mode().equals("bridge")) {
				String brgSql = "insert into chk_brg_regular( chk_id, prj_id, line_no, line_name, bridge_id, bridge_name, maintain_org, response_person, audit_state ) values(?,?,?,?,?,?,?,?,?)";
			
				
				//chk_id
				String chk_id = UUID.randomUUID().toString().replaceAll("-", "");
				i = dataOperation.executeUpdate(brgSql,
						new Object[] {chk_id, prj_id, sf.getHighway_id(),
								sf.getHighway_name(), sf.getStruct_id(), sf.getStruct_name(), sf.getManage_name(),
								prj_charge_man, 0 });
				/* @author xianing(￣ε(#￣)
				 * 当前项目prj_id为prj_id
				 * 当前分区主键为zone_id
				 * 当前项目chk_id为chk_id
				 * 向chk_brg_regular表插入数据  uuid为chk_id
				 * 
				 * */
					
				/*if(getLastProjectInfo(zone_id).size()>1){
				String last_prj_id = getLastProjectInfo(zone_id).get(1).getPrj_id();
				//上一个项目prj当前的桥梁记录信息
				List<ChkBrgRegular> cbrs= getChkBrgRegular(last_prj_id,sf.getStruct_id());
				//更改当前项目,当前桥的信息为上一个项目该桥的信息
				if(cbrs!=null&&cbrs.size()>0){
					ChkBrgRegular oldChkBrgRegular=cbrs.get(0);
					new CheckBridgeDao().updateChkBrgRegular(oldChkBrgRegular, prj_id, sf.getStruct_id(),chk_id);
					String last_chk_id = cbrs.get(0).getChk_id();
					copyChkSpansByChk_id(last_chk_id,chk_id,sf.getStruct_id());
					
				}
				}*/
				
				CopyDao.getInstance().startCopyOne(prj_id, chk_type, sf.getStruct_id());
				
				if (i < 0) {
					dataOperation.close();
					return i;
				}
				
				brgSql = "insert into eva_brg_rec (bridge_id,prj_id,er_std,audit_state) values(?,?,?,?)";
				//定期和特殊检查
				if(chk_type.equals("regular") || chk_type.equals("special")){
					i = dataOperation.executeUpdate(brgSql, new Object[] { sf.getStruct_id(), prj_id, "2004", 0 });
					if (i < 0) {
						dataOperation.close();
						return i;
					}
					i = dataOperation.executeUpdate(brgSql, new Object[] { sf.getStruct_id(), prj_id, "2011", 0 });
					if (i < 0) {
						dataOperation.close();
						return i;
					}
				}
				
			}
			//通道
			if (sf.getStruct_mode().equals("pass")) {
				String passSql = "insert into chk_pass_regular( chk_id, prj_id, pass_id, line_no, line_name, maintain_org, response_person, audit_state ) values(?,?,?,?,?,?,?,?)";
				i = dataOperation.executeUpdate(passSql,
						new Object[] { UUID.randomUUID().toString().replaceAll("-", ""), prj_id, sf.getStruct_id(),
								sf.getHighway_id(), sf.getHighway_name(), sf.getManage_name(), prj_charge_man, 0 });
				CopyPassDao.getInstance().startCopyOne(prj_id, chk_type, sf.getStruct_id());
				if (i < 0) {
					dataOperation.close();
					return i;
				}
			}
			//涵洞
			if (sf.getStruct_mode().equals("culvert")) {
				String culSql = "insert into chk_culvert_regular( chk_id, prj_id, culvert_id, maintain_org, response_person, audit_state) values(?,?,?,?,?,?)";
				i = dataOperation.executeUpdate(culSql, new Object[] { UUID.randomUUID().toString().replaceAll("-", ""),
						prj_id, sf.getStruct_id(), sf.getManage_name(), prj_charge_man, 0 });
				CopyCulvertDao.getInstance().startCopyOne(prj_id, chk_type, sf.getStruct_id());
				if (i < 0) {
					dataOperation.close();
					return i;
				}
			}
		}
		dataOperation.close();
		return i;
	}

	public int getPrj_Struct_No_sum(String start, String end) {
		int sum = 0;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = " SELECT SUM(struct_no) FROM chk_project_info WHERE prj_establish_tm BETWEEN ? and ? ";
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { start, end });
		try {
			while (rs.next()) {
				String re = rs.getString(1);
				if (re != null) {
					sum = Integer.parseInt(re);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return sum;

	}

	public List<ChkProjectInfo> initPrjTable2(String orgid) {
		List<ChkProjectInfo> ll = new ArrayList<ChkProjectInfo>();
		String sql = "select * from chk_project_info where zone_id like ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {orgid});
		try {
			while (rs.next()) {
				ChkProjectInfo cp = new ChkProjectInfo();
				cp.setPrj_id(rs.getString("prj_id"));
				cp.setPrj_desc(rs.getString("prj_desc"));
				cp.setChk_type(rs.getString("chk_type"));
				cp.setStruct_no(rs.getInt("struct_no"));
				cp.setMember_no(rs.getInt("member_no"));
				cp.setMember_chk_no(rs.getInt("member_chk_no"));
				cp.setStruct_checked(rs.getInt("struct_checked"));
				cp.setStruct_eva(rs.getInt("struct_eva"));
				cp.setPrj_charge_man(rs.getString("prj_charge_man"));
				if(rs.getString("prj_member")!=null){
					cp.setPrj_member(rs.getString("prj_member").replaceAll("#", ","));
				}
				
				
				cp.setPrj_state(rs.getInt("prj_state"));
				cp.setPrj_establish_tm(rs.getString("prj_establish_tm"));
				cp.setMaintain_org(rs.getString("maintain_org"));
				ll.add(cp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	public List<ZoneInfoVo> initZoneDailyPrj(String orgid) {
		List<ZoneInfoVo> ll = new ArrayList<ZoneInfoVo>();
		String sql = "select * from sys_zone_info where org_id = ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {orgid});
		try {
			while (rs.next()) {
				ZoneInfoVo zif = new ZoneInfoVo();
				zif.setZone_name(rs.getString("zone_name"));
				zif.setZone_id(rs.getString("zone_id"));
				zif.setOrg_id(rs.getString("org_id"));
				zif.setEngineer_name(Nullchange.NulltoString(rs.getString("engineer_name")));
				zif.setDutyman_name(Nullchange.NulltoString(rs.getString("dutyman_name")));
				zif.setBuild_prj(rs.getInt("build_prj")+"");
				zif.setCheck_people(Nullchange.NulltoString(rs.getString("check_people"))+" ");
				zif.setPrj_charge_man(Nullchange.NulltoString(rs.getString("prj_charge_man"))+" ");
				
				ll.add(zif);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<ChkProjectInfo> initPrjTable() {
		List<ChkProjectInfo> ll = new ArrayList<ChkProjectInfo>();
		String sql = "select * from chk_project_info";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				ChkProjectInfo cp = new ChkProjectInfo();
				cp.setPrj_id(rs.getString("prj_id"));
				cp.setPrj_desc(rs.getString("prj_desc"));
				cp.setChk_type(rs.getString("chk_type"));
				cp.setStruct_no(rs.getInt("struct_no"));
				cp.setMember_no(rs.getInt("member_no"));
				cp.setMember_chk_no(rs.getInt("member_chk_no"));
				cp.setStruct_checked(rs.getInt("struct_checked"));
				cp.setStruct_eva(rs.getInt("struct_eva"));
				cp.setPrj_charge_man(rs.getString("prj_charge_man"));
				cp.setHt_input(rs.getString("ht_input"));
				if(rs.getString("prj_member")!=null&&!"".equals(rs.getString("prj_member"))){
				cp.setPrj_member(rs.getString("prj_member").replaceAll("#", ","));
				}
				cp.setPrj_state(rs.getInt("prj_state"));
				cp.setPrj_establish_tm(rs.getString("prj_establish_tm"));
				cp.setMaintain_org(rs.getString("maintain_org"));
				cp.setZone_id(rs.getString("zone_id"));
				ll.add(cp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	public int editPrj(String prj_charge_man, String prj_member, String prj_id) {
		String sql = "update chk_project_info set prj_charge_man=?,prj_member=? where prj_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] { prj_charge_man, prj_member.replaceAll(",", "#"), prj_id });
		sql = "update chk_brg_regular set response_person=? where prj_id=?";
		i = dataOperation.executeUpdate(sql, new String[] { prj_charge_man, prj_id });
		sql = "update chk_pass_regular set response_person=? where prj_id=?";
		i = dataOperation.executeUpdate(sql, new String[] { prj_charge_man, prj_id });
		sql = "update chk_culvert_regular set response_person=? where prj_id=?";
		i = dataOperation.executeUpdate(sql, new String[] { prj_charge_man, prj_id });
		dataOperation.close();
		return i;
	}

	public int endPrj(String prj_id) {
		String sql = "update chk_project_info set prj_state=1,prj_complete_tm=now() where prj_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] { prj_id });
		dataOperation.close();
		return i;
	}
	
	public int updateSysZoneInfo(String check_people,String prj_charge_man,String zone_id) {
		String sql = "update sys_zone_info set check_people =?,prj_charge_man=? where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] {check_people,prj_charge_man,zone_id});
		dataOperation.close();
		return i;
	}

	public int delPrj(String prj_id) {
		String sql = "delete from chk_project_info where prj_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] { prj_id });
		dataOperation.close();
		return i;
	}
	
	public boolean getSamePrj(String zone_id,String date,String type) {
		boolean flag = false;
		String sql = "select * from chk_project_info where zone_id=? and prj_establish_tm=? and chk_type=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {zone_id,date,type});
		try {
			while (rs.next()) {
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dataOperation.close();
		return flag;
	}

	public int addStruct(String prj_id, String chk_type, List<StructInformation> ll, String prj_charge_man) {
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = 0;
		for (StructInformation sf : ll) {
			if (sf.getStruct_mode().equals("bridge")) {
				String brgSql = "insert into chk_brg_regular( chk_id, prj_id, line_no, line_name, bridge_id, bridge_name, maintain_org, response_person, audit_state ) values(?,?,?,?,?,?,?,?,?)";
				i = dataOperation.executeUpdate(brgSql,
						new Object[] { UUID.randomUUID().toString().replaceAll("-", ""), prj_id, sf.getHighway_id(),
								sf.getHighway_name(), sf.getStruct_id(), sf.getStruct_name(), sf.getManage_name(),
								prj_charge_man, 0 });
				if (i < 0) {
					dataOperation.close();
					return i;
				}
				brgSql = "insert into eva_brg_rec (bridge_id,prj_id,er_std,audit_state) values(?,?,?,?)";
				i = dataOperation.executeUpdate(brgSql, new Object[] { sf.getStruct_id(), prj_id, "2004", 0 });
				if (i < 0) {
					dataOperation.close();
					return i;
				}
				i = dataOperation.executeUpdate(brgSql, new Object[] { sf.getStruct_id(), prj_id, "2011", 0 });
				if (i < 0) {
					dataOperation.close();
					return i;
				}
			}
			if (sf.getStruct_mode().equals("pass")) {
				String passSql = "insert into chk_pass_regular( chk_id, prj_id, pass_id, line_no, line_name, maintain_org, response_person, audit_state ) values(?,?,?,?,?,?,?,?)";
				i = dataOperation.executeUpdate(passSql,
						new Object[] { UUID.randomUUID().toString().replaceAll("-", ""), prj_id, sf.getStruct_id(),
								sf.getHighway_id(), sf.getHighway_name(), sf.getManage_name(), prj_charge_man, 0 });
				if (i < 0) {
					dataOperation.close();
					return i;
				}
			}
			if (sf.getStruct_mode().equals("culvert")) {
				String culSql = "insert into chk_culvert_regular( chk_id, prj_id, culvert_id, maintain_org, response_person, audit_state) values(?,?,?,?,?,?)";
				i = dataOperation.executeUpdate(culSql, new Object[] { UUID.randomUUID().toString().replaceAll("-", ""),
						prj_id, sf.getStruct_id(), sf.getManage_name(), prj_charge_man, 0 });
				if (i < 0) {
					dataOperation.close();
					return i;
				}
			}
		}
		dataOperation.close();
		;
		return i;
	}
	
	private void copyHistoryInfo(String zone_id,String prj_id){
		
		
	}
	
	
	private List<ChkProjectInfo> getLastProjectInfo(String zone_id){
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		List<ChkProjectInfo> ll = new ArrayList<ChkProjectInfo>();
		String sql = "select * from chk_project_info where zone_id = ? order by prj_establish_tm desc";
		ResultSet rs = dataOperation.executeQuery(sql,new Object[]{zone_id});
		try {
			while (rs.next()) {
				ChkProjectInfo cp = new ChkProjectInfo();
				cp.setPrj_id(rs.getString("prj_id"));
				cp.setPrj_desc(rs.getString("prj_desc"));
				cp.setChk_type(rs.getString("chk_type"));
				cp.setStruct_no(rs.getInt("struct_no"));
				cp.setMember_no(rs.getInt("member_no"));
				cp.setMember_chk_no(rs.getInt("member_chk_no"));
				cp.setStruct_checked(rs.getInt("struct_checked"));
				cp.setStruct_eva(rs.getInt("struct_eva"));
				cp.setPrj_charge_man(rs.getString("prj_charge_man"));
				if(rs.getString("prj_member")!=null&&!"".equals(rs.getString("prj_member"))){
				cp.setPrj_member(rs.getString("prj_member").replaceAll("#", ","));
				}
				cp.setPrj_state(rs.getInt("prj_state"));
				cp.setPrj_establish_tm(rs.getString("prj_establish_tm"));
				cp.setMaintain_org(rs.getString("maintain_org"));
				cp.setZone_id(rs.getString("zone_id"));
				ll.add(cp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	
	
	public void modifyChkBrgRegular(ChkBrgRegular chkBrgRegular) {
		
		
	}
	
	private List<ChkBrgRegular> getChkBrgRegular(String last_prj_id,String last_bridge_id){
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		List<ChkBrgRegular> ll = new ArrayList<ChkBrgRegular>();
		String sql = " select * from chk_brg_regular where prj_id = ? and bridge_id=?  ";
		ResultSet rs = dataOperation.executeQuery(sql,new Object[]{last_prj_id,last_bridge_id});
		try {
			while (rs.next()) {
				ChkBrgRegular cp = new ChkBrgRegular();
				cp.setChk_id(rs.getString("chk_id"));
				cp.setBridge_id(rs.getString("bridge_id"));
				cp.setAudit_state(rs.getString("audit_state"));
				cp.setBridge_len(rs.getFloat("bridge_len"));
				cp.setBridge_name(rs.getString("bridge_name"));
				cp.setCheck_date(rs.getString("check_date"));
				cp.setClimate(rs.getString("climate"));
				cp.setConstruct_ym(rs.getString("construct_ym"));
				cp.setDefect_desc(rs.getString("defect_desc"));
				cp.setDown_lane_name(rs.getString("down_lane_name"));
				cp.setDown_struct_type(rs.getString("down_struct_type"));
				cp.setEval_level(rs.getString("eval_level"));
				cp.setLast_check_date(rs.getString("last_check_date"));
				cp.setLast_maintain_date(rs.getString("last_maintain_date"));
				cp.setLine_name(rs.getString("line_name"));
				cp.setLine_no(rs.getString("line_no"));
				cp.setMain_span_struct(rs.getString("main_span_struct"));
				cp.setMaintain_org(rs.getString("maintain_org"));
				cp.setMaintain_score(rs.getFloat("maintain_score"));
				cp.setNext_check_date(rs.getString("next_check_date"));
				cp.setPrj_id(rs.getString("prj_id"));
				cp.setRecord_person(rs.getString("record_person"));
				cp.setRegular_maintain_rec(rs.getString("regular_maintain_rec"));
				cp.setResponse_person(rs.getString("response_person"));
				cp.setSpan_len(rs.getFloat("span_len"));
				cp.setStruct_span(rs.getString("struct_span"));
				cp.setStub_no(rs.getString("stub_no"));
				cp.setTop_struct_type(rs.getString("top_struct_type"));
				cp.setTotal_cleanliness_score(rs.getFloat("total_cleanliness_score"));
				cp.setTotal_level(rs.getString("total_level"));
				
				ll.add(cp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	private void  copyChkSpansByChk_id(String last_chk_id,String chk_id,String bridge_id){
		List<ChkSpanRecord> allSpans = new CheckBridgeDao().getAllSpans(last_chk_id);
		for(ChkSpanRecord chkSpanRecord:allSpans){
			String uuid=UUID.randomUUID().toString().replaceAll("-", "");
			chkSpanRecord.setChk_id(chk_id);
			chkSpanRecord.setSpan_chk_id(uuid);
			String last_chk_span_id = chkSpanRecord.getSpan_chk_id();
			int i=CheckBridgeDao.getInstance().addSpan(chkSpanRecord);
			copyChkBrgRecord(last_chk_span_id,uuid);
			
			//String 
		}
	}
	
	private void  copyChkBrgRecord(String last_span_chk_id,String span_chk_id){
		
		List<ChkBrgRecord> chkBrgRecords = new CurrentControlDao().selectDicsBySpan_chk_id(last_span_chk_id);
		
		for(ChkBrgRecord chkBrgRecord : chkBrgRecords){
			String mbr_chk_id=UUID.randomUUID().toString().replaceAll("-", "");
			chkBrgRecord.setSpan_chk_id(span_chk_id);
			chkBrgRecord.setMbr_chk_id(mbr_chk_id);
			String last_mbr_chk_id = chkBrgRecord.getMbr_chk_id();
			new CurrentControlDao().addDefect(chkBrgRecord);
			copyChkBrgDefect(last_mbr_chk_id,mbr_chk_id);
		}
		
	}
	
	private void  copyChkBrgDefect(String last_mbr_chk_id,String mbr_chk_id){
			
		List<ChkBrgDefect> chkBrgDefects = new CheckSpanDao().getDefectList(last_mbr_chk_id);
			for(ChkBrgDefect chkBrgDefect : chkBrgDefects){
				String defect_serial=UUID.randomUUID().toString().replaceAll("-", "");
				chkBrgDefect.setDefect_serial(defect_serial);
				chkBrgDefect.setMbr_chk_id(mbr_chk_id);
				new CurrentControlDao().insertChkBrgDefect(chkBrgDefect);
			}
		}
}
