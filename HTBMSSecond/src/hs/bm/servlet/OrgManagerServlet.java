package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import hs.bm.bean.SysUsrUsrInfo;
import hs.bm.dao.LogDao;
import hs.bm.dao.OrgManagerDao;
import hs.bm.dao.StructMgrDao;
import hs.bm.dao.UserDao;
import hs.bm.vo.BrgCardInfoVO;
import hs.bm.vo.CheckPeopleVo;
import hs.bm.vo.OrgInfo;
import hs.bm.vo.OrgTechZone;
import hs.bm.vo.OrgUserInfo;
import hs.bm.vo.ResObj;
import hs.bm.vo.StructInformation;
import hs.bm.vo.StructSearch;
import hs.bm.vo.SysUsrPassRoleVo;
import hs.bm.vo.ZoneInfo;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class ORGManagerServlet
 */
public class OrgManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrgManagerServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type"); 
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		if(type.equals("selectCompany")){
			String org_id = request.getParameter("org_id");
			if(org_id==null||org_id.equals("null")){
				org_id=null;
			}
			List<OrgInfo> oi = OrgManagerDao.getInstance().getCompanyNames(org_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("selectTech")){
			//System.out.println("selectTech");
			String org_id = request.getParameter("org_id"); 
			List<OrgInfo> oi = OrgManagerDao.getInstance().getTechName(org_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("zoneinfo")){
			//System.out.println("zoneinfo-In");
			String org_id = request.getParameter("org_id"); 
			List<ZoneInfo> oi = OrgManagerDao.getInstance().getZoneInfo(org_id);
			List<OrgInfo> oi1 = OrgManagerDao.getInstance().getCompanyNames(org_id);
			JSONObject obj = new JSONObject();
			obj.put("companyInfo", oi1.get(0));
			obj.put("zoneInfo",oi);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(obj);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("getJob")){
			//System.out.println("getJob-In");
			String department_id = request.getParameter("department_id"); 
			List<ZoneInfo> oi = OrgManagerDao.getInstance().getJobInfo(department_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("addCompany")){
			try {
				String org_name = request.getParameter("org_name"); 
				String org_name_short = request.getParameter("org_name_short"); 
				String section_name = request.getParameter("section_name"); 
				String org_id=OrgManagerDao.getInstance().getOrg_id();
				int i=OrgManagerDao.getInstance().addCompany(org_name,org_name_short,section_name,org_id);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setObj(org_id);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"增加成功", "OrgManagerServlet+addCompany","addCompany");
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "OrgManagerServlet+addCompany",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("addZone")){
			//System.out.println("addZone-In");
			String zone_id = request.getParameter("zone_id"); 
			String zone_name = request.getParameter("zone_name");  
			String zoneAddId=OrgManagerDao.getInstance().getZoneAddId(zone_id);
			try {
				int i=OrgManagerDao.getInstance().addZoneSingle(zoneAddId,zone_id,zone_name);
				//System.out.println(i);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setObj(zoneAddId);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"增加成功", "OrgManagerServlet+addZone","addZone");
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "OrgManagerServlet+addZone",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("addUser")){
			//System.out.println("addUser-In");
			String add_usr_name = request.getParameter("add_usr_name"); 
			String phone_no = request.getParameter("phone_no");  
			String qq_no = request.getParameter("qq_no"); 
			String email_no = request.getParameter("email_no");  
			String add_usr_position = request.getParameter("add_usr_position"); 
			String department_id = request.getParameter("department_id");
			String org_usr_id=UUID.randomUUID().toString();
			try {
				int i=OrgManagerDao.getInstance().addUser(add_usr_name,phone_no,qq_no,email_no,add_usr_position,department_id,org_usr_id);
				//System.out.println(i);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setObj(org_usr_id);
						ro.setSuccess("success");
				}else{
					ro.setError(1);
				}
				LogDao.getInstance().addLogInfo(log_user,"增加成功", "OrgManagerServlet+addUser","addUser");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "OrgManagerServlet+addUser",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("getPerson")){
			//System.out.println("getPerson-In");
			UserDao ud = new UserDao();
			String department_id = request.getParameter("department_id"); 
			List<OrgUserInfo> oi = OrgManagerDao.getInstance().getPersonInfo(department_id);
			
			List<SysUsrPassRoleVo> ll = ud.getKeepingCompanyTableByDepartmentId(department_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("getEditCompany")){
			//System.out.println("getEditCompany-In");
			String org_id = request.getParameter("org_id"); 
			List<OrgInfo> oi = OrgManagerDao.getInstance().getEditCompanyInfo(org_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("editCompany")){
			//System.out.println("editCompany-In");
			String org_id = request.getParameter("org_id"); 
			String org_name = request.getParameter("org_name");  
			String tech_section = request.getParameter("tech_section"); 
			String section_name= request.getParameter("section_name");
			String section_id= request.getParameter("section_id");
			//System.out.println(section_name+"  "+section_id);
			try {
				int i=OrgManagerDao.getInstance().editCompany(org_id,org_name,tech_section,section_name,section_id);
				//System.out.println(i);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
				}else{
					ro.setError(1);
				}
				LogDao.getInstance().addLogInfo(log_user,"修改成功", "OrgManagerServlet+editCompany","editCompany");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "OrgManagerServlet+editCompany",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("deleteCompany")){
			//System.out.println("deleteCompany-In");
			String org_id = request.getParameter("org_id"); 
			try {
				int i=OrgManagerDao.getInstance().deleteCompany(org_id);
				//System.out.println(i);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
				}else{
					ro.setError(1);
				}
				LogDao.getInstance().addLogInfo(log_user,"删除成功", "OrgManagerServlet+deleteCompany","deleteCompany");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "OrgManagerServlet+deleteCompany",e.getMessage());
			}
			ro.ToJsp(response);
			return;
			
		}
		else if(type.equals("getTechJob")){
			//System.out.println("getTechJob-In");
			String tech_section_id = request.getParameter("tech_section_id"); 
			List<OrgInfo> oi = OrgManagerDao.getInstance().getTechJobInfo(tech_section_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("editTechJob")){
			//System.out.println("editTechJob-In");
			String id = request.getParameter("id");
			String tech_section=request.getParameter("tech_section");
			try {
				int i=OrgManagerDao.getInstance().editTechJob(id,tech_section);
				//System.out.println(i);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
				}else{
					ro.setError(1);
				}
				LogDao.getInstance().addLogInfo(log_user,"修改成功", "OrgManagerServlet+editTechJob","editTechJob");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "OrgManagerServlet+editTechJob",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("editSectionJob")){
			//System.out.println("editSectionJob-In");
			String id = request.getParameter("id");
			String duty_new=request.getParameter("duty_new");
			String engineer_new=request.getParameter("engineer_new");
			//System.out.println(engineer_new);
			String duty_old=request.getParameter("duty_old");
			String engineer_old=request.getParameter("engineer_old");
			try {
				int i=OrgManagerDao.getInstance().editSectionJob(id,duty_new,engineer_new,duty_old,engineer_old);
				//System.out.println(i);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"修改成功", "OrgManagerServlet+editSectionJob","editSectionJob");
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "OrgManagerServlet+editSectionJob",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("getEditUsr")){
			//System.out.println("getEditUsr-In");
			String usr_id = request.getParameter("usr_id"); 
			List<OrgUserInfo> oi = OrgManagerDao.getInstance().getEditUsr(usr_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("editUsr")){
			//System.out.println("editUsr-In");
			String usr_id = request.getParameter("usr_id");
			String usr_name_new=request.getParameter("usr_name_new");
			String e_mail_new=request.getParameter("e_mail_new");
			String qq_new=request.getParameter("qq_new");
			String phone_no_new=request.getParameter("phone_no_new");
			String job_new=request.getParameter("job_new");
			try {
				int i=OrgManagerDao.getInstance().editUsr(usr_id,usr_name_new,e_mail_new,qq_new,phone_no_new,job_new);
				//System.out.println(i);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
				}else{
					ro.setError(1);
				}
				LogDao.getInstance().addLogInfo(log_user,"修改成功", "OrgManagerServlet+editUsr","editUsr");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "OrgManagerServlet+editUsr",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("deleteUsr")){
			String usr_id = request.getParameter("usr_id"); 
			try {
				int i=OrgManagerDao.getInstance().deleteUsr(usr_id);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"删除成功", "OrgManagerServlet+deleteUsr","deleteUsr");
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "OrgManagerServlet+deleteUsr",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("editSection")){
			//System.out.println("editSection-In");
			String zone_id = request.getParameter("zone_id");
			String zone_name_new=request.getParameter("zone_name_new");
			try {
				int i=OrgManagerDao.getInstance().editSection(zone_id,zone_name_new);
				//System.out.println(i);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"修改成功", "OrgManagerServlet+editSection","editSection");
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "OrgManagerServlet+editSection",e.getMessage());
			}
			ro.ToJsp(response);
			return;
			
		}
		else if(type.equals("deleteSection")){
			String zone_id = request.getParameter("zone_id");
			try {
				int count=OrgManagerDao.getInstance().getZoneNumbers(zone_id);
				int i=OrgManagerDao.getInstance().deleteSection(zone_id,count);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setObj(count);
						ro.setSuccess("success");
				}else{
					ro.setError(1);
				}
				LogDao.getInstance().addLogInfo(log_user,"删除成功", "OrgManagerServlet+deleteSection","deleteSection");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "OrgManagerServlet+deleteSection",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("getStructByid")){
			//System.out.println("getStructByid-In");
			String id = request.getParameter("id"); 
			List<StructInformation> oi = OrgManagerDao.getInstance().getStructByid(id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
			
		}
		else if(type.equals("delStruct")){
			//System.out.println("delStruct-In");
			String struct_id = request.getParameter("struct_id"); 
			String struct_mode = request.getParameter("struct_mode");
			try {
				int i = StructMgrDao.getInstance().delStruct(struct_id, struct_mode);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"删除成功", "OrgManagerServlet+delStruct","delStruct");
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "OrgManagerServlet+delStruct",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("initPartAndZone")){
			String org_id = request.getParameter("company"); 
			List<OrgTechZone> oi = OrgManagerDao.getInstance().getPartAndZone(org_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("account_getPersons")){
			String id = request.getParameter("id"); 
			String job=request.getParameter("job"); 
			List<OrgUserInfo> oi = OrgManagerDao.getInstance().account_getPersons(id,job);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("selectSpecifiedCompany")){
			String username = request.getParameter("username");
			String identity= request.getParameter("identity");
			List<OrgInfo> oi = OrgManagerDao.getInstance().getCompanyName(username,identity);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("setZoneBuild_prj")){
			String build_prj = request.getParameter("build_prj");
			String zone_id = request.getParameter("zone_id");
			int i = OrgManagerDao.getInstance().setZoneBuild_prj(build_prj,zone_id);
			//System.out.println(i);
			if(i<0){
				ro.setError(2);
			}else if(i>0){
					ro.setError(0);
					ro.setSuccess("success");
			}else{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		//获取所有检测公司人员账号
		else if(type.equals("getCheckPeople")){
			String zone_id = request.getParameter("zone_id"); 
			List<CheckPeopleVo> oi = OrgManagerDao.getInstance().getCheckPeople(zone_id);
			ro.setError(0);	
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("getBuild_prj")){
			String zone_id = request.getParameter("zone_id"); 
			List<ZoneInfo> oi = OrgManagerDao.getInstance().getBuild_prj(zone_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("getZoneIdByUsr_id")){
			String usr_id = request.getParameter("id"); 
			List<OrgUserInfo> oi = OrgManagerDao.getInstance().getZoneIdByUsr_id(usr_id);
			System.out.println(oi.get(0).getDepartment_id());
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("deleteSectionBySectionId")){
			String sectionId = request.getParameter("sectionId"); 
	
			try {
				int i = OrgManagerDao.getInstance().deleteSectionBySectionId(sectionId);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"删除成功", "OrgManagerServlet+deleteSectionBySectionId","deleteSectionBySectionId");
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "OrgManagerServlet+deleteSectionBySectionId",e.getMessage());
			}
			ro.ToJsp(response);
			return;	
		}
		else if(type.equals("checkMember")){
			String zone_id = request.getParameter("zone_id"); 
			
			int i = OrgManagerDao.getInstance().checkMember(zone_id);
			//System.out.println(i);
			if(i==0){
					ro.setError(0);
					ro.setSuccess("0");
			}else if(i==1){
				ro.setError(0);
				ro.setSuccess("该分区下没有桥梁分管，无法建立日常检查");
			}else if(i==2){
				ro.setError(0);
				ro.setSuccess("该分区下没有工程师，无法建立日常检查");
			}else if(i==3){
				ro.setError(0);
				ro.setSuccess("该分区下没有桥梁分管的账号，无法建立日常检查");
			}
			else if(i==4){
				ro.setError(0);
				ro.setSuccess("该分区下没有工程师的账号，无法建立日常检查");
			}else {
				ro.setError(2);
			}
			ro.ToJsp(response);
			return;		
		}else if(type.equals("addUserCount")){
			/*usr_id:usr_id,
				user_count:user_count,
				user_password:user_password,
				user_role_type:user_role_type,
				user_role:user_role,
				file_name:file_name,*/
			String user_name  = request.getParameter("user_count");
			String user_pwd   = request.getParameter("user_password");
			String user_role  = request.getParameter("job_new");
			String sign_path  = request.getParameter("file_name");
			String org_usr_id = request.getParameter("usr_id");
			String engRole = getUsrRole(user_role);
			try {
				if(!"".equals(engRole)){
					int i = OrgManagerDao.getInstance().addUserCount(user_name, user_pwd, engRole, sign_path, org_usr_id);	
					if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"增加成功", "OrgManagerServlet+addUserCount","addUserCount");
					}else{
						ro.setError(2);
						ro.setSuccess("fail");
					}
				}else{
					ro.setError(1);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "OrgManagerServlet+addUserCount",e.getMessage());
			}
			ro.ToJsp(response);
			return;		
		}else if(type.equals("getEditUsrCount")){
			//System.out.println("getEditUsr-In");
			String usr_id = request.getParameter("usr_id"); 
			List<SysUsrUsrInfo> oi = OrgManagerDao.getInstance().getEditUsrCount(usr_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}else if(type.equals("getCount")){
			//System.out.println("getEditUsr-In");
			String org_usr_id = request.getParameter("org_usr_id"); 
			List<SysUsrUsrInfo> oi = OrgManagerDao.getInstance().getEditUsrCount(org_usr_id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}else if(type.equals("addCheckPeopleCount")){
			//System.out.println("getEditUsr-In");
			String zone_id = request.getParameter("zone_id"); 
			String checkPeople = request.getParameter("checkPeople"); 
			try {
				int i = OrgManagerDao.getInstance().updateCheckPeople(zone_id,checkPeople);
				if(i>0){
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"增加成功", "OrgManagerServlet+addCheckPeopleCount","addCheckPeopleCount");
				}else{
					ro.setError(2);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "OrgManagerServlet+addCheckPeopleCount",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
	}

	private String getUsrRole(String usr_role){
		if("桥梁主管".equals(usr_role)){
			return "orgCharge";
		}else if("负责人".equals(usr_role)||"责任人".equals(usr_role)||"桥梁分管".equals(usr_role)){
			return "orgDuty";
		}else if("工程师".equals(usr_role)){
			return "orgEngineer";
		}else{
			return "";
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
