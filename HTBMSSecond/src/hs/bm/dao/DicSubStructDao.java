package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicBrgStructDistrDef;

public class DicSubStructDao {
	
	private static DicSubStructDao dicSubStructDao;

	public static DicSubStructDao getInstance() {
		if (dicSubStructDao == null) {
			dicSubStructDao = new DicSubStructDao();
		}
		return dicSubStructDao;
	}

	public List<DicBrgStructDistrDef> initSubStruct() {
		List<DicBrgStructDistrDef> ll = new ArrayList<DicBrgStructDistrDef>();
		String sql = "select distr_id,distr_name from dic_brg_struct_distr_def order by distr_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicBrgStructDistrDef dbs = new DicBrgStructDistrDef();
				dbs.setDistr_id(rs.getString("distr_id"));
				dbs.setDistr_name(rs.getString("distr_name"));
				ll.add(dbs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	
}
