package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicDefReference;

public class DefReferenceDao {
	
	private static DefReferenceDao defReferenceDao;
	
	public static DefReferenceDao getInstance(){
		if(defReferenceDao==null){
			defReferenceDao=new DefReferenceDao();
		}
		return defReferenceDao;
	}
	
	public boolean checkName(String reference_name){
		boolean flag = false;
		
		String sql = "select * from dic_def_reference where reference_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{reference_name});
		try {
			if(rs.next()){
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return flag;
	}
	
	public List<DicDefReference> initReference(){
		String sql = "select * from dic_def_reference";
		List<DicDefReference> ll = new ArrayList<DicDefReference>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				DicDefReference dd = new DicDefReference();
				dd.setReference_name(rs.getString("reference_name"));
				ll.add(dd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	public int newDefReference(String reference_name){
		String sql = "insert into dic_def_reference(reference_name) values (?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{reference_name});
		dataOperation.close();
		return i;
	}
	
	
	public int delDefReference(String reference_name){
		String sql = "delete from dic_def_reference where reference_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{reference_name});
		dataOperation.close();
		return i;
	}
	
	
}
