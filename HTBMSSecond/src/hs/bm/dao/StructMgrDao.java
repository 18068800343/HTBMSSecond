package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.DicManageOrg;
import hs.bm.bean.SysOrgInfo;
import hs.bm.bean.SysOrgUsrInfo;
import hs.bm.bean.SysSectionInfo;
import hs.bm.bean.SysUsrUsrInfo;
import hs.bm.bean.SysZoneInfo;
import hs.bm.vo.BridgeEvalVO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.StructInformation;
import hs.bm.vo.StructSearch;
import hs.bm.vo.SysUsrUsrInfoVo;

public class StructMgrDao {

	private static StructMgrDao structMgrDao;

	public static StructMgrDao getInstance() {
		if (structMgrDao == null) {
			structMgrDao = new StructMgrDao();
		}
		return structMgrDao;
	}

	/*
	 * public List<StructInformation> initTable() { List<StructInformation> ll =
	 * new ArrayList<StructInformation>(); ll.addAll(getBridgeInfos());
	 * ll.addAll(getPassInfos()); ll.addAll(getCulvertInfos()); return ll; }
	 */
	public List<BrgCardAdminId> initBridge(String mode) {
		List<BrgCardAdminId> ll = new ArrayList<BrgCardAdminId>();
		String sql = "select * from brg_card_admin_id where bridge_id not in(select bridge_id from brg_system where mode=?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { mode });
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				BrgCardAdminId dhi = new BrgCardAdminId();
				dhi.setBridge_no(rs.getString("bridge_no"));
				dhi.setBridge_name(rs.getString("bridge_name"));
				;
				ll.add(dhi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<StructInformation> searchStruct(StructSearch ssh) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		List<StructInformation> results = new ArrayList<StructInformation>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if (ssh.getStruct_mode().equals("bridge")) {
			if (ssh.getProject().equals("0")) {
				ll = getBridgeInfos(ssh, dataOperation);
				for (StructInformation sm : ll) {
					if (ssh.getStruct_type().equals("%") || containStructType(ssh, sm.getStruct_id(), dataOperation)) {
						results.add(sm);
					}
				}
			} else {
				List<String> bgs = getStructByProject(ssh.getProject(), ssh.getStruct_mode());
				for (String id : bgs) {
					StructInformation sm = getBridgeInfo(ssh, id, dataOperation);
					if (sm == null) {
						continue;
					}
					if (ssh.getCheck_state().equals("%") || ssh.getCheck_state().equals(sm.getCheck_state())) {
						if (ssh.getEval_state().equals("%") || ssh.getEval_state().equals(sm.getEval_state())) {
							if (ssh.getStruct_type().equals("%")
									|| containStructType(ssh, sm.getStruct_id(), dataOperation)) {
								results.add(sm);
							}
						}
					}
				}
			}
		} else if (ssh.getStruct_mode().equals("pass")) {
			if (ssh.getProject().equals("0")) {
				ll = getPassInfos(ssh, dataOperation);
				for (StructInformation sm : ll) {
					if (ssh.getStruct_type().equals("%") || containStructType(ssh, sm.getStruct_id(), dataOperation)) {
						results.add(sm);
					}
				}
			} else {
				List<String> pgs = getStructByProject(ssh.getProject(), ssh.getStruct_mode());
				for (String id : pgs) {
					StructInformation sm = getPassInfo(ssh, id, dataOperation);
					if (sm == null) {
						continue;
					}
					if (ssh.getCheck_state().equals("%") || ssh.getCheck_state().equals(sm.getCheck_state())) {
						if (ssh.getStruct_type().equals("%")
								|| containStructType(ssh, sm.getStruct_id(), dataOperation)) {
							results.add(sm);
						}
					}
				}
			}
		} else if (ssh.getStruct_mode().equals("culvert")) {
			if (ssh.getProject().equals("0")) {
				ll = getCulvertInfos(ssh, dataOperation);
				for (StructInformation sm : ll) {
					if (ssh.getStruct_type().equals("%") || containStructType(ssh, sm.getStruct_id(), dataOperation)) {
						results.add(sm);
					}
				}
			} else {
				List<String> cgs = getStructByProject(ssh.getProject(), ssh.getStruct_mode());
				for (String id : cgs) {
					StructInformation sm = getCulvertInfo(ssh, id, dataOperation);
					if (sm == null) {
						continue;
					}
					if (ssh.getCheck_state().equals("%") || ssh.getCheck_state().equals(sm.getCheck_state())) {
						if (ssh.getStruct_type().equals("%")
								|| containStructType(ssh, sm.getStruct_id(), dataOperation)) {
							results.add(sm);
						}
					}
				}
			}
		}
		dataOperation.close();
		return results;
	}

	public boolean containStructType(StructSearch ssh, String id, MyDataOperation dataOperation) {
		boolean flag = false;
		String sql = null;
		if (ssh.getStruct_mode().equals("bridge")) {
			sql = "select * from brg_span_info where bridge_id=? and brg_type_id=?";
		} else if (ssh.getStruct_mode().equals("pass")) {
			sql = "select * from pass_span_info where pass_id=? and pass_type_id=?";
		} else if (ssh.getStruct_mode().equals("culvert")) {
			sql = "select * from cul_span_info where culvert_id=? and cul_type_id=?";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { id, ssh.getStruct_type() });
		try {
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<StructInformation> getBridgeInfos(StructSearch ssh, MyDataOperation dataOperation) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		
		String sql = "SELECT" + 
				" IFNULL(a.bridge_id,'') as bridge_id," 
				+ "IFNULL(a.bridge_no,'') as bridge_no,"
				+ "IFNULL(a.bridge_name,'') as bridge_name," 
				+ "IFNULL(a.bridge_pile_no,'') as bridge_pile_no,"
				+ "IFNULL(a.span_build,'') as span_build," 
				+ "IFNULL(a.function_type,'') as function_type,"
				+ "IFNULL(a.bridge_mode,'') as bridge_mode," 
				+ "IFNULL(b.org_id,'') as org_id,"
				+ "IFNULL(b.org_name,'') as org_name," 
				+ "IFNULL(b.org_name_short,'') as org_name_short,"
				+ "IFNULL(c.zone_id,'') as zone_id," 
				+ "IFNULL(c.zone_name,'') as zone_name,"
				+ "IFNULL(d.section_id,'') as section_id," 
				+ "IFNULL(d.section_name,'') as section_name,"
				+ "IFNULL(e.highway_id,'') as highway_id," 
				+ "IFNULL(e.highway_no,'') as highway_no,"
				+ "IFNULL(e.highway_name,'') as highway_name" 
				+ " FROM " 
				+ "brg_card_admin_id a," 
				+ "sys_org_info b,"
				+ "sys_zone_info c," 
				+ "sys_section_info d," 
				+ "dic_hw_info e" 
				+ " WHERE " 
				+ "a.manage_id = b.org_id"
				+ " AND a.zone_id = c.zone_id" 
				+ " AND a.section_id = d.section_id" 
				+ " AND a.highway_id = e.highway_id"
				+ " AND IFNULL(a.highway_id,'') LIKE ?" 
				+ " AND IFNULL(a.manage_id,'') LIKE ?" 
				+ " AND IFNULL(a.section_id,'') LIKE ?"
				+ " AND IFNULL(a.zone_id,'') LIKE ?" 
				+ " AND IFNULL(a.function_type,'') LIKE ?" 
				+ " AND IFNULL(a.bridge_mode,'') LIKE ?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { ssh.getLine(), ssh.getManage(), ssh.getSection(),
				ssh.getZone(), ssh.getFunction_type(), ssh.getBridge_mode() });
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("bridge_id"));
				sm.setStruct_no(rs.getString("bridge_no"));
				sm.setStruct_name(rs.getString("bridge_name"));
				sm.setStruct_mode("bridge");
				sm.setStub_no(rs.getString("bridge_pile_no"));
				sm.setSpan_build(rs.getString("span_build"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_no(rs.getString("highway_no"));
				sm.setHighway_name(rs.getString("highway_name"));
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ll;
	}

	public StructInformation getBridgeInfo(StructSearch ssh, String id, MyDataOperation dataOperation) {
		StructInformation sm = null;
		String sql = "SELECT" + 
				" IFNULL(a.bridge_id,'') as bridge_id," 
				+ "IFNULL(a.bridge_no,'') as bridge_no,"
				+ "IFNULL(a.bridge_name,'') as bridge_name," 
				+ "IFNULL(a.bridge_pile_no,'') as bridge_pile_no,"
				+ "IFNULL(a.span_build,'') as span_build," 
				+ "IFNULL(a.function_type,'') as function_type,"
				+ "IFNULL(a.bridge_mode,'') as bridge_mode," 
				+ "IFNULL(b.org_id,'') as org_id,"
				+ "IFNULL(b.org_name,'') as org_name," 
				+ "IFNULL(b.org_name_short,'') as org_name_short,"
				+ "IFNULL(c.zone_id,'') as zone_id," 
				+ "IFNULL(c.zone_name,'') as zone_name,"
				+ "IFNULL(d.section_id,'') as section_id," 
				+ "IFNULL(d.section_name,'') as section_name,"
				+ "IFNULL(e.highway_id,'') as highway_id," 
				+ "IFNULL(e.highway_no,'') as highway_no,"
				+ "IFNULL(e.highway_name,'') as highway_name" 
				+ " FROM " 
				+ "brg_card_admin_id a," 
				+ "sys_org_info b,"
				+ "sys_zone_info c," 
				+ "sys_section_info d," 
				+ "dic_hw_info e" 
				+ " WHERE " 
				+ "a.manage_id = b.org_id"
				+ " AND a.zone_id = c.zone_id" 
				+ " AND a.section_id = d.section_id" 
				+ " AND a.highway_id = e.highway_id"
				+ " AND IFNULL(a.highway_id,'') LIKE ?" 
				+ " AND IFNULL(a.manage_id,'') LIKE ?" 
				+ " AND IFNULL(a.section_id,'') LIKE ?"
				+ " AND IFNULL(a.zone_id,'') LIKE ?" 
				+ " AND IFNULL(a.function_type,'') LIKE ?" 
				+ " AND IFNULL(a.bridge_mode,'') LIKE ?"
				+ " AND  a.bridge_id = ?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { ssh.getLine(), ssh.getManage(),
				ssh.getSection(), ssh.getZone(), ssh.getFunction_type(), ssh.getBridge_mode() , id});
		try {
			while (rs.next()) {
				sm = new StructInformation();
				sm.setStruct_id(rs.getString("bridge_id"));
				sm.setStruct_no(rs.getString("bridge_no"));
				sm.setStruct_name(rs.getString("bridge_name"));
				sm.setStruct_mode("bridge");
				sm.setStub_no(rs.getString("bridge_pile_no"));
				sm.setSpan_build(rs.getString("span_build"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_no(rs.getString("highway_no"));
				sm.setHighway_name(rs.getString("highway_name"));
				setPrjChk(dataOperation, sm, ssh.getProject());
				setPrjEval(dataOperation, sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sm;
	}

	public List<StructInformation> getPassInfos(StructSearch ssh, MyDataOperation dataOperation) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		
		String sql = "SELECT" + 
				" IFNULL(a.pass_id,'') as pass_id," 
				+ "IFNULL(a.pass_no,'') as pass_no,"
				+ "IFNULL(a.pass_name,'') as pass_name," 
				+ "IFNULL(a.stub_no,'') as stub_no,"
				+ "IFNULL(a.span_build,'') as span_build," 
				+ "IFNULL(a.use_type,'') as use_type," 
				+ "IFNULL(b.org_id,'') as org_id,"
				+ "IFNULL(b.org_name,'') as org_name," 
				+ "IFNULL(b.org_name_short,'') as org_name_short,"
				+ "IFNULL(c.zone_id,'') as zone_id," 
				+ "IFNULL(c.zone_name,'') as zone_name,"
				+ "IFNULL(d.section_id,'') as section_id," 
				+ "IFNULL(d.section_name,'') as section_name,"
				+ "IFNULL(e.highway_id,'') as highway_id," 
				+ "IFNULL(e.highway_no,'') as highway_no,"
				+ "IFNULL(e.highway_name,'') as highway_name" 
				+ " FROM " 
				+ "pass_info a," 
				+ "sys_org_info b,"
				+ "sys_zone_info c," 
				+ "sys_section_info d," 
				+ "dic_hw_info e" 
				+ " WHERE " 
				+ "a.manage_id = b.org_id"
				+ " AND a.zone_id = c.zone_id" 
				+ " AND a.section_id = d.section_id" 
				+ " AND a.highway_id = e.highway_id"
				+ " AND IFNULL(a.highway_id,'') LIKE ?" 
				+ " AND IFNULL(a.manage_id,'') LIKE ?" 
				+ " AND IFNULL(a.section_id,'') LIKE ?"
				+ " AND IFNULL(a.zone_id,'') LIKE ?" 
				+ " AND IFNULL(a.use_type,'') LIKE ?";
		ResultSet rs = dataOperation.executeQuery(sql,
				new String[] { ssh.getLine(), ssh.getManage(), ssh.getSection(), ssh.getZone(), ssh.getUse_type() });
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("pass_id"));
				sm.setStruct_no(rs.getString("pass_no"));
				sm.setStruct_name(rs.getString("pass_name"));
				sm.setStruct_mode("pass");
				sm.setSpan_build(rs.getString("span_build"));
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_no(rs.getString("highway_no"));
				sm.setHighway_name(rs.getString("highway_name"));
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ll;
	}

	public StructInformation getPassInfo(StructSearch ssh, String id, MyDataOperation dataOperation) {
		StructInformation sm = null;
		String sql = "SELECT" + 
				" IFNULL(a.pass_id,'') as pass_id," 
				+ "IFNULL(a.pass_no,'') as pass_no,"
				+ "IFNULL(a.pass_name,'') as pass_name," 
				+ "IFNULL(a.stub_no,'') as stub_no,"
				+ "IFNULL(a.span_build,'') as span_build," 
				+ "IFNULL(a.use_type,'') as use_type," 
				+ "IFNULL(b.org_id,'') as org_id,"
				+ "IFNULL(b.org_name,'') as org_name," 
				+ "IFNULL(b.org_name_short,'') as org_name_short,"
				+ "IFNULL(c.zone_id,'') as zone_id," 
				+ "IFNULL(c.zone_name,'') as zone_name,"
				+ "IFNULL(d.section_id,'') as section_id," 
				+ "IFNULL(d.section_name,'') as section_name,"
				+ "IFNULL(e.highway_id,'') as highway_id," 
				+ "IFNULL(e.highway_no,'') as highway_no,"
				+ "IFNULL(e.highway_name,'') as highway_name" 
				+ " FROM " 
				+ "pass_info a," 
				+ "sys_org_info b,"
				+ "sys_zone_info c," 
				+ "sys_section_info d," 
				+ "dic_hw_info e" 
				+ " WHERE " 
				+ "a.manage_id = b.org_id"
				+ " AND a.zone_id = c.zone_id" 
				+ " AND a.section_id = d.section_id" 
				+ " AND a.highway_id = e.highway_id"
				+ " AND pass_id = ?"
				+ " AND IFNULL(a.highway_id,'') LIKE ?" 
				+ " AND IFNULL(a.manage_id,'') LIKE ?" 
				+ " AND IFNULL(a.section_id,'') LIKE ?"
				+ " AND IFNULL(a.zone_id,'') LIKE ?" 
				+ " AND IFNULL(a.use_type,'') LIKE ?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { id, ssh.getLine(), ssh.getManage(),
				ssh.getSection(), ssh.getZone(), ssh.getUse_type() });
		try {
			while (rs.next()) {
				sm = new StructInformation();
				sm.setStruct_id(rs.getString("pass_id"));
				sm.setStruct_no(rs.getString("pass_no"));
				sm.setStruct_name(rs.getString("pass_name"));
				sm.setStruct_mode("pass");
				sm.setSpan_build(rs.getString("span_build"));
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_no(rs.getString("highway_no"));
				sm.setHighway_name(rs.getString("highway_name"));
				setPrjChk(dataOperation, sm, ssh.getProject());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sm;
	}

	public List<String> getStructByProject(String prj_id, String type) {
		List<String> ls = new ArrayList<String>();
		Set<String> set = new HashSet<String>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = null;
		String sql = "";
		switch (type) {
		case "bridge":
			sql = "select bridge_id from chk_brg_regular where prj_id like ?";
			rs = dataOperation.executeQuery(sql, new String[] { prj_id });
			try {
				while (rs.next()) {
					set.add(rs.getString("bridge_id"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "culvert":
			sql = "select culvert_id from chk_culvert_regular where prj_id like ?";
			rs = dataOperation.executeQuery(sql, new String[] { prj_id });
			try {
				while (rs.next()) {
					set.add(rs.getString("culvert_id"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "pass":
			sql = "select pass_id from chk_pass_regular where prj_id like ?";
			rs = dataOperation.executeQuery(sql, new String[] { prj_id });
			try {
				while (rs.next()) {
					set.add(rs.getString("pass_id"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		}
		ls.addAll(set);
		dataOperation.close();
		return ls;
	}

	public List<StructInformation> getCulvertInfos(StructSearch ssh, MyDataOperation dataOperation) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT" + 
				" IFNULL(a.culvert_id,'') as culvert_id," 
				+ "IFNULL(a.culvert_no,'') as culvert_no,"
				+ "IFNULL(a.culvert_name,'') as culvert_name," 
				+ "IFNULL(a.stub_no,'') as stub_no,"
				+ "IFNULL(a.span_build,'') as span_build," 
				+ "IFNULL(b.org_id,'') as org_id,"
				+ "IFNULL(b.org_name,'') as org_name," 
				+ "IFNULL(b.org_name_short,'') as org_name_short,"
				+ "IFNULL(c.zone_id,'') as zone_id," 
				+ "IFNULL(c.zone_name,'') as zone_name,"
				+ "IFNULL(d.section_id,'') as section_id," 
				+ "IFNULL(d.section_name,'') as section_name,"
				+ "IFNULL(e.highway_id,'') as highway_id," 
				+ "IFNULL(e.highway_no,'') as highway_no,"
				+ "IFNULL(e.highway_name,'') as highway_name" 
				+ " FROM " 
				+ "cul_info a," 
				+ "sys_org_info b,"
				+ "sys_zone_info c," 
				+ "sys_section_info d," 
				+ "dic_hw_info e" 
				+ " WHERE " 
				+ "a.manage_id = b.org_id"
				+ " AND a.zone_id = c.zone_id" 
				+ " AND a.section_id = d.section_id" 
				+ " AND a.highway_id = e.highway_id"
				+ " AND IFNULL(a.highway_id,'') LIKE ?" 
				+ " AND IFNULL(a.manage_id,'') LIKE ?" 
				+ " AND IFNULL(a.section_id,'') LIKE ?"
				+ " AND IFNULL(a.zone_id,'') LIKE ?" ;
		ResultSet rs = dataOperation.executeQuery(sql,
				new String[] { ssh.getLine(), ssh.getManage(), ssh.getSection(), ssh.getZone() });
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("culvert_id"));
				sm.setStruct_no(rs.getString("culvert_no"));
				sm.setStruct_name(rs.getString("culvert_name"));
				sm.setStruct_mode("culvert");
				sm.setSpan_build(rs.getString("span_build"));
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_no(rs.getString("highway_no"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ll;
	}

	public StructInformation getCulvertInfo(StructSearch ssh, String id, MyDataOperation dataOperation) {
		StructInformation sm = null;
		String sql = "SELECT" + 
				" IFNULL(a.culvert_id,'') as culvert_id," 
				+ "IFNULL(a.culvert_no,'') as culvert_no,"
				+ "IFNULL(a.culvert_name,'') as culvert_name," 
				+ "IFNULL(a.stub_no,'') as stub_no,"
				+ "IFNULL(a.span_build,'') as span_build," 
				+ "IFNULL(b.org_id,'') as org_id,"
				+ "IFNULL(b.org_name,'') as org_name," 
				+ "IFNULL(b.org_name_short,'') as org_name_short,"
				+ "IFNULL(c.zone_id,'') as zone_id," 
				+ "IFNULL(c.zone_name,'') as zone_name,"
				+ "IFNULL(d.section_id,'') as section_id," 
				+ "IFNULL(d.section_name,'') as section_name,"
				+ "IFNULL(e.highway_id,'') as highway_id," 
				+ "IFNULL(e.highway_no,'') as highway_no,"
				+ "IFNULL(e.highway_name,'') as highway_name" 
				+ " FROM " 
				+ "cul_info a," 
				+ "sys_org_info b,"
				+ "sys_zone_info c," 
				+ "sys_section_info d," 
				+ "dic_hw_info e" 
				+ " WHERE " 
				+ "a.manage_id = b.org_id"
				+ " AND a.zone_id = c.zone_id" 
				+ " AND a.section_id = d.section_id" 
				+ " AND a.highway_id = e.highway_id"
				+ " AND a.culvert_id=?"
				+ " AND IFNULL(a.highway_id,'') LIKE ?" 
				+ " AND IFNULL(a.manage_id,'') LIKE ?" 
				+ " AND IFNULL(a.section_id,'') LIKE ?"
				+ " AND IFNULL(a.zone_id,'') LIKE ?" ;
		ResultSet rs = dataOperation.executeQuery(sql,
				new String[] { id, ssh.getLine(), ssh.getManage(), ssh.getSection(), ssh.getZone() });
		try {
			while (rs.next()) {
				sm = new StructInformation();
				sm.setStruct_id(rs.getString("culvert_id"));
				sm.setStruct_no(rs.getString("culvert_no"));
				sm.setStruct_name(rs.getString("culvert_name"));
				sm.setStruct_mode("culvert");
				sm.setSpan_build(rs.getString("span_build"));
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("org_id"));
				sm.setManage_name(rs.getString("org_name"));
				sm.setManage_short_name(rs.getString("org_name_short"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_no(rs.getString("highway_no"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				setPrjChk(dataOperation, sm, ssh.getProject());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sm;
	}

	public void setPrjChk(MyDataOperation dataOperation, StructInformation sm, String prj_id) {
		String sql = null;
		if (sm.getStruct_mode().equals("bridge")) {
			sql = "select a.prj_id,a.prj_desc,a.prj_state,b.audit_state,b.bridge_name,b.bridge_id,b.check_date from chk_project_info a,chk_brg_regular b where b.prj_id=a.prj_id and b.bridge_id=? and a.prj_id=?";
		}
		if (sm.getStruct_mode().equals("pass")) {
			sql = "select a.prj_id,a.prj_desc,a.prj_state,b.audit_state,b.pass_id,b.check_date from chk_project_info a,chk_pass_regular b where b.prj_id=a.prj_id and b.pass_id=? and a.prj_id=?";
		}
		if (sm.getStruct_mode().equals("culvert")) {
			sql = "select a.prj_id,a.prj_desc,a.prj_state,b.audit_state,b.culvert_id,b.check_date from chk_project_info a,chk_culvert_regular b where b.prj_id=a.prj_id and b.culvert_id=? and a.prj_id=?";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { sm.getStruct_id(), prj_id });
		try {
			while (rs.next()) {
				sm.setProject_id(rs.getString("prj_id"));
				sm.setProject_name(rs.getString("prj_desc"));
				sm.setProject_state(rs.getString("prj_state"));
				sm.setCheck_state(rs.getString("audit_state"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void setPrjEval(MyDataOperation dataOperation, StructInformation sm) {
		String sql = null;
		if (sm.getStruct_mode().equals("bridge")) {
			sql = "select * from eva_brg_rec where bridge_id=? and prj_id=?";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { sm.getStruct_id(), sm.getProject_id() });
		String eval_state04 = "";
		String eval_state11 = "";
		try {
			while (rs.next()) {
				if (rs.getString("er_std").equals("2004")) {
					eval_state04 = rs.getString("audit_state");
				}
				if (rs.getString("er_std").equals("2011")) {
					eval_state11 = rs.getString("audit_state");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sm.setEval_state04(eval_state04);
		sm.setEval_state11(eval_state11);
		if (eval_state04.equals("0") || eval_state11.equals("0")) {
			sm.setEval_state("0");
		} else if (eval_state04.equals("1") && eval_state11.equals("1")) {
			sm.setEval_state("1");
		} else if (eval_state04.equals("2") && eval_state11.equals("2")) {
			sm.setEval_state("2");
		} else {
			sm.setEval_state("1");
		}
	}

	public OperationConstruct getStructChk(OperationConstruct oc) {
		String sql = "";
		switch (oc.getMode()) {
		case "bridge":
			sql = "select a.prj_id,b.prj_desc,b.chk_type,a.chk_id,a.check_date,b.prj_state from chk_brg_regular as a,chk_project_info as b where a.prj_id=b.prj_id and a.prj_id=?  and a.bridge_id=?";
			break;
		case "culvert":
			sql = "select a.prj_id,b.prj_desc,b.chk_type,a.chk_id,a.check_date,b.prj_state from chk_culvert_regular as a,chk_project_info as b where a.prj_id=b.prj_id  and a.prj_id=?  and a.culvert_id=?";
			break;
		case "pass":
			sql = "select a.prj_id,b.prj_desc,b.chk_type,a.chk_id,a.check_date,b.prj_state from chk_pass_regular as a,chk_project_info as b where a.prj_id=b.prj_id  and a.prj_id=?  and a.pass_id=?";
			break;
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { oc.getPrj_id(), oc.getId() });
		try {
			while (rs.next()) {
				oc.setChk_id(rs.getString("chk_id"));
				oc.setChk_type(rs.getString("chk_type"));
				oc.setPrj_desc(rs.getString("prj_desc"));
				oc.setPrj_id(rs.getString("prj_id"));
				oc.setPrj_state(rs.getString("prj_state"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return oc;
	}

	public int delStruct(String struct_id, String struct_mode) {
		String sql = null;
		if (struct_mode.equals("bridge")) {
			sql = "delete from brg_card_admin_id where bridge_id=?";
		} else if (struct_mode.equals("pass")) {
			sql = "delete from pass_info where pass_id=?";
		} else if (struct_mode.equals("culvert")) {
			sql = "delete from cul_info where culvert_id=?";
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] { struct_id });
		dataOperation.close();
		return i;
	}

	public List<BrgCardAdminId> initIndexBrg(String prj_id, String highway_id, String manage_id, String section_id,
			String zone_id) {
		List<BrgCardAdminId> lb = new ArrayList<>();
		String[] sa = new String[] { highway_id, manage_id, section_id, zone_id };
		String sql = "select * from brg_card_admin_id where highway_id like ? and manage_id like ? and section_id like ? and zone_id like ? and longitude!='' and longitude is not null";
		if (!prj_id.equals("%")) {
			sql = "select * from brg_card_admin_id where highway_id like ? and manage_id like ? and section_id like ? and zone_id like ? and bridge_id in (select bridge_id from chk_brg_regular where prj_id like ?) and longitude!='' and longitude is not null";
			sa = new String[] { highway_id, manage_id, section_id, zone_id, prj_id };
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, sa);
		try {
			while (rs.next()) {
				BrgCardAdminId bca = new BrgCardAdminId();
				bca.setBridge_id(rs.getString("bridge_id"));
				bca.setBridge_name(rs.getString("bridge_name"));
				bca.setBridge_no(rs.getString("bridge_no"));
				bca.setHighway_id(rs.getString("highway_id"));
				bca.setLongitude(rs.getString("longitude"));
				bca.setLatitude(rs.getString("latitude"));
				bca.setManage_id(rs.getString("manage_id"));
				bca.setSection_id(rs.getString("section_id"));
				bca.setZone_id(rs.getString("zone_id"));
				lb.add(bca);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dataOperation.close();
		}
		return lb;
	}

	public Map<String, List<BrgCardAdminId>> getHighwayBridge() {
		Map<String, List<BrgCardAdminId>> map = new HashMap<>();
		String sql = "SELECT a.*,b.highway_name from brg_card_admin_id as a,dic_hw_info as b where a.highway_id=b.highway_id and a.longitude!='' and a.longitude is not NULL";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				String highway_id = rs.getString("highway_id");
				BrgCardAdminId bca = new BrgCardAdminId();
				bca.setBridge_id(rs.getString("bridge_id"));
				bca.setBridge_name(rs.getString("bridge_name"));
				bca.setBridge_no(rs.getString("bridge_no"));
				bca.setHighway_id(rs.getString("highway_name"));
				bca.setLongitude(rs.getString("longitude"));
				bca.setLatitude(rs.getString("latitude"));
				if (map.containsKey(highway_id)) {
					map.get(highway_id).add(bca);
				} else {
					List<BrgCardAdminId> lb = new ArrayList<>();
					lb.add(bca);
					map.put(highway_id, lb);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dataOperation.close();
		}
		return map;
	}

	public List<BridgeEvalVO> getBridgeEval() {
		List<BridgeEvalVO> lb = new ArrayList<>();
		String sql = "SELECT a.prj_desc,b.* from chk_project_info as a ,"
				+ "(SELECT DISTINCT bridge_id,prj_id,ER_STD,ER_LEVEL,"
				+ "ER_GRADE,ER_DATE from chk_brg_regular full join "
				+ "evaluationrec on bridge_id=bridge_no and prj_id=prj_no) "
				+ "as b where b.prj_id=a.prj_id ORDER BY ER_DATE desc";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				BridgeEvalVO bev = new BridgeEvalVO();
				bev.setBridge_id(rs.getString("bridge_id"));
				bev.setPrj_id(rs.getString("prj_id"));
				bev.setPrj_name(rs.getString("prj_desc"));
				bev.setER_GRADE(rs.getString("ER_GRADE"));
				bev.setER_LEVEL(rs.getString("ER_LEVEL"));
				bev.setER_STD(rs.getString("ER_STD"));
				bev.setER_DATE(rs.getString("ER_DATE"));
				lb.add(bev);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dataOperation.close();
		}
		return lb;
	}

	public List<SysOrgInfo> initOrg(String org_id) {
		List<SysOrgInfo> sysOrgInfos = new ArrayList<>();
		String sql = "select * from sys_org_info where org_id like ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {org_id});
		if (rs == null) {
			sysOrgInfos = null;
		}
		try {
			while (rs.next()) {
				SysOrgInfo sysOrgInfo = new SysOrgInfo();
				sysOrgInfo.setOrg_id(rs.getString("org_id"));
				sysOrgInfo.setOrg_name(rs.getString("org_name"));
				sysOrgInfo.setOrg_name_short(rs.getString("org_name_short"));
				sysOrgInfo.setTech_section(rs.getString("tech_section"));
				sysOrgInfo.setTech_section_id(rs.getString("tech_section_id"));
				sysOrgInfo.setChargeman_name(rs.getString("chargeman_name"));
				sysOrgInfos.add(sysOrgInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return sysOrgInfos;
	}

	public List<SysSectionInfo> initSection() {
		List<SysSectionInfo> sysSectionInfos = new ArrayList<>();
		String sql = "select * from sys_section_info";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {});
		if (rs == null) {
			sysSectionInfos = null;
		}
		try {
			while (rs.next()) {
				SysSectionInfo sectionInfo = new SysSectionInfo();
				sectionInfo.setOrg_id(rs.getString("org_id"));
				sectionInfo.setSection_id(rs.getString("section_id"));
				sectionInfo.setSection_name(rs.getString("section_name"));
				sysSectionInfos.add(sectionInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return sysSectionInfos;
	}

	public List<SysZoneInfo> initZone() {
		List<SysZoneInfo> sZoneInfos = new ArrayList<>();
		String sql = "select * from sys_zone_info";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {});
		if (rs == null) {
			sZoneInfos = null;
		}
		try {
			while (rs.next()) {
				SysZoneInfo sysZoneInfo = new SysZoneInfo();
				sysZoneInfo.setDutyman_name(rs.getString("dutyman_name"));
				sysZoneInfo.setEngineer_name(rs.getString("engineer_name"));
				sysZoneInfo.setOrg_id(rs.getString("org_id"));
				sysZoneInfo.setZone_id(rs.getString("zone_id"));
				sysZoneInfo.setZone_name(rs.getString("zone_name"));
				sZoneInfos.add(sysZoneInfo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return sZoneInfos;
	}

	public List<SysZoneInfo> initZoneByOrgId(String org_id) {
		List<SysZoneInfo> sZoneInfos = new ArrayList<>();
		String sql = "select * from sys_zone_info where org_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {org_id});
		if (rs == null) {
			sZoneInfos = null;
		}
		try {
			while (rs.next()) {
				SysZoneInfo sysZoneInfo = new SysZoneInfo();
				sysZoneInfo.setDutyman_name(rs.getString("dutyman_name"));
				sysZoneInfo.setEngineer_name(rs.getString("engineer_name"));
				sysZoneInfo.setOrg_id(rs.getString("org_id"));
				sysZoneInfo.setZone_id(rs.getString("zone_id"));
				sysZoneInfo.setZone_name(rs.getString("zone_name"));
				sZoneInfos.add(sysZoneInfo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return sZoneInfos;
	}
	
	public SysUsrUsrInfo getUserByName(String userName) {
		SysUsrUsrInfo sysUsrUsrInfo = new SysUsrUsrInfo();
		String sql = "select * from sys_usr_usr_info where usr_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {userName});
		if (rs == null) {
			sysUsrUsrInfo = null;
		}
		try {
			while (rs.next()) {
				sysUsrUsrInfo.setUsr_id(rs.getString("usr_id"));
				sysUsrUsrInfo.setUsr_name(rs.getString("usr_name"));
				sysUsrUsrInfo.setUsr_pwd(rs.getString("usr_pwd"));
				sysUsrUsrInfo.setOrg_usr_id(rs.getString("org_usr_id"));
				sysUsrUsrInfo.setUsr_role(rs.getString("usr_role"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return sysUsrUsrInfo;
	}
	
	/*
	 *@author xianing
	 *获取管理员账号信息
	 */
	public SysUsrUsrInfoVo getAllUserInfoByName(String userName) {
		SysUsrUsrInfoVo sysUsrUsrInfoVo = new SysUsrUsrInfoVo();
		String sql = "select * from sys_usr_usr_info a left join sys_org_usr_info b on a.org_usr_id = b.org_usr_id where usr_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {userName});
		if (rs == null) {
			sysUsrUsrInfoVo = null;
		}
		try {
			while (rs.next()) {
				sysUsrUsrInfoVo.setUsr_id(rs.getString("usr_id"));
				sysUsrUsrInfoVo.setUsr_name(rs.getString("usr_name"));
				sysUsrUsrInfoVo.setUsr_pwd(rs.getString("usr_pwd"));
				sysUsrUsrInfoVo.setOrg_usr_id(rs.getString("org_usr_id"));
				sysUsrUsrInfoVo.setUsr_role(rs.getString("usr_role"));
				sysUsrUsrInfoVo.setOrg_usr_name(rs.getString("org_usr_name"));
				sysUsrUsrInfoVo.setEmail(rs.getString("e_mail"));
				sysUsrUsrInfoVo.setQq(rs.getString("qq"));
				sysUsrUsrInfoVo.setPhone_no(rs.getString("phone_no"));
				sysUsrUsrInfoVo.setDepartment_id(rs.getString("department_id"));
				sysUsrUsrInfoVo.setJob_name(rs.getString("job_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return sysUsrUsrInfoVo;
	}
	
	public SysOrgUsrInfo getOrgUserById(String org_usr_id) {
		SysOrgUsrInfo sysOrgUsrInfo = new SysOrgUsrInfo();
		String sql = "select * from sys_org_usr_info where org_usr_id like ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {org_usr_id});
		if (rs == null) {
			sysOrgUsrInfo = null;
		}
		try {
			while (rs.next()) {
				sysOrgUsrInfo.setDepartment_id(rs.getString("department_id"));
				sysOrgUsrInfo.setOrg_usr_id(rs.getString("org_usr_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return sysOrgUsrInfo;
	}
}
