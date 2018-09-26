package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import hs.bm.bean.ScoreIndexset2011;
import hs.bm.vo.DicMemEval;

public class DicMemEvalDao {
	
	private static DicMemEvalDao dicMemEvalDao;

	public static DicMemEvalDao getInstance() {
		if (dicMemEvalDao == null) {
			dicMemEvalDao = new DicMemEvalDao();
		}
		return dicMemEvalDao;
	}
	
	public List<String> initBridgeTypeOption(){
		String sql = "select brg_type_name from dic_brg_struct_type_def order by cast(brg_type_id as SIGNED)";
		List<String> ll = new ArrayList<String>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				String s = rs.getString("brg_type_name");
				ll.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<ScoreIndexset2011> initIndexsetOption() {
		List<ScoreIndexset2011> ll = new ArrayList<ScoreIndexset2011>();
		String sql = "select * from score_indexset_2011";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				ScoreIndexset2011 st = new ScoreIndexset2011();
				st.setIndexset_id(rs.getString("indexset_id"));
				st.setIndexset_name(rs.getString("indexset_name"));
				ll.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<DicMemEval> initTable() {
		List<DicMemEval> ll = new ArrayList<DicMemEval>();
		String sql = "select a.id,a.member_id,b.member_name,a.indexset_id,c.indexset_name,a.member_type_name,a.brg_base_type from indexset_recognise_info as a,dic_brg_struct_member_def as b,score_indexset_2011 as c where a.member_id=b.member_id and c.indexset_id=a.indexset_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				DicMemEval dme = new DicMemEval();
				dme.setId(rs.getString("id"));
				dme.setMember_id(rs.getString("member_id"));
				dme.setMember_name(rs.getString("member_name"));
				dme.setMember_type_name(rs.getString("member_type_name"));
				dme.setIndexset_id(rs.getString("indexset_id"));
				dme.setIndexset_name(rs.getString("indexset_name"));
				dme.setBridge_base_type(rs.getString("brg_base_type"));
				ll.add(dme);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public boolean checkRepeat(DicMemEval dme) {
		boolean flag = false;
		String sql = "select * from indexset_recognise_info where indexset_id=? and member_id=? and member_type_name=? and brg_base_type=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{
				dme.getIndexset_id(),
				dme.getMember_id(),
				dme.getMember_type_name(),
				dme.getBridge_base_type()
		});
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
	
	public boolean checkRepeat2(DicMemEval dme) {
		boolean flag = false;
		String sql = "select * from indexset_recognise_info where indexset_id=? and member_id=? and member_type_name=? and brg_base_type=? and id!=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{
				dme.getIndexset_id(),
				dme.getMember_id(),
				dme.getMember_type_name(),
				dme.getBridge_base_type(),
				dme.getId()
		});
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

	public int addData(DicMemEval dme) {
		String sql = "insert into indexset_recognise_info(id,indexset_id,member_id,member_type_name,brg_base_type) values (?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{
				dme.getId(),
				dme.getIndexset_id(),
				dme.getMember_id(),
				dme.getMember_type_name(),
				dme.getBridge_base_type()
		});
		dataOperation.close();
		return i;
	}

	public int delData(String id) {
		String sql = "delete from indexset_recognise_info where id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{
				id
		});
		dataOperation.close();
		return i;
	}

	public int editData(DicMemEval dme) {
		String sql = "update indexset_recognise_info set indexset_id=?,member_id=?,member_type_name=?,brg_base_type=? where id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{
				dme.getIndexset_id(),
				dme.getMember_id(),
				dme.getMember_type_name(),
				dme.getBridge_base_type(),
				dme.getId()
		});
		dataOperation.close();
		return i;
	}

	
}
