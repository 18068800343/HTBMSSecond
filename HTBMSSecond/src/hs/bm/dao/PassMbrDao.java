package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import hs.bm.bean.*;
import hs.bm.vo.DicHwBrgSectionRelationVO;
import hs.bm.vo.Pass_memberVO;
import hs.bm.vo.Pass_spanVO;

public class PassMbrDao {
	
	
	private static PassMbrDao passMbrDao;
	
	public static PassMbrDao getInstance(){
		if(passMbrDao==null){
			passMbrDao = new PassMbrDao();
		}
		return passMbrDao;
	}
		
	/***********************************************************************/
	
	/**
	 * 插入通道跨
	 * @param csi
	 * @return
	 */
	public int insertPass_Span_info(PassSpanInfo psi)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " INSERT INTO pass_span_info VALUES(?,?,?,?,?) ";
		String[] arr =
		{ psi.getS_id(), psi.getPass_id(), psi.getDirection(), psi.getSpan_no() + "", psi.getPass_type_id() };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public int updatePass_Info(String Pass_type_name ,String pass_id )
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " UPDATE pass_info SET pass_type = ? WHERE pass_id = ? ";
		String[] arr= {Pass_type_name,pass_id};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
		
				
	}
	
	/**
	 * 获取Pass_type_name
	 * @param psi
	 * @return
	 */
	public String getPass_type_name(PassSpanInfo psi){
		String pass_type_name = "";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " SELECT pass_type_name FROM dic_pass_struct_type_def WHERE pass_type_id = ? ";
		String[] arr = {psi.getPass_type_id()};
		ResultSet rs= mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				pass_type_name = rs.getString("pass_type_name");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return pass_type_name;
	}
	
	/**
	 * 更新通道跨信息
	 * @param csi
	 * @return
	 */
	public int updatePass_Span_info(PassSpanInfo psi)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " UPDATE pass_span_info SET span_no= ? ,direction = ? ,pass_type_id=? WHERE s_id=? ";
		String[] arr ={psi.getSpan_no()+"",psi.getDirection(),psi.getPass_type_id(),psi.getS_id()};
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
	public int  add_member(PassMbrInfo pmi)
	{
		int i =0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " INSERT INTO pass_mbr_info (r_id,s_id,member_type,member_no,member_desc) VALUES(?,?,?,?,?) ";
		String[] arr ={pmi.getR_id(),pmi.getS_id(),pmi.getMember_type(),pmi.getMember_no(),pmi.getMember_desc()};
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
	public int isExit_member(PassMbrInfo pmi)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " SELECT * FROM pass_mbr_info WHERE member_no = ? AND s_id = ? AND r_id !=? ";
		String[] arr ={pmi.getMember_no(),pmi.getS_id(),pmi.getR_id()};
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
	public int isExit_span(PassSpanInfo psi)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " SELECT * FROM pass_span_info WHERE span_no=? and s_id != ? and direction =? and pass_id=? ";
		String[] arr =
		{ psi.getSpan_no() + "",psi.getS_id(),psi.getDirection(),psi.getPass_id() };
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
	 * @param psi
	 * @return
	 */
	public int span_del(PassSpanInfo psi){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " DELETE FROM pass_span_info WHERE s_id = ? ";
		String[] arr ={psi.getS_id()};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	/**
	 * 一个通道所有的跨信息
	 * @author sundj
	 * @param culvert_id
	 * @return
	 */
	public ArrayList<Pass_spanVO> pass_span_all(String culvert_id)
	{
		ArrayList<Pass_spanVO> list = new ArrayList<Pass_spanVO>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " SELECT c.*,d.pass_type_name FROM pass_span_info AS c LEFT JOIN dic_pass_struct_type_def AS d ON c.pass_type_id = d.pass_type_id WHERE pass_id = ? ";
		String[] arr =
		{ culvert_id };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				Pass_spanVO ps = new Pass_spanVO();
				ps.setS_id(rs.getString("s_id"));
				ps.setPass_id(rs.getString("pass_id"));
				ps.setDirection(rs.getString("direction"));
				ps.setSpan_no(rs.getString("span_no"));
				ps.setPass_type_id(rs.getString("pass_type_id"));
				ps.setPass_type_name(rs.getString("pass_type_name"));
				list.add(ps);
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
	public Pass_memberVO getPass_memberVObyR_id(PassMbrInfo pmi){
		Pass_memberVO pm = new Pass_memberVO();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" select mi.*,md.component9,md.distr_name,md.member_name from pass_mbr_info AS mi LEFT JOIN dic_brg_struct_member_def AS md ON mi.member_type=md.member_name where r_id=? ";
		String[] arr = {pmi.getR_id()};
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				pm.setS_id(rs.getString("s_id"));
				pm.setR_id(rs.getString("r_id"));
				pm.setMember_type(rs.getString("member_type"));
				pm.setMember_desc(rs.getString("member_desc"));
				pm.setMember_no(rs.getString("member_no"));
				pm.setDistr_name("无");
				pm.setComponent_name(rs.getString("component9"));
				pm.setMember_name(rs.getString("member_name"));
				pm.setMember_model("无");
				
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return pm;
	}
	/**
	 * 根据s_id获取一个构件对象数组
	 * @author sundj
	 * @param cmi
	 * @return
	 */
	public ArrayList<Pass_memberVO> getPass_memberVObyS_id(PassMbrInfo pmi){
		ArrayList<Pass_memberVO>  list= new ArrayList<Pass_memberVO>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" select mi.*,md.component9,md.distr_name,md.member_name from pass_mbr_info AS mi LEFT JOIN dic_brg_struct_member_def AS md ON mi.member_type=md.member_name where s_id=? ";
		String[] arr = {pmi.getS_id()};
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				Pass_memberVO pm = new Pass_memberVO();
				pm.setS_id(rs.getString("s_id"));
				pm.setR_id(rs.getString("r_id"));
				pm.setMember_type(rs.getString("member_type"));
				pm.setMember_desc(rs.getString("member_desc"));
				pm.setMember_no(rs.getString("member_no"));
				pm.setDistr_name("无");
				pm.setComponent_name(rs.getString("component9"));
				pm.setMember_name(rs.getString("member_name"));
				pm.setMember_model("无");
				list.add(pm);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	/**
	 * 更新通道构件信息
	 * @author sundj
	 * @param cmi
	 * @return
	 */
	public int updatePass_Mbr_Info(PassMbrInfo pmi){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" UPDATE pass_mbr_info SET member_desc=?,member_no=?,member_type=? WHERE r_id=? ";
		String[] arr = {pmi.getMember_desc(),pmi.getMember_no(),pmi.getMember_type(),pmi.getR_id()};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	/**
	 * 删除通道跨
	 * @author sundj
	 * @param cmi
	 * @return
	 */
	public int delPass_Mbr_Info(PassMbrInfo pmi){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql =" DELETE FROM pass_mbr_info WHERE r_id = ? ";
		String[] arr = {pmi.getR_id()};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
		
	}
	
	/**
	 * 全部涵洞
	 * @return
	 */
	public ArrayList<PassInfo> getAllpass()
	{
		ArrayList<PassInfo> list = new ArrayList<PassInfo>();
		String sql = " select * from pass_info ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String[] arr = {};
		ResultSet rs= mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				PassInfo ci = new PassInfo();
				ci.setPass_id(rs.getString("pass_id"));
				ci.setPass_name(rs.getString("pass_name"));
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
		String sql = "delete from pass_span_info where pass_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{id});
		if(i<0){
			dataOperation.close();
			return false;
		}
		
		sql = "select * from pass_span_info where pass_id=?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{copyBridge});
		sql = "insert into pass_span_info(s_id,pass_id,direction,span_no,pass_type_id) values (?,?,?,?,?)";
		try {
			while(rs.next()){
				String s_id = UUID.randomUUID().toString().replaceAll("-", "");
				String culvert_id = id;
				String direction = rs.getString("direction");
				String span_no = rs.getString("span_no");
				String brg_type_id = rs.getString("pass_type_id");
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
		String sql = "delete from pass_mbr_info where s_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = dataOperation.executeUpdate(sql, new String[]{s_id});
		if(i<0){
			dataOperation.close();
			return false;
		}
		sql = "select * from pass_mbr_info where s_id=(select s_id from pass_span_info where pass_id=? and direction=? and span_no=?)";
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
		sql = "insert into pass_mbr_info(r_id,s_id,member_type,member_no,member_desc,member_model) values(?,?,?,?,?,?)";
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
		
	
	public ArrayList<DicPassStructTypeDef> getDicPassStructTypeDef(){
		ArrayList<DicPassStructTypeDef> dicPassStructTypeDef = new ArrayList<DicPassStructTypeDef>();
		String sql = " SELECT * FROM dic_pass_struct_type_def WHERE 1=1 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{});
		try
		{
			while (rs.next())
			{
				DicPassStructTypeDef entity = new DicPassStructTypeDef();
				entity.setPass_type_id(rs.getString("pass_type_id"));
				entity.setPass_type_name(rs.getString("pass_type_name"));
				dicPassStructTypeDef.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return dicPassStructTypeDef;
	}
	
	public ArrayList<PassSpanInfo> getPassSpanInfoDirection(String pass_id){
		ArrayList<PassSpanInfo> passSpanInfo = new ArrayList<PassSpanInfo>();
		String sql = " SELECT DISTINCT direction FROM pass_span_info WHERE pass_id = ? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{pass_id});
		try
		{
			while (rs.next())
			{
				PassSpanInfo entity = new PassSpanInfo();
				entity.setDirection(rs.getString("direction"));
				passSpanInfo.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return passSpanInfo;
	}
	
	
	public String isCheckAudited(String pass_id,String prj_id){
		String audit_state = "";
		String sql = " SELECT * FROM chk_pass_regular WHERE prj_id=? AND pass_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id,pass_id});
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
