package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicBrgCardDomain;
import hs.bm.bean.DicBrgCardItem;
import hs.bm.vo.BridgeCardTreeInfo;

public class DicCardDao {
	private static DicCardDao dicCardDao;

	public static DicCardDao getInstance() {
		if (dicCardDao == null) {
			dicCardDao = new DicCardDao();
		}
		return dicCardDao;
	}

	public List<BridgeCardTreeInfo> initBridgeCardTree() {
		List<BridgeCardTreeInfo> ll = new ArrayList<BridgeCardTreeInfo>();
		String sql = "select item_id,item_name,item_desc from dic_brg_card_item order by item_sort,cast(item_id as UNSIGNED INTEGER)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		BridgeCardTreeInfo bc = new BridgeCardTreeInfo();
		String preDesc = "";
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicBrgCardItem dbci = new DicBrgCardItem();
				dbci.setItem_id(rs.getString("item_id"));
				dbci.setItem_name(rs.getString("item_name"));
				String item_desc = rs.getString("item_desc");
				dbci.setItem_desc(item_desc);
				if (!item_desc.equals(preDesc) && preDesc != "") {
					bc.setRoot(preDesc);
					ll.add(bc);
					bc = new BridgeCardTreeInfo();
					bc.getItems().add(dbci);
				} else {
					bc.getItems().add(dbci);
				}
				preDesc = item_desc;
			}
			bc.setRoot(preDesc);
			ll.add(bc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<DicBrgCardDomain> initBridgeCardTable(String item_id) {
		List<DicBrgCardDomain> ll = new ArrayList<DicBrgCardDomain>();
		String sql = "select domain_id,item_id,item_value from dic_brg_card_domain where item_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { item_id });
		if (rs == null) {
			ll = null;
		}
		try {
			while (rs.next()) {
				DicBrgCardDomain dcd = new DicBrgCardDomain();
				dcd.setDomain_id(rs.getString("domain_id"));
				dcd.setItem_id(rs.getString("item_id"));
				dcd.setItem_value(rs.getString("item_value"));
				ll.add(dcd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();

		return ll;
	}

	public int editBridgeCardDomain(DicBrgCardDomain dcd) {
		String sql = "UPDATE dic_brg_card_domain set item_value=? where domain_id=? and item_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] { dcd.getItem_value(), dcd.getDomain_id(), dcd.getItem_id() });
		dataOperation.close();
		return i;
	}

	public int deleteBridgeCardDomain(String domain_id, String item_id) {
		String sql = "DELETE from dic_brg_card_domain where domain_id=? and item_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] { domain_id, item_id });
		dataOperation.close();
		return i;
	}

	public int newBridgeCardDomain(DicBrgCardDomain dcd) {
		String sql = "insert into dic_brg_card_domain(domain_id,item_id,item_value) values(?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] { dcd.getDomain_id(), dcd.getItem_id(), dcd.getItem_value()});
		dataOperation.close();
		return i;
	}
}
