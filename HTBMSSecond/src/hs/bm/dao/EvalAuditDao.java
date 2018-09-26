package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import hs.bm.vo.EvalBean;

public class EvalAuditDao
{

	private static EvalAuditDao EvalAuditDao;

	public static EvalAuditDao getInstance()
	{
		if (EvalAuditDao == null)
		{
			EvalAuditDao = new EvalAuditDao();
		}
		return EvalAuditDao;
	}

	/** 根据桥梁编号获取桥梁名称以及桥型 */

	/*
	 * public Connect GetBrgConncet(List<String> brg_id, MyDataOperation
	 * dataOperation) { Connect con = new Connect(); List<Connect> lc = new
	 * ArrayList<Connect>(); String sql = "select * from brg_card_admin_id";
	 * ResultSet rs = dataOperation.executeQuery(sql, null); try { while
	 * (rs.next()) { if (brg_id.contains(rs.getString("bridge_no"))) { Connect c
	 * = new Connect(); c.setId(rs.getString("bridge_no"));
	 * c.setName(rs.getString("bridge_name"));
	 * c.setType(rs.getString("brg_type_id")); lc.add(c); }
	 * 
	 * } } catch (SQLException e) { e.printStackTrace(); } con.setId("bridge");
	 * con.setName("桥梁"); con.setType("bridge"); con.setChildren(lc); return
	 * con; }
	 */
	/** 根据涵洞编号获取涵洞类型 */
	/*
	 * public Connect GetCulConncet(List<String> cul_id, MyDataOperation
	 * dataOperation) { Connect con = new Connect(); List<Connect> lc = new
	 * ArrayList<Connect>(); String sql = "select * from cul_info"; ResultSet rs
	 * = dataOperation.executeQuery(sql, null); try { while (rs.next()) { if
	 * (cul_id.contains(rs.getString("culvert_id"))) { Connect c = new
	 * Connect(); c.setId(rs.getString("culvert_id"));
	 * c.setName(rs.getString("culvert_id"));
	 * c.setType(rs.getString("culvert_type")); lc.add(c); }
	 * 
	 * } } catch (SQLException e) { e.printStackTrace(); } con.setId("culvert");
	 * con.setName("涵洞"); con.setType("culvert"); con.setChildren(lc); return
	 * con; }
	 */

	/** 根据通道编号获取通道类型 */
	/*
	 * public Connect GetPassConncet(List<String> pass_id, MyDataOperation
	 * dataOperation) { Connect con = new Connect(); List<Connect> lc = new
	 * ArrayList<Connect>(); String sql = "select * from pass_info"; ResultSet
	 * rs = dataOperation.executeQuery(sql, null); try { while (rs.next()) { if
	 * (pass_id.contains(rs.getString("pass_id"))) { Connect c = new Connect();
	 * c.setId(rs.getString("pass_id")); c.setName(rs.getString("pass_id"));
	 * c.setType(rs.getString("pass_type")); lc.add(c); }
	 * 
	 * } } catch (SQLException e) { e.printStackTrace(); } con.setId("pass");
	 * con.setName("通道"); con.setType("pass"); con.setChildren(lc); return con;
	 * }
	 */

	/*
	 * public List<Connect> GetSectionConnect(List<String> section, Map<String,
	 * List<String>> brgmap, Map<String, List<String>> culmap, Map<String,
	 * List<String>> passmap, MyDataOperation dataOperation) { List<Connect> lc
	 * = new ArrayList<Connect>(); String sql =
	 * "select * from dic_hw_section_info"; ResultSet rs =
	 * dataOperation.executeQuery(sql, null); try { while (rs.next()) { if
	 * (section.contains(rs.getString("section_id"))) { Connect c = new
	 * Connect(); String section_id = rs.getString("section_id");
	 * c.setId(section_id); c.setName(rs.getString("section_name"));
	 * c.setType("section"); List<Connect> lc1 = new ArrayList<Connect>(); if
	 * (brgmap.containsKey(section_id)) { List<String> ls =
	 * brgmap.get(section_id); lc1.add(GetBrgConncet(ls, dataOperation)); } if
	 * (culmap.containsKey(section_id)) { List<String> ls =
	 * culmap.get(section_id); lc1.add(GetCulConncet(ls, dataOperation)); } if
	 * (passmap.containsKey(section_id)) { List<String> ls =
	 * passmap.get(section_id); lc1.add(GetPassConncet(ls, dataOperation)); }
	 * c.setChildren(lc1); lc.add(c); }
	 * 
	 * } } catch (SQLException e) { e.printStackTrace(); } return lc; }
	 */

