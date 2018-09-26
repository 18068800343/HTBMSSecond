package hs.bm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 数据库操作
 * @author mao
 *
 */
public class MyDataOperation {

	
	/**连接*/
	private Connection conn = null;
	/**sql语句预处理*/
	private PreparedStatement ps = null;
	/**select 查询结果集*/
	private List<ResultSet> rs = new ArrayList<ResultSet>();
	/**是否开启事务*/
	private boolean commit;
	/**是否出现异常*/
	private boolean err = false;
	
	
	/**
	 * 设置连接
	 * @return
	 */
	public MyDataOperation(Connection conn,boolean commit){
		this.conn = conn;
		this.commit = commit;
		try {
			conn.setAutoCommit(commit);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public MyDataOperation(Connection conn){
		this.conn = conn;
		this.commit = true;
		try {
			conn.setAutoCommit(commit);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int executeUpdate(String sql,Object[] objs){
		ps = getPreparedStatement(sql);
		if(err){
			return -1;
		}
		if (objs != null) {
			for (int i = 0; i < objs.length; i++) {
				ps = SetPs(objs[i], i + 1);
				if(err){
					return -1;
				}
			}
		}
		int res = update();
		if(err){
			return -1;
		}
		return res;
	}
	
	public ResultSet executeQuery(String sql,Object[] objs){
		ps = getPreparedStatement(sql);
		if(err){
			return null;
		}
		if (objs != null) {
			for (int i = 0; i < objs.length; i++) {
				ps = SetPs(objs[i], i + 1);
				if(err){
					return null;
				}
			}
		}
		
		ResultSet rst = query();
		rs.add(rst);
		if(err){
			return null;
		}
		return rst;
	}
	
	
	
	/**自动事务提交和出错回滚以及关闭*/
	public void close(){
		if(err&&!commit){
			rollback();
		}
		if(!commit){
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(rs.size()>0){
			try {
				for(ResultSet rSet:rs){
					if(rSet!=null){
						rSet.close();
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	/**提交update*/
	private int update(){
		try {
			return ps.executeUpdate();
		} catch (SQLException e) {
			err = true;
			e.printStackTrace();
		}
		return 0;
	}
	
	/**提交Query*/
	private ResultSet query(){
		ResultSet rst = null;
		try {
			rst = ps.executeQuery();
			
		} catch (SQLException e) {
			err = true;
			e.printStackTrace();
		}
		return rst;
	}
	
	/**事务回滚*/
	private void rollback(){
		try {
			conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取perparedstatement
	 * @param sql
	 * @return
	 */
	private PreparedStatement getPreparedStatement(String sql) {
		try {
			return conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 向preparedstatement中添加值
	 * @param obj
	 * @param i
	 * @return
	 */
	private PreparedStatement SetPs(Object obj, int i) {
		if (obj instanceof Integer) {
			try {
				ps.setInt(i, (Integer) obj);
			} catch (SQLException e) {
				e.printStackTrace();
				err = true;
			}
			return ps;
		}
		if (obj instanceof Double) {
			try {
				ps.setDouble(i, (Double) obj);
			} catch (SQLException e) {
				e.printStackTrace();
				err = true;
			}
			return ps;
		}
		if (obj instanceof String) {
			try {
				ps.setString(i, (String) obj);
			} catch (SQLException e) {
				e.printStackTrace();
				err = true;
			}
			return ps;
		}
		if (obj instanceof Long) {
			try {
				ps.setLong(i, (Long) obj);
			} catch (SQLException e) {
				e.printStackTrace();
				err = true;
			}
			return ps;
		}
		if (obj instanceof Float) {
			try {
				ps.setFloat(i, (Float) obj);
			} catch (SQLException e) {
				e.printStackTrace();
				err = true;
			}
			return ps;
		}
      if(obj==null){
    	  try {
				ps.setString(i, null);
			} catch (SQLException e) {
				e.printStackTrace();
				err = true;
			}
			return ps;
      }
		return ps;

	}

}
