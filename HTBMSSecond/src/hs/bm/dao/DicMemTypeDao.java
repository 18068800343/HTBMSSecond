package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicBrgStructMemberDef;

public class DicMemTypeDao {
	
	private static DicMemTypeDao dicMemTypeDao;

	public static DicMemTypeDao getInstance() {
		if (dicMemTypeDao == null) {
			dicMemTypeDao = new DicMemTypeDao();
		}
		return dicMemTypeDao;
	}
	
	public boolean checkNameId(String name,String id,String style){
		boolean flag = false;
		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(style.equals("bridge")){
			sql = "select * from dic_brg_struct_type_def where brg_type_name = ? or brg_type_id=?";
		}
		if(style.equals("distr")){
			sql = "select * from dic_brg_struct_distr_def where distr_name=? or distr_id=?";
		}
		if(style.equals("component")){
			sql = "select * from dic_brg_struct_component_def where component_name=? or component_id=?";
		}
		if(style.equals("member")){
			sql = "select * from dic_brg_struct_member_def where member_name=? or member_id=?";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{name,id});
		try {
			if(rs.next()){
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return flag;
	}
	
	public boolean checkNameId(String name,String id,String style,String specification){
		boolean flag = false;
		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(style.equals("component")){
			sql = "select * from dic_brg_struct_component_def where  component_id=?";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{id});
		try {
			if(rs.next()){
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		sql = "select * from dic_brg_struct_component_def where  component_name=? and specification=?";
		rs = dataOperation.executeQuery(sql, new String[]{name,specification});
		try {
			if(rs.next()){
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return flag;
	}
	
	
	public boolean checkName(String name,String style){
		boolean flag = false;
		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(style.equals("bridge")){
			sql = "select * from dic_brg_struct_type_def where brg_type_name = ?";
		}
		if(style.equals("distr")){
			sql = "select * from dic_brg_struct_distr_def where distr_name=?";
		}
		if(style.equals("component")){
			sql = "select * from dic_brg_struct_component_def where component_name=?";
		}
		if(style.equals("member")){
			sql = "select * from dic_brg_struct_member_def where member_name=?";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{name});
		try {
			if(rs.next()){
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return flag;
	}
	
	public boolean checkName(String name,String style,String specification){
		boolean flag = false;
		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(style.equals("component")){
			sql = "select * from dic_brg_struct_component_def where component_name=? and specification=?";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{name,specification});
		try {
			if(rs.next()){
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return flag;
	}
	
	
	/**
	 * 初始化构件类型字典数据
	 * 
	 * @author mao
	 * @return List<DicBrgStructDistrDef>
	 */
	public List<DicBrgStructMemberDef> initMemType() {
		List<DicBrgStructMemberDef> ll = new ArrayList<DicBrgStructMemberDef>();
		String sql = "select member_id,member_name from dic_brg_struct_member_def order by member_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicBrgStructMemberDef dbs = new DicBrgStructMemberDef();
				dbs.setMember_id(rs.getString("member_id"));
				dbs.setMember_name(rs.getString("member_name"));
				ll.add(dbs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	/**
	 * 新增构件类型字典数据
	 * 
	 * @author mao
	 * @return i
	 */
	public int newMemType(DicBrgStructMemberDef dbs) {
		String sql = "insert into dic_brg_struct_member_def(member_id,member_name) values (?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = 0;
		i = dataOperation.executeUpdate(sql, new Object[] { dbs.getMember_id(), dbs.getMember_name() });
		dataOperation.close();
		return i;
	}

	
	
	/**
	 * 删除构件类型字典数据
	 * 
	 * @author mao
	 * @return i
	 */
	public int deleteMemType(String member_id) {
		String sql = "delete from dic_brg_struct_member_def where member_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { member_id });
		dataOperation.close();
		return i;
	}
	
	/**
	 * 修改
	 * @param dbs
	 * @return
	 */
	public int editMemType(DicBrgStructMemberDef dbs) {
		String sql = "update  dic_brg_struct_member_def set member_name=? where member_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = 0;
		i = dataOperation.executeUpdate(sql, new Object[] {dbs.getMember_name(),dbs.getMember_id()});
		dataOperation.close();
		return i;
	}
}
