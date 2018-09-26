package hs.bm.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicBrgStructComponentDef;
import hs.bm.bean.DicBrgStructMemberDef;

public class DicBridgeStructDao {

	private static DicBridgeStructDao dicBridgeStructDao;

	public static DicBridgeStructDao getInstance() {
		if (dicBridgeStructDao == null) {
			dicBridgeStructDao = new DicBridgeStructDao();
		}
		return dicBridgeStructDao;
	}
	
	
	public List<DicBrgStructMemberDef> initTable(){
		List<DicBrgStructMemberDef> ll = new ArrayList<DicBrgStructMemberDef>();
		String sql = "select member_id,member_name,component1,component2,component3,component4,component5,component6,component7,component8,component9,component10,distr_name from dic_brg_struct_member_def";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		if(rs==null){
			ll=null;
		}
		try {
			while(rs.next()){
				DicBrgStructMemberDef dbs = new DicBrgStructMemberDef();
				dbs.setMember_id(rs.getString("member_id"));
				dbs.setMember_name(rs.getString("member_name"));
				dbs.setComponent1(rs.getString("component1"));
				dbs.setComponent2(rs.getString("component2"));
				dbs.setComponent3(rs.getString("component3"));
				dbs.setComponent4(rs.getString("component4"));
				dbs.setComponent5(rs.getString("component5"));
				dbs.setComponent6(rs.getString("component6"));
				dbs.setComponent7(rs.getString("component7"));
				dbs.setComponent8(rs.getString("component8"));
				dbs.setComponent9(rs.getString("component9"));
				dbs.setComponent10(rs.getString("component10"));
				dbs.setDistr_name(rs.getString("distr_name"));
				ll.add(dbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	public List<DicBrgStructComponentDef> initOption(){
		List<DicBrgStructComponentDef> ll = new ArrayList<DicBrgStructComponentDef>();
		String sql = "select component_id,component_name,specification from dic_brg_struct_component_def";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		if(rs==null){
			ll=null;
		}
		try {
			while(rs.next()){
				DicBrgStructComponentDef dbs = new DicBrgStructComponentDef();
				dbs.setComponent_id(rs.getString("component_id"));
				dbs.setComponent_name(rs.getString("component_name"));
				dbs.setSpecification(rs.getString("specification"));
				ll.add(dbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	public int editData2011(DicBrgStructMemberDef dbs){
		String sql = "update dic_brg_struct_member_def set component1=?,component2=?,component3=?,component4=?,component5=?,component6=?,distr_name=? where member_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dbs.getComponent1(),dbs.getComponent2(),dbs.getComponent3(),dbs.getComponent4(),dbs.getComponent5(),dbs.getComponent6(),dbs.getDistr_name(),dbs.getMember_id() });
		dataOperation.close();
		return i;
	}


	public int editData2014(DicBrgStructMemberDef dbs) {
		String sql = "update dic_brg_struct_member_def set component7=?,distr_name=? where member_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dbs.getComponent7(),dbs.getDistr_name(),dbs.getMember_id() });
		dataOperation.close();
		return i;
	}


	public int editDataCKB(DicBrgStructMemberDef dbs) {
		String sql = "update dic_brg_struct_member_def set component8=?,distr_name=? where member_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dbs.getComponent8(),dbs.getDistr_name(),dbs.getMember_id() });
		dataOperation.close();
		return i;
	}


	public int editDataCKP(DicBrgStructMemberDef dbs) {
		String sql = "update dic_brg_struct_member_def set component9=? where member_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dbs.getComponent9(),dbs.getMember_id() });
		dataOperation.close();
		return i;
	}
	
	public int editDataCKC(DicBrgStructMemberDef dbs) {
		String sql = "update dic_brg_struct_member_def set component10=? where member_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dbs.getComponent10(),dbs.getMember_id() });
		dataOperation.close();
		return i;
	}
	
}
