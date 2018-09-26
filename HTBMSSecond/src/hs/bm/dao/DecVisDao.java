package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.vo.Connect;

public class DecVisDao {
    
	private static DecVisDao checkSpanInfoDao;

	public static DecVisDao getInstance() {
		if (checkSpanInfoDao == null) {
			checkSpanInfoDao = new DecVisDao();
		}
		return checkSpanInfoDao;
	}
	
	
	public List<Connect> getConnect(String bridge_id){
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		String sql="SELECT * from brg_span_info where bridge_id=? and brg_type_id in('1', '2', '3', '4', '8', '9', '10') ORDER BY direction,span_no;";
		List<Connect> con=new ArrayList<Connect>();
		Connect up=new Connect();
		up.setType("direction");
		List<Connect> upcon=new ArrayList<Connect>();
		Connect down=new Connect();
		down.setType("direction");
		List<Connect> downcon=new ArrayList<Connect>();
		Connect none=new Connect();
		none.setType("direction");
		List<Connect> nonecon=new ArrayList<Connect>();
		up.setName("上行");
		down.setName("下行");
		none.setName("无");
		ResultSet rs=dataOperation.executeQuery(sql, new String[]{bridge_id});
		try {
			while (rs.next()) {
				Connect cn=new Connect();
				cn.setName(rs.getString("span_no"));
				cn.setType("span_no");
				cn.setBgco(rs.getString("brg_type_id"));
				if(rs.getString("direction").contains("上行")){
					upcon.add(cn);
				}else if (rs.getString("direction").contains("下行")) {
					downcon.add(cn);
				}else{
					nonecon.add(cn);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(upcon.size()>0){
			up.setChildren(upcon);
			con.add(up);
		}
		if(downcon.size()>0){
			down.setChildren(downcon);
			con.add(down);
		}
		if(nonecon.size()>0){
			none.setChildren(nonecon);
			con.add(none);
		}
		dataOperation.close();
		return con;
		
	}
	
	
	public Map<String, Integer> initSpanNum(String bridge_id){
		Map<String, Integer> map=new HashMap<String, Integer>();
		String sql ="select direction,count(span_no) as sn from brg_span_info where bridge_id=? group by direction";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id});
		try {
			while (rs.next()) {
				String direction=rs.getString("direction");
				int c=rs.getInt("sn");
				map.put(direction, c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return map;
	}
	
	public int getBeamNo(String bridge_id,String direction,String span_no){
		int i=0;
		String sql ="select count(DISTINCT substring_index(a.member_no,'#梁',1)) as lh from brg_mbr_info as a,brg_span_info as b where b.s_id=a.s_id and b.bridge_id=? and b.direction=? and b.span_no=? and member_no like '%#梁%'";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id,direction,span_no});
		try {
			while (rs.next()) {
				String lh=rs.getString("lh");
				i = Integer.parseInt(lh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return i;
	}
	

	
	

	
	public List<Map<String, String>> initProject(String bridge_id) {
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		String sql = "select a.prj_id,b.prj_desc from chk_brg_regular as a,chk_project_info as b where a.prj_id=b.prj_id and a.bridge_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id});
		try {
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("prj_id", rs.getString("prj_id"));
				map.put("prj_desc", rs.getString("prj_desc"));
				ll.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	public List<Map<String, String>> initProject2(String bridge_id,String orgid) {
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		String sql = "select a.prj_id,b.prj_desc from chk_brg_regular as a,chk_project_info as b where a.prj_id=b.prj_id and a.bridge_id=? and b.zone_id like ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id,orgid});
		try {
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("prj_id", rs.getString("prj_id"));
				map.put("prj_desc", rs.getString("prj_desc"));
				ll.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	
	public List<ChkBrgDefect> initTable(String prj_id,String bridge_id,String direction,String span_no){
		String defect_name="环向裂缝";
		 String sql = "SELECT a.*,e.* from chk_brg_defect as a,chk_brg_record as b,chk_span_record as c,"
		 		+ "chk_brg_regular as d,brg_mbr_info as e where d.chk_id=c.chk_id and c.span_chk_id=b.span_chk_id and "
		 		+ "b.mbr_chk_id=a.mbr_chk_id and d.prj_id=? and d.bridge_id=? and c.direction=? and "
		 		+ "c.span_no=? and a.defect_name_f like '%裂缝%' and (b.mbr_type like '%腹板%' or "
		 		+ "b.mbr_type like '%底板%' or b.mbr_type like '%翼板%') and a.mbr_no=e.r_id and a.defect_name !=?";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
			ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id,bridge_id,direction,span_no,defect_name});
			List<ChkBrgDefect> lb=new ArrayList<ChkBrgDefect>();
			try {
				while (rs.next()) {
					ChkBrgDefect dmd = new ChkBrgDefect();
					dmd.setDefect_serial(rs.getString("defect_serial"));
					dmd.setDefect_id(rs.getString("defect_id"));
					dmd.setMbr_chk_id(rs.getString("mbr_chk_id"));
					dmd.setMbr_no(rs.getString("member_no"));
					dmd.setDefect_name(rs.getString("defect_name"));
					dmd.setDefect_location_desc(rs.getString("defect_location_desc"));
					dmd.setDefect_count(rs.getString("defect_count"));
					dmd.setRepair_state(rs.getString("repair_state"));
					dmd.setDefect_attr(rs.getString("defect_attr"));
					dmd.setIs_uploaded(rs.getString("is_uploaded"));
					dmd.setDefect_location_desc_val(rs.getString("defect_location_desc_val"));
					dmd.setDefect_count_val(rs.getString("defect_count_val"));
					dmd.setChk_defect_memo(rs.getString("chk_defect_memo"));
					dmd.setDefect_name_f(rs.getString("defect_name_f"));
					lb.add(dmd);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dataOperation.close();
			return lb;
	 }
	
	public List<ChkBrgDefect> initTable2(String prj_id,String bridge_id,String direction,String span_no,String defectName){
		 String sql = "SELECT a.*,e.* from chk_brg_defect as a,chk_brg_record as b,chk_span_record as c,"
		 		+ "chk_brg_regular as d,brg_mbr_info as e where d.chk_id=c.chk_id and c.span_chk_id=b.span_chk_id and "
		 		+ "b.mbr_chk_id=a.mbr_chk_id and d.prj_id=? and d.bridge_id=? and c.direction=? and "
		 		+ "c.span_no=? and a.defect_name_f like '%裂缝%' and (b.mbr_type like '%腹板%' or "
		 		+ "b.mbr_type like '%底板%' or b.mbr_type like '%翼板%') and a.mbr_no=e.r_id and a.defect_name=?";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
			ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id,bridge_id,direction,span_no,defectName});
			List<ChkBrgDefect> lb=new ArrayList<ChkBrgDefect>();
			try {
				while (rs.next()) {
					ChkBrgDefect dmd = new ChkBrgDefect();
					dmd.setDefect_serial(rs.getString("defect_serial"));
					dmd.setDefect_id(rs.getString("defect_id"));
					dmd.setMbr_chk_id(rs.getString("mbr_chk_id"));
					dmd.setMbr_no(rs.getString("member_no"));
					dmd.setDefect_name(rs.getString("defect_name"));
					dmd.setDefect_location_desc(rs.getString("defect_location_desc"));
					dmd.setDefect_count(rs.getString("defect_count"));
					dmd.setRepair_state(rs.getString("repair_state"));
					dmd.setDefect_attr(rs.getString("defect_attr"));
					dmd.setIs_uploaded(rs.getString("is_uploaded"));
					dmd.setDefect_location_desc_val(rs.getString("defect_location_desc_val"));
					dmd.setDefect_count_val(rs.getString("defect_count_val"));
					dmd.setChk_defect_memo(rs.getString("chk_defect_memo"));
					dmd.setDefect_name_f(rs.getString("defect_name_f"));
					lb.add(dmd);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dataOperation.close();
			return lb;
	 }
	
	
	
	
	public static boolean isInteger(String input){  
        Matcher mer = Pattern.compile("^[+-]?[0-9]+$").matcher(input);  
        return mer.find();  
    }  
	
	
	
}
