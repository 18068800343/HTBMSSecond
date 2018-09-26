package hs.bm.dao;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgCardConstructPrjMemo;
import hs.bm.bean.BrgCardDocument;
import hs.bm.bean.BrgCardStructTech;
import hs.bm.bean.DicHwInfo;
import hs.bm.bean.DicManageOrg;
import hs.bm.bean.DicManageSection;
import hs.bm.bean.DicManageZone;
import hs.bm.bean.SysOrgInfo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NewBrgDao
{
	
	private static NewBrgDao newBrgDao;

	public static NewBrgDao getInstance()
	{
		if (newBrgDao == null)
		{
			newBrgDao = new NewBrgDao();
		}
		return newBrgDao;
	}
	
	public ArrayList<DicHwInfo> init_line(){
		ArrayList<DicHwInfo> list = new ArrayList<DicHwInfo>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " select * from dic_hw_info where 1=1 ";
		String[] params = {};
		ResultSet rs = mdo.executeQuery(sql, params);
		try
		{
			while (rs.next())
			{
				DicHwInfo dhi = new DicHwInfo();
				dhi.setHighway_id(rs.getString("highway_id"));
				dhi.setHighway_level(rs.getString("highway_level"));
				dhi.setHighway_name(rs.getString("highway_name"));
				dhi.setHighway_no(rs.getString("highway_no"));
				list.add(dhi);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
		
	
	public ArrayList<DicManageZone> init_manage_zone(String manage_id){
		ArrayList<DicManageZone> list = new ArrayList<DicManageZone>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " select * from sys_zone_info where org_id=? ";
		String[] params = {manage_id};
		ResultSet rs = mdo.executeQuery(sql, params);
		try
		{
			while (rs.next())
			{
				DicManageZone dmz = new DicManageZone();
				dmz.setZone_id(rs.getString("zone_id"));
				dmz.setZone_name(rs.getString("zone_name"));
				list.add(dmz);
			}
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	
	public ArrayList<DicManageSection> init_section(String manage_id){
		ArrayList<DicManageSection> list = new ArrayList<DicManageSection>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " select * from sys_section_info where org_id=? ";
		String[] params = {manage_id};
		ResultSet rs = mdo.executeQuery(sql, params);
		try
		{
			while (rs.next())
			{
				DicManageSection dms = new DicManageSection();
				dms.setSection_id(rs.getString("section_id"));
				dms.setSection_name(rs.getString("section_name"));
				list.add(dms);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	
	public ArrayList<SysOrgInfo> init_maintain_org(){
		ArrayList<SysOrgInfo> list = new ArrayList<SysOrgInfo>();
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " select * from sys_org_info where 1=1 ";
		String[] params = {};
		ResultSet rs = mdo.executeQuery(sql, params);
		try
		{
			while (rs.next())
			{
				SysOrgInfo entity = new SysOrgInfo();
				entity.setOrg_id(rs.getString("org_id"));
				entity.setOrg_name(rs.getString("org_name"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	
	public int insertBrg_card_admin_id(BrgCardAdminId brg){
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " INSERT INTO brg_card_admin_id(bridge_id,highway_id,manage_id,section_id,zone_id,bridge_no,bridge_name," +
				"bridge_pile_no,span_build,bridge_mode,longitude,latitude,main_span) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		String[] params={brg.getBridge_id(),brg.getHighway_id(),brg.getManage_id(),brg.getSection_id(),
						brg.getZone_id(),brg.getBridge_no(),brg.getBridge_name(),brg.getBridge_pile_no(),
						brg.getSpan_build(),brg.getBridge_mode(),brg.getLongitude(),brg.getLatitude(),brg.getMain_span()
						};
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
	}
	
	public int insertBrgCardStructTech(BrgCardStructTech brgCardStructTech)
	{
		int i = 0;
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = " INSERT INTO brg_card_struct_tech(bridge_id) VALUES(?) ";
		String[] params =new String[]{
			brgCardStructTech.getBridge_id()
		};
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
	}
	
	public int insertbrgCardDocument(BrgCardDocument brgCardDocument){
		int i = 0;
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = " INSERT INTO brg_card_document(bridge_id) VALUES(?) ";
		String[] params =new String[]{
				brgCardDocument.getBridge_id()
		};
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
	}
	
	public int insertBrgCardConstructPrjMemo(String bridge_id){
		int i = 0;
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = " INSERT INTO brg_card_construct_prj_memo(bridge_id) VALUES(?) ";
		String[] params =new String[]{
				bridge_id
		};
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
	}
	
	public ArrayList<DicHwInfo> getHighway_no(String highway_id){
		ArrayList<DicHwInfo> dicHwInfo = new ArrayList<DicHwInfo>();
		String sql = " SELECT highway_no,highway_level FROM dic_hw_info WHERE highway_id = ? ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, new String[]{
				highway_id
		});
		try
		{
			while (rs.next())
			{
				DicHwInfo entity = new DicHwInfo();
				entity.setHighway_no(rs.getString("highway_no"));
				entity.setHighway_level(rs.getString("highway_level"));
				dicHwInfo.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();		
		return dicHwInfo;
	}
}
