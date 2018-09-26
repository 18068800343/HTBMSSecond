package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import hs.bm.bean.DicMbrDefectF;
import hs.bm.bean.DicMbrDefectS;
import hs.bm.vo.DicDefect;

public class DicDefectDao {
	
	private static DicDefectDao dicDefectDao;
	
	public static DicDefectDao getInstance(){
		if(dicDefectDao==null){
			dicDefectDao=new DicDefectDao();
		}
		return dicDefectDao;
	}
   public List<DicDefect> initTable(){
	   List<DicDefect> ld=new ArrayList<DicDefect>();
	   Map<String, DicDefect> map=new HashMap<String,DicDefect>();
	   String sql = "select IFNULL(a.defect_id,'') as defect_id,IFNULL(a.defect_name,'') as defect_name,IFNULL(a.defect_loc_def,'') as defect_loc_def,IFNULL(a.defect_def,'') as defect_def,IFNULL(a.defect_template,'') as defect_template,IFNULL(a.defect_attr,'') as defect_attr,IFNULL(a.defect_statistics,'') as defect_statistics,IFNULL(a.defect_summary,'') as defect_summary,b.* from dic_mbr_defect_s as a RIGHT JOIN dic_mbr_defect_f as b on a.defect_f_id=b.defect_f_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				if(map.containsKey(rs.getString("defect_f_id"))){
					DicDefect d1=map.get(rs.getString("defect_f_id"));
					List<DicMbrDefectS> lt=d1.getDefects();
					DicMbrDefectS ddt=new DicMbrDefectS();
					ddt.setDefect_def(rs.getString("defect_def"));
					ddt.setDefect_id(rs.getString("defect_id"));
					ddt.setDefect_loc_def(rs.getString("defect_loc_def"));
					ddt.setDefect_template(rs.getString("defect_template"));
					ddt.setDefect_name(rs.getString("defect_name"));
					ddt.setDefect_attr(rs.getString("defect_attr"));
					ddt.setDefect_statistics(rs.getString("defect_statistics"));
					ddt.setDefect_summary(rs.getString("defect_summary"));
					if(!rs.getString("defect_id").equals("")){
						lt.add(ddt);
					}
					d1.setDefects(lt);
					map.put(rs.getString("defect_f_id"), d1);
				}else{
					DicDefect d1=new DicDefect();
					List<DicMbrDefectS> lt=d1.getDefects();
					DicMbrDefectS ddt=new DicMbrDefectS();
					ddt.setDefect_def(rs.getString("defect_def"));
					ddt.setDefect_id(rs.getString("defect_id"));
					ddt.setDefect_loc_def(rs.getString("defect_loc_def"));
					ddt.setDefect_template(rs.getString("defect_template"));
					ddt.setDefect_name(rs.getString("defect_name"));
					ddt.setDefect_attr(rs.getString("defect_attr"));
					ddt.setDefect_statistics(rs.getString("defect_statistics"));
					ddt.setDefect_summary(rs.getString("defect_summary"));
					if(!rs.getString("defect_id").equals("")){
						lt.add(ddt);
					}
					d1.setDefect_f_id(rs.getString("defect_f_id"));
					d1.setDefect_f_name(rs.getString("defect_f_name"));
					d1.setDefects(lt);
					map.put(rs.getString("defect_f_id"), d1);
				}
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		for(String s:map.keySet()){
			ld.add(map.get(s));
		}
		return ld;
   }
   
   
   public int addDefect_f(DicMbrDefectF dmd){
	   String sql = "insert into dic_mbr_defect_f (defect_f_id,defect_f_name) values (?,?)";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmd.getDefect_f_id(),dmd.getDefect_f_name() });
		dataOperation.close();
		return i;
   }
   public int delDefect_f(DicMbrDefectF dmd) {
	   String sql = "delete from dic_mbr_defect_f where defect_f_id=?";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmd.getDefect_f_id() });
		dataOperation.close();
		return i;
   }
   public int editDefect_f(DicMbrDefectF dmd, String old_id){
	   String sql = "update dic_mbr_defect_f set defect_f_id=?,defect_f_name=? where defect_f_id=?";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmd.getDefect_f_id(), dmd.getDefect_f_name(), old_id });
		dataOperation.close();
		return i;
   }
   public int addDefect(DicMbrDefectS dmd) {
	   String sql = "insert into dic_mbr_defect_s (defect_id,defect_name,defect_loc_def,defect_def,defect_template,defect_f_id,defect_attr,defect_statistics,defect_summary) values (?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmd.getDefect_id(), dmd.getDefect_name(),
				dmd.getDefect_loc_def(), dmd.getDefect_def(), dmd.getDefect_template(), dmd.getDefect_f_id(),dmd.getDefect_attr(),dmd.getDefect_statistics(),dmd.getDefect_summary() });
		dataOperation.close();
		return i;
	}
   public int delDefect(String defect_id) {
	   String sql = "delete from dic_mbr_defect_s where defect_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { defect_id });
		dataOperation.close();
		return i;
	}
   public boolean checkNameId_f(String id,String name){
	   boolean flag = false;
	   String sql = "select * from dic_mbr_defect_f where defect_f_id=? or defect_f_name=?";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
	   ResultSet rs = dataOperation.executeQuery(sql, new String[]{id,name});
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
   public boolean checkNameId_s(String id,String name, String f_id){
	   boolean flag = false;
	   String sql = "select * from dic_mbr_defect_s where defect_id=? or ? in (select defect_name from dic_mbr_defect_s where defect_f_id =?)";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
	   ResultSet rs = dataOperation.executeQuery(sql, new String[]{id,name, f_id});
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
   public boolean checkName_f(String id,String name, String old_id, String old_name){
	   boolean flag = false;
	   String sql = "select * from dic_mbr_defect_f where (defect_f_id=? or defect_f_name=?) and (defect_f_id!=? and defect_f_name!=?)";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
	   ResultSet rs = dataOperation.executeQuery(sql, new String[]{id, name, old_id, old_name});
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
   public boolean checkName_s(String id,String name, String f_id){
	   boolean flag = false;
	   String sql = "select * from dic_mbr_defect_s where defect_name=? and defect_id!=? and defect_f_id=?";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
	   ResultSet rs = dataOperation.executeQuery(sql, new String[]{name,id, f_id});
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
   public boolean checkId_s(String id){
	   boolean flag = false;
	   String sql = "select * from dic_mbr_defect_s where defect_id=?";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
	   ResultSet rs = dataOperation.executeQuery(sql, new String[]{id});
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
   public int editDefect(DicMbrDefectS dmd, String old_id) {
	   String sql = "update dic_mbr_defect_s set defect_id=?,defect_name=?,defect_loc_def=?,defect_def=?,defect_template=?,defect_attr=?,defect_statistics=?,defect_summary=? where defect_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { dmd.getDefect_id(), dmd.getDefect_name(),
				dmd.getDefect_loc_def(), dmd.getDefect_def(), dmd.getDefect_template(), dmd.getDefect_attr(), dmd.getDefect_statistics(),dmd.getDefect_summary(),old_id });
		dataOperation.close();
		return i;
	}
   
   
}
