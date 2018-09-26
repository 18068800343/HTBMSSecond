package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import hs.bm.bean.BackUpDataBase;
import hs.bm.bean.SysOrgInfo;

public class BackUpDao {
	
	private static BackUpDao backUpDao;
	
	public static BackUpDao getInstance(){
		if(backUpDao==null){
			backUpDao=new BackUpDao();
		}
		return backUpDao;
	}
	
	public long getLastBackStmp(){
		long stmp = 0;
		String sql = "select * from backup_database where createuser='系统' order by id desc limit 1";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				Date  date = rs.getTimestamp("createtime");
				stmp = date.getTime();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return stmp;
	}
	
	public int insertDataBaseBack(BackUpDataBase bd){
		int  i=0;
		String sql = "insert into backup_database(createtime, createuser, memo, path) values(?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		i = dataOperation.executeUpdate(sql, new String[]{
				bd.getCreatetime(),
				bd.getCreateuser(),
				bd.getMemo(),
				bd.getPath()
		});
		dataOperation.close();
		return i;
	}
	
	public List<BackUpDataBase> initDataBaseBack(){
		List<BackUpDataBase> ll = new ArrayList<>();
		String sql = "select * from backup_database";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				BackUpDataBase db = new BackUpDataBase();
				db.setId(rs.getString("id"));
				db.setCreatetime(rs.getString("createtime"));
				db.setCreateuser(rs.getString("createuser"));
				db.setMemo(rs.getString("memo"));
				db.setPath(rs.getString("path"));
				ll.add(db);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

}
