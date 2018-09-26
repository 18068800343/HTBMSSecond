package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.vo.MemMember;

public class DicMemMemberTypeDao {
	private static DicMemMemberTypeDao dicMemMemberTypeDao;

	public static DicMemMemberTypeDao getInstance() {
		if (dicMemMemberTypeDao == null) {
			dicMemMemberTypeDao = new DicMemMemberTypeDao();
		}
		return dicMemMemberTypeDao;
	}
	
	
	public int checkRepeat(String member_id,String member_type_name){
		String sql = "select * from mem_member_type_def where member_id=? and member_type_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{member_id,member_type_name});
		int i=-1;
		try {
			if(rs.next()){
				i=1;
			}else {
				i=0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return i;
	}
	
	public int addDicMemMemberType(String member_id,String member_name,String member_type_name){
		String sql = "insert into mem_member_type_def(member_id,member_name,member_type_name) values(?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] {member_id,member_name,member_type_name});
		dataOperation.close();
		return i;
	}
	
	public List<MemMember> initTable(){
		List<MemMember> lm=new ArrayList<MemMember>();
		String sql = "select member_id,member_name,member_type_name from mem_member_type_def";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				MemMember mm=new MemMember();
				mm.setMember_id(rs.getString("member_id"));
				mm.setMember_name(rs.getString("member_name"));
				mm.setMember_type_name(rs.getString("member_type_name"));
				lm.add(mm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return lm;
	}
	public int delDicMemMemberType(String member_id,String member_type_name){
		String sql = "delete from mem_member_type_def where member_id=? and member_type_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] {member_id,member_type_name});
		dataOperation.close();
		return i;
	}
	
	public List<String> initOption(){
		List<String> ll = new ArrayList<String>();
		String sql = "select member_name from mem_member_type_def GROUP BY member_name ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				String s = rs.getString("member_name");
				ll.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	
}
