package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.DicBrgMonitoringItem;
import hs.bm.bean.EvaBridgePart;
import hs.bm.vo.Eval11Info;
import hs.bm.vo.IndexsetIndexVO;
import hs.bm.vo.OperationConstruct;

public class MonitoringDao {

	private static MonitoringDao monitoringDao;

	public static MonitoringDao getInstance() {
		if (monitoringDao == null) {
			monitoringDao = new MonitoringDao();
		}
		return monitoringDao;
	}
	
	public List<DicBrgMonitoringItem> getItem_first(){
		List<DicBrgMonitoringItem> list =new ArrayList<DicBrgMonitoringItem>(); 
		String sql = " SELECT item_first FROM dic_brg_monitoring_item GROUP BY item_first ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{});
		try {
			while (rs.next()) {
				DicBrgMonitoringItem entity = new DicBrgMonitoringItem();
				entity.setItem_first(rs.getString("item_first"));
				list.add(entity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	
	public List<DicBrgMonitoringItem> getItem_second(DicBrgMonitoringItem dbmi){
		List<DicBrgMonitoringItem> list =new ArrayList<DicBrgMonitoringItem>(); 
		String sql = " SELECT item_second FROM dic_brg_monitoring_item WHERE item_first=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{dbmi.getItem_first()});
		try {
			while (rs.next()) {
				DicBrgMonitoringItem entity = new DicBrgMonitoringItem();
				entity.setItem_second(rs.getString("item_second"));
				list.add(entity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	
	public List<BrgCardAdminId> getScan_struct(String zone){
		List<BrgCardAdminId> list =new ArrayList<BrgCardAdminId>(); 
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs =null;
		String sql=null;
		if(zone==null){
			sql = " SELECT bridge_id ,bridge_name FROM brg_card_admin_id WHERE bridge_id IN (SELECT DISTINCT bridge_id FROM brg_system) ";
			rs = dataOperation.executeQuery(sql, new String[]{});
		}else{
			sql = " SELECT bridge_id ,bridge_name FROM brg_card_admin_id WHERE bridge_id IN (SELECT DISTINCT bridge_id FROM brg_system) and zone_id like ? ";
			rs = dataOperation.executeQuery(sql, new String[]{zone});
		}
		try {
			while (rs.next()) {
				BrgCardAdminId entity = new BrgCardAdminId();
				entity.setBridge_id(rs.getString("bridge_id"));
				entity.setBridge_name(rs.getString("bridge_name"));
				list.add(entity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	
			
	

}
