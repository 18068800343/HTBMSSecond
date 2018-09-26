package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.EvaBrgRec;
import hs.bm.vo.DefectStatistics;
import hs.bm.vo.EvalStatistics;
import hs.bm.vo.MemberStatistics;


public class StatisticsDao {

	private static StatisticsDao statisticsDao;

	public static StatisticsDao getInstance() {
		if (statisticsDao == null) {
			statisticsDao = new StatisticsDao();
		}
		return statisticsDao;
	}
	
	public int initCount(String name,String startTime){
		int i=0;
		String sql="select max(report_count) from report_info where user_name=? and report_start_date=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql,new String[]{name,startTime});
		try {
			while (rs.next()) {
				i=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return i;
	} 
	
	public List<Map<String, String>> initProject() {
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		String sql = "select prj_id, prj_desc, chk_type,zone_id from chk_project_info ORDER BY prj_establish_tm DESC";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("prj_id", rs.getString("prj_id"));
				map.put("prj_desc", rs.getString("prj_desc"));
				map.put("chk_type", rs.getString("chk_type"));
				map.put("zone_id", rs.getString("zone_id"));
				ll.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<Map<String, String>> chioceProject(String projectType,String orgId){
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql="";
		ResultSet rs;
		if(projectType.equals("all")&&orgId.equals("all")){
			sql = "select prj_id, prj_desc, chk_type,zone_id from chk_project_info ORDER BY prj_establish_tm DESC";
			rs = dataOperation.executeQuery(sql, new String[] {});
		}else if(projectType.equals("all")&&!orgId.equals("all")){
			String zone_id= orgId.substring(0,4)+"%";
			sql = "select prj_id, prj_desc, chk_type,zone_id from chk_project_info where zone_id like ? ORDER BY prj_establish_tm DESC";
			rs = dataOperation.executeQuery(sql, new String[] {zone_id});
		}else if(!projectType.equals("all")&&orgId.equals("all")){
			sql = "select prj_id, prj_desc, chk_type,zone_id from chk_project_info where chk_type=? ORDER BY prj_establish_tm DESC";
			rs = dataOperation.executeQuery(sql, new String[] {projectType});
		}else{
			String zone_id= orgId.substring(0,4)+"%";
			sql = "select prj_id, prj_desc, chk_type,zone_id from chk_project_info where chk_type=? and zone_id like ? ORDER BY prj_establish_tm DESC";
			rs = dataOperation.executeQuery(sql, new String[] {projectType,zone_id});
		}
		try {
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("prj_id", rs.getString("prj_id"));
				map.put("prj_desc", rs.getString("prj_desc"));
				map.put("chk_type", rs.getString("chk_type"));
				map.put("zone_id", rs.getString("zone_id"));
				ll.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	
	public List<Map<String, String>> initProject2(String zone_id) {
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		String sql = "select prj_id, prj_desc, chk_type,zone_id from chk_project_info where zone_id like ? ORDER BY prj_establish_tm DESC";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {zone_id});
		try {
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("prj_id", rs.getString("prj_id"));
				map.put("prj_desc", rs.getString("prj_desc"));
				map.put("chk_type", rs.getString("chk_type"));
				map.put("zone_id", rs.getString("zone_id"));
				ll.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
 
	public List<Map<String, String>> getProject1(String norm,String zone_id) {
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		String sql=null;
		if(norm.equals("%")){
			sql = "select * from chk_project_info ORDER BY prj_establish_tm DESC";
		}else if(norm.equals("2011")){
			sql="select a.* from chk_project_info a,eva_mbr b where a.prj_id=b.prj_id GROUP BY a.prj_id ORDER BY a.prj_establish_tm DESC";
		}else{
			sql="select a.* from chk_project_info a,eva_ubr_2004 b where a.prj_id=b.prj_id GROUP BY a.prj_id ORDER BY a.prj_establish_tm DESC";
		}		
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("prj_id", rs.getString("prj_id"));
				map.put("prj_desc", rs.getString("prj_desc"));
				map.put("chk_type", rs.getString("chk_type"));
				map.put("zone_id", rs.getString("zone_id"));
				ll.add(map);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	
	public List<Map<String, String>> getProject2(String norm,String zone_id) {
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		String sql=null;
		if(norm.equals("%")){
			sql = "select prj_id, prj_desc, chk_type,zone_id from chk_project_info where zone_id like ? ORDER BY prj_establish_tm DESC";	
		}else if(norm.equals("2011")){
			sql = "select a.prj_id, a.prj_desc, a.chk_type,a.zone_id from chk_project_info a,eva_mbr b where a.prj_id=b.prj_id and a.zone_id like ? GROUP BY a.prj_id ORDER BY a.prj_establish_tm DESC";
		}else{
			sql = "select a.prj_id, a.prj_desc, a.chk_type,a.zone_id from chk_project_info a,eva_ubr_2004 b where a.prj_id=b.prj_id and a.zone_id like ? GROUP BY a.prj_id ORDER BY a.prj_establish_tm DESC";
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {zone_id});
		try {
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("prj_id", rs.getString("prj_id"));
				map.put("prj_desc", rs.getString("prj_desc"));
				map.put("chk_type", rs.getString("chk_type"));
				map.put("zone_id", rs.getString("zone_id"));
				ll.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
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
	
	public List<Map<String, String>> getStructProjectByProject(String prj_id, String type,String manageName,String line) {
		List<Map<String, String>> ls = new ArrayList<Map<String, String>>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = null;
		String sql = "";
		switch (type) {
		case "bridge":
			sql = "select bridge_id,prj_id from chk_brg_regular where prj_id like ? and line_no like ? and maintain_org like ?";
			rs = dataOperation.executeQuery(sql, new String[] { prj_id ,line,manageName});
			try {
				while (rs.next()) {
					Map<String, String> map = new HashMap<String, String>();
					map.put("struct", rs.getString("bridge_id"));
					map.put("project", rs.getString("prj_id"));
					ls.add(map);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "culvert":
			sql = "select culvert_id,prj_id from chk_culvert_regular where prj_id like ?";
			rs = dataOperation.executeQuery(sql, new String[] { prj_id });
			try {
				while (rs.next()) {
					Map<String, String> map = new HashMap<String, String>();
					map.put("struct", rs.getString("culvert_id"));
					map.put("project", rs.getString("prj_id"));
					ls.add(map);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "pass":
			sql = "select pass_id,prj_id from chk_pass_regular where prj_id like ?";
			rs = dataOperation.executeQuery(sql, new String[] { prj_id });
			try {
				while (rs.next()) {
					Map<String, String> map = new HashMap<String, String>();
					map.put("struct", rs.getString("pass_id"));
					map.put("project", rs.getString("prj_id"));
					ls.add(map);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		}
		dataOperation.close();
		return ls;
	}

	public List<String> getRepeat(List<String> ls1, List<String> ls2) {
		if (ls1 == null) {
			return ls2;
		}
		if (ls2 == null) {
			return ls1;
		}
		List<String> ls = new ArrayList<String>();
		for (String s : ls1) {
			if (ls2.contains(s)) {
				ls.add(s);
			}
		}
		return ls;

	}

	public Map<String, List<Map<String, String>>> GetAllStruct() {
		Map<String, List<Map<String, String>>> map = new HashMap<String, List<Map<String, String>>>();
		List<Map<String, String>> lmb = GetAllBrg();
		List<Map<String, String>> lmc = GetAllCul();
		List<Map<String, String>> lmp = GetAllPass();
		if (lmb.size() > 0) {
			map.put("bridge", lmb);
		}
		if (lmc.size() > 0) {
			map.put("culvert", lmc);
		}
		if (lmp.size() > 0) {
			map.put("pass", lmp);
		}
		return map;
	}

	public Map<String, List<Map<String, String>>> GetAllStruct2(String orgid) {
		Map<String, List<Map<String, String>>> map = new HashMap<String, List<Map<String, String>>>();
		List<Map<String, String>> lmb = GetAllBrg2(orgid);
		
		if (lmb.size() > 0) {
			map.put("bridge", lmb);
		}
		
		return map;
	}
	public List<Map<String, String>> GetAllBrg() {
		List<Map<String, String>> lmb = new ArrayList<Map<String, String>>();
		String sql = "select * from brg_card_admin_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				Map<String, String> m1 = new HashMap<String, String>();
				m1.put("id", rs.getString("bridge_id"));
				m1.put("name", rs.getString("bridge_name"));
				lmb.add(m1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return lmb;
	}
	
	public List<Map<String, String>> GetAllBrg2(String orgid) {
		
		List<Map<String, String>> lmb = new ArrayList<Map<String, String>>();
		String sql = "select * from brg_card_admin_id where manage_id like ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String [] {orgid});
		try {
			while (rs.next()) {
				Map<String, String> m1 = new HashMap<String, String>();
				m1.put("id", rs.getString("bridge_id"));
				m1.put("name", rs.getString("bridge_name"));
				lmb.add(m1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		dataOperation.close();
		return lmb;
	}

	public List<String> getAllStructId(String type) {
		List<String> lmb = new ArrayList<String>();
		String sql = "";
		String s = "";

		if (type.equals("bridge")) {
			sql = "select * from brg_card_admin_id";
			s = "bridge_id";
		}
		if (type.equals("pass")) {
			sql = "select * from pass_info";
			s = "pass_id";
		}
		if (type.equals("culvert")) {
			sql = "select * from cul_info";
			s = "culvert_id";
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				String id = rs.getString(s);
				lmb.add(id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return lmb;
	}

	public List<Map<String, String>> GetAllCul() {
		List<Map<String, String>> lmc = new ArrayList<Map<String, String>>();
		String sql = "select * from cul_info";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				Map<String, String> m1 = new HashMap<String, String>();
				m1.put("id", rs.getString("culvert_id"));
				m1.put("name", rs.getString("culvert_no"));
				lmc.add(m1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return lmc;
	}

	public List<Map<String, String>> GetAllPass() {
		List<Map<String, String>> lmp = new ArrayList<Map<String, String>>();
		String sql = "select * from pass_info";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				Map<String, String> m1 = new HashMap<String, String>();
				m1.put("id", rs.getString("pass_id"));
				m1.put("name", rs.getString("pass_no"));
				lmp.add(m1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return lmp;
	}

	public List<String> initComponent(String specification) {
		List<String> ll = new ArrayList<String>();
		String sql = "select component_name from dic_brg_struct_component_def where specification=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { specification });
		try {
			while (rs.next()) {
				String component_name = rs.getString("component_name");
				ll.add(component_name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<MemberStatistics> searchMember(MemberStatistics statistics) {
		List<MemberStatistics> ll = new ArrayList<MemberStatistics>();
		List<String> ids = new ArrayList<String>();

		List<String> prj = null;
		if (!statistics.getProject().equals("0")) {
			prj = getStructByProject(statistics.getProject(), statistics.getStruct_mode());
		}
		System.out.println("prj："+JSON.toJSONString(prj));
//		List<String> lsec = getStructByLineManage( statistics );
		List<String> sid = new ArrayList<String>();
		if (statistics.getStruct().equals("%")) {
			sid = getAllStructId(statistics.getStruct_mode());
		} else {
			sid.add(statistics.getStruct());
		}
//		ids = getRepeat(prj, lsec);
		ids = getRepeat(prj, sid);
		System.out.println(JSON.toJSONString(ids));
		System.out.println(ids.size());
		for (String s : ids) {
			ll.addAll(getMemList(s, statistics.getStruct_mode(), statistics));
		}
		return ll;
	}

/*	 public List<String> getStructByLineManage( MemberStatistics statistics ) {
		List<String> ll = new ArrayList<String>();
		String sql = null;
		if (statistics.getStruct_mode().equals("bridge")) {
			sql = "select bridge_id from dic_hw_brg_section_relation where highway_id like ? and section_id like ? and struct_type='桥梁'";
		}
		if (statistics.getStruct_mode().equals("pass")) {
			sql = "select struct_id from dic_hw_brg_section_relation where highway_id like ? and section_id like ? and struct_type='通道'";
		}
		if (statistics.getStruct_mode().equals("culvert")) {
			sql = "select struct_id from dic_hw_brg_section_relation where highway_id like ? and section_id like ? and struct_type='涵洞'";
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { line, section });
		try {
			while (rs.next()) {
				String struct_id = rs.getString("struct_id");
				ll.add(struct_id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}*/

	/*public List<MemberStatistics> getMemList(String id, String type, MemberStatistics mem) {
		List<MemberStatistics> lm = new ArrayList<MemberStatistics>();
		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = null;
		try {
			switch (type) {
			case "bridge":
				sql = "SELECT t1.*,t2.* FROM(SELECT d3.highway_name,d2.section_name,b1.bridge_name,"
						+ "d1.struct_id from dic_hw_brg_section_relation d1,dic_hw_section_info d2,"
						+ "dic_hw_info d3,brg_card_admin_id as b1 where d1.struct_id=b1.bridge_id "
						+ "and d1.highway_id=d3.highway_id and d1.section_id=d2.section_id)"
						+ " as t1 RIGHT JOIN(SELECT bs.direction,bs.span_no,db.brg_type_name,dbs.distr_name,"
						+ "dbs.component8,bm.member_type,bm.member_model,bm.member_no,bs.bridge_id from brg_mbr_info as bm,"
						+ "brg_span_info as bs,dic_brg_struct_type_def as db,dic_brg_struct_member_def as dbs "
						+ "where bs.bridge_id=? and bs.brg_type_id=db.brg_type_id "
						+ "and bs.s_id=bm.s_id and bm.member_type=dbs.member_name and bs.direction like ? "
						+ "and bs.span_no like ? and db.brg_type_id like ? and dbs.distr_name like ? "
						+ "and dbs.component8 like ? and bm.member_type like ? and bm.member_model like ?"
						+ ") as t2 ON t1.struct_id=t2.bridge_id";
				rs = dataOperation
						.executeQuery(sql,
								new String[] { id, mem.getDirection(), mem.getSpan(), mem.getStruct_type(),
										mem.getDistr_name(), mem.getComponent_name(), mem.getMember_name(),
										mem.getMemType() });
				while (rs.next()) {
					MemberStatistics ms = new MemberStatistics();
					ms.setLine(rs.getString("highway_name"));
					ms.setSection(rs.getString("section_name"));
					ms.setStruct_mode("桥梁");
					ms.setStruct(rs.getString("bridge_name"));
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("brg_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component8"));
					ms.setMember_name(rs.getString("member_type"));
					ms.setMember_no(rs.getString("member_no"));
					ms.setMemType(rs.getString("member_model"));
					lm.add(ms);
				}
				break;
			case "culvert":
				sql = "SELECT t1.*,t2.* FROM(SELECT d3.highway_name,d2.section_name,d1.struct_id from "
						+ "dic_hw_brg_section_relation d1,dic_hw_section_info d2,dic_hw_info d3 where "
						+ "d1.highway_id=d3.highway_id and d1.section_id=d2.section_id) as t1 RIGHT JOIN"
						+ "(SELECT bs.direction,bs.span_no,db.cul_type_name,dbs.distr_name,dbs.component10,"
						+ "bm.member_type,bm.member_no,bs.culvert_id from cul_mbr_info as bm,cul_span_info as bs,"
						+ "dic_cul_struct_type_def as db,dic_brg_struct_member_def as dbs where "
						+ "bs.culvert_id=? and bs.cul_type_id=db.cul_type_id and bs.s_id=bm.s_id and "
						+ "bm.member_type=dbs.member_name and bs.direction like ? "
						+ "and bs.span_no like ? and db.cul_type_id like ? "
						+ "and dbs.component10 like ? and bm.member_type like ?) as t2 ON t1.struct_id=t2.culvert_id";
				rs = dataOperation.executeQuery(sql, new String[] { id, mem.getDirection(), mem.getSpan(),
						mem.getStruct_type(), mem.getComponent_name(), mem.getMember_name() });
				while (rs.next()) {
					MemberStatistics ms = new MemberStatistics();
					ms.setLine(rs.getString("highway_name"));
					ms.setSection(rs.getString("section_name"));
					ms.setStruct_mode("涵洞");
					ms.setStruct(id);
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("cul_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component10"));
					ms.setMember_name(rs.getString("member_type"));
					ms.setMember_no(rs.getString("member_no"));
					lm.add(ms);
				}

				break;
			case "pass":
				sql = "SELECT t1.*,t2.* FROM (SELECT d3.highway_name,d2.section_name,d1.struct_id "
						+ "from dic_hw_brg_section_relation d1,dic_hw_section_info d2,dic_hw_info d3 "
						+ "where d1.highway_id=d3.highway_id and d1.section_id=d2.section_id ) as t1 "
						+ "RIGHT JOIN(SELECT bs.direction,bs.span_no,db.pass_type_name,dbs.distr_name,"
						+ "dbs.component9,bm.member_type,bm.member_no,bs.pass_id from pass_mbr_info as bm,"
						+ "pass_span_info as bs,dic_pass_struct_type_def as db,dic_brg_struct_member_def as dbs "
						+ "where bs.pass_id=? and bs.pass_type_id=db.pass_type_id and bs.s_id=bm.s_id "
						+ "and bm.member_type=dbs.member_name AND bs.direction like ? and bs.span_no like ? "
						+ "and db.pass_type_id like ? and dbs.component9 like ? "
						+ "and bm.member_type like ?) as t2 ON t1.struct_id=t2.pass_id";
				rs = dataOperation.executeQuery(sql, new String[] { id, mem.getDirection(), mem.getSpan(),
						mem.getStruct_type(), mem.getComponent_name(), mem.getMember_name() });
				while (rs.next()) {
					MemberStatistics ms = new MemberStatistics();
					ms.setLine(rs.getString("highway_name"));
					ms.setSection(rs.getString("section_name"));
					ms.setStruct_mode("通道");
					ms.setStruct(id);
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("pass_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component9"));
					ms.setMember_name(rs.getString("member_type"));
					ms.setMember_no(rs.getString("member_no"));
					lm.add(ms);
				}

				break;
			}
		} catch (Exception e) {
		} finally {
			dataOperation.close();
		}
		return lm;
	}*/

	public List<MemberStatistics> getMemList(String id, String type, MemberStatistics mem) {
		List<MemberStatistics> lm = new ArrayList<MemberStatistics>();
		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = null;
		try {
			switch (type) {
			case "bridge":
				sql = "SELECT\n" +
						"	b.highway_name,\n" +
						"	e.section_name,\n" +
						"	c.org_name,\n" +
						"	d.zone_name,\n" +
						"	a.bridge_name,\n" +
						"	bsi.direction,\n" +
						"	bsi.span_no,\n" +
						"	dbst.brg_type_name,\n" +
						"	dbsm.distr_name,\n" +
						"	dbsm.component8,\n" +
						"	dbsm.member_name,\n" +
						"	bmi.member_no,\n" +
						"	bmi.member_model\n" +
						"FROM\n" +
						"	brg_card_admin_id AS a,\n" +
						"	dic_hw_info AS b,\n" +
						"	sys_org_info AS c,\n" +
						"	sys_zone_info AS d,\n" +
						"	sys_section_info AS e,\n" +
						"	brg_mbr_info AS bmi,\n" +
						"	brg_span_info AS bsi,\n" +
						"	dic_brg_struct_type_def AS dbst,\n" +
						"	dic_brg_struct_distr_def AS dbsd,\n" +
						"	dic_brg_struct_member_def AS dbsm\n" +
						"WHERE\n" +
						"	a.bridge_id LIKE ?\n" +
						"AND b.highway_id LIKE ?\n" +
						"AND e.section_id LIKE ?\n" +
						"AND c.org_id LIKE ?\n" +
						"AND d.zone_id LIKE ?\n" +
						"AND a.highway_id = b.highway_id\n" +
						"AND a.manage_id = c.org_id\n" +
						"AND a.zone_id = d.zone_id\n" +
						"AND a.section_id = e.section_id\n" +
						"AND bsi.direction LIKE ?\n" +
						"AND bsi.span_no LIKE ?\n" +
						"AND bsi.bridge_id = a.bridge_id\n" +
						"AND bsi.s_id = bmi.s_id\n" +
						"AND dbst.brg_type_id LIKE ?\n" +
						"AND bsi.brg_type_id = dbst.brg_type_id\n" +
						"AND dbsm.member_name LIKE ?\n" +
						"AND dbsm.member_name = bmi.member_type\n" +
						"AND dbsm.distr_name LIKE ?\n" +
						"AND dbsm.component8 LIKE ?\n" +
						"GROUP BY\n" +
						"	b.highway_name,\n" +
						"	e.section_name,\n" +
						"	c.org_name,\n" +
						"	d.zone_name,\n" +
						"	a.bridge_name,\n" +
						"	bsi.direction,\n" +
						"	bsi.span_no,\n" +
						"	dbst.brg_type_name,\n" +
						"	dbsm.distr_name,\n" +
						"	dbsm.component8,\n" +
						"	dbsm.member_name,\n" +
						"	bmi.member_no,\n" +
						"	bmi.member_model;";
				rs = dataOperation
						.executeQuery(sql,
								new String[] { id, mem.getLine(), mem.getSection(), mem.getManage(),
										mem.getZone(), mem.getDirection(), mem.getSpan(),
										mem.getStruct_type(),mem.getMember_name(),mem.getDistr_name(),mem.getComponent_name() });
				while (rs.next()) {
					MemberStatistics ms = new MemberStatistics();
					ms.setLine(rs.getString("highway_name"));
					ms.setSection(rs.getString("section_name"));
					ms.setManage(rs.getString("org_name"));
					ms.setZone(rs.getString("zone_name"));
					ms.setStruct_mode("桥梁");
					ms.setStruct(rs.getString("bridge_name"));
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("brg_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component8"));
					ms.setMember_name(rs.getString("member_name"));
					ms.setMember_no(rs.getString("member_no"));
					ms.setMemType(rs.getString("member_model"));
					lm.add(ms);
				}
				break;
			case "culvert":
				sql = "SELECT\n" +
						"	b.highway_name,\n" +
						"	e.section_name,\n" +
						"	c.org_name as manage_name,\n" +
						"	d.zone_name,\n" +
						"	a.culvert_name,\n" +
						"	bsi.direction,\n" +
						"	bsi.span_no,\n" +
						"	dbst.cul_type_name,\n" +
						"	dbsm.distr_name,\n" +
						"	dbsm.component8,\n" +
						"	dbsm.member_name,\n" +
						"	bmi.member_no,\n" +
						"	bmi.member_model\n" +
						"FROM\n" +
						"	cul_info AS a,\n" +
						"	dic_hw_info AS b,\n" +
						"	sys_org_info AS c,\n" +
						"	sys_zone_info AS d,\n" +
						"	sys_section_info AS e,\n" +
						"	cul_mbr_info AS bmi,\n" +
						"	cul_span_info AS bsi,\n" +
						"	dic_cul_struct_type_def AS dbst,\n" +
						"	dic_brg_struct_distr_def AS dbsd,\n" +
						"	dic_brg_struct_member_def AS dbsm\n" +
						"WHERE\n" +
						"	a.culvert_id LIKE ?\n" +
						"AND b.highway_id LIKE ?\n" +
						"AND e.section_id LIKE ?\n" +
						"AND c.org_id LIKE ?\n" +
						"AND d.zone_id LIKE ?\n" +
						"AND a.highway_id = b.highway_id\n" +
						"AND a.manage_id = c.org_id\n" +
						"AND a.zone_id = d.zone_id\n" +
						"AND a.section_id = e.section_id\n" +
						"AND bsi.direction LIKE ?\n" +
						"AND bsi.span_no LIKE ?\n" +
						"AND bsi.culvert_id = a.culvert_id\n" +
						"AND bsi.s_id = bmi.s_id\n" +
						"AND dbst.cul_type_id LIKE ?\n" +
						"AND bsi.cul_type_id = dbst.cul_type_id\n" +
						"AND dbsm.member_name LIKE ?\n" +
						"AND dbsm.member_name = bmi.member_type\n" +
						"AND dbsm.distr_name LIKE ?\n" +
						"AND dbsm.component10 LIKE ?\n" +
						"GROUP BY\n" +
						"	b.highway_name,\n" +
						"	e.section_name,\n" +
						"	c.org_name,\n" +
						"	d.zone_name,\n" +
						"	a.culvert_name,\n" +
						"	bsi.direction,\n" +
						"	bsi.span_no,\n" +
						"	dbst.cul_type_name,\n" +
						"	dbsm.distr_name,\n" +
						"	dbsm.component8,\n" +
						"	dbsm.member_name,\n" +
						"	bmi.member_no,\n" +
						"	bmi.member_model;";
				rs = dataOperation.executeQuery(sql, new String[] { id, mem.getLine(), mem.getSection(), mem.getManage(),
						mem.getZone(), mem.getDirection(), mem.getSpan(),
						mem.getStruct_type(),mem.getMember_name(),mem.getDistr_name(),mem.getComponent_name() });
				while (rs.next()) {
					MemberStatistics ms = new MemberStatistics();
					ms.setLine(rs.getString("highway_name"));
					ms.setSection(rs.getString("section_name"));
					ms.setManage(rs.getString("manage_name"));
					ms.setZone(rs.getString("zone_name"));
					ms.setStruct_mode("涵洞");
					ms.setStruct(rs.getString("bridge_name"));
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("brg_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component8"));
					ms.setMember_name(rs.getString("member_name"));
					ms.setMember_no(rs.getString("member_no"));
					ms.setMemType(rs.getString("member_model"));
					lm.add(ms);
				}

				break;
			case "pass":
				sql = "SELECT\n" +
						"	b.highway_name,\n" +
						"	e.section_name,\n" +
						"	c.org_name AS manage_name,\n" +
						"	d.zone_name,\n" +
						"	a.pass_name,\n" +
						"	bsi.direction,\n" +
						"	bsi.span_no,\n" +
						"	dbst.pass_type_name,\n" +
						"	dbsm.distr_name,\n" +
						"	dbsm.component8,\n" +
						"	dbsm.member_name,\n" +
						"	bmi.member_no,\n" +
						"	bmi.member_model\n" +
						"FROM\n" +
						"	pass_info AS a,\n" +
						"	dic_hw_info AS b,\n" +
						"	sys_org_info AS c,\n" +
						"	sys_zone_info AS d,\n" +
						"	sys_section_info AS e,\n" +
						"	pass_mbr_info AS bmi,\n" +
						"	pass_span_info AS bsi,\n" +
						"	dic_pass_struct_type_def AS dbst,\n" +
						"	dic_brg_struct_distr_def AS dbsd,\n" +
						"	dic_brg_struct_member_def AS dbsm\n" +
						"WHERE\n" +
						"	a.pass_id LIKE ?\n" +
						"AND b.highway_id LIKE ?\n" +
						"AND e.section_id LIKE ?\n" +
						"AND c.org_id LIKE ?\n" +
						"AND d.zone_id LIKE ?\n" +
						"AND a.highway_id = b.highway_id\n" +
						"AND a.manage_id = c.org_id\n" +
						"AND a.zone_id = d.zone_id\n" +
						"AND a.section_id = e.section_id\n" +
						"AND bsi.direction LIKE ?\n" +
						"AND bsi.span_no LIKE ?\n" +
						"AND bsi.pass_id = a.pass_id\n" +
						"AND bsi.s_id = bmi.s_id\n" +
						"AND dbst.pass_type_id LIKE ?\n" +
						"AND bsi.pass_type_id = dbst.pass_type_id\n" +
						"AND dbsm.member_name LIKE ?\n" +
						"AND dbsm.member_name = bmi.member_type\n" +
						"AND dbsm.distr_name LIKE ?\n" +
						"AND dbsm.component9 LIKE ?\n" +
						"GROUP BY\n" +
						"	b.highway_name,\n" +
						"	e.section_name,\n" +
						"	c.org_name,\n" +
						"	d.zone_name,\n" +
						"	a.pass_name,\n" +
						"	bsi.direction,\n" +
						"	bsi.span_no,\n" +
						"	dbst.pass_type_name,\n" +
						"	dbsm.distr_name,\n" +
						"	dbsm.component8,\n" +
						"	dbsm.member_name,\n" +
						"	bmi.member_no,\n" +
						"	bmi.member_model;";
				rs = dataOperation.executeQuery(sql, new String[] { id, mem.getLine(), mem.getSection(), mem.getManage(),
						mem.getZone(), mem.getDirection(), mem.getSpan(),
						mem.getStruct_type(),mem.getMember_name(),mem.getDistr_name(),mem.getComponent_name() });
				while (rs.next()) {
					MemberStatistics ms = new MemberStatistics();
					ms.setLine(rs.getString("highway_name"));
					ms.setSection(rs.getString("section_name"));
					ms.setManage(rs.getString("manage_name"));
					ms.setZone(rs.getString("zone_name"));
					ms.setStruct_mode("通道");
					ms.setStruct(rs.getString("bridge_name"));
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("brg_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component8"));
					ms.setMember_name(rs.getString("member_name"));
					ms.setMember_no(rs.getString("member_no"));
					ms.setMemType(rs.getString("member_model"));
					lm.add(ms);
				}

				break;
			}
		} catch (Exception e) {
		} finally {
			dataOperation.close();
		}
		return lm;
	}
	/*public List<DefectStatistics> getDefectList(String prj_id, String id, String type, DefectStatistics mem) {
		StructLine sl = getStructLine(id, type);
		List<DefectStatistics> lm = new ArrayList<DefectStatistics>();
		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = null;
		try {
			switch (type) {
			case "bridge":
				sql = "SELECT cpi.prj_desc,btd.brg_type_name,cbd.defect_name_f,cbd.defect_name,"
						+ "cbd.defect_location_desc,cbd.defect_count,cbd.defect_attr,cmr.direction,cmr.span_no,"
						+ "bmd.distr_name,bmd.component8,cmr.mbr_type,cmr.mbr_no,bmi.member_model "
						+ "from chk_brg_defect as cbd,chk_brg_record as cmr,chk_span_record as csr,"
						+ "chk_brg_regular as cbr,brg_span_info as bsi,brg_mbr_info as bmi,"
						+ "chk_project_info as cpi,dic_brg_struct_type_def as btd,dic_brg_struct_member_def"
						+ " as bmd where cbd.mbr_chk_id=cmr.mbr_chk_id and cmr.span_chk_id=csr.span_chk_id"
						+ " and csr.chk_id=cbr.chk_id and cbr.prj_id=?"
						+ " and cbr.prj_id=cpi.prj_id and cbr.bridge_id=? and bsi.s_id=bmi.s_id and"
						+ " bsi.bridge_id=cbr.bridge_id and cmr.direction=bsi.direction and "
						+ "cmr.span_no=bsi.span_no and cmr.mbr_type=bmi.member_type and "
						+ "cmr.mbr_no=bmi.member_no and bsi.brg_type_id=btd.brg_type_id and "
						+ "bmd.member_name=cmr.mbr_type and cmr.direction like ? and "
						+ "cmr.span_no like ? and btd.brg_type_id like ? and "
						+ "bmd.distr_name like ? and bmd.component8 like ? and "
						+ "cmr.mbr_type like ? and bmi.member_model like ? and"
						+ " cbd.defect_name_f like ? and cbd.defect_name like ?";
				rs = dataOperation.executeQuery(sql,
						new String[] { prj_id, id, mem.getDirection(), mem.getSpan(), mem.getStruct_type(),
								mem.getDistr_name(), mem.getComponent_name(), mem.getMember_name(), 
								mem.getMemType(), mem.getDefect_name_f(), mem.getDefect_name() });
				while (rs.next()) {
					DefectStatistics ms = new DefectStatistics();
					ms.setProject(rs.getString("prj_desc"));
					ms.setLine(sl.getHighway_name());
					ms.setSection(sl.getSection_name());
					ms.setStruct_mode("桥梁");
					ms.setStruct(sl.getStruct_name());
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("brg_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component8"));
					ms.setMember_name(rs.getString("mbr_type"));
					ms.setMember_no(rs.getString("mbr_no"));
					ms.setMemType(rs.getString("member_model"));
					ms.setDefect_name_f(rs.getString("defect_name_f"));
					ms.setDefect_name(rs.getString("defect_name"));
					ms.setDefect_count(rs.getString("defect_count"));
					ms.setDefect_location_desc(rs.getString("defect_location_desc"));
					ms.setImportant(rs.getString("defect_attr"));
					lm.add(ms);
				}
				break;
			case "culvert":
				sql = "SELECT cpi.prj_desc,btd.cul_type_name,cbd.defect_name_f,cbd.defect_name,"
						+ "cbd.defect_location_desc,cbd.defect_count,cbd.defect_attr,cmr.direction,"
						+ "cmr.span_no,bmd.distr_name,bmd.component10,cmr.mbr_type,"
						+ "cmr.mbr_no,bmi.member_model from chk_culvert_defect as cbd,"
						+ "chk_culvert_record as cmr,chk_culvert_span_record as csr,"
						+ "chk_culvert_regular as cbr,cul_span_info as bsi,"
						+ "cul_mbr_info as bmi,chk_project_info as cpi,"
						+ "dic_cul_struct_type_def as btd,dic_brg_struct_member_def as bmd "
						+ "where cbd.mbr_chk_id=cmr.mbr_chk_id and cmr.span_chk_id=csr.span_chk_id"
						+ " and csr.chk_id=cbr.chk_id and cbr.prj_id=? "
						+ "and cbr.prj_id=cpi.prj_id"
						+ " and cbr.culvert_id=? and bsi.s_id=bmi.s_id and bsi.culvert_id=cbr.culvert_id "
						+ "and cmr.direction=bsi.direction and cmr.span_no=bsi.span_no"
						+ " and cmr.mbr_type=bmi.member_type and cmr.mbr_no=bmi.member_no and "
						+ "bsi.cul_type_id=btd.cul_type_id and bmd.member_name=cmr.mbr_type"
						+ " and cmr.direction like ? and cmr.span_no like ? and "
						+ "btd.cul_type_id like ? and bmd.distr_name like ?"
						+ " and bmd.component10 like ? and cmr.mbr_type like ? "
						+ "and bmi.member_model like ?"
						+ " and cbd.defect_name_f like ? and cbd.defect_name like ?";
				rs = dataOperation.executeQuery(sql,
						new String[] { prj_id, id, mem.getDirection(), mem.getSpan(), mem.getStruct_type(),
								mem.getDistr_name(), mem.getComponent_name(), mem.getMember_name(),
								mem.getMemType(), mem.getDefect_name_f(), mem.getDefect_name() });
				while (rs.next()) {
					DefectStatistics ms = new DefectStatistics();
					ms.setProject(rs.getString("prj_desc"));
					ms.setLine(sl.getHighway_name());
					ms.setSection(sl.getSection_name());
					ms.setStruct_mode("涵洞");
					ms.setStruct(sl.getStruct_name());
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("cul_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component10"));
					ms.setMember_name(rs.getString("mbr_type"));
					ms.setMember_no(rs.getString("mbr_no"));
					ms.setMemType(rs.getString("member_model"));
					ms.setDefect_name_f(rs.getString("defect_name_f"));
					ms.setDefect_name(rs.getString("defect_name"));
					ms.setDefect_count(rs.getString("defect_count"));
					ms.setDefect_location_desc(rs.getString("defect_location_desc"));
					ms.setImportant(rs.getString("defect_attr"));
					lm.add(ms);
				}

				break;
			case "pass":
				sql = "SELECT cpi.prj_desc,btd.pass_type_name,cbd.defect_name_f,cbd.defect_name,"
						+ "cbd.defect_location_desc,cbd.defect_count,cbd.defect_attr,cmr.direction,"
						+ "cmr.span_no,bmd.distr_name,bmd.component9,cmr.mbr_type,"
						+ "cmr.mbr_no,bmi.member_model from chk_pass_defect as cbd,"
						+ "chk_pass_record as cmr,chk_pass_span_record as csr,"
						+ "chk_pass_regular as cbr,pass_span_info as bsi,"
						+ "pass_mbr_info as bmi,chk_project_info as cpi,"
						+ "dic_pass_struct_type_def as btd,dic_brg_struct_member_def as bmd "
						+ "where cbd.mbr_chk_id=cmr.mbr_chk_id and cmr.span_chk_id=csr.span_chk_id"
						+ " and csr.chk_id=cbr.chk_id and cbr.prj_id=? "
						+ "and cbr.prj_id=cpi.prj_id"
						+ " and cbr.pass_id=? and bsi.s_id=bmi.s_id and bsi.pass_id=cbr.pass_id "
						+ "and cmr.direction=bsi.direction and cmr.span_no=bsi.span_no"
						+ " and cmr.mbr_type=bmi.member_type and cmr.mbr_no=bmi.member_no and "
						+ "bsi.pass_type_id=btd.pass_type_id and bmd.member_name=cmr.mbr_type"
						+ " and cmr.direction like ? and cmr.span_no like ? and "
						+ "btd.pass_type_id like ? and bmd.distr_name like ?"
						+ " and bmd.component9 like ? and cmr.mbr_type like ? "
						+ "and bmi.member_model like ?"
						+ " and cbd.defect_name_f like ? and cbd.defect_name like ?";
				rs = dataOperation.executeQuery(sql,
						new String[] { prj_id, id, mem.getDirection(), mem.getSpan(), mem.getStruct_type(),
								mem.getDistr_name(), mem.getComponent_name(), mem.getMember_name(),
								mem.getMemType(), mem.getDefect_name_f(), mem.getDefect_name() });
				while (rs.next()) {
					DefectStatistics ms = new DefectStatistics();
					ms.setProject(rs.getString("prj_desc"));
					ms.setLine(sl.getHighway_name());
					ms.setSection(sl.getSection_name());
					ms.setStruct_mode("通道");
					ms.setStruct(sl.getStruct_name());
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("pass_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component9"));
					ms.setMember_name(rs.getString("mbr_type"));
					ms.setMember_no(rs.getString("mbr_no"));
					ms.setMemType(rs.getString("member_model"));
					ms.setDefect_name_f(rs.getString("defect_name_f"));
					ms.setDefect_name(rs.getString("defect_name"));
					ms.setDefect_count(rs.getString("defect_count"));
					ms.setDefect_location_desc(rs.getString("defect_location_desc"));
					ms.setImportant(rs.getString("defect_attr"));
					lm.add(ms);
				}
				break;
			}
		} catch (Exception e) {
		} finally {
			dataOperation.close();
		}
		return lm;
	}*/

	/*public StructLine getStructLine(String struct_id, String type) {
		StructLine sl = new StructLine();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = null;
		String sql = "";
		if (type.equals("bridge")) {
			sql = "SELECT d3.highway_name,d2.section_name,b1.bridge_name,"
					+ "d1.struct_id from dic_hw_brg_section_relation d1,dic_hw_section_info d2,"
					+ "dic_hw_info d3,brg_card_admin_id as b1 where d1.struct_id=b1.bridge_id "
					+ "and d1.highway_id=d3.highway_id and d1.section_id=d2.section_id and b1.bridge_id=?";
		} else {
			sql = "SELECT d3.highway_name,d2.section_name,d1.struct_id from "
					+ "dic_hw_brg_section_relation d1,dic_hw_section_info d2,dic_hw_info d3 where "
					+ "d1.highway_id=d3.highway_id and d1.section_id=d2.section_id and d1.struct_id=?";
		}
		try {
			rs = dataOperation.executeQuery(sql, new String[] { struct_id });
			if (rs.next()) {
				sl.setHighway_name(rs.getString("highway_name"));
				sl.setSection_name(rs.getString("section_name"));
				if (type.equals("bridge")) {
					sl.setStruct_name(rs.getString("bridge_name"));
				} else {
					sl.setStruct_name(struct_id);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dataOperation.close();
		}
		return sl;
	}*/
	
	public String manageName(String manage_id){
		String manage=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql="SELECT org_name FROM sys_org_info where org_id=?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{manage_id});
		try {
			while(rs.next()){
				manage=rs.getString("org_name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return manage;
	}
	
	
	public List<DefectStatistics> searchDefect(DefectStatistics statistics) {
		List<DefectStatistics> ll = new ArrayList<DefectStatistics>();
		List<String> ids = new ArrayList<String>();
		
		String manage=statistics.getManage();
		if(!manage.equals("%")){
			manage=manageName(manage);
		}
		
		List<Map<String, String>> prj = getStructProjectByProject(statistics.getProject(), statistics.getStruct_mode(),manage,statistics.getLine());
			

		List<String> sid = new ArrayList<String>();
		if (statistics.getStruct().equals("%")) {
			sid = getAllStructId(statistics.getStruct_mode());
		} else {
			sid.add(statistics.getStruct());
		}
		ids = getRepeat(null, sid);
		List<Map<String, String>> prjStruct = new ArrayList<Map<String, String>>();
		for (String s : ids) {
			for(Map<String, String> map : prj){
				if(s.equals(map.get("struct"))){
					prjStruct.add(map);
				}
			}
		}
		
		for(Map<String, String> map : prjStruct){
			ll.addAll(getDefectList(map.get("project"), map.get("struct"), statistics.getStruct_mode(), statistics));
		}
		return ll;
	}

	private  List<DefectStatistics> getDefectList(String project, String id, String type,
			DefectStatistics statistics) {
		List<DefectStatistics> lm = new ArrayList<DefectStatistics>();
		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = null;
		try {
			switch (type) {
			case "bridge":
				sql = "SELECT DISTINCT\n" +
						"	cpi.prj_desc,\n" +
						"	a.bridge_pile_no,\n" +
						"	b.highway_name,\n" +
						"	e.section_name,\n" +
						"	c.org_name as manage_name,\n" +
						"	d.zone_name,\n" +
						"	a.bridge_name,\n" +
						"	bsi.direction,\n" +
						"	bsi.span_no,\n" +
						"	dbst.brg_type_name,\n" +
						"	dbsm.distr_name,\n" +
						"	dbsm.component8,\n" +
						"	dbsm.member_name,\n" +
						"	bmi.member_no,\n" +
						"	bmi.member_model,\n" +
						"	cbd.defect_name_f,\n" +
						"	cbd.defect_name,\n" +
						"	cbd.defect_location_desc,\n" +
						"	cbd.defect_count,\n" +
						"	cbd.defect_attr,\n" +
						"	cbd.develop_state\n" +
						"FROM\n" +
						"	brg_card_admin_id AS a,\n" +
						"	dic_hw_info AS b,\n" +
						"	sys_org_info AS c,\n" +
						"	sys_zone_info AS d,\n" +
						"	sys_section_info AS e,\n" +
						"	brg_mbr_info AS bmi,\n" +
						"	brg_span_info AS bsi,\n" +
						"	dic_brg_struct_type_def AS dbst,\n" +
						"	dic_brg_struct_distr_def AS dbsd,\n" +
						"	dic_brg_struct_member_def AS dbsm,\n" +
						"	chk_brg_regular AS cbr,\n" +
						"	chk_span_record AS csr,\n" +
						"	chk_brg_record AS cbr2,\n" +
						"	chk_brg_defect AS cbd,\n" +
						"	chk_project_info AS cpi\n" +
						"WHERE\n" +
						"	csr.chk_id = cbr.chk_id\n" +
						"AND cbr2.span_chk_id = csr.span_chk_id\n" +
						"AND cbr2.mbr_no = bmi.r_id\n" +
						"AND cbd.mbr_chk_id = cbr2.mbr_chk_id\n" +
						"AND cbd.mbr_no = bmi.r_id\n" +
						"AND cbr.prj_id = cpi.prj_id\n" +
						"AND cbr.prj_id LIKE ?\n" +
						"AND a.bridge_id LIKE ?\n" +
						"AND b.highway_id LIKE ?\n" +
						"AND e.section_id LIKE ?\n" +
						"AND c.org_id LIKE ?\n" +
						"AND d.zone_id LIKE ?\n" +
						"AND a.highway_id = b.highway_id\n" +
						"AND a.manage_id = c.org_id\n" +
						"AND a.zone_id = d.zone_id\n" +
						"AND a.section_id = e.section_id\n" +
						"AND bsi.direction LIKE ?\n" +
						"AND bsi.span_no LIKE ?\n" +
						"AND bsi.bridge_id = a.bridge_id\n" +
						"AND bsi.s_id = bmi.s_id\n" +
						"AND dbst.brg_type_id LIKE ?\n" +
						"AND bsi.brg_type_id = dbst.brg_type_id\n" +
						"AND dbsm.member_name LIKE ?\n" +
						"AND dbsm.member_name = bmi.member_type\n" +
						"AND dbsm.distr_name LIKE ?\n" +
						"AND dbsm.component8 LIKE ?\n" +
						"AND cbd.defect_name_f LIKE ?\n" +
						"AND cbd.defect_name LIKE ?\n" +
						"AND cbr.bridge_id = a.bridge_id\n" +
						"AND cbr.prj_id = cpi.prj_id";
				rs = dataOperation.executeQuery(sql,
						new String[] { project, id, statistics.getLine(), statistics.getSection(), 
								statistics.getManage(),statistics.getZone(), statistics.getDirection(),
								statistics.getSpan(),statistics.getStruct_type(),statistics.getMember_name(), 
								statistics.getDistr_name(), statistics.getComponent_name(), statistics.getDefect_name_f(),
								statistics.getDefect_name()});
				while (rs.next()) {
					DefectStatistics ms = new DefectStatistics();
					ms.setProject(rs.getString("prj_desc"));
					ms.setLine(rs.getString("highway_name"));
					ms.setSection(rs.getString("section_name"));
					ms.setBridge_pile_no(rs.getString("bridge_pile_no"));
					ms.setManage(rs.getString("manage_name"));
					ms.setZone(rs.getString("zone_name"));
					ms.setStruct_mode("桥梁");
					ms.setStruct(rs.getString("bridge_name"));
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("brg_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component8"));
					ms.setMember_name(rs.getString("member_name"));
					ms.setMember_no(rs.getString("member_no"));
					ms.setMemType(rs.getString("member_model"));
					ms.setDefect_name_f(rs.getString("defect_name_f"));
					ms.setDefect_name(rs.getString("defect_name"));
					ms.setDefect_count(rs.getString("defect_count"));
					ms.setDefect_location_desc(rs.getString("defect_location_desc"));
					ms.setImportant(rs.getString("defect_attr"));
					ms.setDevelop(rs.getString("develop_state"));
					lm.add(ms);
				}
				break;
			case "culvert":
				sql = "SELECT DISTINCT\n" +
						"	cpi.prj_desc,\n" +
						"	b.highway_name,\n" +
						"	e.section_name,\n" +
						"	c.org_name AS manage_name,\n" +
						"	d.zone_name,\n" +
						"	a.culvert_name,\n" +
						"	a.stub_no,\n" +
						"	bsi.direction,\n" +
						"	bsi.span_no,\n" +
						"	dbst.cul_type_name,\n" +
						"	dbsm.distr_name,\n" +
						"	dbsm.component10,\n" +
						"	dbsm.member_name,\n" +
						"	bmi.member_no,\n" +
						"	bmi.member_model,\n" +
						"	cbd.defect_name_f,\n" +
						"	cbd.defect_name,\n" +
						"	cbd.defect_location_desc,\n" +
						"	cbd.defect_count,\n" +
						"	cbd.defect_attr,\n" +
						"	cbd.develop_state\n" +
						"FROM\n" +
						"	cul_info AS a,\n" +
						"	dic_hw_info AS b,\n" +
						"	sys_org_info AS c,\n" +
						"	sys_zone_info AS d,\n" +
						"	sys_section_info AS e,\n" +
						"	cul_mbr_info AS bmi,\n" +
						"	cul_span_info AS bsi,\n" +
						"	dic_cul_struct_type_def AS dbst,\n" +
						"	dic_brg_struct_distr_def AS dbsd,\n" +
						"	dic_brg_struct_member_def AS dbsm,\n" +
						"	chk_culvert_regular AS cbr,\n" +
						"	chk_culvert_span_record AS csr,\n" +
						"	chk_culvert_record AS cbr2,\n" +
						"	chk_culvert_defect AS cbd,\n" +
						"	chk_project_info AS cpi\n" +
						"WHERE\n" +
						"	csr.chk_id = cbr.chk_id\n" +
						"AND cbr2.span_chk_id = csr.span_chk_id\n" +
						"AND cbr2.mbr_no = bmi.r_id\n" +
						"AND cbd.mbr_chk_id = cbr2.mbr_chk_id\n" +
						"AND cbd.mbr_no = bmi.r_id\n" +
						"AND cbr.prj_id = cpi.prj_id\n" +
						"AND cbr.prj_id LIKE ?\n" +
						"AND a.culvert_id LIKE ?\n" +
						"AND b.highway_id LIKE ?\n" +
						"AND e.section_id LIKE ?\n" +
						"AND c.org_id LIKE ?\n" +
						"AND d.zone_id LIKE ?\n" +
						"AND a.highway_id = b.highway_id\n" +
						"AND a.manage_id = c.org_id\n" +
						"AND a.zone_id = d.zone_id\n" +
						"AND a.section_id = e.section_id\n" +
						"AND bsi.direction LIKE ?\n" +
						"AND bsi.span_no LIKE ?\n" +
						"AND bsi.culvert_id = a.culvert_id\n" +
						"AND bsi.s_id = bmi.s_id\n" +
						"AND dbst.cul_type_id LIKE ?\n" +
						"AND bsi.cul_type_id = dbst.cul_type_id\n" +
						"AND dbsm.member_name LIKE ?\n" +
						"AND dbsm.member_name = bmi.member_type\n" +
						"AND dbsm.distr_name LIKE ?\n" +
						"AND dbsm.component10 LIKE ?\n" +
						"AND cbd.defect_name_f LIKE ?\n" +
						"AND cbd.defect_name LIKE ?\n" +
						"AND cbr.culvert_id = a.culvert_id\n" +
						"AND cbr.prj_id = cpi.prj_id";
				rs = dataOperation.executeQuery(sql,
						new String[] { project, id, statistics.getLine(), statistics.getSection(), 
								statistics.getManage(),statistics.getZone(), statistics.getDirection(),
								statistics.getSpan(),statistics.getStruct_type(),statistics.getMember_name(), 
								statistics.getDistr_name(), statistics.getComponent_name(), statistics.getDefect_name_f(),
								statistics.getDefect_name()});
				while (rs.next()) {
					DefectStatistics ms = new DefectStatistics();
					ms.setProject(rs.getString("prj_desc"));
					ms.setLine(rs.getString("highway_name"));
					ms.setSection(rs.getString("section_name"));
					ms.setManage(rs.getString("manage_name"));
					ms.setZone(rs.getString("zone_name"));
					ms.setBridge_pile_no(rs.getString("stub_no"));
					ms.setStruct_mode("涵洞");
					ms.setStruct(rs.getString("culvert_name"));
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("cul_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component10"));
					ms.setMember_name(rs.getString("member_name"));
					ms.setMember_no(rs.getString("member_no"));
					ms.setMemType(rs.getString("member_model"));
					ms.setDefect_name_f(rs.getString("defect_name_f"));
					ms.setDefect_name(rs.getString("defect_name"));
					ms.setDefect_count(rs.getString("defect_count"));
					ms.setDefect_location_desc(rs.getString("defect_location_desc"));
					ms.setImportant(rs.getString("defect_attr"));
					ms.setDevelop(rs.getString("develop_state"));
					lm.add(ms);
				}

				break;
			case "pass":
				sql = "SELECT DISTINCT\n" +
						"	cpi.prj_desc,\n" +
						"	b.highway_name,\n" +
						"	e.section_name,\n" +
						"	c.org_name AS manage_name,\n" +
						"	d.zone_name,\n" +
						"	a.pass_name,\n" +
						"	a.stub_no,\n" +
						"	bsi.direction,\n" +
						"	bsi.span_no,\n" +
						"	dbst.pass_type_name,\n" +
						"	dbsm.distr_name,\n" +
						"	dbsm.component9,\n" +
						"	dbsm.member_name,\n" +
						"	bmi.member_no,\n" +
						"	bmi.member_model,\n" +
						"	cbd.defect_name_f,\n" +
						"	cbd.defect_name,\n" +
						"	cbd.defect_location_desc,\n" +
						"	cbd.defect_count,\n" +
						"	cbd.defect_attr,\n" +
						"	cbd.develop_state\n" +
						"FROM\n" +
						"	pass_info AS a,\n" +
						"	dic_hw_info AS b,\n" +
						"	sys_org_info AS c,\n" +
						"	sys_zone_info AS d,\n" +
						"	sys_section_info AS e,\n" +
						"	pass_mbr_info AS bmi,\n" +
						"	pass_span_info AS bsi,\n" +
						"	dic_pass_struct_type_def AS dbst,\n" +
						"	dic_brg_struct_distr_def AS dbsd,\n" +
						"	dic_brg_struct_member_def AS dbsm,\n" +
						"	chk_pass_regular AS cbr,\n" +
						"	chk_pass_span_record AS csr,\n" +
						"	chk_pass_record AS cbr2,\n" +
						"	chk_pass_defect AS cbd,\n" +
						"	chk_project_info AS cpi\n" +
						"WHERE\n" +
						"	csr.chk_id = cbr.chk_id\n" +
						"AND cbr2.span_chk_id = csr.span_chk_id\n" +
						"AND cbr2.mbr_no = bmi.r_id\n" +
						"AND cbd.mbr_chk_id = cbr2.mbr_chk_id\n" +
						"AND cbd.mbr_no = bmi.r_id\n" +
						"AND cbr.prj_id = cpi.prj_id\n" +
						"AND cbr.prj_id LIKE ?\n" +
						"AND a.pass_id LIKE ?\n" +
						"AND b.highway_id LIKE ?\n" +
						"AND e.section_id LIKE ?\n" +
						"AND c.org_id LIKE ?\n" +
						"AND d.zone_id LIKE ?\n" +
						"AND a.highway_id = b.highway_id\n" +
						"AND a.manage_id = c.org_id\n" +
						"AND a.zone_id = d.zone_id\n" +
						"AND a.section_id = e.section_id\n" +
						"AND bsi.direction LIKE ?\n" +
						"AND bsi.span_no LIKE ?\n" +
						"AND bsi.pass_id = a.pass_id\n" +
						"AND bsi.s_id = bmi.s_id\n" +
						"AND dbst.pass_type_id LIKE ?\n" +
						"AND bsi.pass_type_id = dbst.pass_type_id\n" +
						"AND dbsm.member_name LIKE ?\n" +
						"AND dbsm.member_name = bmi.member_type\n" +
						"AND dbsm.distr_name LIKE ?\n" +
						"AND dbsm.component9 LIKE ?\n" +
						"AND cbd.defect_name_f LIKE ?\n" +
						"AND cbd.defect_name LIKE ?\n" +
						"AND cbr.pass_id = a.pass_id\n" +
						"AND cbr.prj_id = cpi.prj_id";
				rs = dataOperation.executeQuery(sql,
						new String[] { project, id, statistics.getLine(), statistics.getSection(), 
								statistics.getManage(),statistics.getZone(), statistics.getDirection(),
								statistics.getSpan(),statistics.getStruct_type(),statistics.getMember_name(), 
								statistics.getDistr_name(), statistics.getComponent_name(), statistics.getDefect_name_f(),
								statistics.getDefect_name() });
				while (rs.next()) {
					DefectStatistics ms = new DefectStatistics();
					ms.setProject(rs.getString("prj_desc"));
					ms.setLine(rs.getString("highway_name"));
					ms.setSection(rs.getString("section_name"));
					ms.setManage(rs.getString("manage_name"));
					ms.setZone(rs.getString("zone_name"));
					ms.setStruct_mode("通道");
					ms.setBridge_pile_no(rs.getString("stub_no"));
					ms.setStruct(rs.getString("pass_name"));
					ms.setDirection(rs.getString("direction"));
					ms.setSpan(rs.getString("span_no"));
					ms.setStruct_type(rs.getString("pass_type_name"));
					ms.setDistr_name(rs.getString("distr_name"));
					ms.setComponent_name(rs.getString("component9"));
					ms.setMember_name(rs.getString("member_name"));
					ms.setMember_no(rs.getString("member_no"));
					ms.setMemType(rs.getString("member_model"));
					ms.setDefect_name_f(rs.getString("defect_name_f"));
					ms.setDefect_name(rs.getString("defect_name"));
					ms.setDefect_count(rs.getString("defect_count"));
					ms.setDefect_location_desc(rs.getString("defect_location_desc"));
					ms.setImportant(rs.getString("defect_attr"));
					ms.setDevelop(rs.getString("develop_state"));
					lm.add(ms);
				}
				break;
			}
		} catch (Exception e) {
		} finally {
			dataOperation.close();
		}
		return lm;
	}
	
	public boolean containStructType( EvalStatistics statistics, String id, MyDataOperation dataOperation ){
		boolean flag = false;
		String sql = null;
		if(statistics.getStruct_mode().equals("bridge")){
			sql = "select * from brg_span_info where bridge_id=? and brg_type_id=?";
		}else if(statistics.getStruct_mode().equals("pass")){
			sql = "select * from pass_span_info where pass_id=? and pass_type_id=?";
		}else if(statistics.getStruct_mode().equals("culvert")){
			sql = "select * from cul_span_info where culvert_id=? and cul_type_id=?";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ id, statistics.getStruct_type() });
		try {
			if(rs.next()){
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public List<EvalStatistics> searchEval(EvalStatistics statistics) {
		List<EvalStatistics> ll = new ArrayList<EvalStatistics>();
		List<String> ids = new ArrayList<String>();
		
		String manage=statistics.getManage();
		if(!manage.equals("%")){
			manage=manageName(manage);
		}
		
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		List<Map<String, String>> prj = getStructProjectByProject(statistics.getProject(), statistics.getStruct_mode(),manage,statistics.getLine());
			

		List<String> sid = new ArrayList<String>();
		if (statistics.getStruct().equals("%")) {
			sid = getAllStructId(statistics.getStruct_mode());
		} else {
			sid.add(statistics.getStruct());
		}
		ids = getRepeat(null, sid);
		List<Map<String, String>> prjStruct = new ArrayList<Map<String, String>>();
		for (String s : ids) {
			
			for(Map<String, String> map : prj){
				if(s.equals(map.get("struct"))){
					prjStruct.add(map);
				}
			}
		}
		
		for(Map<String, String> map : prjStruct){
			if(statistics.getStruct_type().equals("%") || containStructType(statistics, map.get("struct"), dataOperation)){
				ll.add(getEvalInfos(map.get("struct"), map.get("project"), statistics, dataOperation));
			}
//			ll.addAll(getDefectList(map.get("project"), map.get("struct"), statistics.getStruct_mode(), statistics));
		}
		dataOperation.close();
		return ll;
	}


	private EvalStatistics getEvalInfos(String id, String prj_id, EvalStatistics statistics, MyDataOperation dataOperation) {
		EvalStatistics eStatistics = new EvalStatistics();
		String sql;
		ResultSet rs;
		boolean flag_11 = false;
		boolean flag_04 = false;
		ArrayList<EvaBrgRec> list_er = statisticsDao.getInstance().getAuditState(prj_id, id);
		for (int i = 0; i < list_er.size(); i++) {
			EvaBrgRec entity = list_er.get(i);
			if (entity.getEr_std().equals("2011")) {
				flag_11 = true;
			}if(entity.getEr_std().equals("2004")) {
				flag_04 = true;
			}
		}
		switch (statistics.getStruct_mode()) {
		case "bridge":
			eStatistics = getBridgeInfo(statistics, id, dataOperation);
			if(eStatistics.getStruct().equals("新洋港大桥"))
			{
				System.out.println(1);
			}
			sql = "select a.*,b.prj_desc from evaluationrec a RIGHT JOIN (select prj_desc from chk_project_info where prj_id=?) b on a.bridge_no=? and a.prj_no=?";
			rs = dataOperation.executeQuery(sql, new String[]{ prj_id, id, prj_id});
			try {
				while(rs.next()){
					String er_std = rs.getString("er_std");
					eStatistics.setProject(rs.getString("prj_desc"));
					if(er_std!=null){
						if(er_std.equals("2004")&&flag_04){
							eStatistics.setEval04(rs.getString("er_level")+"/"+rs.getString("er_grade"));
						}else if(er_std.equals("2011")&&flag_11){
							eStatistics.setEval11(rs.getString("er_level")+"/"+rs.getString("er_grade"));
						}
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "pass":
			eStatistics = getPassInfo(statistics, id, dataOperation);
			sql = "select a.*,b.* from chk_project_info a, chk_pass_regular b where a.prj_id=? and b.prj_id=a.prj_id and b.pass_id=?";
			rs = dataOperation.executeQuery(sql, new String[]{ prj_id, id});
			try {
				while(rs.next()){
					eStatistics.setProject(rs.getString("prj_desc"));
					eStatistics.setEval04(rs.getString("eval_level"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "culvert":
			eStatistics = getCulvertInfo(statistics, id, dataOperation);
			sql = "select a.*,b.* from chk_project_info a, chk_culvert_regular b where a.prj_id=? and b.prj_id=a.prj_id and b.culvert_id=?";
			rs = dataOperation.executeQuery(sql, new String[]{ prj_id, id});
			try {
				while(rs.next()){
					eStatistics.setProject(rs.getString("prj_desc"));
					eStatistics.setEval04(rs.getString("eval_level"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		}
		return eStatistics;
	}
	
	public ArrayList<EvaBrgRec> getAuditState(String prj_id,String brg_id){
		ArrayList<EvaBrgRec> list = new ArrayList<EvaBrgRec>();
		String sql = " SELECT er_std FROM eva_brg_rec WHERE bridge_id = ? AND prj_id = ? AND audit_state>0 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{brg_id,prj_id});
		try {
			while (rs.next()) {
				EvaBrgRec entity = new EvaBrgRec();
				entity.setEr_std(rs.getString("er_std"));
				list.add(entity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
		
	}
	
	public EvalStatistics getBridgeInfo( EvalStatistics statistics ,String id  ,MyDataOperation dataOperation){
		EvalStatistics sm = null;
		String sql ="SELECT\n" +
				"	a.bridge_id,\n" +
				"	a.bridge_no,\n" +
				"	a.bridge_name,\n" +
				"	a.bridge_pile_no,\n" +
				"	a.span_build,\n" +
				"	a.function_type,\n" +
				"	a.bridge_mode,\n" +
				"	b.org_id AS manage_id,\n" +
				"	b.org_name AS manage_name,\n" +
				"	b.org_name_short AS manage_short_name,\n" +
				"	c.zone_id,\n" +
				"	c.zone_name,\n" +
				"	d.section_id,\n" +
				"	d.section_name,\n" +
				"	e.highway_id,\n" +
				"	e.highway_no,\n" +
				"	e.highway_name\n" +
				"FROM\n" +
				"	brg_card_admin_id a,\n" +
				"	sys_org_info AS b,\n" +
				"	sys_zone_info AS c,\n" +
				"	sys_section_info AS d,\n" +
				"	dic_hw_info e\n" +
				"WHERE\n" +
				"	a.manage_id = b.org_id\n" +
				"AND a.zone_id = c.zone_id\n" +
				"AND a.section_id = d.section_id\n" +
				"AND a.highway_id = e.highway_id\n" +
				"AND a.bridge_id =?\n" +
				"AND a.highway_id LIKE ?\n" +
				"AND a.manage_id LIKE ?\n" +
				"AND a.section_id LIKE ?\n" +
				"AND a.zone_id LIKE ?";
		
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{
				id,
				statistics.getLine(),
				statistics.getManage(),
				statistics.getSection(),
				statistics.getZone()
		});
		try {
			while(rs.next()){
				sm = new EvalStatistics();
				sm.setStruct(rs.getString("bridge_name"));
				sm.setStruct_mode("桥梁");
				sm.setManage(rs.getString("manage_name"));
				sm.setZone(rs.getString("zone_name"));
				sm.setSection(rs.getString("section_name"));
				sm.setLine(rs.getString("highway_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sm;
	}
	
	public EvalStatistics getPassInfo(EvalStatistics statistics,String id, MyDataOperation dataOperation){
		EvalStatistics sm = null;
		String sql = "SELECT\n" +
				"	a.pass_id,\n" +
				"	a.pass_no,\n" +
				"	a.pass_name,\n" +
				"	a.stub_no,\n" +
				"	a.span_build,\n" +
				"	a.use_type,\n" +
				"	b.org_id as manage_id,\n" +
				"	b.org_name as manage_name,\n" +
				"	b.org_name_short as manage_short_name,\n" +
				"	c.zone_id,\n" +
				"	c.zone_name,\n" +
				"	d.section_id,\n" +
				"	d.section_name,\n" +
				"	e.highway_id,\n" +
				"	e.highway_no,\n" +
				"	e.highway_name\n" +
				"FROM\n" +
				"	pass_info a,\n" +
				"	sys_org_info AS b,\n" +
				"	sys_zone_info AS c,\n" +
				"	sys_section_info AS d,\n" +
				"	dic_hw_info e\n" +
				"WHERE\n" +
				"	a.manage_id = b.org_id\n" +
				"AND a.zone_id = c.zone_id\n" +
				"AND a.section_id = d.section_id\n" +
				"AND a.highway_id = e.highway_id\n" +
				"AND pass_id =?\n" +
				"AND a.highway_id LIKE ?\n" +
				"AND a.manage_id LIKE ?\n" +
				"AND a.section_id LIKE ?\n" +
				"AND a.zone_id LIKE ?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{
				id,
				statistics.getLine(),
				statistics.getManage(),
				statistics.getSection(),
				statistics.getZone()
		});
		try {
			while(rs.next()){
				sm = new EvalStatistics();
				sm.setStruct(rs.getString("pass_no"));
				sm.setStruct_mode("通道");
				sm.setManage(rs.getString("manage_name"));
				sm.setZone(rs.getString("zone_name"));
				sm.setSection(rs.getString("section_name"));
				sm.setLine(rs.getString("highway_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sm;
	}
	
	public EvalStatistics getCulvertInfo(EvalStatistics statistics,String id, MyDataOperation dataOperation){
		EvalStatistics sm = null;
		String sql = "SELECT\n" +
				"	a.culvert_id,\n" +
				"	a.culvert_no,\n" +
				"	a.culvert_name,\n" +
				"	a.stub_no,\n" +
				"	a.span_build,\n" +
				"	b.org_id AS manage_id,\n" +
				"	b.org_name AS manage_name,\n" +
				"	b.org_name_short AS manage_short_name,\n" +
				"	c.zone_id,\n" +
				"	c.zone_name,\n" +
				"	d.section_id,\n" +
				"	d.section_name,\n" +
				"	e.highway_id,\n" +
				"	e.highway_no,\n" +
				"	e.highway_name\n" +
				"FROM\n" +
				"	cul_info a,\n" +
				"	sys_org_info AS b,\n" +
				"	sys_zone_info AS c,\n" +
				"	sys_section_info AS d,\n" +
				"	dic_hw_info e\n" +
				"WHERE\n" +
				"	a.manage_id = b.org_id\n" +
				"AND a.zone_id = c.zone_id\n" +
				"AND a.section_id = d.section_id\n" +
				"AND a.highway_id = e.highway_id\n" +
				"AND a.culvert_id =?\n" +
				"AND a.highway_id LIKE ?\n" +
				"AND a.manage_id LIKE ?\n" +
				"AND a.section_id LIKE ?\n" +
				"AND a.zone_id LIKE ?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{
				id,
				statistics.getLine(),
				statistics.getManage(),
				statistics.getSection(),
				statistics.getZone()
		});
		try {
			while(rs.next()){
				sm = new EvalStatistics();
				sm.setStruct(rs.getString("culvert_no"));
				sm.setStruct_mode("涵洞");
				sm.setManage(rs.getString("manage_name"));
				sm.setZone(rs.getString("zone_name"));
				sm.setSection(rs.getString("section_name"));
				sm.setLine(rs.getString("highway_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sm;
	}

	public static void main(String[] args) {
//		 for(String s: StatisticsDao.getInstance().getStructByLineSection("%",
//		 "YC-01", "bridge")){
//		 System.out.println(s);
//		 }
//		 for (Map<String, String> s : StatisticsDao.getInstance().getStructProjectByProject("%",
//		 "bridge")) {
//		 System.out.println(s.get("struct")+" : "+s.get("project"));
//		 }
     String sql = "SELECT\n" +
    		 "	b.highway_name,\n" +
    		 "	e.section_name,\n" +
    		 "	c.org_name AS manage_name,\n" +
    		 "	d.zone_name,\n" +
    		 "	a.bridge_name,\n" +
    		 "	bsi.direction,\n" +
    		 "	bsi.span_no,\n" +
    		 "	dbst.brg_type_name,\n" +
    		 "	dbsm.distr_name,\n" +
    		 "	dbsm.component8,\n" +
    		 "	dbsm.member_name,\n" +
    		 "	bmi.member_no,\n" +
    		 "	bmi.member_model\n" +
    		 "FROM\n" +
    		 "	brg_card_admin_id AS a,\n" +
    		 "	dic_hw_info AS b,\n" +
    		 "	sys_org_info AS c,\n" +
    		 "	sys_zone_info AS d,\n" +
    		 "	sys_section_info AS e,\n" +
    		 "	brg_mbr_info AS bmi,\n" +
    		 "	brg_span_info AS bsi,\n" +
    		 "	dic_brg_struct_type_def AS dbst,\n" +
    		 "	dic_brg_struct_distr_def AS dbsd,\n" +
    		 "	dic_brg_struct_member_def AS dbsm\n" +
    		 "WHERE\n" +
    		 "	a.bridge_id LIKE ?\n" +
    		 "AND b.highway_id LIKE ?\n" +
    		 "AND e.section_id LIKE ?\n" +
    		 "AND c.org_id LIKE ?\n" +
    		 "AND d.zone_id LIKE ?\n" +
    		 "AND a.highway_id = b.highway_id\n" +
    		 "AND a.manage_id = c.org_id\n" +
    		 "AND a.zone_id = d.zone_id\n" +
    		 "AND a.section_id = e.section_id\n" +
    		 "AND bsi.direction LIKE ?\n" +
    		 "AND bsi.span_no LIKE ?\n" +
    		 "AND bsi.bridge_id = a.bridge_id\n" +
    		 "AND bsi.s_id = bmi.s_id\n" +
    		 "AND dbst.brg_type_id LIKE ?\n" +
    		 "AND bsi.brg_type_id = dbst.brg_type_id\n" +
    		 "AND dbsm.member_name LIKE ?\n" +
    		 "AND dbsm.member_name = bmi.member_type\n" +
    		 "AND dbsm.distr_name LIKE ?\n" +
    		 "AND dbsm.component8 LIKE ?;";
     System.out.println(sql);
	}



}
