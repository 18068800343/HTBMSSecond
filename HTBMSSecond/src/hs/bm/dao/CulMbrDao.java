package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import hs.bm.bean.*;
import hs.bm.vo.Cul_SpanVO;
import hs.bm.vo.Cul_memberVO;
import hs.bm.vo.DicHwBrgSectionRelationVO;

public class CulMbrDao
{
	
	private static CulMbrDao culMbrDao;
	
	public static CulMbrDao getInstance()
	{
		if(culMbrDao==null){
			culMbrDao = new CulMbrDao();
		}
		return culMbrDao;
	}
	
	/**
	 * 根据涵洞编号获取涵洞构件信息
	 * */
	public ArrayList<CulMbrInfo> GetCulMbrInfo(String culvert_id)
	{
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "SELECT * from cul_mbr_info where culvert_id=?";
		String[] as = new String[]
		{ culvert_id };
		ResultSet rs = mdo.executeQuery(sql, as);
		ArrayList<CulMbrInfo> al = new ArrayList<CulMbrInfo>();
		try
		{
			while (rs.next())
			{
				CulMbrInfo supr = new CulMbrInfo();
				supr.setR_id(rs.getString("r_id"));
				supr.setS_id(rs.getString("s_id"));
				supr.setMember_type(rs.getString("member_type"));
				supr.setMember_type(rs.getString("member_type"));
				supr.setMember_no(rs.getString("member_no"));
				supr.setMember_desc(rs.getString("member_desc"));
				supr.setMember_model(rs.getString("member_model"));
				al.add(supr);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return al;
	}

	/**
	 * 获取所有的涵洞构件信息
	 * */
	public ArrayList<CulMbrInfo> GetAllBrgMbrInfo()
	{
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "SELECT * from cul_mbr_info";
		ResultSet rs = mdo.executeQuery(sql, null);
		ArrayList<CulMbrInfo> al = new ArrayList<CulMbrInfo>();
		try
		{
			while (rs.next())
			{
				CulMbrInfo supr = new CulMbrInfo();
				supr.setR_id(rs.getString("r_id"));
				supr.setS_id(rs.getString("s_id"));
				supr.setMember_type(rs.getString("member_type"));
				supr.setMember_type(rs.getString("member_type"));
				supr.setMember_no(rs.getString("member_no"));
				supr.setMember_desc(rs.getString("member_desc"));
				supr.setMember_model(rs.getString("member_model"));
				al.add(supr);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return al;
	}

	/**
	 * 插入一条涵洞构件信息
	 * */
	public int InsertCulMbrInfo(CulMbrInfo bmi)
	{
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "insert into cul_mbr_info values(?,?,?,?,?,?,?)";
		Object[] obj = new Object[]
		{ bmi.getR_id(), bmi.getS_id(), bmi.getMember_type(), bmi.getMember_type(), bmi.getMember_no(), bmi.getMember_desc(), bmi.getMember_model() };
		int i = mdo.executeUpdate(sql, obj);
		mdo.close();
		return i;
	}

	/**
	 * 删除一条涵洞构件信息
	 * */
	public int DeleteCulMbrInfo(String r_id)
	{
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "delete from cul_mbr_info where r_id=?";
		String[] as = new String[]
		{ r_id };
		int i = mdo.executeUpdate(sql, as);
		mdo.close();
		return i;
	}

	/**
	 * 修改一条涵洞构件信息
	 * */
	public int UpdateCulMbrInfo(CulMbrInfo bmi)
	{
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "update cul_mbr_info set member_type=?,member_type=?,member_no=?,member_model=? where r_id=?";
		String[] as = new String[]
		{ bmi.getMember_type(), bmi.getMember_type(), bmi.getMember_no(), bmi.getMember_model(), bmi.getR_id() };
		int i = mdo.executeUpdate(sql, as);
		mdo.close();
		return i;
	}

	public List<DicHwInfo> queryH()
	{
		List<DicHwInfo> ll = new ArrayList<DicHwInfo>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn);
		String sql = "select highway_id,highway_name from dic_hw_info";
		String[] as =
		{};
		ResultSet rs = mdo.executeQuery(sql, as);
		try
		{
			while (rs.next())
			{
				DicHwInfo dhi = new DicHwInfo();
				dhi.setHighway_id(rs.getString(1));
				dhi.setHighway_name(rs.getString(2));
				ll.add(dhi);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			mdo.close();
		}
		return ll;
	}

	public List<DicManageSection> queryHS(String hid)
	{
		List<DicManageSection> ll = new ArrayList<DicManageSection>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "select section_id,section_name from dic_hw_section_info where highway_id=?";
		String[] as =
		{ hid };
		ResultSet rs = mdo.executeQuery(sql, as);
		try
		{
			while (rs.next())
			{
				DicManageSection dms = new DicManageSection();
				dms.setSection_no(rs.getString(1));
				dms.setSection_name(rs.getString(2));
				/*
				dhsi.setSection_id(rs.getString(1));
				dhsi.setSection_name(rs.getString(2));
				*/
				ll.add(dms);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			mdo.close();
		}
		return ll;
	}

	public List<DicHwBrgSectionRelationVO> queryHBS(String hid)
	{
		List<DicHwBrgSectionRelationVO> ll = new ArrayList<DicHwBrgSectionRelationVO>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "select struct_id from dic_hw_brg_section_relation where section_id=? and struct_type='涵洞'";
		String[] as =
		{ hid };
		ResultSet rs = mdo.executeQuery(sql, as);
		try
		{
			while (rs.next())
			{
				DicHwBrgSectionRelationVO dbhs = new DicHwBrgSectionRelationVO();
				dbhs.setStruct_id(rs.getString(1));
				ll.add(dbhs);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			mdo.close();
		}
		return ll;
	}

	public List<DicHwBrgSectionRelationVO> queryHBS1(String hid)
	{
		List<DicHwBrgSectionRelationVO> ll = new ArrayList<DicHwBrgSectionRelationVO>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "select struct_id from dic_hw_brg_section_relation where highway_id=? and section_id is null and struct_type='涵洞'";
		String[] as =
		{ hid };
		ResultSet rs = mdo.executeQuery(sql, as);
		try
		{
			while (rs.next())
			{
				DicHwBrgSectionRelationVO dbhs = new DicHwBrgSectionRelationVO();
				dbhs.setStruct_id(rs.getString(1));
				ll.add(dbhs);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			mdo.close();
		}
		return ll;
	}

	public int updateCul_Info(String cul_type_name,String culvert_id){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " UPDATE cul_info SET culvert_type = ? WHERE culvert_id = ? ";
		String[] arr = {cul_type_name,culvert_id};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	/**
	 * 获取cul_type_name
	 * @param csi
	 * @return
	 */
	public String getCulTypeName(CulSpanInfo csi){
		String cul_type_name="";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " SELECT cul_type_name FROM dic_cul_struct_type_def WHERE cul_type_id = ? ";
		String[] arr = {csi.getCul_type_id()};
		ResultSet rs= mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				cul_type_name = rs.getString("cul_type_name");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return cul_type_name;
	}
	
	/**
	 * 插入涵洞跨
	 * 
	 * @param csi
	 * @return
	 */
	public int insertCul_Span_info(CulSpanInfo csi)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " INSERT INTO cul_span_info VALUES(?,?,?,?,?) ";
		String[] arr =
		{ csi.getS_id(), csi.getCulvert_id(), csi.getDirection(), csi.getSpan_no() + "", csi.getCul_type_id() };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	/**
	 * 更新涵洞跨信息
	 * @param csi
	 * @return
	 */
	public int updateCul_Span_info(CulSpanInfo csi)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " UPDATE cul_span_info SET span_no= ? ,direction = ? ,cul_type_id=? WHERE s_id=? ";
		String[] arr ={csi.getSpan_no()+"",csi.getDirection(),csi.getCul_type_id(),csi.getS_id()};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;

	}
	/**
	 * 增加构件信息
	 * @author sundj
	 * @param cmi
	 * @return
	 */
	public int  add_member(CulMbrInfo cmi)
	{
		int i =0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " INSERT INTO cul_mbr_info (r_id,s_id,member_type,member_no,member_desc) VALUES(?,?,?,?,?) ";
		String[] arr ={cmi.getR_id(),cmi.getS_id(),cmi.getMember_type(),cmi.getMember_no(),cmi.getMember_desc()};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
		
	}
	/**
	 * 检查相同编号的构件
	 * @author sundj
	 * @param cmi
	 * @return 1存在/0不存在
	 */
	public int isExit_member(CulMbrInfo cmi)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " SELECT * FROM cul_mbr_info WHERE member_no = ? AND s_id = ? AND r_id !=? ";
		String[] arr ={cmi.getMember_no(),cmi.getS_id(),cmi.getR_id()};
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			if (rs.next())
			{
				i = 1;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return i;
	}
	
	/**
	 * 检查相同的跨号
	 * @author sundj
	 * @param csi
	 * @return 1存在/0不存在
	 */
	public int isExit_span(CulSpanInfo csi)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " SELECT * FROM cul_span_info WHERE span_no=? and s_id != ? and culvert_id=? ";
		String[] arr =
		{ csi.getSpan_no() + "",csi.getS_id(),csi.getCulvert_id() };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			if (rs.next())
			{
				i = 1;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return i;
	}
	/**
	 * 删除跨
	 * @author sundj
	 * @param csi
	 * @return
	 */
	public int span_del(CulSpanInfo csi){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " DELETE FROM cul_span_info WHERE s_id = ? ";
		String[] arr ={csi.getS_id()};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	/**
	 * 一个涵洞所有的跨信息
	 * @author sundj
	 * @param culvert_id
	 * @return
	 */
	public ArrayList<Cul_SpanVO> cul_span_all(String culvert_id)
	{
		ArrayList<Cul_SpanVO> list = new ArrayList<Cul_SpanVO>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " SELECT c.*,d.cul_type_name FROM cul_span_info AS c LEFT JOIN dic_cul_struct_type_def AS d ON c.cul_type_id = d.cul_type_id WHERE culvert_id = ? ";
		String[] arr =
		{ culvert_id };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				Cul_SpanVO cs = new Cul_SpanVO();
				cs.setS_id(rs.getString("s_id"));
				cs.setCulvert_id(rs.getString("culvert_id"));
				cs.setDirection(rs.getString("direction"));
				cs.setSpan_no(rs.getString("span_no"));
				cs.setCul_type_id(rs.getString("cul_type_id"));
				cs.setCul_type_name(rs.getString("cul_type_name"));
				list.add(cs);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	/**
	 * @author sundj
	 * 根据r_id获取一个构件vo对象
	 * @param cmi
	 * @return
	 */
	public Cul_memberVO getCul_memberVObyR_id(CulMbrInfo cmi){
		Cul_memberVO cm = new Cul_memberVO();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" select mi.*,md.component10,md.distr_name,md.member_name from cul_mbr_info AS mi LEFT JOIN dic_brg_struct_member_def AS md ON mi.member_type=md.member_name where r_id=? ";
		String[] arr = {cmi.getR_id()};
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				cm.setS_id(rs.getString("s_id"));
				cm.setR_id(rs.getString("r_id"));
				cm.setMember_type(rs.getString("member_type"));
				cm.setMember_desc(rs.getString("member_desc"));
				cm.setMember_no(rs.getString("member_no"));
				cm.setDistr_name("无");
				cm.setComponent_name(rs.getString("component10"));
				cm.setMember_name(rs.getString("member_name"));
				cm.setMember_model("无");
				
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return cm;
	}
	/**
	 * 根据s_id获取一个构件对象数组
	 * @author sundj
	 * @param cmi
	 * @return
	 */
	public ArrayList<Cul_memberVO> getCul_memberVObyS_id(CulMbrInfo cmi){
		ArrayList<Cul_memberVO>  list= new ArrayList<Cul_memberVO>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" select mi.*,md.component10,md.distr_name,md.member_name from cul_mbr_info AS mi LEFT JOIN dic_brg_struct_member_def AS md ON mi.member_type=md.member_name where s_id=? ";
		String[] arr = {cmi.getS_id()};
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				Cul_memberVO cm = new Cul_memberVO();
				cm.setS_id(rs.getString("s_id"));
				cm.setR_id(rs.getString("r_id"));
				cm.setMember_type(rs.getString("member_type"));
				cm.setMember_desc(rs.getString("member_desc"));
				cm.setMember_no(rs.getString("member_no"));
				cm.setDistr_name("无");
				cm.setComponent_name(rs.getString("component10"));
				cm.setMember_name(rs.getString("member_name"));
				cm.setMember_model("无");
				list.add(cm);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	/**
	 * 更新涵洞构件信息
	 * @author sundj
	 * @param cmi
	 * @return
	 */
	public int updateCul_Mbr_Info(CulMbrInfo cmi){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" UPDATE cul_mbr_info SET member_desc=?,member_no=?,member_type=? WHERE r_id=? ";
		String[] arr = {cmi.getMember_desc(),cmi.getMember_no(),cmi.getMember_type(),cmi.getR_id()};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	/**
	 * 删除涵洞跨
	 * @author sundj
	 * @param cmi
	 * @return
	 */
	public int delCul_Mbr_Info(CulMbrInfo cmi){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" DELETE FROM cul_mbr_info WHERE r_id = ? ";
		String[] arr = {cmi.getR_id()};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	/**
	 * 全部涵洞
	 * @return
	 */
	public ArrayList<CulInfo> getAllcul()
	{
		ArrayList<CulInfo> list = new ArrayList<CulInfo>();
		String sql = " select * from cul_info ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String[] arr = {};
		ResultSet rs= mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				CulInfo ci = new CulInfo();
				ci.setCulvert_id(rs.getString("culvert_id"));
				ci.setCulvert_name(rs.getString("culvert_name"));
				list.add(ci);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	/**
	 * 复制涵洞结构
	 * @param copyBridge
	 * @param id
	 * @return
	 */
	public boolean copyAllMem(String copyBridge, String id) {
		String sql = "delete from cul_span_info where culvert_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{id});
		if(i<0){
			dataOperation.close();
			return false;
		}
		
		sql = "select * from cul_span_info where culvert_id=?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{copyBridge});
		sql = "insert into cul_span_info(s_id,culvert_id,direction,span_no,cul_type_id) values (?,?,?,?,?)";
		try {
			while(rs.next()){
				String s_id = UUID.randomUUID().toString().replaceAll("-", "");
				String culvert_id = id;
				String direction = rs.getString("direction");
				String span_no = rs.getString("span_no");
				String brg_type_id = rs.getString("cul_type_id");
				int j = dataOperation.executeUpdate(sql, new String[]{
						s_id,
						culvert_id,
						direction,
						span_no,
						brg_type_id
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
	
	public boolean copyThisMem(String copyBridge, String direction, String span_no, String s_id) {
		String sql = "delete from cul_mbr_info where s_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = dataOperation.executeUpdate(sql, new String[]{s_id});
		if(i<0){
			dataOperation.close();
			return false;
		}
		sql = "select * from cul_mbr_info where s_id=(select s_id from cul_span_info where culvert_id=? and direction=? and span_no=?)";
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
		sql = "insert into cul_mbr_info(r_id,s_id,member_type,member_no,member_desc,member_model) values(?,?,?,?,?,?)";
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
	
	public ArrayList<DicCulStructTypeDef> getCul_type(){
		ArrayList<DicCulStructTypeDef> dicCulStructTypeDef = new ArrayList<DicCulStructTypeDef>();
		String sql = " SELECT * FROM dic_cul_struct_type_def WHERE 1=1 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{});
		try
		{
			while (rs.next())
			{
				DicCulStructTypeDef entity = new DicCulStructTypeDef();
				entity.setCul_type_id(rs.getString("cul_type_id"));
				entity.setCul_type_name(rs.getString("cul_type_name"));
				dicCulStructTypeDef.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return dicCulStructTypeDef;
		
	}
	
	public ArrayList<CulSpanInfo> getCulSpanInfoDirection(String culvert_id)
	{
		ArrayList<CulSpanInfo> culSpanInfo = new ArrayList<CulSpanInfo>();
		String sql = " SELECT DISTINCT direction FROM cul_span_info WHERE culvert_id = ? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{culvert_id});
		try
		{
			while (rs.next())
			{
				CulSpanInfo entity = new CulSpanInfo();
				entity.setDirection(rs.getString("direction"));
				culSpanInfo.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return culSpanInfo;
	}
	
	
	public String isCheckAudited(String culvert_id,String prj_id){
		String audit_state = "";
		String sql = " SELECT * FROM chk_culvert_regular WHERE prj_id=? AND culvert_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id,culvert_id});
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
}
