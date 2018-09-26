package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicMemberCondition;
import hs.bm.bean.DicMemberStandard;
import hs.bm.vo.ManageSectionBridge;

public class MemberStandardDao {
	public static boolean flag=false;
	private static MemberStandardDao memberStandardDao;
	public static MemberStandardDao getInstance(){
		if(memberStandardDao==null){
			memberStandardDao=new MemberStandardDao();
		}
		return memberStandardDao;
	}
    
    
    
    public List<DicMemberCondition> initTree(){
    	List<DicMemberCondition> lc=new ArrayList<DicMemberCondition>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="select * from dic_member_condition order by bridge_type,condition_style,condition_norm,location";
    	ResultSet rs=mdo.executeQuery(sql,null);
    	try {
			while (rs.next()) {
				DicMemberCondition dmc=new DicMemberCondition();
				dmc.setBridge_type(rs.getString("bridge_type"));
				dmc.setCondition_id(rs.getString("condition_id"));
				dmc.setCondition_norm(rs.getString("condition_norm"));
				dmc.setCondition_style(rs.getString("condition_style"));
				dmc.setLocation(rs.getString("location"));
				lc.add(dmc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	return lc;
    }
    
    
    
   
    public List<DicMemberStandard> initTable(String condition_id){
    	List<DicMemberStandard> lc=new ArrayList<DicMemberStandard>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="select * from dic_member_standard where condition_id=?";
    	ResultSet rs=mdo.executeQuery(sql,new String[]{condition_id});
    	try {
			while (rs.next()) {
				DicMemberStandard dmc=new DicMemberStandard();
				dmc.setCondition_id(rs.getString("condition_id"));
				dmc.setMember_model(rs.getString("member_model"));
				dmc.setMember_name(rs.getString("member_name"));
				dmc.setMember_type(rs.getString("member_type"));
				dmc.setStandard_id(rs.getString("standard_id"));
				lc.add(dmc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	return lc;
    }
    public int editStandard(DicMemberStandard dms){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="update dic_member_standard set member_type=?,member_name=?,member_model=? where standard_id=?";
    	int i=mdo.executeUpdate(sql, new String[]{dms.getMember_type(),dms.getMember_name(),dms.getMember_model(),dms.getStandard_id()});
    	mdo.close();
    	return i;
    }
    public int delStandard(String id){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="delete from dic_member_standard where standard_id=?";
    	int i=mdo.executeUpdate(sql, new Object[]{id});
    	mdo.close();
    	return i;
    }
    public int delCondition(String id){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="delete from dic_member_condition where condition_id=?";
    	int i=mdo.executeUpdate(sql, new Object[]{id});
    	mdo.close();
    	return i;
    }

    public int delCondition1(String id){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="delete from dic_member_standard where condition_id=?";
    	int i=mdo.executeUpdate(sql, new Object[]{id});
    	mdo.close();
    	return i;
    }

   
    
    public int addCondition(DicMemberCondition dmc){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="insert into dic_member_condition(condition_id,bridge_type,condition_style,condition_norm,location) values(?,?,?,?,?)";
    	int i=mdo.executeUpdate(sql, new Object[]{dmc.getCondition_id(),dmc.getBridge_type(),dmc.getCondition_style(),dmc.getCondition_norm(),dmc.getLocation()});
    	mdo.close();
    	return i;
    }
    
    
  
    
    /*
     *@author xianing  
     */
    public List<DicMemberCondition> nameJudge(DicMemberCondition dmc){
    	List<DicMemberCondition> lc=new ArrayList<DicMemberCondition>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="select * from dic_member_condition where bridge_type = ? "
    		                                          +" and condition_style  = ? "
    			                                      +" and condition_norm = ? "
    			                                      +"  and location = ? ";
    	ResultSet rs=mdo.executeQuery(sql,new String[]{dmc.getBridge_type(),
    			                                       dmc.getCondition_style(),
    			                                       dmc.getCondition_norm(),
    			                                       dmc.getLocation()});
    	try {
			while (rs.next()) {
				DicMemberCondition dm=new DicMemberCondition();
				dm.setBridge_type(rs.getString("bridge_type"));
				dm.setCondition_id(rs.getString("condition_id"));
				dm.setCondition_norm(rs.getString("condition_norm"));
				dm.setCondition_style(rs.getString("condition_style"));
				dm.setLocation(rs.getString("location"));
				lc.add(dm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	return lc;
    }
    
    public int addStandard(DicMemberStandard dmc){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="insert into dic_member_standard(standard_id,member_type,member_name,member_model,condition_id) values(?,?,?,?,?)";
    	int i=mdo.executeUpdate(sql, new Object[]{dmc.getStandard_id(),dmc.getMember_type(),dmc.getMember_name(),dmc.getMember_model(),dmc.getCondition_id()});
    	mdo.close();
    	return i;
    }
   
    
    public List<ManageSectionBridge> initManageSection(){
    	List<ManageSectionBridge> lc=new ArrayList<>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT b.manage_id,b.manage_name,c.section_id,"
    			+ "c.section_name,a.bridge_id,a.bridge_name from "
    			+ "brg_card_admin_id as a,dic_manage_org as b,"
    			+ "dic_manage_section as c where a.manage_id=b.manage_id "
    			+ "and a.section_id=c.section_id ORDER BY manage_name,section_name,bridge_name";
    	ResultSet rs=mdo.executeQuery(sql,null);
    	try {
			while (rs.next()) {
				String manage_id=rs.getString("manage_id");
				String manage_name=rs.getString("manage_name");
				String section_id=rs.getString("section_id");
				String section_name=rs.getString("section_name");
				String bridge_id=rs.getString("bridge_id");
				String bridge_name=rs.getString("bridge_name");
				ManageSectionBridge msb=new ManageSectionBridge();
				msb.setStruct_name(bridge_name);
				msb.setStruct_id(bridge_id);
				msb.setManage_id(manage_id);
				msb.setManage_name(manage_name);
				msb.setSection_id(section_id);
				msb.setSection_name(section_name);
				lc.add(msb);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	return lc;
    }
	public static void main(String[] args) {
	}

}
