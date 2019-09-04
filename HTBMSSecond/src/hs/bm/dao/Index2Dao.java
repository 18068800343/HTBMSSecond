
package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.vo.BridgeEvalVO;

public class Index2Dao {
	private static Index2Dao dao;
	public static Index2Dao getInstance(){
		if(dao==null){
			dao=new Index2Dao();
		}
		return dao;
	}

	public Map<String,List> getBrgDate(String highway_id,String manage_id,String section_id,String zone_id){
		Map<String, List> map = new HashMap<String, List>();
		List<Integer> list1=new ArrayList<>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql="SELECT COUNT(1) FROM brg_card_admin_id where bridge_mode =?";
		if(!highway_id.equals("%")){
			sql=sql+" and highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql=sql+" and manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql=sql+" and section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql=sql+" and zone_id='"+zone_id+"'";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { "特大桥" });
		ResultSet rs1 = dataOperation.executeQuery(sql, new String[] { "大桥" });
		ResultSet rs2 = dataOperation.executeQuery(sql, new String[] { "中桥" });
		ResultSet rs3 = dataOperation.executeQuery(sql, new String[] { "小桥" });

		try {
			while(rs.next()){
				int veryBigBrg=rs.getInt(1);
				list1.add(veryBigBrg);
			}
			while(rs1.next()){
				int BigBrg=rs1.getInt(1);
				list1.add(BigBrg);
			}
			while(rs2.next()){
				int mediumBrg=rs2.getInt(1);
				list1.add(mediumBrg);
			}
			while(rs3.next()){
				int smallBrg=rs3.getInt(1);
				list1.add(smallBrg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list1!=null){
			map.put("brg1", list1);
		}
		
		
		List<Integer> list2=new ArrayList<>();
		String sql4="SELECT COUNT(1) FROM brg_card_admin_id where function_type=?";
		String sql7="SELECT COUNT(1) FROM brg_card_admin_id where function_type NOT in(?,?,?)";
		if(!highway_id.equals("%")){
			sql4=sql4+" and highway_id='"+highway_id+"'";
			sql7=sql7+" and highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql4=sql4+" and manage_id='"+manage_id+"'";
			sql7=sql7+" and manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql4=sql4+" and section_id='"+section_id+"'";
			sql7=sql7+" and section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql4=sql4+" and zone_id='"+zone_id+"'";
			sql7=sql7+" and zone_id='"+zone_id+"'";
		}
		ResultSet rs4 = dataOperation.executeQuery(sql4, new String[] { "主线桥" });
		ResultSet rs5 = dataOperation.executeQuery(sql4, new String[] { "匝道桥" });
		ResultSet rs6 = dataOperation.executeQuery(sql4, new String[] { "支线上跨桥" });
		ResultSet rs7 = dataOperation.executeQuery(sql7, new String[] { "主线桥","匝道桥","支线上跨桥" });
		
		try {
			while(rs4.next()){
				int mainBridge=rs4.getInt(1);
				list2.add(mainBridge);
			}
			while(rs5.next()){
				int rampBridge=rs5.getInt(1);
				list2.add(rampBridge);
			}
			while(rs6.next()){
				int overpassBridge=rs6.getInt(1);
				list2.add(overpassBridge);
			}
			while(rs7.next()){
				int otherBridge=rs7.getInt(1);
				list2.add(otherBridge);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list2!=null){
			map.put("brg2", list2);
		}
		
		
		List<Integer> list3=new ArrayList<>();
		String sql8="SELECT	COUNT(1) FROM brg_card_top_struct a,brg_card_admin_id b WHERE a.top_struct_type LIKE ? and a.bridge_id=b.bridge_id";
		if(!highway_id.equals("%")){
			sql8=sql8+" and b.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql8=sql8+" and b.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql8=sql8+" and b.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql8=sql8+" and b.zone_id='"+zone_id+"'";
		}
		
		ResultSet rs8 = dataOperation.executeQuery(sql8, new String[] { "%组合%" });
		ResultSet rs9 = dataOperation.executeQuery(sql8, new String[] { "%空心板%" });
		ResultSet rs10 = dataOperation.executeQuery(sql8, new String[] { "%连续%" });
		ResultSet rs11 = dataOperation.executeQuery(sql8, new String[] { "%T%" });
		
		try {
			while(rs8.next()){
				int boxBridge=rs8.getInt(1);
				list3.add(boxBridge);
			}
			while(rs9.next()){
				int hollowBridge=rs9.getInt(1);
				list3.add(hollowBridge);
			}
			while(rs10.next()){
				int continuousBridge=rs10.getInt(1);
				list3.add(continuousBridge);
			}
			while(rs11.next()){
				int TBridge=rs11.getInt(1);
				list3.add(TBridge);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list3!=null){
			map.put("brg3", list3);
		}
		dataOperation.close();
		return map;
	}
	
	public Map<String,List> getEvaDate(String highway_id,String manage_id,String section_id,String zone_id){
		Map<String,List> map=new HashMap<>();
		List<Integer> list1=new ArrayList<>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql="SELECT	COUNT(1) FROM	evaluationrec a ,brg_card_top_struct b ,brg_card_admin_id c WHERE	a.bridge_no = b.bridge_id AND b.bridge_id=c.bridge_id and b.top_struct_type like '%空心板%' and a.ER_LEVEL=?";
		if(!highway_id.equals("%")){
			sql=sql+" and c.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql=sql+" and c.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql=sql+" and c.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql=sql+" and c.zone_id='"+zone_id+"'";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{"1类"});
		ResultSet rs1 = dataOperation.executeQuery(sql, new String[]{"2类"});
		ResultSet rs2 = dataOperation.executeQuery(sql, new String[]{"3类"});
		
		try {
			while(rs.next()){
				int hollow1=rs.getInt(1);
				list1.add(hollow1);
			}
			while(rs1.next()){
				int hollow2=rs1.getInt(1);
				list1.add(hollow2);
			}
			while(rs2.next()){
				int hollow3=rs2.getInt(1);
				list1.add(hollow3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list1!=null){
			map.put("eva1", list1);
		}
		
		List<Integer> list2=new ArrayList<>();
		String sql3="SELECT	COUNT(1) FROM	evaluationrec a ,brg_card_top_struct b ,brg_card_admin_id c WHERE	a.bridge_no = b.bridge_id AND b.bridge_id=c.bridge_id and b.top_struct_type like '%组合%' and a.ER_LEVEL=?";
		if(!highway_id.equals("%")){
			sql3=sql3+" and c.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql3=sql3+" and c.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql3=sql3+" and c.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql3=sql3+" and c.zone_id='"+zone_id+"'";
		}
		ResultSet rs3 = dataOperation.executeQuery(sql3,new String[]{"1类"});
		ResultSet rs4 = dataOperation.executeQuery(sql3,new String[]{"2类"});
		ResultSet rs5 = dataOperation.executeQuery(sql3,new String[]{"3类"});
		
		try {
			while(rs3.next()){
				int group1=rs3.getInt(1);
				list2.add(group1);
			}
			while(rs4.next()){
				int group2=rs4.getInt(1);
				list2.add(group2);
			}
			while(rs5.next()){
				int group3=rs5.getInt(1);
				list2.add(group3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list2!=null){
			map.put("eva2", list2);
		}
		
		
		List<Integer> list3=new ArrayList<>();
		String sql6="SELECT	COUNT(1) FROM	evaluationrec a ,brg_card_top_struct b ,brg_card_admin_id c WHERE	a.bridge_no = b.bridge_id AND b.bridge_id=c.bridge_id and b.top_struct_type like '%连续%' and a.ER_LEVEL=?";
		if(!highway_id.equals("%")){
			sql6=sql6+" and c.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql6=sql6+" and c.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql6=sql6+" and c.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql6=sql6+" and c.zone_id='"+zone_id+"'";
		}
		ResultSet rs6 = dataOperation.executeQuery(sql6,new String[]{"1类"});
		ResultSet rs7 = dataOperation.executeQuery(sql6,new String[]{"2类"});
		ResultSet rs8 = dataOperation.executeQuery(sql6,new String[]{"3类"});
		
		try {
			while(rs6.next()){
				int continuous1=rs6.getInt(1);
				list3.add(continuous1);
			}
			while(rs7.next()){
				int continuous2=rs7.getInt(1);
				list3.add(continuous2);
			}
			while(rs8.next()){
				int continuous3=rs8.getInt(1);
				list3.add(continuous3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list3!=null){
			map.put("eva3", list3);
		}
		
		
		List<Integer> list4=new ArrayList<>();
		String sql9="SELECT	COUNT(1) FROM	evaluationrec a ,brg_card_top_struct b ,brg_card_admin_id c WHERE	a.bridge_no = b.bridge_id AND b.bridge_id=c.bridge_id and b.top_struct_type like '%T%' and a.ER_LEVEL=?";
		if(!highway_id.equals("%")){
			sql9=sql9+" and c.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql9=sql9+" and c.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql9=sql9+" and c.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql9=sql9+" and c.zone_id='"+zone_id+"'";
		}
		ResultSet rs9 = dataOperation.executeQuery(sql9,new String[]{"1类"});
		ResultSet rs10 = dataOperation.executeQuery(sql9,new String[]{"2类"});
		ResultSet rs11 = dataOperation.executeQuery(sql9,new String[]{"3类"});
		
		try {
			while(rs9.next()){
				int T1=rs9.getInt(1);
				list4.add(T1);
			}
			while(rs10.next()){
				int T2=rs10.getInt(1);
				list4.add(T2);
			}
			while(rs11.next()){
				int T3=rs11.getInt(1);
				list4.add(T3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list4!=null){
			map.put("eva4", list4);
		}
		dataOperation.close();
		return map;
	}
	
	public Map<String,List<Integer>> getDiseaseCount(String bridgeType,String componentType,String disease,String diseaseType,String highway_id,String manage_id,String section_id,String zone_id){
		Map<String,List<Integer>>map=new HashMap<>();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
		int year=Integer.valueOf(sdf.format(new Date()));
		List<Integer> list=new ArrayList<>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql="select COUNT(1) from chk_brg_defect where mbr_chk_id in(select a.mbr_chk_id from chk_brg_record a,chk_span_record b,brg_card_admin_id c where a.span_chk_id=b.span_chk_id  and a.bridge_id=c.bridge_id and b.chk_time like ? ";
				if(!highway_id.equals("%")){
					sql=sql+" and c.highway_id='"+highway_id+"'";
				}
				if(!manage_id.equals("%")){
					sql=sql+" and c.manage_id='"+manage_id+"'";
				}
				if(!section_id.equals("%")){
					sql=sql+" and c.section_id='"+section_id+"'";
				}
				if(!zone_id.equals("%")){
					sql=sql+" and c.zone_id='"+zone_id+"'";
				}
		
				if(!bridgeType.equals("%")){
					sql=sql+" and b.span_top_struct='"+bridgeType+"')";
				}else{
					sql=sql+")";
				}
				if(!componentType.equals("%")){
					sql=sql+" and mbr_no in(select r_id from brg_mbr_info where member_type='"+componentType+"')";
				}
				if(!disease.equals("%")){
					sql=sql+" and defect_name_f='"+disease+"'";
				}
				if(!diseaseType.equals("%")){
					sql=sql+" and defect_name='"+diseaseType+"'";
				}
		ResultSet rs = dataOperation.executeQuery(sql,new Object[]{year-2+"%"});
		try {
			while(rs.next()){
				int count1=rs.getInt(1);
				list.add(count1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		String sql1="select COUNT(1) from chk_brg_defect where mbr_chk_id in(select a.mbr_chk_id from chk_brg_record a,chk_span_record b,brg_card_admin_id c where a.span_chk_id=b.span_chk_id  and a.bridge_id=c.bridge_id and b.chk_time like ? ";
				if(!highway_id.equals("%")){
					sql1=sql1+" and c.highway_id='"+highway_id+"'";
				}
				if(!manage_id.equals("%")){
					sql1=sql1+" and c.manage_id='"+manage_id+"'";
				}
				if(!section_id.equals("%")){
					sql1=sql1+" and c.section_id='"+section_id+"'";
				}
				if(!zone_id.equals("%")){
					sql1=sql1+" and c.zone_id='"+zone_id+"'";
				}
		
				if(!bridgeType.equals("%")){
					sql1=sql1+" and b.span_top_struct='"+bridgeType+"')";
				}else{
					sql1=sql1+")";
				}
				if(!componentType.equals("%")){
					sql1=sql1+" and mbr_no in(select r_id from brg_mbr_info where member_type='"+componentType+"')";
				}
				if(!disease.equals("%")){
					sql1=sql1+" and defect_name_f='"+disease+"'";
				}
				if(!diseaseType.equals("%")){
					sql1=sql1+" and defect_name='"+diseaseType+"'";
				}
		ResultSet rs1 = dataOperation.executeQuery(sql1,new Object[]{year-1+"%"});
		try {
			while(rs1.next()){
				int count2=rs1.getInt(1);
				list.add(count2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		String sql2="select COUNT(1) from chk_brg_defect where mbr_chk_id in(select a.mbr_chk_id from chk_brg_record a,chk_span_record b,brg_card_admin_id c where a.span_chk_id=b.span_chk_id  and a.bridge_id=c.bridge_id and b.chk_time like ? ";
				if(!highway_id.equals("%")){
					sql2=sql2+" and c.highway_id='"+highway_id+"'";
				}
				if(!manage_id.equals("%")){
					sql2=sql2+" and c.manage_id='"+manage_id+"'";
				}
				if(!section_id.equals("%")){
					sql2=sql2+" and c.section_id='"+section_id+"'";
				}
				if(!zone_id.equals("%")){
					sql2=sql2+" and c.zone_id='"+zone_id+"'";
				}
		
				if(!bridgeType.equals("%")){
					sql2=sql2+" and b.span_top_struct='"+bridgeType+"')";
				}else{
					sql2=sql2+")";
				}
				if(!componentType.equals("%")){
					sql2=sql2+" and mbr_no in(select r_id from brg_mbr_info where member_type='"+componentType+"')";
				}
				if(!disease.equals("%")){
					sql2=sql2+" and defect_name_f='"+disease+"'";
				}
				if(!diseaseType.equals("%")){
					sql2=sql2+" and defect_name='"+diseaseType+"'";
				}
		ResultSet rs2 = dataOperation.executeQuery(sql2,new Object[]{year+"%"});
		try {
			while(rs2.next()){
				int count3=rs2.getInt(1);
				list.add(count3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		map.put("num", list);
		List<Integer>list2=new ArrayList<>();
		list2.add(year-2);
		list2.add(year-1);
		list2.add(year);
		map.put("year", list2);
		dataOperation.close();	
		return map;
	}
	
	public Map<String,List> getEvaOf0411(String highway_id,String manage_id,String section_id,String zone_id){
		Map<String,List> map=new HashMap<>();
		List<Integer> list1=new ArrayList<>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql="SELECT	COUNT(1) FROM	evaluationrec a,brg_card_admin_id b WHERE a.bridge_no=b.bridge_id and ER_DATE like '2015%' and ER_LEVEL=? and ER_STD='2004'";
		if(!highway_id.equals("%")){
			sql=sql+" and b.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql=sql+" and b.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql=sql+" and b.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql=sql+" and b.zone_id='"+zone_id+"'";
		}
		
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{"1类"});
		ResultSet rs1 = dataOperation.executeQuery(sql, new String[]{"2类"});
		ResultSet rs2 = dataOperation.executeQuery(sql, new String[]{"3类"});
		
		try {
			while(rs.next()){
				int hollow1=rs.getInt(1);
				list1.add(hollow1);
			}
			while(rs1.next()){
				int hollow2=rs1.getInt(1);
				list1.add(hollow2);
			}
			while(rs2.next()){
				int hollow3=rs2.getInt(1);
				list1.add(hollow3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list1!=null){
			map.put("evaType1", list1);
		}
		
		List<Integer> list2=new ArrayList<>();
		String sql3="SELECT	COUNT(1) FROM	evaluationrec a,brg_card_admin_id b WHERE a.bridge_no=b.bridge_id and ER_DATE like '2016%' and ER_LEVEL=? and ER_STD='2004'";
		if(!highway_id.equals("%")){
			sql3=sql3+" and b.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql3=sql3+" and b.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql3=sql3+" and b.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql3=sql3+" and b.zone_id='"+zone_id+"'";
		}
		
		ResultSet rs3 = dataOperation.executeQuery(sql3, new String[]{"1类"});
		ResultSet rs4 = dataOperation.executeQuery(sql3, new String[]{"2类"});
		ResultSet rs5 = dataOperation.executeQuery(sql3, new String[]{"3类"});
		
		try {
			while(rs3.next()){
				int group1=rs3.getInt(1);
				list2.add(group1);
			}
			while(rs4.next()){
				int group2=rs4.getInt(1);
				list2.add(group2);
			}
			while(rs5.next()){
				int group3=rs5.getInt(1);
				list2.add(group3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list2!=null){
			map.put("evaType2", list2);
		}
		
		
		List<Integer> list3=new ArrayList<>();
		String sql6="SELECT	COUNT(1) FROM	evaluationrec a,brg_card_admin_id b WHERE a.bridge_no=b.bridge_id and ER_DATE like '2017%' and ER_LEVEL=? and ER_STD='2004'";
		if(!highway_id.equals("%")){
			sql6=sql6+" and b.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql6=sql6+" and b.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql6=sql6+" and b.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql6=sql6+" and b.zone_id='"+zone_id+"'";
		}
		
		ResultSet rs6 = dataOperation.executeQuery(sql6, new String[]{"1类"});
		ResultSet rs7 = dataOperation.executeQuery(sql6, new String[]{"2类"});
		ResultSet rs8 = dataOperation.executeQuery(sql6, new String[]{"3类"});
		
		try {
			while(rs6.next()){
				int continuous1=rs6.getInt(1);
				list3.add(continuous1);
			}
			while(rs7.next()){
				int continuous2=rs7.getInt(1);
				list3.add(continuous2);
			}
			while(rs8.next()){
				int continuous3=rs8.getInt(1);
				list3.add(continuous3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list3!=null){
			map.put("evaType3", list3);
		}
		
		List<Integer> list4=new ArrayList<>();
		String sql9="SELECT	COUNT(1) FROM	evaluationrec a,brg_card_admin_id b WHERE a.bridge_no=b.bridge_id and ER_DATE like '2015%' and ER_LEVEL=? and ER_STD='2011'";
		if(!highway_id.equals("%")){
			sql9=sql9+" and b.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql9=sql9+" and b.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql9=sql9+" and b.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql9=sql9+" and b.zone_id='"+zone_id+"'";
		}
		
		ResultSet rs9 = dataOperation.executeQuery(sql9, new String[]{"1类"});
		ResultSet rs10 = dataOperation.executeQuery(sql9, new String[]{"2类"});
		ResultSet rs11 = dataOperation.executeQuery(sql9, new String[]{"3类"});
		
		try {
			while(rs9.next()){
				int continuous1=rs9.getInt(1);
				list4.add(continuous1);
			}
			while(rs10.next()){
				int continuous2=rs10.getInt(1);
				list4.add(continuous2);
			}
			while(rs11.next()){
				int continuous3=rs11.getInt(1);
				list4.add(continuous3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list4!=null){
			map.put("evaType4", list4);
		}
		
		List<Integer> list5=new ArrayList<>();
		String sql12="SELECT	COUNT(1) FROM	evaluationrec a,brg_card_admin_id b WHERE a.bridge_no=b.bridge_id and ER_DATE like '2016%' and ER_LEVEL=? and ER_STD='2011'";
		if(!highway_id.equals("%")){
			sql12=sql12+" and b.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql12=sql12+" and b.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql12=sql12+" and b.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql12=sql12+" and b.zone_id='"+zone_id+"'";
		}
		
		ResultSet rs12 = dataOperation.executeQuery(sql12, new String[]{"1类"});
		ResultSet rs13 = dataOperation.executeQuery(sql12, new String[]{"2类"});
		ResultSet rs14 = dataOperation.executeQuery(sql12, new String[]{"3类"});
		
		try {
			while(rs12.next()){
				int continuous1=rs12.getInt(1);
				list5.add(continuous1);
			}
			while(rs13.next()){
				int continuous2=rs13.getInt(1);
				list5.add(continuous2);
			}
			while(rs14.next()){
				int continuous3=rs14.getInt(1);
				list5.add(continuous3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list3!=null){
			map.put("evaType5", list5);
		}
		
		List<Integer> list6=new ArrayList<>();
		String sql15="SELECT	COUNT(1) FROM	evaluationrec a,brg_card_admin_id b WHERE a.bridge_no=b.bridge_id and ER_DATE like '2017%' and ER_LEVEL=? and ER_STD='2011'";
		if(!highway_id.equals("%")){
			sql15=sql15+" and b.highway_id='"+highway_id+"'";
		}
		if(!manage_id.equals("%")){
			sql15=sql15+" and b.manage_id='"+manage_id+"'";
		}
		if(!section_id.equals("%")){
			sql15=sql15+" and b.section_id='"+section_id+"'";
		}
		if(!zone_id.equals("%")){
			sql15=sql15+" and b.zone_id='"+zone_id+"'";
		}
		ResultSet rs15 = dataOperation.executeQuery(sql15, new String[]{"1类"});
		ResultSet rs16 = dataOperation.executeQuery(sql15, new String[]{"2类"});
		ResultSet rs17 = dataOperation.executeQuery(sql15, new String[]{"3类"});
		
		try {
			while(rs15.next()){
				int continuous1=rs15.getInt(1);
				list6.add(continuous1);
			}
			while(rs16.next()){
				int continuous2=rs16.getInt(1);
				list6.add(continuous2);
			}
			while(rs17.next()){
				int continuous3=rs17.getInt(1);
				list6.add(continuous3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list6!=null){
			map.put("evaType6", list6);
		}
		dataOperation.close();
		return map;
	}
	
	
	public List<BrgCardAdminId> initIndexBrg_old(String prj_id, String highway_id, String manage_id, String section_id,
			String zone_id,String eva_type) {
		List<BrgCardAdminId> lb = new ArrayList<>();
		String sql="";
		String[] sa = null;
		if(eva_type.equals("%")){
			sa = new String[] { highway_id, manage_id, section_id, zone_id};
			sql = "select * from brg_card_admin_id where highway_id like ? and manage_id like ? and section_id like ? and zone_id like ? and longitude!='' and longitude is not null";
		}
		if(eva_type.equals("2004")){
			sa = new String[] { highway_id, manage_id, section_id, zone_id};
			sql = "select * from brg_card_admin_id where highway_id like ? and manage_id like ? and section_id like ? and zone_id like ? and longitude!='' and longitude is not null and bridge_id IN (SELECT b.bridge_id FROM chk_project_info a, eva_ubr_2004 b WHERE	a.prj_id = b.prj_id	GROUP BY a.prj_id)";
		}
		if(eva_type.equals("2011")){
			sa = new String[] { highway_id, manage_id, section_id, zone_id};
			sql = "select * from brg_card_admin_id where highway_id like ? and manage_id like ? and section_id like ? and zone_id like ? and longitude!='' and longitude is not null and bridge_id IN (SELECT b.bridge_id FROM chk_project_info a, eva_mbr b WHERE	a.prj_id = b.prj_id	GROUP BY a.prj_id)";
		}
		
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
	
	//2019.09.04增加首页地图桥检评价显示速度的修改，原代码在上面
	public List<BrgCardAdminId> initIndexBrg(String prj_id, String highway_id, String manage_id, String section_id,
			String zone_id,String eva_type) {
		List<BrgCardAdminId> lb = new ArrayList<>();
		String sql="";
		String[] sa = null;
		if(eva_type.equals("%")){
			sa = new String[] { highway_id, manage_id, section_id, zone_id};
			sql = "select aa.bridge_id,aa.bridge_name,aa.bridge_no,aa.highway_id,aa.longitude,aa.latitude,aa.manage_id,aa.section_id,aa.zone_id," + 
					"		bb.prj_id,bb.prj_desc,bb.ER_GRADE,bb.ER_LEVEL,bb.ER_STD,bb.ER_DATE" + 
					"	from brg_card_admin_id as aa" + 
					"	left join (SELECT a.prj_desc,b.* " + 
					"			from chk_project_info as a ," + 
					"				(SELECT DISTINCT bridge_id,prj_id,ER_STD,ER_LEVEL," + 
					"				ER_GRADE,ER_DATE " + 
					"				from chk_brg_regular " + 
					"				full join evaluationrec" + 
					"				on bridge_id=bridge_no and prj_id=prj_no) " + 
					"				as b where b.prj_id=a.prj_id) as bb on aa.bridge_id=bb.bridge_id" + 
					"	where aa.highway_id like ? and aa.manage_id like ? and aa.section_id like ? and aa.zone_id like ? and aa.longitude!='' and aa.longitude is not null";
		}else if(eva_type.equals("2004")){
			sa = new String[] { highway_id, manage_id, section_id, zone_id};
			sql = "select aa.bridge_id,aa.bridge_name,aa.bridge_no,aa.highway_id,aa.longitude,aa.latitude,aa.manage_id,aa.section_id,aa.zone_id," + 
					"		bb.prj_id,bb.prj_desc,bb.ER_GRADE,bb.ER_LEVEL,bb.ER_STD,bb.ER_DATE" + 
					"	from brg_card_admin_id as aa" + 
					"	left join (SELECT a.prj_desc,b.* " + 
					"			from chk_project_info as a ," + 
					"				(SELECT DISTINCT bridge_id,prj_id,ER_STD,ER_LEVEL," + 
					"				ER_GRADE,ER_DATE " + 
					"				from chk_brg_regular " + 
					"				full join evaluationrec" + 
					"				on bridge_id=bridge_no and prj_id=prj_no) " + 
					"				as b where b.prj_id=a.prj_id) as bb on aa.bridge_id=bb.bridge_id" + 
					"	where aa.highway_id like ? and aa.manage_id like ? and aa.section_id like ? and aa.zone_id like ? and aa.longitude!='' and aa.longitude is not null " + 
					"	and aa.bridge_id in (SELECT b.bridge_id FROM chk_project_info a, eva_ubr_2004 b where a.prj_id=b.prj_id GROUP BY a.prj_id)";
					  
		}else if(eva_type.equals("2011")){
			sa = new String[] { highway_id, manage_id, section_id, zone_id};
			sql = "select aa.bridge_id,aa.bridge_name,aa.bridge_no,aa.highway_id,aa.longitude,aa.latitude,aa.manage_id,aa.section_id,aa.zone_id," + 
					"		bb.prj_id,bb.prj_desc,bb.ER_GRADE,bb.ER_LEVEL,bb.ER_STD,bb.ER_DATE" + 
					"	from brg_card_admin_id as aa" + 
					"	left join (SELECT a.prj_desc,b.* " + 
					"			from chk_project_info as a ," + 
					"				(SELECT DISTINCT bridge_id,prj_id,ER_STD,ER_LEVEL," + 
					"				ER_GRADE,ER_DATE " + 
					"				from chk_brg_regular " + 
					"				full join evaluationrec" + 
					"				on bridge_id=bridge_no and prj_id=prj_no) " + 
					"				as b where b.prj_id=a.prj_id) as bb on aa.bridge_id=bb.bridge_id" + 
					"	where aa.highway_id like ? and aa.manage_id like ? and aa.section_id like ? and aa.zone_id like ? and aa.longitude!='' and aa.longitude is not null " + 
					"	and aa.bridge_id in (SELECT b.bridge_id FROM chk_project_info a, eva_mbr b WHERE a.prj_id=b.prj_id GROUP BY a.prj_id)";				
		}
		
		
		if (!prj_id.equals("%")) {
			sql = "select aa.bridge_id,aa.bridge_name,aa.bridge_no,aa.highway_id,aa.longitude,aa.latitude,aa.manage_id,aa.section_id,aa.zone_id," + 
					"		bb.prj_id,bb.prj_desc,bb.ER_GRADE,bb.ER_LEVEL,bb.ER_STD,bb.ER_DATE" + 
					"	from brg_card_admin_id as aa" + 
					"	left join (SELECT a.prj_desc,b.* " + 
					"			from chk_project_info as a ," + 
					"				(SELECT DISTINCT bridge_id,prj_id,ER_STD,ER_LEVEL," + 
					"				ER_GRADE,ER_DATE " + 
					"				from chk_brg_regular " + 
					"				full join evaluationrec" + 
					"				on bridge_id=bridge_no and prj_id=prj_no) " + 
					"				as b where b.prj_id=a.prj_id) as bb on aa.bridge_id=bb.bridge_id" + 
					"	where aa.highway_id like ? and aa.manage_id like ? and aa.section_id like ? and aa.zone_id like ? " + 
					"	and aa.bridge_id in (select bridge_id from chk_brg_regular where prj_id like ?) and aa.longitude!='' and aa.longitude is not null";
			sa = new String[] { highway_id, manage_id, section_id, zone_id, prj_id };
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, sa);
		try {
			BrgCardAdminId last_BrgCardAdminId = null;
			String last_Bridge_id = "";
			String current_Bridge_id = "";
			while (rs.next()) {
				if(null!=last_BrgCardAdminId)  last_Bridge_id=last_BrgCardAdminId.getBridge_id();
				current_Bridge_id = rs.getString("bridge_id");
				if(!current_Bridge_id.equals(last_Bridge_id)) {
					BrgCardAdminId bca = new BrgCardAdminId();
					if(null!=last_BrgCardAdminId) 
					{
						lb.add(last_BrgCardAdminId);
					}
					last_BrgCardAdminId = bca;
					bca.setBridge_id(rs.getString("bridge_id"));
					bca.setBridge_name(rs.getString("bridge_name"));
					bca.setBridge_no(rs.getString("bridge_no"));
					bca.setHighway_id(rs.getString("highway_id"));
					bca.setLongitude(rs.getString("longitude"));
					bca.setLatitude(rs.getString("latitude"));
					bca.setManage_id(rs.getString("manage_id"));
					bca.setSection_id(rs.getString("section_id"));
					bca.setZone_id(rs.getString("zone_id"));
					
					List<BridgeEvalVO> bevList = new ArrayList<>();
					if(null!=rs.getString("prj_id")) {
						BridgeEvalVO bev = new BridgeEvalVO();
						bev.setPrj_id(rs.getString("prj_id"));
						bev.setPrj_name(rs.getString("prj_desc"));
						bev.setER_GRADE(rs.getString("ER_GRADE"));
						bev.setER_LEVEL(rs.getString("ER_LEVEL"));
						bev.setER_STD(rs.getString("ER_STD"));
						bev.setER_DATE(rs.getString("ER_DATE"));
						bevList.add(bev);
					}
					bca.setBridgeEvalVOList(bevList);
					
				}else {
					BridgeEvalVO bev = new BridgeEvalVO();
					bev.setPrj_id(rs.getString("prj_id"));
					bev.setPrj_name(rs.getString("prj_desc"));
					bev.setER_GRADE(rs.getString("ER_GRADE"));
					bev.setER_LEVEL(rs.getString("ER_LEVEL"));
					bev.setER_STD(rs.getString("ER_STD"));
					bev.setER_DATE(rs.getString("ER_DATE"));
					last_BrgCardAdminId.getBridgeEvalVOList().add(bev);
				}
		
			}
			if(null!=last_BrgCardAdminId) 
			{
				lb.add(last_BrgCardAdminId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dataOperation.close();
		}
		return lb;
	}
	
	public List<Map<String, String>> getProject1(String norm,String manage_id) {
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		String sql=null;
		if(manage_id.equals("%")){
			if(norm.equals("%")){
				sql = "select * from chk_project_info ORDER BY prj_establish_tm DESC";
			}else if(norm.equals("2011")){
				sql="select a.prj_id,a.prj_desc,a.chk_type,a.maintain_org,a.zone_id from chk_project_info a,eva_mbr b where a.prj_id=b.prj_id GROUP BY a.prj_id ORDER BY a.prj_establish_tm DESC";
			}else{
				sql="select a.* from chk_project_info a,eva_ubr_2004 b where a.prj_id=b.prj_id GROUP BY a.prj_id ORDER BY a.prj_establish_tm DESC";
			}		
		}else{
			String zone_id=manage_id.substring(0,4)+"%";
			if(norm.equals("%")){
				sql = "select prj_id, prj_desc, chk_type,zone_id from chk_project_info where zone_id like '"+zone_id+"' ORDER BY prj_establish_tm DESC";	
			}else if(norm.equals("2011")){
				sql = "select a.prj_id, a.prj_desc, a.chk_type,a.zone_id from chk_project_info a,eva_mbr b where a.prj_id=b.prj_id and a.zone_id like '"+zone_id+"' GROUP BY a.prj_id ORDER BY a.prj_establish_tm DESC";
			}else{
				sql = "select a.prj_id, a.prj_desc, a.chk_type,a.zone_id from chk_project_info a,eva_ubr_2004 b where a.prj_id=b.prj_id and a.zone_id like '"+zone_id+"' GROUP BY a.prj_id ORDER BY a.prj_establish_tm DESC";
			}
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

	
	public List<Map<String, String>> getProject2(String norm,String zone) {
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
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {zone});
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
}
