package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import hs.bm.bean.IndexsetIndex;
import hs.bm.bean.ScoreIndexset2011;
import hs.bm.vo.DicEval11VO;

public class DicEval11Dao {
	
	 private static DicEval11Dao dicEval11Dao;
	 public static DicEval11Dao getInstance(){
			if(dicEval11Dao==null){
				dicEval11Dao=new DicEval11Dao();
			}
			return dicEval11Dao;
	 }
	public List<DicEval11VO> initTable() {
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		List<DicEval11VO> ll = new ArrayList<DicEval11VO>();
		String sql = "select * from score_indexset_2011";
		ResultSet rs = dataOperation.executeQuery(sql, null);
		sql = "select * from indexset_index where indexset_id=?";
		try {
			while(rs.next()){
				DicEval11VO dv = new DicEval11VO();
				dv.setIndexset_id(rs.getString("indexset_id"));
				dv.setIndexset_name(rs.getString("indexset_name"));
				List<IndexsetIndex> list = new ArrayList<IndexsetIndex>();
				ResultSet rt = dataOperation.executeQuery(sql, new String[]{dv.getIndexset_id()});
				while(rt.next()){
					IndexsetIndex dx = new IndexsetIndex();
					dx.setIndex_id(rt.getString("index_id"));
					dx.setIndex_no(rt.getString("index_no"));
					dx.setIndex_name(rt.getString("index_name"));
					dx.setIndex_scale(rt.getString("index_scale"));
					dx.setIndex_scalemax(rt.getString("index_scalemax"));
					dx.setIndexset_id(rt.getString("indexset_id"));
					list.add(dx);
				}
				dv.setIndexs(list);
				ll.add(dv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	public boolean checkNameId_f(String indexset_id, String indexset_name) {
		 boolean flag = false;
		   String sql = "select * from score_indexset_2011 where indexset_id=? or indexset_name=?";
		   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		   ResultSet rs = dataOperation.executeQuery(sql, new String[]{indexset_id, indexset_name});
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
	public int addIndexSet(ScoreIndexset2011 scoreIndexset) {
		String sql = "insert into score_indexset_2011 (indexset_id,indexset_name) values (?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { scoreIndexset.getIndexset_id(), scoreIndexset.getIndexset_name() });
		dataOperation.close();
		return i;
	}
	public int delIndexSet(String indexset_id) {
		String sql = "delete from score_indexset_2011 where indexset_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { indexset_id });
		dataOperation.close();
		return i;
	}
	public int editIndexSet(ScoreIndexset2011 scoreIndexset, String old_id) {
		String sql = "update score_indexset_2011 set indexset_id=?,indexset_name=? where indexset_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new Object[] { scoreIndexset.getIndexset_id(), scoreIndexset.getIndexset_name(), old_id });
		dataOperation.close();
		return i;
	}
	public boolean checkName_f(String indexset_id, String indexset_name, String old_id, String old_name) {
		boolean flag = false;
	   String sql = "select * from score_indexset_2011 where (indexset_id=? or indexset_name=?) and (indexset_id!=? and indexset_name!=?)";
	   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
	   ResultSet rs = dataOperation.executeQuery(sql, new String[]{indexset_id, indexset_name, old_id, old_name});
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
	public int addIndex(IndexsetIndex index) {
		String sql = "insert into indexset_index (index_id,index_no,index_name,index_scalemax,index_scale,indexset_id) values (?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{
				index.getIndex_id(),
				index.getIndex_no(),
				index.getIndex_name(),
				index.getIndex_scalemax(),
				index.getIndex_scale(),
				index.getIndexset_id()
		});
		dataOperation.close();
		return i;
	}
	public boolean checkNameId_s(String index_id, String index_name, String indexset_id) {
		boolean flag = false;
		String sql = "select * from indexset_index where index_id=? or ? in (select index_name from indexset_index where indexset_id =?)";
	    MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
	    ResultSet rs = dataOperation.executeQuery(sql, new String[]{index_id, index_name, indexset_id});
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
	public int delIndex(String index_id) {
		String sql = "delete from indexset_index where index_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{
				index_id
		});
		dataOperation.close();
		return i;
	}
	public int editIndex(IndexsetIndex index, String old_id) {
		String sql = "update indexset_index set index_id=?,index_no=?,index_name=?,index_scalemax=?,index_scale=? where index_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{
				index.getIndex_id(),
				index.getIndex_no(),
				index.getIndex_name(),
				index.getIndex_scalemax(),
				index.getIndex_scale(),
				old_id
		});
		dataOperation.close();
		return i;
	}
	public boolean checkId_s(String index_id) {
		   boolean flag = false;
		   String sql = "select * from indexset_index where index_id=?";
		   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		   ResultSet rs = dataOperation.executeQuery(sql, new String[]{index_id});
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
	public boolean checkName_s(String index_id, String index_name, String indexset_id) {
		   boolean flag = false;
		   String sql = "select * from indexset_index where index_name=? and index_id!=? and indexset_id=?";
		   MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		   ResultSet rs = dataOperation.executeQuery(sql, new String[]{index_name, index_id, indexset_id});
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
	
	
}