	// public Connect GetLineConnect(String hw_id,MyDataOperation
	// dataOperation){
	// Connect c=new Connect();
	// String sql =
	// "select bc.bridge_name,bm.direction from brg_mbr_info bm,brg_card_admin_id bc where bm.bridge_id=? and bm.bridge_id=bc.bridge_no group by bm.direction";
	// ResultSet rs=dataOperation.executeQuery(sql,new String[]{hw_id});
	// List<String> dir=new ArrayList<>();
	// List<String> span=new ArrayList<>();
	// Map<String, List<String>> dirmap=new HashMap<String, List<String>>();
	// Map<String, List<String>> spanmap=new HashMap<String, List<String>>();
	// try {
	// while (rs.next()) {
	// c.setId(hw_id);
	// c.setName(rs.getString("bridge_name"));
	// List<String> list=new ArrayList<>();
	// list.add(rs.getString("direction"));
	// dirmap.put(hw_id, list);
	// }
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	//
	// sql =
	// "select bm.direction from brg_mbr_info bm,brg_card_admin_id bc where bm.bridge_id=? and bm.bridge_id=bc.bridge_no group by bm.direction";
	//
	// List<Connect> lc=GetSectionConnect(section, brgmap, culmap,
	// passmap,dataOperation);
	// if(brg.size()>=1){
	// lc.add(GetBrgConncet(brg,dataOperation));
	// }
	// if(cul.size()>=1){
	// lc.add(GetCulConncet(cul,dataOperation));
	// }
	// if(pass.size()>=1){
	// lc.add(GetPassConncet(pass,dataOperation));
	// }
	// c.setChildren(lc);
	// c.setType("line");
	// return c;
	// }

