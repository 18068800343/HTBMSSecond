package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicBrgStructTypeDef;
import hs.bm.bean.DicCulStructTypeDef;
import hs.bm.bean.DicPassStructTypeDef;
import hs.bm.vo.BrgStructTypeVO;

public class DicStructTypeDao {
	
	private static DicStructTypeDao dicStructTypeDao;
	
	public static DicStructTypeDao getInstance() {
		if (dicStructTypeDao == null) {
			dicStructTypeDao = new DicStructTypeDao();
		}
		return dicStructTypeDao;
	}

	public List<BrgStructTypeVO> initBridgeType() {
		List<BrgStructTypeVO> map=new ArrayList<BrgStructTypeVO>();
		List<DicBrgStructTypeDef> ll=new ArrayList<DicBrgStructTypeDef>();
		List<String> ls=new ArrayList<String>();
		String sql = "select * from dic_brg_struct_type_def order by brg_type_id+0";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		if (rs == null) {
			map = null;
		}
		try {
			while (rs.next()) {
				DicBrgStructTypeDef dtd=new DicBrgStructTypeDef();
				dtd.setBrg_base_type(rs.getString("brg_base_type"));
				dtd.setBrg_type_id(rs.getString("brg_type_id"));
				dtd.setBrg_type_name(rs.getString("brg_type_name"));
				String base=rs.getString("brg_base_type");
				if(!ls.contains(base)){
					ls.add(base);
				}
				ll.add(dtd);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		for(int i=0;i<ls.size();i++){
			BrgStructTypeVO bv=new BrgStructTypeVO();
			bv.setBrg_base_type(ls.get(i));
			List<DicBrgStructTypeDef> l2=new ArrayList<DicBrgStructTypeDef>();
			for(int j=0;j<ll.size();j++){
				if(ll.get(j).getBrg_base_type().equals(ls.get(i))){
					l2.add(ll.get(j));
				}
			}
			bv.setLl(l2);
			map.add(bv);
		}
		return map;
	}

	public List<DicCulStructTypeDef> initCulvertType() {
		List<DicCulStructTypeDef> ll=new ArrayList<DicCulStructTypeDef>();
		String sql = "select * from dic_cul_struct_type_def order by cul_type_id+0";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				DicCulStructTypeDef dd=new DicCulStructTypeDef();
				dd.setCul_type_id(rs.getString("cul_type_id"));
				dd.setCul_type_name(rs.getString("cul_type_name"));
				ll.add(dd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<DicPassStructTypeDef> initPassType() {
		List<DicPassStructTypeDef> ll=new ArrayList<DicPassStructTypeDef>();
		String sql = "select * from dic_pass_struct_type_def order by pass_type_id+0";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				DicPassStructTypeDef dd=new DicPassStructTypeDef();
				dd.setPass_type_id(rs.getString("pass_type_id"));
				dd.setPass_type_name(rs.getString("pass_type_name"));
				ll.add(dd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}


	
}
