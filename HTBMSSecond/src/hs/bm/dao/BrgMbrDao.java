package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import hs.bm.bean.BrgMbrInfo;
import hs.bm.bean.BrgSpanInfo;
import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.DicBrgCardDomain;
import hs.bm.bean.DicBrgStructMemberDef;
import hs.bm.bean.DicBrgStructTypeDef;
import hs.bm.bean.DicMemberCondition;
import hs.bm.bean.DicMemberStandard;
import hs.bm.bean.MemMemberTypeDef;
import hs.bm.util.IDtool;
import hs.bm.vo.BrgLXVO;
import hs.bm.vo.BrgMemberVO;
import hs.bm.vo.BrgSpanInfoVO;
import hs.bm.vo.DicVisVO;
import hs.bm.vo.QuickDownSpanVo;
public class BrgMbrDao {
	
	private static BrgMbrDao brgMbrDao;
	
	
	public static BrgMbrDao getIntance(){
		if(brgMbrDao==null){
			brgMbrDao=new BrgMbrDao();
		}
		return brgMbrDao;
	}
	/**
	 * 根据id查询桥型名称
	 * @author sundj
	 * @param brg_type_id
	 * @return brg_type_name
	 */
	public String getBaseNameById(String brg_type_id){
		String brg_base_type ="";
		String sql="select brg_type_name from dic_brg_struct_type_def where brg_type_id=?";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] obj = new String[]{brg_type_id};
    	ResultSet rs = mdo.executeQuery(sql, obj);
    	try
		{
			while (rs.next())
			{
				brg_base_type=rs.getString("brg_type_name");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
		return brg_base_type;
	}
	/**
	 * 根据桥型名称查询id
	 * @author sundj
	 * @param  brg_type_name 
	 * @return brg_type_id
	 */
	public String getIdByName(String brg_type_name){
		String brg_type_id ="";
		String sql="select brg_type_id from dic_brg_struct_type_def where brg_type_name=? ";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] obj = new String[]{brg_type_name};
    	ResultSet rs = mdo.executeQuery(sql, obj);
    	try
		{
			while (rs.next())
			{
				brg_type_id=rs.getString("brg_type_id");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
		return brg_type_id;
	}
	
	
	/**查询桥型，构件类型，主材类型，支座类型*/
	public List<BrgLXVO> queryLX(Object[] obj){
		List<BrgLXVO> ll=new ArrayList<BrgLXVO>();
		BrgLXVO bv=new BrgLXVO();
		String sql1="select * from dic_brg_struct_type_def";
		String sql4="select * from dic_brg_struct_member_def";
		List<DicBrgStructTypeDef> qx =new ArrayList<DicBrgStructTypeDef>();
		List<DicBrgStructMemberDef> gjlx=new ArrayList<DicBrgStructMemberDef>();
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	try{
		ResultSet rs1=mdo.executeQuery(sql1, obj);
		while(rs1.next()){
			DicBrgStructTypeDef db=new DicBrgStructTypeDef();
			db.setBrg_type_id(rs1.getString("brg_type_id"));
			db.setBrg_type_name(rs1.getString("brg_type_name"));
			qx.add(db);
		}
		ResultSet rs4=mdo.executeQuery(sql4, obj);
		while(rs4.next()){
			DicBrgStructMemberDef md=new DicBrgStructMemberDef();
			md.setComponent1(rs4.getString("component1"));
			md.setComponent2(rs4.getString("component2"));
			md.setComponent3(rs4.getString("component3"));
			md.setComponent4(rs4.getString("component4"));
			md.setComponent5(rs4.getString("component5"));
			md.setComponent6(rs4.getString("component6"));
			md.setComponent7(rs4.getString("component7"));
			md.setComponent8(rs4.getString("component8"));
			md.setDistr_name(rs4.getString("distr_name"));
			md.setMember_id(rs4.getString("member_id"));
			md.setMember_name(rs4.getString("Member_name"));
			gjlx.add(md);
		}
		bv.setGjlx(gjlx);
		bv.setQx(qx);
		ll.add(bv);
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		mdo.close();
    	}
		
		return ll;
	}
	
	public ArrayList<MemMemberTypeDef> getMM_type(String id)
	{
		ArrayList<MemMemberTypeDef> list= new ArrayList<MemMemberTypeDef>();
		String sql = " SELECT * FROM mem_member_type_def where member_id =? ";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] obj = new String[]{id};
    	ResultSet rs=mdo.executeQuery(sql, obj);
    	try
		{
			while (rs.next())
			{
				MemMemberTypeDef mmt = new MemMemberTypeDef();
				mmt.setMember_id(rs.getString("member_id"));
				mmt.setMember_type_name(rs.getString("member_type_name"));
				list.add(mmt);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
		return list;
		
	}
	/**
	 * 查询跨信息
	 */
	public List<BrgSpanInfoVO> querySpan(Object[] obj){
		List<BrgSpanInfoVO> ll=new ArrayList<BrgSpanInfoVO>();
		String sql="select * from brg_span_info where bridge_id=? order by span_no";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	ResultSet rs=mdo.executeQuery(sql, obj);
    	try{
		while(rs.next()){
			BrgSpanInfoVO bs=new BrgSpanInfoVO();
			bs.setS_id(rs.getString("s_id"));
			bs.setBridge_id(rs.getString("bridge_id"));
			bs.setDirection(rs.getString("direction"));
			bs.setSpan_no(rs.getString("span_no"));
			bs.setBrg_type_id(rs.getString("brg_type_id"));
			bs.setSpan_length(rs.getString("span_length"));
			bs.setSpan_material(rs.getString("span_material"));
			bs.setSpanning_case(rs.getString("spanning_case"));
			bs.setClearance(rs.getString("clearance"));
			String consecutive_no = rs.getString("consecutive_no");
			if (consecutive_no==null)
			{
				bs.setSpan_line_no("");
			}else{
				bs.setSpan_line_no(consecutive_no);
			}
			ll.add(bs);
		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		mdo.close();
    	}
		return ll;	
	}
	public ArrayList<DicBrgStructMemberDef> queryMemberType()
	{
		ArrayList<DicBrgStructMemberDef> list = new ArrayList<DicBrgStructMemberDef>();
		String sql = " SELECT member_id,member_name FROM dic_brg_struct_member_def ";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] obj = new String[]{};
    	ResultSet rs=mdo.executeQuery(sql, obj);
    	try
		{
			while (rs.next())
			{
				DicBrgStructMemberDef dbsmd = new DicBrgStructMemberDef();
				dbsmd.setMember_id(rs.getString("member_id"));
				dbsmd.setMember_name(rs.getString("member_name"));
				list.add(dbsmd);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
		return list;
	}
	
	/**
	 * 查询跨是否重复
	 */
	public int checkSpan(Object[] obj){
		int i=0;
		String sql="select *  from brg_span_info where bridge_id=? and direction=? and span_no=? and s_id!=?";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	ResultSet rs=mdo.executeQuery(sql, obj);
    	try{
		while(rs.next()){
			i=-1;
		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		mdo.close();
    	}
		return i;
	}
	/**
	 * 插入下部构件信息
	 * */
	public int insertDownSpan(QuickDownSpanVo quickDownSpanVo){
		String sql="insert into brg_card_down_struct"
				+ " (down_struct_id,down_struct_pier,down_struct_type,down_struct_stuff,"
				+ " down_struct_base_type,bridge_id,is_wade,"
				+ " direction) values(?,?,?,?,?,?,?,?); ";
		int i=this.excuteUpdate(sql, new Object[]{IDtool.getUUID().replace("-",""),
				                     quickDownSpanVo.getQuickSpan_duntai_no(),
				                     quickDownSpanVo.getQuick_down_struct_type(),
				                     quickDownSpanVo.getQuick_down_struct_stuff(),
				                     quickDownSpanVo.getQuick_down_struct_base_type(),
				                     quickDownSpanVo.getBridge_id(),
				                     quickDownSpanVo.getIfWadeOrNo(),
				                     quickDownSpanVo.getDirection()});
		return i;
    }
	/**
	 * 删除原本下部构件信息
	 * */
	public int DeleteDownSpans(String bridge_id){
		String sql=" delete from brg_card_down_struct where bridge_id=?";
		int i=this.excuteUpdate(sql,new Object[]{bridge_id});
		return i;
    }
	/**
	 * 插入一条跨信息
	 * */
	public int insertKH(Object[] obj){
		String sql="insert into brg_span_info(s_id,bridge_id,direction,span_no,brg_type_id,consecutive_no,span_length,span_material,spanning_case,clearance) values(?,?,?,?,?,?,?,?,?,?);";
		int i=this.excuteUpdate(sql, obj);
		return i;
    }
	/**
	 * 删除一条跨信息
	 * */
	public int deleteSpan(Object[] obj){
		String sql="delete from brg_span_info where s_id=?";
		int i=this.excuteUpdate(sql, obj);
		return i;
    }
	/**
	 * 修改一条跨信息
	 * */
	public int updateSpan(Object[] obj){
		String sql="update brg_span_info set direction=?,span_no=?,brg_type_id=?,consecutive_no=?,span_length=?,span_material=?,spanning_case=?,clearance=? where s_id=?";
		int i=this.excuteUpdate(sql, obj);
		return i;
    }
	/**
	 * 查询构件信息
	 * @param obj
	 * @return
	 */
	public List<BrgMemberVO> queryMember(Object[] obj){
		List<BrgMemberVO>ll=new ArrayList<BrgMemberVO>();
		String sql=" select mi.*,md.component8,md.distr_name,md.member_name from brg_mbr_info mi, dic_brg_struct_member_def md where mi.s_id=? and mi.member_type=md.member_name ";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
		ResultSet rs=mdo.executeQuery(sql, obj);
		try{
		while(rs.next()){
			BrgMemberVO bm=new BrgMemberVO();
			bm.setR_id(rs.getString("r_id"));
			bm.setS_id(rs.getString("s_id"));
			bm.setMember_type(rs.getString("member_name"));
			bm.setMember_no(rs.getString("member_no"));
			bm.setMember_desc(rs.getString("member_desc"));
			bm.setMember_model(rs.getString("member_model"));
			/*bm.setMaterial_name(rs.getString("material_name"));*/
			/*bm.setBearing_name(rs.getString("bearing_name"));*/
			bm.setComponent_name(rs.getString("component8"));
			bm.setDistr_name(rs.getString("distr_name"));
			ll.add(bm);
		}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			mdo.close();
		}
		System.out.println(ll.size());
		return ll;
	}
	
	
	/**
	 * 通过桥梁id查询有病害的构件
	 * @param obj
	 * @return
	 */
	public List<DicVisVO> queryBingHai(Object[] obj){
		List<DicVisVO> ll=new ArrayList<DicVisVO>();
		String sql="select br.* "
				+ "from chk_brg_defect bd "
				+ "INNER JOIN chk_brg_record br "
				+ "on bd.mbr_chk_id=br.mbr_chk_id and br.bridge_id=? "
				+ "GROUP BY direction,span_no,mbr_type";
		Connection conn=MyDataSource.getInstance().getConnection();
		MyDataOperation mdo=new MyDataOperation(conn,false);
		ResultSet rs=mdo.executeQuery(sql, obj);
		try{
		while(rs.next()){
			DicVisVO vv=new DicVisVO();
			vv.setBridge_id(rs.getString("Bridge_id"));
			vv.setMbr_chk_id(rs.getString("Mbr_chk_id"));
			vv.setDirection(rs.getString("Direction"));
			vv.setSpan_no(rs.getString("Span_no"));
			vv.setMbr_type(rs.getString("Mbr_type"));
			vv.setMbr_no(rs.getString("Mbr_no"));
					String sql1="select * from chk_brg_defect where mbr_chk_id=?";	
					ResultSet rs1=mdo.executeQuery(sql1, new Object[]{vv.getMbr_chk_id()});
					List<ChkBrgDefect> ll1=new ArrayList<ChkBrgDefect>();
					while(rs1.next()){
						ChkBrgDefect df=new ChkBrgDefect();
						df.setDefect_id(rs1.getString("defect_id"));
						df.setDefect_location_desc(rs1.getString("Defect_location_desc"));
						
						df.setDefect_count(rs1.getString("Defect_count"));
						df.setDefect_name(rs1.getString("Defect_name"));
						df.setRepair_state(rs1.getString("Repair_state"));
						df.setDefect_serial(rs1.getString("Defect_serial"));
						ll1.add(df);
					}
					vv.setBd(ll1);
					
		ll.add(vv);	
		}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			mdo.close();
		}
		
		
		return ll;
	}
	
	/**
	 * 判定构件编号是否重复
	 */
	public int checkR_id(Object[] obj){
		int i=0;
		String sql="select * from brg_mbr_info where r_id=? and s_id=?";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
		ResultSet rs=mdo.executeQuery(sql, obj);
		try{
		while(rs.next()){
			i=-1;
		}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			mdo.close();
		}
		return i;
	}
	
	/**
	 * 判定构件是否重复
	 */
	
	public int checkMember(Object[] obj){
		int i=0;
		String sql="select * from brg_mbr_info where s_id =? and member_no=? ";
		Connection conn=MyDataSource.getInstance().getConnection();
		MyDataOperation mdo=new MyDataOperation(conn,false);
		ResultSet rs=mdo.executeQuery(sql, obj);
		try{
		while(rs.next()){
			i=-2;
		}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			mdo.close();
		}
		return i;
	}
	
	/**插入一条构件信息*/
	public int insertMember(Object[] obj){
		String sql="insert into brg_mbr_info(r_id,s_id,member_type,member_no,member_desc,member_model) values(?,?,?,?,?,?)";
		int i=this.excuteUpdate(sql, obj);
		return i;
	}
	/**修改一条构件信息*/
	public int updateMember(Object[] obj){
		String sql="update brg_mbr_info set member_type=?,member_no=?,member_desc=?,member_model=? where r_id=?";
		int i=this.excuteUpdate(sql, obj);
		return i;
	}
	/**删除一条构件信息*/
	public int delMember(Object[] obj){
		String sql="delete from brg_mbr_info where r_id=?";
		int i=this.excuteUpdate(sql, obj);
		return i;
	}
	
	/**删除一条构件信息*/
	public int queryStructChkState(String id){
		String sql = "select * from struct_chk_state where id = ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{id});
		int i = 0;
		try {
			if(rs.next()){
				i =  rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return i;
	}
	/**简化*/
	private int excuteUpdate(String sql,Object[] obj){
		int i=0;
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	i=mdo.executeUpdate(sql, obj);
    	mdo.close();
		return i;
	}
	
	
	public List<Map<String, String>> getAllBridge(){
		String sql = "select bridge_id,bridge_name from brg_card_admin_id";
		List<Map<String, String>> ll = new ArrayList<Map<String,String>>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				Map<String, String> map = new HashMap<String, String>();
				map.put("bridge_id", rs.getString("bridge_id"));
				map.put("bridge_name", rs.getString("bridge_name"));
				ll.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	public boolean copyThisMem(String copyBridge, String direction, String span_no, String s_id) {
		String sql = "delete from brg_mbr_info where s_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = dataOperation.executeUpdate(sql, new String[]{s_id});
		if(i<0){
			dataOperation.close();
			return false;
		}
		sql = "select * from brg_mbr_info where s_id=(select s_id from brg_span_info where bridge_id=? and direction=? and span_no=?)";
		List<BrgMbrInfo> ll = new ArrayList<BrgMbrInfo>();
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{copyBridge, direction, span_no});
		try {
			while(rs.next()){
				BrgMbrInfo bm=new BrgMbrInfo();
				bm.setR_id(UUID.randomUUID().toString().replaceAll("-", ""));
				bm.setS_id(s_id);
				bm.setMember_no(rs.getString("member_no"));
				bm.setMember_desc(rs.getString("member_desc"));
				bm.setMember_model(rs.getString("member_model"));
				bm.setMember_type(rs.getString("member_type"));
				ll.add(bm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sql = "insert into brg_mbr_info(r_id,s_id,member_type,member_no,member_desc,member_model) values(?,?,?,?,?,?)";
		for(int j=0;j<ll.size();j++){
			BrgMbrInfo bm = ll.get(j);
			int k = dataOperation.executeUpdate(sql, new String[]{
					bm.getR_id(),
					bm.getS_id(),
					bm.getMember_type(),
					bm.getMember_no(),
					bm.getMember_desc(),
					bm.getMember_model()
			});
			if(k<0){
				dataOperation.close();
				return false;
			}
		}
		dataOperation.close();
		return true;
	}
	
	public static void main(String[] args) throws Exception{
		BrgMbrInfo bmi=new BrgMbrInfo();
		bmi.setMember_desc("4");
		bmi.setMember_model("5");
		bmi.setMember_no("6");
	}
	public boolean copyAllMem(String copyBridge, String id) {
		String sql = "delete from brg_span_info where bridge_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{id});
		if(i<0){
			dataOperation.close();
			return false;
		}
		
		sql = "select * from brg_span_info where bridge_id=?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{copyBridge});
		sql = "insert into brg_span_info(s_id,bridge_id,direction,span_no,brg_type_id,consecutive_no) values (?,?,?,?,?,?)";
		try {
			while(rs.next()){
				String s_id = UUID.randomUUID().toString().replaceAll("-", "");
				String bridge_id = id;
				String direction = rs.getString("direction");
				String span_no = rs.getString("span_no");
				String brg_type_id = rs.getString("brg_type_id");
				String consecutive_no = rs.getString("consecutive_no");
				int j = dataOperation.executeUpdate(sql, new String[]{
						s_id,
						bridge_id,
						direction,
						span_no,
						brg_type_id,
						consecutive_no
				});
				if(j<0){
					dataOperation.close();
					return false;
				}
				boolean flag = copyThisMem(copyBridge, direction, span_no, s_id);
				if(flag==false){
					dataOperation.close();
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return true;
	}
	public List<String> buildDirection(String brg_id) {
		String sql = "SELECT direction from brg_span_info where bridge_id=? GROUP BY direction";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{brg_id});
		List<String> ll = new ArrayList<String>();
		try {
			while(rs.next()){
				String direction = rs.getString("direction");
				ll.add(direction);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	
	public List<String> buildSpan(String brg_id, String direction) {
		String sql = "SELECT span_no from brg_span_info where bridge_id=? and direction=? order by span_no";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{brg_id, direction});
		List<String> ll = new ArrayList<String>();
		try {
			while(rs.next()){
				String span_no = rs.getString("span_no");
				ll.add(span_no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	
	public boolean copyThisDirection(String copyBridge, String copyDirection, String id, String oldDirection) {
		String sql = "delete from brg_span_info where bridge_id=? and direction=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{id, oldDirection});
		if(i<0){
			dataOperation.close();
			return false;
		}
		
		sql = "select * from brg_span_info where bridge_id=? and direction=?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{copyBridge, copyDirection});
		sql = "insert into brg_span_info(s_id,bridge_id,direction,span_no,brg_type_id,consecutive_no) values (?,?,?,?,?,?)";
		try {
			while(rs.next()){
				String s_id = UUID.randomUUID().toString().replaceAll("-", "");
				String bridge_id = id;
				String direction = rs.getString("direction");
				String span_no = rs.getString("span_no");
				String brg_type_id = rs.getString("brg_type_id");
				String consecutive_no = rs.getString("consecutive_no");
				int j = dataOperation.executeUpdate(sql, new String[]{
						s_id,
						bridge_id,
						oldDirection,
						span_no,
						brg_type_id,
						consecutive_no
				});
				if(j<0){
					dataOperation.close();
					return false;
				}
				boolean flag = copyThisMem(copyBridge, direction, span_no, s_id);
				if(flag==false){
					dataOperation.close();
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return true;
	}
	
	public ArrayList<BrgSpanInfo> getBrgSpanInfo_direction(String bridge_id){
		ArrayList<BrgSpanInfo> brgSpanInfo = new ArrayList<BrgSpanInfo>();
		String sql = " SELECT DISTINCT direction FROM brg_span_info WHERE bridge_id = ? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id});
		try
		{
			while (rs.next())
			{
				BrgSpanInfo entity = new BrgSpanInfo();
				entity.setDirection(rs.getString("direction"));
				brgSpanInfo.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgSpanInfo;
	}
	
	public String isCheckAudited(String bridge_id,String prj_id){
		String audit_state = "";
		String sql = " SELECT * FROM chk_brg_regular WHERE prj_id=? AND bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id,bridge_id});
		try
		{
			while (rs.next())
			{
				
				audit_state=rs.getString("audit_state");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return audit_state;
	}
	
	
	/**
	 * 查询跨是否重复
	 */
	public ArrayList<BrgSpanInfo> isSpanExit(String bridge_id,String span_no,String query_type,String span_top,String span_down){
		ArrayList<BrgSpanInfo> brgSpanInfo = new ArrayList<BrgSpanInfo>();
		String sql="";
		if(query_type.equals("1")){
			if (span_top!=null&&span_down!=null)
			{
				sql="select *  from brg_span_info where bridge_id=?  and span_no=? and direction !='无'";
			}else if(span_top==null){
				sql="select *  from brg_span_info where bridge_id=?  and span_no=? and direction ='下行'";
			}else{
				sql="select *  from brg_span_info where bridge_id=?  and span_no=? and direction ='上行'";
			}
		}else{
			sql="select *  from brg_span_info where bridge_id=?  and span_no=? and direction ='无' ";
		}
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] params = new String[]{
    			bridge_id,span_no
    	};
    	ResultSet rs=mdo.executeQuery(sql, params);
    	try
		{
			while (rs.next())
			{
				BrgSpanInfo entity = new BrgSpanInfo();
				entity.setSpan_no(rs.getString("span_no"));
				entity.setDirection(rs.getString("direction"));
				brgSpanInfo.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
		return brgSpanInfo;
	}
	
	/**
	 * 
	 * @return ArrayList<DicMemberCondition>
	 */
	public ArrayList<DicMemberCondition> getDicMemberCondition(String condition_style ){
		ArrayList<DicMemberCondition> dicMemberConditions = new ArrayList<DicMemberCondition>();
		Connection conn=MyDataSource.getInstance().getConnection();
		String sql = " SELECT DISTINCT bridge_type FROM dic_member_condition WHERE condition_style=? ";
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] params = new String[]{condition_style};
    	ResultSet rs=mdo.executeQuery(sql, params);
    	try
		{
			while (rs.next())
			{
				DicMemberCondition entity = new DicMemberCondition();
				entity.setBridge_type(rs.getString("bridge_type"));
				dicMemberConditions.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
		return dicMemberConditions;
	}
	
	
	public ArrayList<DicMemberCondition> getDicMemberCondition_conditionNorm(String condition_style,String brg_type ){
		ArrayList<DicMemberCondition> dicMemberConditions = new ArrayList<DicMemberCondition>();
		Connection conn=MyDataSource.getInstance().getConnection();
		String sql = " SELECT DISTINCT condition_norm FROM dic_member_condition WHERE condition_style=? and bridge_type=? ";
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String[] params = new String[]{condition_style,brg_type};
    	ResultSet rs=mdo.executeQuery(sql, params);
    	try
		{
			while (rs.next())
			{
				DicMemberCondition entity = new DicMemberCondition();
				entity.setCondition_norm(rs.getString("condition_norm"));
				dicMemberConditions.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
		return dicMemberConditions;
	}
	
	public ArrayList<DicMemberStandard> getDicMemberStandardByDMC(String bridge_type,String condition_style,String condition_norm,String location){
		ArrayList<DicMemberStandard> dicMemberStandard = new ArrayList<DicMemberStandard>();
		String sql = " SELECT b.member_type,b.member_name,b.member_model FROM dic_member_condition as a LEFT JOIN dic_member_standard as b on a.condition_id=b.condition_id WHERE a.bridge_type=? AND a.condition_style=? AND a.condition_norm=? AND a.location=? ";
		MyDataOperation mdo=new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		String[] params = new String[]{
			bridge_type,condition_style,condition_norm,location
		};
		ResultSet rs=mdo.executeQuery(sql, params);
		try
		{
			while (rs.next())
			{
				DicMemberStandard entity = new DicMemberStandard();
				entity.setMember_model(rs.getString("member_model"));
				entity.setMember_name(rs.getString("member_name"));
				entity.setMember_type(rs.getString("member_type"));
				dicMemberStandard.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return dicMemberStandard;
	}
	
	public int buildQuickSpan(String s_id,String bridge_id,String direction,String span_no,String brg_type,String consecutive_no,String span_length,String span_material,String spanning_case,String clearance){
		int i = 0;
		String sql=" insert into brg_span_info(s_id,bridge_id,direction,span_no,brg_type_id,consecutive_no,span_length,span_material,spanning_case,clearance) values(?,?,?,?,?,?,?,?,?,?)  ";
		MyDataOperation mdo=new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		String[] params = new String[]{
				s_id,bridge_id,direction,span_no,brg_type,consecutive_no,
				span_length,span_material,spanning_case,clearance
		};
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
	}
	
	public List<DicBrgCardDomain> getSpan_material(){
		List<DicBrgCardDomain> list = new ArrayList<DicBrgCardDomain>();
		String sql = " SELECT item_value FROM dic_brg_card_domain WHERE item_id = '28' ";
		MyDataOperation mdo=new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		String[] params = new String[]{};
		ResultSet rs = mdo.executeQuery(sql, params);
		try
		{
			while (rs.next())
			{
				DicBrgCardDomain entity = new DicBrgCardDomain();
				entity.setItem_value(rs.getString("item_value"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	
	public int buildQuickSpan_member(String r_id,String s_id,String member_type,String member_no,String member_model){
		int i = 0;
		String sql = " INSERT INTO brg_mbr_info(r_id,s_id,member_type,member_no,member_model) VALUES(?,?,?,?,?) ";
		MyDataOperation mdo=new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		String[] params = new String[]{
				r_id,s_id,member_type,member_no,member_model
		};
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
		
	}
} 
