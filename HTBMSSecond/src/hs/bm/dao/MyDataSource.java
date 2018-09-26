package hs.bm.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;

public class MyDataSource {
	
	private DataSource dds;
	
	private static MyDataSource mds;
	
	private MyDataSource() {
		try {
			InputStream is = getClass().getResourceAsStream("/dbconfig.properties");
			Properties p = new Properties();
			p.load(is);
			dds = DruidDataSourceFactory.createDataSource(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static MyDataSource getInstance() {
		if(mds == null) {
			mds = new MyDataSource();
		}
		return mds;
	}
	
	public synchronized Connection getConnection() {
		Connection conn = null;
		try {
			conn = dds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
		
	/*private ComboPooledDataSource rds;
	
	private static MyDataSource mds;
	
	private MyDataSource() {
		rds = new ComboPooledDataSource();
	}
	
	public static MyDataSource getInstance() {
		if(mds == null) {
			mds = new MyDataSource();
		}
		return mds;
	}
	
	public synchronized Connection getConnection() {
		Connection conn = null;
		try {
			conn = rds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	protected void finalize() throws Throwable {
		DataSources.destroy(rds);
		super.finalize();
	}*/
}
