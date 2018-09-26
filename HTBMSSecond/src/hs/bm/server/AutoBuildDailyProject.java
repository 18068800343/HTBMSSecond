package hs.bm.server;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;

import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;
import hs.bm.dao.PrjMgrDao;
import hs.bm.vo.StructInformation;

public class AutoBuildDailyProject implements Runnable{

	@Override
	public void run() {
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "select a.*,b.org_name from sys_zone_info a,sys_org_info b where b.org_id = a.org_id and a.build_prj=1 ";
		setOldDailyProject(dataOperation);//设置当天的项目未过期
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				String zone_id = rs.getString("zone_id");
				String org_id = rs.getString("org_id");
				String zone_name = rs.getString("zone_name");
				String org_name = rs.getString("org_name");
				String check_people = rs.getString("check_people");
				String prj_charge_man = rs.getString("prj_charge_man");
				String ht="";
				//获取所有用户信息
				Map<String, List<String>> userMap = getUser(dataOperation, zone_id);
				List<String> charge = userMap.get("charge");
				List<String> member = userMap.get("member");
				if(charge.size()==0 || member.size()==0){
					System.out.println(zone_name+"，用户信息不完善");
					continue;
				}
				List<StructInformation> bridges = getBridge(dataOperation, zone_id);
				if(bridges.size()==0){
					System.out.println(zone_name+"，下面没有桥梁");
					continue;
				}
				String prj_id = UUID.randomUUID().toString().replaceAll("-", "");
				String prj_desc = new SimpleDateFormat("yyyy年MM月dd日").format(new Date())+zone_name+"日常检查";
				String chk_type = "daily";
				
				//在日常项目记录表里新增记录
				if(!PrjMgrDao.getInstance().getSamePrj(zone_id,new SimpleDateFormat("yyyy-MM-dd").format(new Date()), chk_type)){
					PrjMgrDao.getInstance().saveNewPrj(prj_id, prj_desc, chk_type, org_name, zone_id, prj_charge_man, check_people, bridges,ht);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
	}
	
	/*
	 * @author xianing
	 */
	private int setOldDailyProject(MyDataOperation dataOperation){
		
		String sql = "UPDATE chk_project_info set prj_state=2 where prj_state=0 and to_days(prj_establish_tm) <> to_days(now()) and chk_type='daily' ";
		
		return dataOperation.executeUpdate(sql, null);
	}
	
	
	private Map<String, List<String>> getUser(MyDataOperation dataOperation, String zone_id){
		Map<String, List<String>> map = new HashMap<>();
		List<String> charge = new ArrayList<>();
		List<String> member = new ArrayList<>();
		String sql = "select * from sys_usr_usr_info where org_usr_id in "
				+ "(select org_usr_id from sys_org_usr_info where department_id=?)";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{zone_id});
		try {
			while(rs.next()){
				String role = rs.getString("usr_role");
				if(role.equals("orgEngineer")){
					member.add(rs.getString("usr_name"));
				}
				if(role.equals("orgDuty")){
					charge.add(rs.getString("usr_name"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		map.put("charge", charge);
		map.put("member", member);
		return map;
	}
	
	private List<StructInformation> getBridge(MyDataOperation dataOperation, String zone_id){
		 List<StructInformation> ll = new ArrayList<>();
		 String sql = "select a.*,b.highway_name,c.org_name from brg_card_admin_id a,dic_hw_info b, sys_org_info c \n" +
				 "where a.highway_id=b.highway_id and a.zone_id=? and a.manage_id=c.org_id;";
		 ResultSet rs = dataOperation.executeQuery(sql, new String[]{zone_id});
			try {
				while(rs.next()){
					StructInformation sf = new StructInformation();
					sf.setStruct_id(rs.getString("bridge_id"));
					sf.setStruct_name(rs.getString("bridge_name"));
					sf.setHighway_id(rs.getString("highway_id"));
					sf.setHighway_name(rs.getString("highway_name"));
					sf.setManage_name(rs.getString("org_name"));
					sf.setStruct_mode("bridge");
					ll.add(sf);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		 return ll;
	}
	public static void main(String[] args){
		new Thread(new AutoBuildDailyProject()).start();
	}
}

	 