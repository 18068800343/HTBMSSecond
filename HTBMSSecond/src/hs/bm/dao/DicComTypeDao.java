package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicBrgStructComponentDef;

public class DicComTypeDao {
	
	private static DicComTypeDao dicComTypeDao;

	public static DicComTypeDao getInstance() {
		if (dicComTypeDao == null) {
			dicComTypeDao = new DicComTypeDao();
		}
		return dicComTypeDao;
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
	 * 获取部件类型数据
	 */
	public List<DicBrgStructComponentDef> initComType() {
		List<DicBrgStructComponentDef> ll = new ArrayList<DicBrgStructComponentDef>();
		String sql = "select component_id,component_name,specification from dic_brg_struct_component_def order by component_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicBrgStructComponentDef dbs = new DicBrgStructComponentDef();
				dbs.setComponent_id(rs.getString("component_id"));
				dbs.setComponent_name(rs.getString("component_name"));
				dbs.setSpecification(rs.getString("specification"));
				ll.add(dbs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	/**
	 * 新增部件类型的数据
	 * 
	 * @author mao
	 * @return
	 */
	public int newComType(DicBrgStructComponentDef dbs) {
		String sql = "insert into dic_brg_struct_component_def(component_id,component_name,specification) values (?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = 0;
		i = dataOperation.executeUpdate(sql, new Object[] { dbs.getComponent_id(), dbs.getComponent_name(),dbs.getSpecification()});
		dataOperation.close();
		return i;
	}
	
	/**
	 * 删除部件类型的数据
	 * 
	 * @author mao
	 * @return
	 */
	public int deleteComType(String component_id) {
		String sql = "delete from dic_brg_struct_component_def where component_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { component_id });
		dataOperation.close();
		return i;
	}
	
	/**
	 * 修改部件类型数据
	 */
	public int editComType(DicBrgStructComponentDef dbs){
		String sql = "update  dic_brg_struct_component_def  set component_name=? where component_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = 0;
		i = dataOperation.executeUpdate(sql, new Object[] {dbs.getComponent_name(),dbs.getComponent_id()});
		dataOperation.close();
		return i;
	}
}
