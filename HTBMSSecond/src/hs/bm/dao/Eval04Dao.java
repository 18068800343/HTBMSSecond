package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import hs.bm.vo.Eval04VO;
import hs.bm.vo.IndexsetIndexVO;

public class Eval04Dao {
	
	private int i;
	
	
	private static Eval04Dao eval04Dao;
	 public static Eval04Dao getInstance(){
			if(eval04Dao==null){
				eval04Dao=new Eval04Dao();
			}
			return eval04Dao;
	 }
	/**
	 * 查询04评定所需要的数据
	 * @param obj
	 * @return
	 */
	public List<Eval04VO> queryEval04(Object[] obj){
		
		List<Eval04VO> ll=new ArrayList<Eval04VO>();
		String sql="select t3.*,cd.component_id "
				+ "from dic_brg_struct_component_def cd "
				+ "inner join (select t1.*,md.component7 "
				+ " from dic_brg_struct_member_def md "
				+ "inner join "
				+ "(select ee.ER_NO,ee.ER_STD ,ee.bridge_id,ee.prj_id,ee.audit_state,si.member_type "
				+ "FROM  eva_brg_rec ee "
				+ "inner join (select b1.bridge_id,b2.member_type from brg_span_info b1 inner join brg_mbr_info b2 on b1.bridge_id=? and b1.s_id=b2.s_id) si "
				+ "on  ee.prj_id=? and ee.bridge_id=? and ee.bridge_id=si.bridge_id and ee.ER_STD='2004' and ee.audit_state in (0,1,2) group by member_type) t1 "
				+ "on md.member_name=t1.member_type) t3 "
				+ "on cd.component_name=t3.component7 and cd.specification='2004评定' group by component7";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	ResultSet rs=mdo.executeQuery(sql, obj);
		try{
			while(rs.next()){
				if(!(rs.getString("component7")==null)){
				Eval04VO ev=new Eval04VO();
				ev.setState(rs.getString("audit_state"));
    			if(ev.getState().equals("0")){
    				ev.setState("<span class='label label-danger state'>未评定</span>");
    			}else if(ev.getState().equals("1")){
    				ev.setState("<span class='label label-success state'>已评定</span>");
    			}else if(ev.getState().equals("2")){
    				ev.setState("<span class='label label-success state'>已审核</span>");
    			}
				ev.setBridge_no(rs.getString("bridge_id"));
				ev.setComponent_name(rs.getString("component7"));
				ev.setComponent_id(rs.getString("component_id"));
				ev.setEr_no(rs.getString("Er_no"));
				ev.setPrj_no(rs.getString("prj_id"));
				ev.setEr_std(rs.getString("Er_std"));
				ev.setIiv(this.queryValue(ev));
				ev.setScore(i+"");
				ll.add(ev);
					
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			mdo.close();
		}
		
		
		return ll;
	}
	/**
	 * 查询04评定的分值
	 * @param ev
	 * @param mdo
	 * @return
	 */
	private List<IndexsetIndexVO> queryValue(Eval04VO ev){
		i=0;
		Connection conn=MyDataSource.getInstance().getConnection();
		MyDataOperation mdo=new MyDataOperation(conn,false);
		List<IndexsetIndexVO> ll=this.getEval04IndexSet();
			String sql="select cd.*,eu.* from (select component_id,component_name from  dic_brg_struct_component_def where specification='2004评定' and component_name=?) cd  left JOIN  eva_ubr_2004 eu on  eu.prj_id=? and eu.bridge_id=? and eu.dic_component_id=cd.component_id ";
			ResultSet rs=mdo.executeQuery(sql, new Object[]{ev.getComponent_name(),ev.getPrj_no(),ev.getBridge_no()});
			try{
			while(rs.next()){
				if(rs.getString("eva_ubr_grade1")==null){
					int i=0;
					String uuid=UUID.randomUUID().toString();
					i=this.insertValue(new Object[]{uuid,ev.getPrj_no(),ev.getBridge_no(),ev.getComponent_id(),0,0,0});
					if(i==-1){
						mdo.close();
						return null;
					}	
					
				}else{
					
					ll.get(0).setValue(rs.getInt("eva_ubr_grade1")>0?""+rs.getInt("eva_ubr_grade1"):""+rs.getInt("eva_ubr_grade1"));
					ll.get(1).setValue(rs.getInt("eva_ubr_grade2")>0?""+rs.getInt("eva_ubr_grade2"):""+rs.getInt("eva_ubr_grade2"));
					ll.get(2).setValue(rs.getInt("eva_ubr_grade3")>0?""+rs.getInt("eva_ubr_grade3"):""+rs.getInt("eva_ubr_grade3"));
				i=rs.getInt("eva_ubr_grade1")+rs.getInt("eva_ubr_grade2")+rs.getInt("eva_ubr_grade3");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			mdo.close();
		}
		
		return ll;
	}
	
	
	/**
	 * 插入指标所对应的值
	 * @param obj
	 * @return
	 */
	public int insertValue(Object[] obj){
		int i=0;
		String sql="insert into eva_ubr_2004(eva_ubr_code,prj_id,bridge_id,dic_component_id,eva_ubr_grade1,eva_ubr_grade2,eva_ubr_grade3) values(?,?,?,?,?,?,?)";
		i=this.excuteUpdate(sql, obj);
		return i;
	}
	
	/**
	 * 更改指标所对应的值
	 */
	public int updateValue(Object[] obj){
		int i=0;
		String sql="update eva_ubr_2004 set eva_ubr_grade1=?,eva_ubr_grade2=?,eva_ubr_grade3=? where prj_id=? and bridge_id=? and dic_component_id=?";
		i=this.excuteUpdate(sql, obj);
		return i;
	}
	
	/**
	 * 更改评定状态
	 * */
	public int updateEvaluationRec(Object[] obj){
		int i=0;
		String sql="update  eva_brg_rec set audit_state=?,ER_DATE=?,pdf=null where ER_NO=? and ER_STD=?";
		i=this.excuteUpdate(sql, obj);
		return i;
	}
	
	/**
	 * 04评定写死
	 */
	private List<IndexsetIndexVO>  getEval04IndexSet(){
		List<IndexsetIndexVO> l1=new ArrayList<IndexsetIndexVO>();
		
		IndexsetIndexVO v1=new IndexsetIndexVO();
		v1.setIndex_id("1");
		v1.setIndex_scale("0,+1,+2");
		v1.setIndex_name("缺损程度");
		v1.setValue("0");
		l1.add(v1);
		IndexsetIndexVO v2=new IndexsetIndexVO();
		v2.setIndex_id("2");
		v2.setIndex_scale("0,+1,+2");
		v2.setIndex_name("缺损对使用功能的影响程度");
		v2.setValue("0");
		l1.add(v2);
		IndexsetIndexVO v3=new IndexsetIndexVO();
		v3.setIndex_id("3");
		v3.setIndex_scale("-1,0,+1");
		v3.setIndex_name("缺损发展变化状况的修正");
		v3.setValue("0");
		l1.add(v3);
		return l1;
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
	public String getLevel(String prj_id, String id) {
		String sql = "select * from evaluationrec where bridge_no=? and prj_no=? and er_std='2004'";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ id, prj_id });
		String level = "";
		try {
			while(rs.next()){
				level = rs.getString("er_level")+"/"+rs.getString("er_grade");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return level;
	}
	
	public boolean checkPrjEvaCount(String id, String prj_id){
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "select * from eva_brg_rec where bridge_id=? and prj_id=?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ id, prj_id});
		boolean flag = false;
		int f1 = 0;
		int f2 = 0;
		try {
			while(rs.next()){
				int f =  rs.getInt("audit_state");
				String  std = rs.getString("er_std");
				if (std.equals("2004")) {
					f1 = f;
				}
				if(std.equals("2011")){
					f2 = f;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		
		if(f1!=0 && f2!=0){
			flag = true;
		}else{
			if(f2==0){
				flag = true;
			}
		}
		return flag;
	}
	
	public void changePrjEvaCount(String prj_id){
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "  update chk_project_info set struct_eva=struct_eva+1 WHERE prj_id = ? ";
		dataOperation.executeUpdate(sql, new String[]{ prj_id });
		dataOperation.close();
	}
	
	
	public Map<String, String> getScore(String prj_id, String bridge_id){
		Map<String, String> map = new HashMap<>();
		String sql = "select * from eva_brg_rec where prj_id=? and bridge_id=? and er_std='2004'";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id, bridge_id});
		try {
			while(rs.next()){
				map.put("score_clean", rs.getString("score_clean"));
				map.put("score_fix", rs.getString("score_fix"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return map;
	}
	public int setScore(String score_clean, String score_fix, String prj_id, String bridge_id){
		String sql = "update eva_brg_rec set score_clean=?,score_fix=? where prj_id=? and bridge_id=? and er_std='2004'";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{score_clean, score_fix, prj_id, bridge_id});
		dataOperation.close();
		return i;
	}
}
