package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.CulSpanInfo;
import hs.bm.bean.PassSpanInfo;
import hs.bm.vo.BriCulPassId;
import hs.bm.vo.ModeIdName;


public class ChkAuditDao {
	
	
	private static ChkAuditDao ChkAuditDao;
	
	public static ChkAuditDao getInstance() {
		if (ChkAuditDao == null) {
			ChkAuditDao = new ChkAuditDao();
		}
		return ChkAuditDao;
	}
	



	public List<ModeIdName> showFirstTree(String id,String name,String mode,String prj_id) throws SQLException{
		List<ModeIdName> ll=new ArrayList<ModeIdName>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql=null;
		if(mode.equals("bridge")){
			sql = " select audit_state from chk_brg_regular where bridge_id=? and prj_id= ?  and audit_state in (1,2) ";
			String[] arr=new String[]{id,prj_id};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				ModeIdName dhi=new ModeIdName();
				dhi.setState(rs.getString(1));
				dhi.setId(id);
				dhi.setName(name);
				dhi.setMode(mode);
	    		ll.add(dhi);
	    	}
		}else if(mode.equals("pass")){
			sql = "select audit_state from chk_pass_regular where pass_id=? and prj_id= ? and audit_state in (1,2)";
			String[] arr=new String[]{id,prj_id};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				ModeIdName dhi=new ModeIdName();
				dhi.setState(rs.getString(1));
				dhi.setId(id);
				dhi.setName(name);
				dhi.setMode(mode);
	    		ll.add(dhi);
	    	}
			System.out.println(ll.size());
		}else{
			sql = "select audit_state from chk_culvert_regular where culvert_id=? and prj_id=? and audit_state in (1,2)";
			String[] arr=new String[]{id,prj_id};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				ModeIdName dhi=new ModeIdName();
				dhi.setState(rs.getString(1));
				dhi.setId(id);
				dhi.setName(name);
				dhi.setMode(mode);
	    		ll.add(dhi);
	    	}
		}
		System.out.println(ll.size());
		mdo.close();
		return ll;
	}

	public List<BriCulPassId> showSecondTreeB(String hid) throws SQLException{
		List<BriCulPassId> ll=new ArrayList<BriCulPassId>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
			String sql = "select bridge_id,(select bridge_name from brg_card_admin_id where bridge_no=bridge_id) from chk_brg_prj_sec_brg_relation where prj_id=?";
			String[] arr=new String[]{hid};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				BriCulPassId dhi=new BriCulPassId();
	    		dhi.setBid(rs.getString(1));
	    		dhi.setBname(rs.getString(2));
	    		ll.add(dhi);
	    	}
		mdo.close();	
		return ll;
	}
	

	public List<CulSpanInfo> showSecondTreeC(String hid,String prj_id) throws SQLException{
		List<CulSpanInfo> ll=new ArrayList<CulSpanInfo>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
			String sql = " SELECT c.direction FROM (SELECT b.span_no,b.direction FROM chk_culvert_regular AS a LEFT JOIN chk_culvert_span_record AS b ON a.chk_id = b.chk_id WHERE culvert_id=? AND prj_id=? ) AS c GROUP BY c.direction  ";
			String[] arr=new String[]{hid,prj_id};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				CulSpanInfo csi=new CulSpanInfo();
				String direction = rs.getString("direction");
				if (direction.equals("无"))
				{
					direction = "无方向";
				}
				csi.setDirection(direction);
	    		ll.add(csi);
	    	}
			mdo.close();
		return ll;
	}
	
	public List<PassSpanInfo> showSecondTreeP(String hid,String prj_id) throws SQLException{
		List<PassSpanInfo> ll=new ArrayList<PassSpanInfo>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
			String sql = " SELECT c.direction FROM (SELECT b.span_no,b.direction FROM chk_pass_regular AS a LEFT JOIN chk_pass_span_record AS b ON a.chk_id = b.chk_id WHERE pass_id=? AND prj_id=? ) AS c GROUP BY c.direction  ";
			String[] arr=new String[]{hid,prj_id};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				PassSpanInfo psi=new PassSpanInfo();
				String direction = rs.getString("direction");
				if (direction.equals("无"))
				{
					direction = "无方向";
				}
				psi.setDirection(direction);
	    		ll.add(psi);
	    	}
			mdo.close();
		return ll;
	}
	
	public List<ChkBrgRecord> showThirdTreeB(String hsid,String prj_id) throws SQLException{
		List<ChkBrgRecord> ll=new ArrayList<ChkBrgRecord>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
			String sql = " SELECT b.direction FROM chk_brg_regular AS a LEFT JOIN chk_span_record AS b ON a.chk_id=b.chk_id WHERE a.bridge_id=? AND a.prj_id=? GROUP BY b.direction ";
			String[] arr=new String[]{hsid,prj_id};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				ChkBrgRecord dhi=new ChkBrgRecord();
	    		dhi.setDirection(rs.getString(1));
	    		ll.add(dhi);
	    	}
			mdo.close();
		return ll;
	}
	/**
	 * @param hsid
	 * @param bridgeid
	 * @return
	 * @throws SQLException
	 */
	public List<ChkBrgRecord> showFourthTreeP(String hsid,String bridgeid,String prj_id) throws SQLException{
		List<ChkBrgRecord> ll=new ArrayList<ChkBrgRecord>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
			String sql = " SELECT b.span_no FROM chk_brg_regular AS a LEFT JOIN chk_span_record as b ON a.chk_id = b.chk_id WHERE a.bridge_id=? AND a.prj_id=? AND b.direction=? ORDER BY b.span_no+0 ";
			String[] arr=new String[]{bridgeid,prj_id,hsid};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				ChkBrgRecord dhi=new ChkBrgRecord();
	    		dhi.setSpan_no(rs.getString(1));
	    		ll.add(dhi);
	    	}
			System.out.println(ll.size());
			mdo.close();	
		return ll;
	}
	
	public List<CulSpanInfo> getCulSpanNo(String hsid,String bridgeid,String prj_id) throws SQLException{
		List<CulSpanInfo> ll=new ArrayList<CulSpanInfo>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
			String sql = " SELECT b.span_no FROM chk_culvert_regular AS a LEFT JOIN chk_culvert_span_record as b ON a.chk_id = b.chk_id WHERE a.culvert_id=? AND a.prj_id=? AND b.direction=? ORDER BY b.span_no+0 ";
			String[] arr=new String[]{bridgeid ,prj_id,hsid};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				CulSpanInfo csi=new CulSpanInfo();
				csi.setSpan_no(rs.getInt("span_no"));
	    		ll.add(csi);
	    	}
			System.out.println(ll.size());
			mdo.close();	
		return ll;
	}
	
	public List<PassSpanInfo> getPassSpanNo(String hsid,String bridgeid,String prj_id) throws SQLException{
		List<PassSpanInfo> ll=new ArrayList<PassSpanInfo>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
			String sql = " SELECT b.span_no FROM chk_pass_regular AS a LEFT JOIN chk_pass_span_record as b ON a.chk_id = b.chk_id WHERE a.pass_id=? AND a.prj_id=? AND b.direction=? ORDER BY b.span_no+0 ";
			String[] arr=new String[]{bridgeid,prj_id,hsid};
	       	ResultSet rs=mdo.executeQuery(sql, arr);
			while(rs.next()){
				PassSpanInfo psi=new PassSpanInfo();
				psi.setSpan_no(rs.getInt("span_no"));
	    		ll.add(psi);
	    	}
			System.out.println(ll.size());
			mdo.close();	
		return ll;
	}
	/**
	 * 桥梁审核
	 * @author sundj
	 * @param briid 桥梁编号;
	 * @param prj_id 项目编号;
	 * @return int 0/1;
	 */
	public int chkbAudit(String briid,String prj_id){
		int i=0;
		System.out.println(briid);
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    		String sql="update chk_brg_regular set audit_state=? where bridge_id=? and prj_id=? and audit_state=?";
        	String[] arr=new String[]{"2",briid,prj_id,"1"};
        	i=mdo.executeUpdate(sql, arr);
        	System.out.println(i);
        	mdo.close();
    	return i;
	}
	/**
	 * 桥梁退审核
	 * @author sundj
	 * @param briid 桥梁编号
	 * @param prj_id 项目编号
	 * @return int 0/1;
	 */
	public int rechkBAudit(String briid,String prj_id){
		int i=0;
		System.out.println(briid);
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    		String sql="update chk_brg_regular set audit_state=? where bridge_id=? and prj_id=? and audit_state=?";
        	String[] arr=new String[]{"1",briid,prj_id,"2"};
        	i=mdo.executeUpdate(sql, arr);
        	System.out.println(i);
        	mdo.close();
    	return i;
	}
	
	/**
	 * 查询项目编号
	 * @author sundj;
	 * @param bid 桥梁编号;
	 * @return prj_no 项目编号;
	 */
	public String getPrj_no(String bid){
		String prj_no = "";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
		String sql = " SELECT prj_id from chk_brg_regular WHERE bridge_id = ? ";
		String[] param=new String[]{bid};
		ResultSet rs = mdo.executeQuery(sql, param);
		try
		{
			while (rs.next())
			{
				prj_no = rs.getString("prj_id");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		mdo.close();
		return prj_no;
		
	}
	/**
	 * 插入两条待评定记录
	 * @param bid 桥梁编号;
	 * @param prj_no 项目编号;
	 * @return boolean 0/1;
	 */
	public boolean EvalAdd(String bid,String prj_no){
		boolean flag = false;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] param_11=new String[]{bid,prj_no,"2011","0"};
    	String[] param_04=new String[]{bid,prj_no,"2004","0"};
    	String sql = "INSERT INTO eva_brg_rec(bridge_id,prj_id,ER_STD,audit_state)VALUES(?,?,?,?)";
    	int i = mdo.executeUpdate(sql, param_04);
    	int j = mdo.executeUpdate(sql, param_11);
    	if (i==1&&j==1)
		{
			flag = true;
		}
		
		mdo.close();
		return flag;
	}
	/**
	 * 减少检查结构数量
	 * @author sundj
	 * @param prj_no 项目编号;
	 * @return boolean 0/1；
	 */
	public boolean minStruct_checked(String prj_no){
		boolean flag = false;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql = "  update chk_project_info set struct_checked=struct_checked-1 WHERE prj_id = ? ";
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
	 * 增加检查结构数量
	 * @author sundj
	 * @param prj_no 项目编号
	 * @return boolean 0/1；
	 */
	public boolean addStruct_checked(String prj_no){
		boolean flag = false;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql = "  update chk_project_info set struct_checked=struct_checked+1 WHERE prj_id = ? ";
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
	 * 检查桥梁是否审核过;
	 * @param bid 桥梁编号;
	 * @param prj_no 项目编号;
	 * @return boolean 0/1;
	 */
	public boolean EvalChk(String bid,String prj_no){
		boolean flag = true;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql = " SELECT * from eva_brg_rec WHERE prj_id = ? AND bridge_id =?";
    	String[] param = new String[]{prj_no,bid};
    	ResultSet rs = mdo.executeQuery(sql, param);
    	try
		{
			if (rs.next())
			{
				flag = false ; 
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
		return flag;
	}
	
	public int chkCAudit(String culvert_id,String prj_id){
		int i=0;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    		String sql="update chk_culvert_regular set audit_state=? where culvert_id=? and prj_id=? and audit_state=?";
        	String[] arr=new String[]{"2",culvert_id,prj_id,"1"};
        	i=mdo.executeUpdate(sql, arr);
        	System.out.println(i);
        	mdo.close();
    	return i;
	}
	/**
	 * 获得每跨的路径
	 * @param span_no
	 * @param dir
	 * @param briid
	 * @return path 路径
	 */
	public String getSpan_card(String span_no, String dir,String briid,String prj_id){
		String path ="";
		String sql = " SELECT b.pdf FROM chk_brg_regular AS a LEFT JOIN chk_span_record AS b ON a.chk_id=b.chk_id WHERE a.bridge_id=? AND a.prj_id=? AND direction=? AND span_no=?  ";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] objs = new String[]{briid,prj_id,dir,span_no};
    	ResultSet rs = mdo.executeQuery(sql, objs);
    	try
		{
			while (rs.next())
			{
				path=rs.getString("pdf");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
		return path;
	}
	/*
	public String newDPF(String span_no, String dir,String briid,String prj_id){
		
		String path = "";
		try
		{
			path = CMDUtil.buildCheck(prj_id, briid, "regular", dir, span_no);
		} catch (Exception e)
		{
		}
		File file = new File(path);
		String[] str = file.getName().split("_");
		String mkdir = "C:\\repository\\"+briid+"\\regular\\"+prj_id;
		File file_makdir = new File(mkdir);
		String[] list_file = file_makdir.list();
		for (int i = 0; i < list_file.length; i++)
		{
			String name =list_file[i];
			String[] temp = name.split("_");
			if (!str[2].equals(temp[2]))
			{
				File file_del = new File(file_makdir+name);
				file_del.delete();
			}
		}
		
		return path;
	}
	*/
	
	public int updatePath(String span_no, String dir,String briid,String path,String prj_id)
	{
		int i = 0;
		String sql = " update  chk_brg_regular AS a LEFT JOIN chk_span_record AS b ON a.chk_id=b.chk_id set pdf=? WHERE a.bridge_id=? AND a.prj_id=? AND direction=? AND span_no=? ";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] objs = new String[]{path,briid,prj_id,dir,span_no};
    	i = mdo.executeUpdate(sql, objs);
    	mdo.close();
		return i;
	}
	
	public int rechkCAudit(String culvert_id){
		int i=0;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    		String sql="update chk_culvert_regular set audit_state=? where culvert_id=? and audit_state=?";
        	String[] arr=new String[]{"1",culvert_id,"2"};
        	i=mdo.executeUpdate(sql, arr);
        	System.out.println(i);
        	mdo.close();
    	return i;
	}

	public int chkPAudit(String pass_id,String prj_id){
		int i=0;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    		String sql="update chk_pass_regular set audit_state=? where prj_id=? and pass_id=? and audit_state=?";
        	String[] arr=new String[]{"2",prj_id,pass_id,"1"};
        	i=mdo.executeUpdate(sql, arr);
        	System.out.println(i);
        	mdo.close();
    	return i;
	}
	
	public int rechkPAudit(String pass_id){
		int i=0;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    		String sql="update chk_pass_regular set audit_state=? where pass_id=? and audit_state=?";
        	String[] arr=new String[]{"1",pass_id,"2"};
        	i=mdo.executeUpdate(sql, arr);
        	System.out.println(i);
        	mdo.close();
    	return i;
	}
	
	public String getPassOrCul_Path(String model,String id,String prj_id,String direction,String span_no){
		String sql = "";
		String path = "";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
		if (model.equals("pass"))
		{
			sql = " SELECT b.pdf FROM chk_pass_regular AS a LEFT JOIN chk_pass_span_record AS b ON a.chk_id = b.chk_id WHERE prj_id=? AND pass_id = ? AND direction=? AND span_no=? ";
		}else if(model.equals("culvert")){
			sql = " SELECT b.pdf FROM chk_culvert_regular AS a LEFT JOIN chk_culvert_span_record AS b ON a.chk_id = b.chk_id WHERE prj_id=? AND culvert_id = ? AND direction=? AND span_no=? ";
		}
		String[] arr = new String[]{ prj_id,id,direction,span_no};
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

	
	public int storePassOrCul_Path(String model,String id,String prj_id,String direction,String span_no,String path){
		String sql = "";
		int i = 0;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
		if (model.equals("pass"))
		{
			sql = " update chk_pass_regular AS a LEFT JOIN chk_pass_span_record AS b ON a.chk_id = b.chk_id set b.pdf=? WHERE prj_id=? AND pass_id = ? AND direction=? AND span_no=? ";
		}else if(model.equals("culvert")){
			sql = " update chk_culvert_regular AS a LEFT JOIN chk_culvert_span_record AS b ON a.chk_id = b.chk_id set b.pdf=? WHERE prj_id=? AND culvert_id = ? AND direction=? AND span_no=? ";
		}
		String[] arr = new String[]{path,prj_id,id,direction,span_no};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public int clearPassOrCul_Path(String model,String id,String path){
		String sql = "";
		int i = 0;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
		if (model.equals("pass"))
		{
			sql = " update chk_pass_regular AS a LEFT JOIN chk_pass_span_record AS b ON a.chk_id = b.chk_id set b.pdf=? WHERE  pass_id = ?  ";
		}else if(model.equals("culvert")){
			sql = " update chk_culvert_regular AS a LEFT JOIN chk_culvert_span_record AS b ON a.chk_id = b.chk_id set b.pdf=? WHERE  culvert_id = ?  ";
		}
		String[] arr = new String[]{path,id};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public int clearChkAuditPDF_Path(String bridge_id){
		int i = 0;
		String sql = " update  chk_brg_regular AS a LEFT JOIN chk_span_record AS b ON a.chk_id=b.chk_id set b.pdf='' WHERE a.bridge_id=? ";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] objs = new String[]{bridge_id};
    	i = mdo.executeUpdate(sql, objs);
    	mdo.close();
		return i;
	}
}
