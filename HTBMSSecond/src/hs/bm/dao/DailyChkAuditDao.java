package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.ChkProjectInfo;
import hs.bm.bean.CulSpanInfo;
import hs.bm.bean.PassSpanInfo;
import hs.bm.bean.SysZoneInfo;
import hs.bm.vo.BriCulPassId;
import hs.bm.vo.DailyChkVO;
import hs.bm.vo.Dailychk_dataVO;
import hs.bm.vo.ModeIdName;

public class DailyChkAuditDao
{

	private static DailyChkAuditDao ChkAuditDao;

	public static DailyChkAuditDao getInstance()
	{
		if (ChkAuditDao == null)
		{
			ChkAuditDao = new DailyChkAuditDao();
		}
		return ChkAuditDao;
	}
	/**
	 * 查询桥梁主管下有日常检查项目的分区
	 * @param org_id
	 * @return
	 */
	public ArrayList<SysZoneInfo> getSysZoneInfo_all(String org_id)
	{
		String sql = "";
		ArrayList<SysZoneInfo> list = new ArrayList<SysZoneInfo>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = null;
		sql = " SELECT * FROM sys_zone_info WHERE org_id =? ";
		arr = new String[]{ org_id };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				SysZoneInfo entity = new SysZoneInfo();
				entity.setZone_id(rs.getString("zone_id"));
				entity.setZone_name(rs.getString("zone_name"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	
	/**
	 * 查询分区负责人的分区信息
	 * @param usrname
	 * @return
	 */
	public ArrayList<SysZoneInfo> get_dutyman_SysZoneInfo(String usrname)
	{
		
		String sql = " SELECT c.zone_id,c.zone_name FROM sys_usr_usr_info AS a LEFT JOIN sys_org_usr_info AS b ON a.org_usr_id = b.org_usr_id LEFT JOIN sys_zone_info AS c ON b.department_id = c.zone_id WHERE  a.usr_name=? ";
		ArrayList<SysZoneInfo> list = new ArrayList<SysZoneInfo>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = new String[]
		{ usrname };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				SysZoneInfo entity = new SysZoneInfo();
				entity.setZone_id(rs.getString("zone_id"));
				entity.setZone_name(rs.getString("zone_name"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	
	/**
	 * 按分区查询日常检查审核数据
	 * @param zone_id
	 * @return
	 */
	public ArrayList<Dailychk_dataVO> queryDailyChk_byZone(String zone_id ,String date,String model)
	{
		String sql="";
		if(model != null && !model.equals("")){
			
			sql = " SELECT a.prj_id,b.bridge_id,b.bridge_name,c.bridge_no,b.audit_state,a.prj_id,b.chk_id,b.line_name FROM chk_project_info AS a LEFT JOIN chk_brg_regular AS b ON a.prj_id = b.prj_id LEFT JOIN brg_card_admin_id AS c ON c.bridge_id = b.bridge_id WHERE  c.zone_id = ? AND a.chk_type = 'daily'  AND  a.prj_establish_tm = ? AND a.prj_state ='2' ";
		}else{
			sql = " SELECT a.prj_id,b.bridge_id,b.bridge_name,c.bridge_no,b.audit_state,a.prj_id,b.chk_id,b.line_name FROM chk_project_info AS a LEFT JOIN chk_brg_regular AS b ON a.prj_id = b.prj_id LEFT JOIN brg_card_admin_id AS c ON c.bridge_id = b.bridge_id WHERE  c.zone_id = ? AND a.chk_type = 'daily'  AND  a.prj_establish_tm = ? AND a.prj_state in (0,1) ";
			
		}
		ArrayList<Dailychk_dataVO> list = new ArrayList<Dailychk_dataVO>();
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = new String[]
		{ zone_id,date };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				Dailychk_dataVO entity  = new Dailychk_dataVO();
				entity.setBrg_id(rs.getString("bridge_id"));
				entity.setBrg_name(rs.getString("bridge_name"));
				entity.setBrg_no(rs.getString("bridge_no"));
				entity.setAudit_state(rs.getString("audit_state"));
				entity.setPrj_id(rs.getString("prj_id"));
				entity.setChk_id(rs.getString("chk_id"));
				entity.setLine_name(rs.getString("line_name"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	/**
	 * 审核标志位加一
	 * @param chk_id
	 * @return
	 */
	public int DailyChk_audit(String chk_id){
		int i = 0;
		String sql = " UPDATE chk_brg_regular SET audit_state = audit_state+1 WHERE chk_id = ? "; 
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = new String[]{ chk_id };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	/**
	 * 完成日常检查项目
	 * @param zone_id
	 * @param date
	 * @return
	 */
	public int completeDailyPrj(String prj_id){
		int i = 0;
		String sql = " UPDATE chk_project_info SET prj_state = '1' WHERE prj_id = ?  ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = new String[]{ prj_id};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	/**
	 * 完成日常检查项目中每一个结构物的检查
	 * @param prj_id
	 * @return
	 */
	public int completeDailyPrj_brg_regular(String prj_id){
		int i = 0;
		String sql = " UPDATE chk_brg_regular SET audit_state='3' WHERE prj_id=? ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = new String[]{ prj_id};
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	/**
	 *获取PDF路径 
	 * @param chk_id
	 * @return
	 */
	public String getPDF_path(String chk_id){
		String path = "";
		String sql = " select pdf from chk_brg_regular where chk_id=? ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = new String[]{ chk_id };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				path = rs.getString("pdf");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return path;
	}
	/**
	 * 存储路径
	 * @param chk_id
	 * @param path
	 * @return
	 */
	public int storePDF_path(String chk_id,String path){
		int i = 0;
		String sql = " update chk_brg_regular  set pdf=? where chk_id=? ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = new String[]{path,chk_id };
		i = mdo.executeUpdate(sql, arr);
		if(i <1){
			sql = " insert chk_brg_regular(pdf) values(?) where chk_id=? ";
			i= mdo.executeUpdate(sql, arr);
		}
		mdo.close();
		return i;
	}
	/**
	 * 获取分区日常检查完成情况
	 * @param zone_id
	 * @return
	 */
	public ArrayList<DailyChkVO> getCalendarData(String zone_id){
		ArrayList<DailyChkVO> list = new ArrayList<>();
		String sql = " SELECT * FROM chk_project_info WHERE zone_id = ? and chk_type='daily' "; 
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = new String[]{zone_id };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				DailyChkVO entity = new DailyChkVO();
				String state = rs.getString("prj_state");
				if(state.equals("2")){
					entity.setValue("逾期未完成");
					entity.setDate(rs.getString("prj_establish_tm"));
					list.add(entity);
				}
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return list;
	}
	/**
	 * 获取分区日常项目开始时间
	 * @param zone_id
	 * @return start_date
	 */
	public String getDailyChkStartDate(String zone_id){
		String start_date="";
		String sql = " SELECT prj_establish_tm FROM chk_project_info WHERE zone_id = ? and chk_type='daily' ORDER BY prj_establish_tm LIMIT 1 ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] arr = new String[]{zone_id };
		ResultSet rs = mdo.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				start_date = rs.getString("prj_establish_tm");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return start_date;
		
	}
	
}