	// public List<Connect> GetLineConnectList(String id){
	// System.out.println(id);
	// List<Connect> lc=new ArrayList<Connect>();
	// MyDataOperation dataOperation = new
	// MyDataOperation(MyDataSource.getInstance().getConnection(),false);
	// Connect connect=GetLineConnect(id,dataOperation);
	// lc.add(connect);
	// dataOperation.close();
	// return lc;
	// }
	// public List<Connect> GetLineConnectList(){
	// List<Connect> lc=new ArrayList<Connect>();
	// String sql =
	// "select highway_id from dic_hw_brg_section_relation group by highway_id";
	// MyDataOperation dataOperation = new
	// MyDataOperation(MyDataSource.getInstance().getConnection(),false);
	// ResultSet rs=dataOperation.executeQuery(sql,null);
	// try {
	// while (rs.next()) {
	// Connect connect=GetLineConnect(rs.getString("highway_id"),dataOperation);
	// lc.add(connect);
	// }
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// dataOperation.close();
	// return lc;
	// }
	/**
	 * @param id
	 * @param sta_no
	 * @param prj_no
	 * @return
	 */
	public List<EvalBean> queryState(String id, String sta_no, String prj_no)
	{
		List<EvalBean> ll = new ArrayList<EvalBean>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = " select * from eva_brg_rec where bridge_id=? and ER_STD=? and prj_id=? and audit_state in (1,2)";
		String[] param = new String[]
		{ id, sta_no, prj_no };
		ResultSet rs = mdo.executeQuery(sql, param);
		try
		{
			while (rs.next())
			{
				EvalBean eb = new EvalBean();
				eb.setState(rs.getString("audit_state"));
				eb.setId(id);
				ll.add(eb);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return ll;

	}

	/**
	 * @author sundj
	 * @param id
	 * @param name
	 * @param mode
	 * @return
	 */
	public List<EvalBean> InitTree(String id, String name, String mode, String prj_no)
	{
		List<EvalBean> ll = new ArrayList<EvalBean>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = " select * from eva_brg_rec where bridge_id=? and prj_id=? and  audit_state in (1,2) ORDER BY ER_STD";
		String[] arr = new String[]
		{ id, prj_no };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				EvalBean eb = new EvalBean();

				eb.setState(rs.getString("audit_state"));
				eb.setId(id);
				eb.setName(name);
				eb.setMode(mode);
				eb.setStandard(rs.getString("ER_STD"));
				ll.add(eb);

			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return ll;
	}

	/**
	 * 评定审核初始化数据
	 * 
	 * @author sundj
	 * @param id
	 * @param name
	 * @param mode
	 * @return List<ModeIdName>
	 * @throws SQLException
	 */
	public List<EvalBean> showFirstTree(String id, String name, String mode) throws SQLException
	{
		List<EvalBean> ll = new ArrayList<EvalBean>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = null;
		if (mode.equals("bridge"))
		{
			sql = "select audit_state from eva_brg_rec where bridge_id=? and audit_state in (1,2)";
			String[] arr = new String[]
			{ id };
			ResultSet rs = mdo.executeQuery(sql, arr);
			while (rs.next())
			{
				EvalBean eb = new EvalBean();
				eb.setState(rs.getString("audit_state"));
				eb.setId(id);
				eb.setName(name);
				eb.setMode(mode);
				eb.setStandard(rs.getString("ER_STD"));
				ll.add(eb);
			}
		}
		mdo.close();
		return ll;
	}

	/*
	 * public List<BriCulPassId> showSecondTreeB(String hid) throws
	 * SQLException{ List<BriCulPassId> ll=new ArrayList<BriCulPassId>();
	 * MyDataOperation mdo = new
	 * MyDataOperation(MyDataSource.getInstance().getConnection()); String sql =
	 * "select bridge_id,(select bridge_name from brg_card_admin_id where bridge_no=bridge_id) from chk_brg_prj_sec_brg_relation where prj_id=?"
	 * ; String[] arr=new String[]{hid}; ResultSet rs=mdo.executeQuery(sql,
	 * arr); while(rs.next()){ BriCulPassId dhi=new BriCulPassId();
	 * dhi.setBid(rs.getString(1)); dhi.setBname(rs.getString(2)); ll.add(dhi);
	 * } mdo.close(); return ll; }
	 */

	/*
	 * public List<ChkBrgRecord> showThirdTreeB(String hsid) throws
	 * SQLException{ List<ChkBrgRecord> ll=new ArrayList<ChkBrgRecord>();
	 * MyDataOperation mdo = new
	 * MyDataOperation(MyDataSource.getInstance().getConnection()); String sql =
	 * "select direction from brg_span_info where bridge_id=? group by direction"
	 * ; String[] arr=new String[]{hsid}; ResultSet rs=mdo.executeQuery(sql,
	 * arr); System.out.println(hsid); while(rs.next()){ ChkBrgRecord dhi=new
	 * ChkBrgRecord(); dhi.setDirection(rs.getString(1)); ll.add(dhi); }
	 * mdo.close(); System.out.println(ll.size()); return ll; }
	 */
	/*
	 * public List<ChkBrgRecord> showFourthTreeP(String hsid,String bridgeid)
	 * throws SQLException{ List<ChkBrgRecord> ll=new ArrayList<ChkBrgRecord>();
	 * MyDataOperation mdo = new
	 * MyDataOperation(MyDataSource.getInstance().getConnection()); String sql =
	 * "select span_no from brg_span_info where direction=? and bridge_id=? group by span_no order by span_no"
	 * ; String[] arr=new String[]{hsid,bridgeid}; ResultSet
	 * rs=mdo.executeQuery(sql, arr); while(rs.next()){ ChkBrgRecord dhi=new
	 * ChkBrgRecord(); dhi.setSpan_no(rs.getString(1)); ll.add(dhi); }
	 * System.out.println(ll.size()); mdo.close(); return ll; }
	 */
	/**
	 * @author sundj
	 * @param id
	 * @param sta_no
	 * @param prj_no
	 * @return
	 */
	public int evalAudit(String id, String sta_no, String prj_no)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "update eva_brg_rec set audit_state=? where bridge_id=? and ER_STD=? and prj_id=? and audit_state=?";
		String[] arr = new String[]
		{ "2", id, sta_no, prj_no, "1" };
		i = mdo.executeUpdate(sql, arr);
		System.out.println(i);
		mdo.close();
		return i;
	}
	/**
	 * 查询04和11的检查状态
	 * @author sundj
	 * @param prj_no
	 * @param bridge_id
	 * @return String add=+1 reduce=-1 
	 */
	public String chkEvalState(String prj_no,String bridge_id)
	{
		String str = "";
		ArrayList<String> list= new ArrayList<String>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " SELECT audit_state  from eva_brg_rec WHERE prj_id = ? and bridge_id = ? ";
		String[] param = new String[]{prj_no,bridge_id};
		ResultSet rs = mdo.executeQuery(sql, param);
		try
		{
			while (rs.next())
			{
				String state = rs.getString("audit_state");
				list.add(state);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		String state_1 = list.get(0);
		String state_2 = list.get(1);
		if (state_1.equals("1")&&state_2.equals("1"))
		{
			str = "reduce";
		}
		else if (state_1.equals("2")&&state_2.equals("2")) {
			str  = "add";
		}
		mdo.close();
		return str;
	}
	/**
	 * 减少评定结构数量
	 * @author sundj
	 * @param prj_no
	 * @return boolean
	 */
	public boolean minStruct_eva(String prj_no){
		boolean flag = false;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql = "  update chk_project_info set struct_eva=struct_eva-1 WHERE prj_no = ? ";
		String[] param = new String[]{prj_no};
		int i = mdo.executeUpdate(sql, param);
		if (i>0)
		{
			flag = true;
		}
		mdo.close();
		return flag;
	}
	/**
	 * 增加评定结构数量
	 * @author sundj
	 * @param prj_no
	 * @return
	 */
	public boolean addStruct_eva(String prj_no){
		boolean flag = false;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql = "  update chk_project_info set struct_eva=struct_eva+1 WHERE prj_no = ? ";
		String[] param = new String[]{prj_no};
		int i = mdo.executeUpdate(sql, param);
		if (i>0)
		{
			flag = true;
		}
		mdo.close();
		return flag;
	}
	
	/**
	 * @author sundj
	 * @param id
	 * @return update rows
	 */
	public int reEvalAudit(String id, String sta_no,String prj_no)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "update eva_brg_rec set audit_state=? where bridge_id=? and ER_STD=? and prj_id=? and audit_state=?";
		String[] arr = new String[]
		{ "1", id, sta_no,prj_no, "2" };
		i = mdo.executeUpdate(sql, arr);
		System.out.println(i);
		mdo.close();
		return i;
	}
	/**
	 * pdf路径
	 * @param bridge_no
	 * @param prj_no
	 * @param ER_STD
	 * @return
	 */
	public String getEvaPath(String bridge_no,String prj_no,String ER_STD){
		String path = null;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" SELECT pdf from eva_brg_rec WHERE bridge_id=? AND prj_id=? AND ER_STD=? ";
		String[] arr = new String[]{bridge_no, prj_no,ER_STD};
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				path = rs.getString("pdf");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return path;
	}
	public int updateEvaPath(String bridge_no,String prj_no,String ER_STD,String path){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" UPDATE eva_brg_rec SET pdf=? WHERE bridge_id=? AND prj_id=? AND ER_STD=? ";
		String[] arr = new String[]{path,bridge_no, prj_no,ER_STD};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	
	public int clearEvaPath(String bridge_id){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " UPDATE eva_brg_rec SET pdf='' WHERE bridge_id=?";
		String[] arr = new String[]{bridge_id};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	/*
	 * public int chkCAudit(String culvert_id){ int i=0; Connection
	 * conn=MyDataSource.getInstance().getConnection(); MyDataOperation mdo=new
	 * MyDataOperation(conn,false); String sql=
	 * "update chk_culvert_regular set audit_state=? where culvert_id=? and audit_state=?"
	 * ; String[] arr=new String[]{"2",culvert_id,"1"}; i=mdo.executeUpdate(sql,
	 * arr); System.out.println(i); mdo.close(); return i; }
	 */
	/*
	 * public int rechkCAudit(String culvert_id){ int i=0; Connection
	 * conn=MyDataSource.getInstance().getConnection(); MyDataOperation mdo=new
	 * MyDataOperation(conn,false); String sql=
	 * "update chk_culvert_regular set audit_state=? where culvert_id=? and audit_state=?"
	 * ; String[] arr=new String[]{"1",culvert_id,"2"}; i=mdo.executeUpdate(sql,
	 * arr); System.out.println(i); mdo.close(); return i; }
	 */

	/*
	 * public int chkPAudit(String pass_id){ int i=0; Connection
	 * conn=MyDataSource.getInstance().getConnection(); MyDataOperation mdo=new
	 * MyDataOperation(conn,false); String sql=
	 * "update chk_pass_regular set audit_state=? where pass_id=? and audit_state=?"
	 * ; String[] arr=new String[]{"2",pass_id,"1"}; i=mdo.executeUpdate(sql,
	 * arr); System.out.println(i); mdo.close(); return i; }
	 */

	/*
	 * public int rechkPAudit(String pass_id){ int i=0; Connection
	 * conn=MyDataSource.getInstance().getConnection(); MyDataOperation mdo=new
	 * MyDataOperation(conn,false); String sql=
	 * "update chk_pass_regular set audit_state=? where pass_id=? and audit_state=?"
	 * ; String[] arr=new String[]{"1",pass_id,"2"}; i=mdo.executeUpdate(sql,
	 * arr); System.out.println(i); mdo.close(); return i; }
	 */

}
