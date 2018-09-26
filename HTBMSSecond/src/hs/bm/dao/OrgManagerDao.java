package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import hs.bm.bean.SysUsrUsrInfo;
import hs.bm.vo.BrgCardInfoVO;
import hs.bm.vo.CheckPeopleVo;
import hs.bm.vo.OrgInfo;
import hs.bm.vo.OrgTechZone;
import hs.bm.vo.OrgUserInfo;
import hs.bm.vo.StructInformation;
import hs.bm.vo.ZoneInfo;

public class OrgManagerDao
{
	private static String defaultTech_section = "工程技术部";
	private static String defaultZone_name = "分区1";
	private static String defaultChargeMan_name = "桥梁主管";
	private static String defaultEngineer = "工程师";
	private static String defaultDuty = "负责人";
	private static String testingCompanyId = "0000#0000#0000";
	private static String testingCompanyName = "检测公司";
	private static OrgManagerDao oRGInfoDao;

	public static OrgManagerDao getInstance()
	{
		if (oRGInfoDao == null)
		{
			oRGInfoDao = new OrgManagerDao();
		}
		return oRGInfoDao;
	}

	public List<OrgInfo> getCompanyNames(String org_id)
	{
		String sql = "";
		String[] params = null;
		if(org_id != null && !org_id.equals("")){
			sql = " SELECT * from sys_org_info WHERE org_id=?  ";
			params =new String[]{
					org_id
			};
		}else{
			sql = " SELECT * from sys_org_info  ";
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, params);

		List<OrgInfo> oril = new ArrayList<OrgInfo>();
		try
		{
			while (rs.next())
			{
				OrgInfo ori = new OrgInfo();
				ori.setOrg_id(rs.getString("org_id"));
				ori.setOrg_name(rs.getString("org_name"));
				ori.setTech_section_id(rs.getString("tech_section_id"));
				ori.setTech_section(rs.getString("tech_section"));
				ori.setOrg_name_short(rs.getString("org_name_short"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public List<OrgInfo> getTechName(String org_id)
	{
		String sql = "SELECT tech_section_id,tech_section from sys_org_info where org_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ org_id });
		List<OrgInfo> oril = new ArrayList<OrgInfo>();
		try
		{
			while (rs.next())
			{
				OrgInfo ori = new OrgInfo();
				ori.setTech_section_id(rs.getString("tech_section_id"));
				ori.setTech_section(rs.getString("tech_section"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public List<ZoneInfo> getZoneInfo(String org_id)
	{
		String sql = "SELECT * from sys_zone_info where org_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ org_id });
		List<ZoneInfo> oril = new ArrayList<ZoneInfo>();
		try
		{
			while (rs.next())
			{
				ZoneInfo ori = new ZoneInfo();
				ori.setZone_id(rs.getString("zone_id"));
				ori.setZone_name(rs.getString("zone_name"));
				ori.setEngineer_name(rs.getString("engineer_name"));
				ori.setDutyman_name(rs.getString("dutyman_name"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public List<ZoneInfo> getJobInfo(String department_id)
	{
		String sql = "SELECT * from sys_zone_info where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ department_id });
		List<ZoneInfo> oril = new ArrayList<ZoneInfo>();
		try
		{
			while (rs.next())
			{

				ZoneInfo ori = new ZoneInfo();
				ori.setEngineer_name(rs.getString("engineer_name"));
				ori.setDutyman_name(rs.getString("dutyman_name"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public int addCompany(String org_name, String org_name_short, String section_name, String org_id)
	{
		
		String[]	arr = section_name.split(",");
		// 获取本次id
		String id = getTheId();
		String section_id = UUID.randomUUID().toString();
		String tech_section_id = getDefaultTech_section_id(id);
		String zone_id = getDefaultZone_id(id);
		String sql = "insert into sys_org_info(org_id,org_name,org_name_short,tech_section,tech_section_id,chargeman_name) values(?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ org_id, org_name, org_name_short, defaultTech_section, tech_section_id,  defaultChargeMan_name });
		if (i > 0)
		{  
			for(int j=0;j<arr.length;j++){
				String section_name1=arr[j];
			i=addSection(section_name1,org_id);
			if(i<=0){
				return i;
			}
			}
		
			i = addZone(zone_id, org_id);
		
		}
		dataOperation.close();
		return i;
	}

	private int addSection(String section_name, String org_id) {
		String section_id = UUID.randomUUID().toString();
		String sql = "insert into sys_section_info(section_id,section_name,org_id) values(?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ section_id, section_name,org_id });
		dataOperation.close();
		return i;
	}
	
	
	
	//@author xianing
	public int addUserCount(String user_name,String user_pwd,String user_role,String sign_path, String org_usr_id) {
		String sql = "insert into sys_usr_usr_info(usr_name,usr_pwd,usr_role,sign_path,org_usr_id) values(?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{user_name,user_pwd,user_role,sign_path,org_usr_id});
		dataOperation.close();
		return i;
	}

	public String getOrg_id()
	{
		String id = getTheId();
		String org_id = getDefaultOrg_id(id);
		return org_id;
	}

	private int addZone(String zone_id, String org_id)
	{
		String sql = "insert into sys_zone_info(zone_id,org_id,zone_name,engineer_name,dutyman_name) values(?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ zone_id, org_id, defaultZone_name, defaultEngineer, defaultDuty });
		dataOperation.close();
		return i;
	}

	private String getDefaultZone_id(String id)
	{
		String zone_id = "#0001#0001";
		if (id != null)
		{
			zone_id = id + zone_id;
		} else
		{
			zone_id = "0001" + zone_id;
		}
		return zone_id;
	}

	private String getDefaultTech_section_id(String id)
	{
		String tech_section_id = "#0001#0000";
		if (id != null)
		{
			tech_section_id = id + tech_section_id;
		} else
		{
			tech_section_id = "0001" + tech_section_id;
		}
		return tech_section_id;
	}

	private String getTheId()
	{
		String sql = "select * from sys_org_info ORDER BY org_id DESC limit 1";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, null);

		String id = null;
		try
		{
			while (rs.next())
			{
				id = rs.getString("org_id");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return getIdPlus(id, 1);
	}

	public String getIdPlus(String id, int type)
	{
		if (id != null)
		{
			String id1;
			if (type == 1)
			{
				id1 = id.substring(0, 4);
			} else if (type == 2)
			{
				id1 = id.substring(5, 9);
			} else
			{
				id1 = id.substring(10, 14);
			}
			int i = Integer.parseInt(id1);
			i++;
			id1 = String.valueOf(i);
			int length = id1.length();
			for (int j = 4; j > length; j--)
			{
				id1 = "0" + id1;
			}
			return id1;
		} else
			return id;
	}

	public String getDefaultOrg_id(String id)
	{
		String org_id = "#0000#0000";
		if (id != null)
		{
			org_id = id + org_id;
		} else
		{
			org_id = "0001" + org_id;
		}
		return org_id;
	}

	public int addZoneSingle(String zone_id1, String zone_id, String zone_name)
	{
		// 获取最大分区
		String sql = "insert into sys_zone_info(zone_id,org_id,zone_name,engineer_name,dutyman_name) select ?,org_id,?,?,? from sys_zone_info where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ zone_id1, zone_name, defaultEngineer, defaultDuty, zone_id });
		dataOperation.close();
		return i;
	}

	public String getZoneAddId(String zone_id)
	{
		String org_id = zone_id.substring(0, 4) + "#0000#0000";
		String zone_id1 = getZone_id(org_id);
		zone_id1 = zone_id.substring(0, 10) + zone_id1;
		return zone_id1;
	}

	private String getZone_id(String org_id)
	{
		String sql = "select * from sys_zone_info where org_id=? ORDER BY zone_id DESC limit 1";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ org_id });
		String id = null;
		try
		{
			while (rs.next())
			{
				id = rs.getString("zone_id");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return getIdPlus(id, 3);
	}

	public int addUser(String add_usr_name, String phone_no, String qq_no, String email_no, String add_usr_position, String department_id, String org_usr_id)
	{
		String sql = "insert into sys_org_usr_info(org_usr_id,org_usr_name,e_mail,qq,phone_no,department_id,job_name) values(?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{org_usr_id, add_usr_name, email_no, qq_no, phone_no, department_id, add_usr_position});
		dataOperation.close();
		return i;
	}

	public List<OrgUserInfo> getPersonInfo(String department_id)
	{
		String sql = "SELECT * from sys_org_usr_info where department_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ department_id });
		List<OrgUserInfo> oril = new ArrayList<OrgUserInfo>();
		try
		{
			while (rs.next())
			{
				OrgUserInfo ori = new OrgUserInfo();
				ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setJob_name(rs.getString("job_name"));
				ori.setOrg_usr_id(rs.getString("org_usr_id"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public List<OrgInfo> getEditCompanyInfo(String org_id)
	{
		String sql = "SELECT * from sys_org_info where org_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ org_id });
		List<OrgInfo> oril = new ArrayList<OrgInfo>();
		try
		{
			while (rs.next())
			{
				OrgInfo ori = new OrgInfo();
				ori.setOrg_name(rs.getString("org_name"));
				ori.setTech_section(rs.getString("tech_section"));
				ori.setOrg_name_short(rs.getString("org_name_short"));
				//ori.setSection_name(rs.getString("section_name"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		String[] section_nameInfo=getEditSection(org_id);
 			oril.get(0).setSection_name(section_nameInfo[0]);
			oril.get(0).setSection_id(section_nameInfo[1]);
		return oril;
	}

	private String[] getEditSection(String org_id) {
		String section_name="";
		String section_id="";
		int i=0;
		String sql = "SELECT * from sys_section_info where org_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ org_id });
	
		try
		{
			while (rs.next())
			{
				if(i==0){
					
					section_name=rs.getString("section_name");
					section_id=rs.getString("section_id");
				}
				else{
					section_name=section_name+","+rs.getString("section_name");
					section_id=section_id+","+rs.getString("section_id");
				}
				i++;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		//System.out.println(section_name);
		String[] rsSection={section_name,section_id};
		return rsSection;
	}

	public int editCompany(String org_id, String org_name, String tech_section, String section_name, String section_id)
	{
		String sql = "update sys_org_info set org_name=?,tech_section=? where org_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ org_name, tech_section,  org_id });
		dataOperation.close();
		//编辑下辖路段
		if(i>=0){
			String[] arr=section_name.split(",");
			String[] brr=section_id.split(",");
			int length=brr.length;
			for(int ii=0;ii<length;ii++){
		   i=updateSectionName(arr[ii],brr[ii]);	
		   if(i<0){
			   return i;
		   }
			}
			//添加新增的section
		for(int jj=length;jj<arr.length;jj++){
			i=addSection(arr[jj],org_id);
		}
		}
		return i;
	}

	private int updateSectionName(String section_name, String section_id) {

		String sql = "update sys_section_info set section_name=? where section_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{section_name,section_id});
		dataOperation.close();
		
		return i;
	}
	
	public int updateCheckPeople(String zone_id, String checkPeople) {

		String sql = "update sys_zone_info set check_people=? where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{checkPeople,zone_id});
		dataOperation.close();
		
		return i;
	}

	public int deleteCompany(String org_id)
	{
		// 删除人员表
		String sql = "delete from sys_org_usr_info where department_id in(select zone_id from sys_zone_info where org_id=?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ org_id });
		dataOperation.close();
		if (i >= 0)
		{
			// 删除分区表
			i = delZone(org_id);
			if (i > 0)
			{
			
				// 删除公司
				i = delCompany(org_id);
			}
		}
		return i;
	}

	private int delCompany(String org_id)
	{
		
		String sql = "delete a.*,b.* from sys_org_info a,sys_section_info b where a.org_id =b.org_id and a.org_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ org_id });
		dataOperation.close();
		return i;
	}

	private int delZone(String org_id)
	{
		String sql = "delete  from sys_zone_info where org_id =?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ org_id });
		dataOperation.close();
		return i;
	}

	public List<OrgInfo> getTechJobInfo(String tech_section_id)
	{
		String sql = "SELECT * from sys_org_info where tech_section_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ tech_section_id });
		List<OrgInfo> oril = new ArrayList<OrgInfo>();
		try
		{
			while (rs.next())
			{
				OrgInfo ori = new OrgInfo();
				ori.setChargeman_name(rs.getString("chargeman_name"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public int editTechJob(String id, String tech_section)
	{
		// org_info表修改
		String sql = "update sys_org_info set chargeman_name=? where tech_section_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ tech_section, id });
		dataOperation.close();
		if (i > 0)
		{
			// 修改person表
			i = editTechPerson(id, tech_section);
		}
		return i;
	}

	private int editTechPerson(String id, String tech_section)
	{
		String sql = "update sys_org_usr_info set job_name=? where department_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ tech_section, id });
		dataOperation.close();
		return i;
	}

	public int editSectionJob(String id, String duty_new, String engineer_new, String duty_old, String engineer_old)
	{
		// zone_info表修改
		String sql = "update sys_zone_info set engineer_name=?,dutyman_name=? where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ engineer_new, duty_new, id });
		dataOperation.close();
		if (i > 0)
		{
			// 修改person表
			if (getZoneToUser(id) > 0)
			{
				i = editSectionPerson(id, duty_new, engineer_new, duty_old, engineer_old);
			}
		}
		return i;
	}

	private int editSectionPerson(String id, String duty_new, String engineer_new, String duty_old, String engineer_old)
	{
		String sql = "update sys_org_usr_info set job_name =(case job_name when ? then ? when ? then ? else job_name end ) where department_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ duty_old, duty_new, engineer_old, engineer_new, id });
		dataOperation.close();
		return i;
	}

	public List<OrgUserInfo> getEditUsr(String usr_id)
	{
		String sql = "SELECT * from sys_org_usr_info where org_usr_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ usr_id });
		List<OrgUserInfo> oril = new ArrayList<OrgUserInfo>();
		try
		{
			while (rs.next())
			{
				OrgUserInfo ori = new OrgUserInfo();
				// ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setJob_name(rs.getString("job_name"));
				ori.setE_mail(rs.getString("e_mail"));
				ori.setPhone_no(rs.getString("phone_no"));
				ori.setQq(rs.getString("qq"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}
	
	public List<SysUsrUsrInfo> getEditUsrCount(String usr_id)
	{
		String sql = "SELECT * from sys_usr_usr_info where org_usr_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ usr_id });
		List<SysUsrUsrInfo> oril = new ArrayList<SysUsrUsrInfo>();
		try
		{
			while (rs.next())
			{
				
				SysUsrUsrInfo ori = new SysUsrUsrInfo();
				// ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setUsr_name(rs.getString("usr_name"));
				ori.setUsr_pwd(rs.getString("usr_pwd"));
				ori.setUsr_role(rs.getString("usr_role"));
				ori.setSign_path(rs.getString("sign_path"));
				ori.setOrg_usr_id(rs.getString("org_usr_id"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}
	
	public List<CheckPeopleVo> getCheckPeople(String zone_id)
	{
		
		String checkPeople  = getCheckPeopleByZoneId(zone_id).toString();
		String sql = "SELECT * from sys_usr_usr_info ";
		String checkName;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql,null);
		List<CheckPeopleVo> suui = new ArrayList<CheckPeopleVo>();
		try
		{
			while (rs.next())
			{
				CheckPeopleVo ori = new CheckPeopleVo();
				
				checkName = rs.getString("usr_name");
				ori.setUsr_name(rs.getString("usr_name"));
				if(checkPeople.contains(checkName)){
					ori.setState(true);
				}else{
					ori.setState(false);
				}
				ori.setUsr_pwd(rs.getString("usr_pwd"));
				ori.setUsr_role(rs.getString("usr_role"));
				ori.setSign_path(rs.getString("sign_path"));
				ori.setOrg_usr_id(rs.getString("org_usr_id"));
				suui.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return suui;
	}
	
	public List<String> getCheckPeopleByZoneId(String zone_id)
	{
		
		String sql = "SELECT check_people from sys_zone_info where zone_id = ?  ";
		
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql,new String[]
				{zone_id});
		List<String> suui = new ArrayList<String>();
		try
		{
            
			while (rs.next())
			{ 
				String checkPeople = rs.getString("check_people"); 
				suui.add(checkPeople);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return suui;
	}
	

	public int editUsr(String usr_id, String usr_name_new, String e_mail_new, String qq_new, String phone_no_new, String job_new)
	{
		String sql = "update sys_org_usr_info set org_usr_name=?,e_mail=?,qq=?,phone_no=?,job_name=? where org_usr_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ usr_name_new, e_mail_new, qq_new, phone_no_new, job_new, usr_id });
		dataOperation.close();
		return i;
	}

	public int deleteUsr(String usr_id)
	{
		int j=-1;
		j=deleteAccount(usr_id);
		if(j>=0){
		String sql = "delete from sys_org_usr_info where org_usr_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ usr_id });
		dataOperation.close();
		return i;
		}
		else{
			//System.out.println("删除账号出错");
			return j;
		}
	}

	private int deleteAccount(String usr_id) {
		String sql = "delete from sys_usr_usr_info where org_usr_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ usr_id });
		dataOperation.close();
		return i;
	}

	public int editSection(String zone_id, String zone_name_new)
	{
		String sql = "update sys_zone_info set zone_name=? where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ zone_name_new, zone_id });
		dataOperation.close();
		return i;
	}

	public int deleteSection(String zone_id, int count)
	{
		// 查询数据库还有几个分区
		int i = -1;
		// 大于1
		if (count > 1)
		{
			i = toDeleteSection(zone_id);
		}
		// 等于1
		else if (count == 1)
		{
			// 删除人员
			i = deleteusrByZone(zone_id);
			// 默认分区
			if (i >= 0)
			{
				i = toDefaultZone(zone_id);
				if (i >= 0 && getZoneToUser(zone_id) > 0)
				{
					i = deleteusrByZone(zone_id);
				}
			}
		}
		return i;
	}

	private int toDefaultZone(String zone_id)
	{
		String sql = "update sys_zone_info set zone_name=?,engineer_name=?,dutyman_name=? where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ defaultZone_name, defaultEngineer, defaultDuty, zone_id });
		dataOperation.close();
		return i;
	}

	private int deleteusrByZone(String zone_id)
	{
		String sql = "delete from sys_org_usr_info where department_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ zone_id });
		dataOperation.close();
		return i;
	}

	private int toDeleteSection(String zone_id)
	{
		int count = getZoneToUser(zone_id);
		int i = count;
		String sql = " delete a.*,b.* from sys_zone_info a,sys_org_usr_info b where a.zone_id=b.department_id and a.zone_id=? ";
		if (count == 0)
		{
			sql = "delete from sys_zone_info where zone_id=?";
		}
		;
		if (i != -1)
		{
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
			i = dataOperation.executeUpdate(sql, new String[]
			{ zone_id });
			dataOperation.close();
		}
		return i;
	}

	private int getZoneToUser(String zone_id)
	{
		String sql = "select count(*) a from sys_org_usr_info where department_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ zone_id });
		int count = -1;
		String countS = null;
		try
		{
			while (rs.next())
			{
				countS = rs.getString("a");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		if (countS != null)
		{
			count = Integer.parseInt(countS);
		}
		return count;
	}

	public int getZoneNumbers(String zone_id)
	{
		zone_id = zone_id.substring(0, 10);
		zone_id = zone_id + "%";
		String sql = " select count(zone_id) a from sys_zone_info where zone_id like ? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ zone_id });
		int count = -1;
		String countS = null;
		try
		{
			while (rs.next())
			{
				countS = rs.getString("a");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		if (countS != null)
		{
			count = Integer.parseInt(countS);
		}
		return count;
	}

	public List<StructInformation> getStructByid(String id)
	{
		String id1 = id.substring(10, 14);
		int i = Integer.parseInt(id1);
		List<StructInformation> oril = new ArrayList<StructInformation>();
		if (i != 0)
		{
			oril = getStructByZone_id1(id);
			oril.addAll(getStructByZone_id2(id));
			oril.addAll(getStructByZone_id3(id));
		} else
		{
			oril = getStructByOrg_id1(id);
			oril.addAll(getStructByOrg_id2(id));
			oril.addAll(getStructByOrg_id3(id));
		}
		return oril;
	}
	// 桥表
	private List<StructInformation> getStructByOrg_id1(String id)
	{
		id = id.substring(0, 4) + "#0000#0000";
		String sql = "SELECT a.bridge_id,b.highway_name,a.bridge_no,a.bridge_name from brg_card_admin_id a,dic_hw_info b where a.manage_id=? and a.highway_id=b.highway_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ id });
		List<StructInformation> oril = new ArrayList<StructInformation>();
		try
		{
			while (rs.next())
			{
				StructInformation ori = new StructInformation();
				// ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setStruct_id(rs.getString("bridge_id"));
				ori.setHighway_name(rs.getString("highway_name"));
				ori.setStruct_no(rs.getString("bridge_no"));
				ori.setStruct_name(rs.getString("bridge_name"));
				ori.setStruct_mode("bridge");
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	private List<StructInformation> getStructByZone_id1(String id)
	{
		String sql = "SELECT a.bridge_id,b.highway_name,a.bridge_no,a.bridge_name from brg_card_admin_id a,dic_hw_info b where a.zone_id=? and a.highway_id=b.highway_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ id });
		List<StructInformation> oril = new ArrayList<StructInformation>();
		try
		{
			while (rs.next())
			{
				StructInformation ori = new StructInformation();
				// ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setStruct_id(rs.getString("bridge_id"));
				ori.setHighway_name(rs.getString("highway_name"));
				ori.setStruct_no(rs.getString("bridge_no"));
				ori.setStruct_name(rs.getString("bridge_name"));
				ori.setStruct_mode("bridge");
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	// 涵洞表
	private List<StructInformation> getStructByOrg_id2(String id)
	{
		id = id.substring(0, 4) + "#0000#0000";
		String sql = "SELECT a.culvert_id,b.highway_name,a.culvert_no,a.culvert_name from cul_info a,dic_hw_info b where a.manage_id=? and a.highway_id=b.highway_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ id });

		List<StructInformation> oril = new ArrayList<StructInformation>();
		try
		{
			while (rs.next())
			{
				StructInformation ori = new StructInformation();
				// ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setStruct_id(rs.getString("culvert_id"));
				ori.setHighway_name(rs.getString("highway_name"));
				ori.setStruct_no(rs.getString("culvert_no"));
				ori.setStruct_name(rs.getString("culvert_name"));
				ori.setStruct_mode("culvert");
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	private List<StructInformation> getStructByZone_id2(String id)
	{
		String sql = "SELECT a.culvert_id,b.highway_name,a.culvert_no,a.culvert_name from cul_info a,dic_hw_info b where a.zone_id=? and a.highway_id=b.highway_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ id });
		List<StructInformation> oril = new ArrayList<StructInformation>();
		try
		{
			while (rs.next())
			{
				StructInformation ori = new StructInformation();
				// ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setStruct_id(rs.getString("culvert_id"));
				ori.setHighway_name(rs.getString("highway_name"));
				ori.setStruct_no(rs.getString("culvert_no"));
				ori.setStruct_name(rs.getString("culvert_name"));
				ori.setStruct_mode("culvert");
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	// 通道表
	private List<StructInformation> getStructByOrg_id3(String id)
	{
		id = id.substring(0, 4) + "#0000#0000";
		String sql = "SELECT a.pass_id,b.highway_name,a.pass_no,a.pass_name from pass_info a,dic_hw_info b where a.manage_id=? and a.highway_id=b.highway_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ id });
		List<StructInformation> oril = new ArrayList<StructInformation>();
		try
		{
			while (rs.next())
			{
				StructInformation ori = new StructInformation();
				// ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setStruct_id(rs.getString("pass_id"));
				ori.setHighway_name(rs.getString("highway_name"));
				ori.setStruct_no(rs.getString("pass_no"));
				ori.setStruct_name(rs.getString("pass_name"));
				ori.setStruct_mode("pass");
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	private List<StructInformation> getStructByZone_id3(String id)
	{
		String sql = "SELECT a.pass_id,b.highway_name,a.pass_no,a.pass_name from pass_info a,dic_hw_info b where a.zone_id=? and a.highway_id=b.highway_id";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ id });
		List<StructInformation> oril = new ArrayList<StructInformation>();
		try
		{
			while (rs.next())
			{
				StructInformation ori = new StructInformation();
				// ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setStruct_id(rs.getString("pass_id"));
				ori.setHighway_name(rs.getString("highway_name"));
				ori.setStruct_no(rs.getString("pass_no"));
				ori.setStruct_name(rs.getString("pass_name"));
				ori.setStruct_mode("pass");
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public List<OrgTechZone> getPartAndZone(String org_id) {
		String sql = " select * from sys_org_info a,sys_zone_info b where a.org_id=b.org_id and a.org_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ org_id });
		List<OrgTechZone> oril = new ArrayList<OrgTechZone>();
		try
		{
			while (rs.next())
			{
				OrgTechZone ori = new OrgTechZone();
				// ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setChargeman_name(rs.getString("chargeman_name"));
				ori.setDutyman_name(rs.getString("dutyman_name"));
				ori.setEngineer_name(rs.getString("engineer_name"));
				ori.setTech_section(rs.getString("tech_section"));
				ori.setTech_section_id(rs.getString("tech_section_id"));
				ori.setZone_id(rs.getString("zone_id"));
				ori.setZone_name(rs.getString("zone_name"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public List<OrgUserInfo> account_getPersons(String id, String job) {
		String sql = "select * from sys_org_usr_info where department_id=? and job_name=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ id,job });
		List<OrgUserInfo> oril = new ArrayList<OrgUserInfo>();
		try
		{
			while (rs.next())
			{
				OrgUserInfo ori = new OrgUserInfo();
				ori.setOrg_usr_id(rs.getString("org_usr_id"));
				ori.setOrg_usr_name(rs.getString("org_usr_name"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public List<OrgInfo> getCompanyName(String username, String identity) {
		List<OrgInfo> oril = new ArrayList<OrgInfo>();
		if(identity.equals("orgAdmin")){
			oril=getOrgAdminCompanyName(username);
		}
		else{
		String sql = " select department_id from sys_org_usr_info where org_usr_id=(select org_usr_id from sys_usr_usr_info where usr_name=?) ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{username});
		String departemnt_id=null;
	
		try
		{
			while (rs.next())
			{
				departemnt_id=rs.getString("department_id");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		if(departemnt_id==null){
			OrgInfo ori = new OrgInfo();
			ori.setOrg_id(testingCompanyId);
			ori.setOrg_name(testingCompanyName);
			oril.add(ori);
		}
		else{
			oril=getComanyNameByDepartmentId(departemnt_id);
		}
		}
		return oril;
	}

	private List<OrgInfo> getOrgAdminCompanyName(String username) {
		String sql = "select * from sys_org_info where org_id=(select department_id from sys_usr_usr_info a left join sys_org_usr_info b on a.org_usr_id = b.org_usr_id where usr_name=?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{username});

		List<OrgInfo> oril = new ArrayList<OrgInfo>();
		try
		{
			while (rs.next())
			{
				OrgInfo ori = new OrgInfo();
				ori.setOrg_id(rs.getString("org_id"));
				ori.setOrg_name(rs.getString("org_name"));
				ori.setTech_section_id(rs.getString("tech_section_id"));
				ori.setTech_section(rs.getString("tech_section"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	private List<OrgInfo> getComanyNameByDepartmentId(String departemnt_id) {
		departemnt_id=departemnt_id.substring(0, 4)+"%";
		String sql = "SELECT * from sys_org_info where org_id like ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{departemnt_id});

		List<OrgInfo> oril = new ArrayList<OrgInfo>();
		try
		{
			while (rs.next())
			{
				OrgInfo ori = new OrgInfo();
				ori.setOrg_id(rs.getString("org_id"));
				ori.setOrg_name(rs.getString("org_name"));
				ori.setTech_section_id(rs.getString("tech_section_id"));
				ori.setTech_section(rs.getString("tech_section"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public int setZoneBuild_prj(String build_prj,String zone_id) {

		String sql = "update sys_zone_info set build_prj=? where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ build_prj,zone_id });
		dataOperation.close();
		return i;
	}

	public List<ZoneInfo> getBuild_prj(String zone_id) {
		String sql = "SELECT build_prj from sys_zone_info where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ zone_id });
		List<ZoneInfo> oril = new ArrayList<ZoneInfo>();
		try
		{
			while (rs.next())
			{
				ZoneInfo ori = new ZoneInfo();
				ori.setBuild_prj(rs.getString("build_prj"));
				
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public List<OrgUserInfo> getZoneIdByUsr_id(String usr_id) {
		String sql = "select department_id from sys_org_usr_info where org_usr_id=(select org_usr_id from sys_usr_usr_info where usr_id=?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ usr_id });
		List<OrgUserInfo> oril = new ArrayList<OrgUserInfo>();
		try
		{
			while (rs.next())
			{
				OrgUserInfo ori = new OrgUserInfo();
				ori.setDepartment_id(rs.getString("department_id"));
				
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

	public int deleteSectionBySectionId(String sectionId) {
		String sql = "delete  from sys_section_info where section_id =?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ sectionId });
		dataOperation.close();
		return i;
	}

	public int checkMember(String zone_id) {
		System.out.println(zone_id);
		int i=-1;
		String org_usr_id_dutyman=null;
		String org_usr_id_engineer=null;
		//获取job_name
		ZoneInfo ori=new ZoneInfo();
		ori=getJobNames(zone_id);
		//判断有没有负责人
		org_usr_id_dutyman=getMans(zone_id,ori.getDutyman_name());
		if(org_usr_id_dutyman==null){
			i=1;
		}
		else {
			org_usr_id_engineer=getMans(zone_id,ori.getEngineer_name());
			if(org_usr_id_engineer==null){
				i=2;
			}
		}
		//判断账户
		if(org_usr_id_dutyman!=null&&org_usr_id_engineer!=null){
			//判断有没有责任人账号
			if(getAccounts(org_usr_id_dutyman)==null){
				i=3;
			}
			else if(getAccounts(org_usr_id_engineer)==null){
				i=4;
			}
			else{
				i=0;
			}
		}
		return i;
	}


	private String getAccounts(String org_usr_id_dutyman) {
		String flag=null;
		String[] arr=org_usr_id_dutyman.split(",");
		for(int i=0;i<arr.length;i++){
			flag=getName(arr[i]);
			if(flag!=null) break;
		}
		return flag;
		
	}

	private String getName(String org_usr_id) {
		String sql = "select usr_name from sys_usr_usr_info where org_usr_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ org_usr_id});
		String names=null;
		
		try
		{
			while (rs.next())
			{
			
				names=rs.getString("usr_name");
		break;
			
			
			}
		
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return names;
	}

	private String getMans(String zone_id, String name) {
		String sql = "select org_usr_id from sys_org_usr_info where department_id=? and job_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ zone_id, name});
		String names=null;
		int i=0;
		try
		{
			while (rs.next())
			{
			if(i==0)	{
				names=rs.getString("org_usr_id");
			}
			else{
				names=","+rs.getString("org_usr_id");
			}
			}
			i++;
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return names;
	}

	private ZoneInfo getJobNames(String zone_id) {
		String sql = "select dutyman_name,engineer_name from sys_zone_info where zone_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ zone_id });
		ZoneInfo ori=new ZoneInfo();
		try
		{
			while (rs.next())
			{
				ori.setDutyman_name(rs.getString("dutyman_name"));
				ori.setEngineer_name(rs.getString("engineer_name"));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return ori;
	}

	

}
