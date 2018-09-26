package hs.bm.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.alibaba.fastjson.JSONObject;

import hs.bm.bean.SysOrgUsrInfo;
import hs.bm.constant.SmsErrMessage;
import hs.bm.dao.LogDao;
import hs.bm.dao.OrgManagerDao;
import hs.bm.dao.PrjMgrDao;
import hs.bm.dao.UserDao;
import hs.bm.util.GetMacAndNetCard;
import hs.bm.util.IDtool;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.CheckPowerVO;
import hs.bm.vo.OrgInfo;
import hs.bm.vo.OrgUserInfo;
import hs.bm.vo.ResObj;
import hs.bm.vo.SysUsrPassRole;
import hs.bm.vo.SysUsrPassRoleVo;

public class UserMgrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserMgrServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		String log_user = (String) session.getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		/*保存签名图片*/
		if (type.equals("img"))
		{
			try {
				File saveFile = null;
				UserDao ud = new UserDao();
				//String user_id = (String) session.getAttribute("userSelected");
				
				String img_usr_name=(String) session.getAttribute("img_usr_name");
				//String file_name = (String) session.getAttribute("file_name");
				String company=(String) session.getAttribute("companyId");
				//System.out.println(file_name);
				String username=img_usr_name+".jpg";
				String result = null;
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				String up=PropertiesUtil.getPropertiesByName("rootDir");
				String user = "user";
				String uploadurl = up+File.separator+user+File.separator+company;
				String stroePath = user+File.separator+company+File.separator+username;
				File uploadPath = new File(uploadurl);
				if (!uploadPath.exists())
				{
					uploadPath.mkdirs();
				}
				try
				{
					List<FileItem> items = upload.parseRequest(request);
					for (FileItem fileItem : items)
					{
						
						if (!fileItem.isFormField())
						{
							saveFile = new File(uploadPath, username);
							result = uploadPath.getAbsolutePath();
						}
						InputStream in = fileItem.getInputStream();
						OutputStream out = new FileOutputStream(saveFile);
						byte[] bs = new byte[1024];
						int i = -1;
						while ((i = in.read(bs)) != -1)
						{
							out.write(bs, 0, i);
						}
						out.flush();
						out.close();
						in.close();
					}
				} catch (FileUploadException e)
				{
					e.printStackTrace();
				}
				if (result == null)
				{
					ro.setSuccess("fail");
				}else
				{
					//System.out.println(saveFile.getAbsolutePath());
					//System.out.println(stroePath);
					int i = ud.store_Sign_Path(stroePath,img_usr_name,company);
					if (i==1)
					{
						ro.setError(0);
						ro.setSuccess("success");
					}
				}
				LogDao.getInstance().addLogInfo(log_user,"成功", "img","UserMgrServlet");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"失败", "img",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("checkPower")){
			GetMacAndNetCard gm = new GetMacAndNetCard();
			String code=gm.readLicense();
			code = gm.getBase64Decodec(code);
			CheckPowerVO cp = new CheckPowerVO();
			String date = gm.getMac(code, "limitDate");
			cp.setDate_limit(date.split("!")[1]);
			cp.setReport_limit(gm.getMac(code, "reportTimes"));
			cp.setStruct_limit(gm.getMac(code, "times"));
			cp.setDate_now(gm.getWebsiteDatetime("http://www.baidu.com"));
			cp.setReport_no(gm.getReportCount());
			cp.setStruct_no(PrjMgrDao.getInstance().getPrj_Struct_No_sum(date.split("!")[0], date.split("!")[1])+"");
			ro.setObj(cp);
			ro.setError(0);
			ro.setSuccess("success");
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("initTable")){
			UserDao ud = new UserDao();
			List<SysUsrPassRole> ll = ud.GetSysUsrPassRole();
			if(ll.size()>0){
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("edit")){
			try {
				String company = request.getParameter("company");
				String domain_role = request.getParameter("domain_role");
				String domain_name = request.getParameter("domain_name");
				String domain_pass=request.getParameter("domain_pass");
				String usr_id=request.getParameter("domain_id");
				
				String phone_no = request.getParameter("phone_no");
				String user_name = request.getParameter("user_name");
				String qq_no = request.getParameter("qq_no");
				String email_no = request.getParameter("email_no");
				
				SysOrgUsrInfo souiCheck=new SysOrgUsrInfo();
				souiCheck.setDepartment_id(company);
				souiCheck.setE_mail(email_no);
				souiCheck.setOrg_usr_name(user_name);
				souiCheck.setPhone_no(phone_no);
				souiCheck.setQq(qq_no);
				
				String org_usr_id=null;
				UserDao ud = new UserDao();
				if(usr_id!=null&&!"".equals(usr_id)){
					org_usr_id = ud.GetOrgUsrId(Integer.parseInt(usr_id));
				}
				//@author xianing
				String unit_name =request.getParameter("unit_name");
				String unit_phone_no=request.getParameter("unit_phone_no");
				String unit_qq_no=request.getParameter("unit_qq_no");
				String unit_email_no=request.getParameter("unit_email_no");
				String departmentId=request.getParameter("departmentId");
				SysOrgUsrInfo soui=new SysOrgUsrInfo();
				soui.setDepartment_id(company);
				soui.setE_mail(unit_email_no);
				soui.setOrg_usr_name(unit_name);
				soui.setPhone_no(unit_phone_no);
				soui.setQq(unit_qq_no);
				soui.setJob_name(getRoleName(domain_role));
				if(org_usr_id!=null&&org_usr_id.trim().length()>14&&unit_name!=null&&!"".equals(unit_name.trim())){
					ud.UpdateSysOrgUsrInfoByOrgUsrId(soui, org_usr_id);
				}else{
					ud.UpdateSysOrgUsrInfoByOrgUsrId(souiCheck, usr_id);
				}
				session.setAttribute("companyId",company);
				session.setAttribute("img_usr_name",domain_name);
				int i=ud.UpdateRoleByName(domain_role,domain_name,domain_pass,usr_id);
				boolean flag =false;
				if(i>0){
					flag = true;
				}
				if(flag){
					ro.setError(0);
					List<SysUsrPassRole> ll=ud.getEditPerson(usr_id);
					/*supr.setUsr_id(rs.getString("usr_id"));
					//supr.setUsr_no(rs.getString("usr_no"));
					supr.setUsr_name(rs.getString("usr_name"));
					supr.setUsr_pwd(rs.getString("usr_pwd"));
					supr.setUsr_role(rs.getString("usr_role"));
					      {"data": "org_usr_name"},
				            {"data": "qq"},
				            {"data": "phone_no"},
				            {"data": "email"},
					*/
					JSONObject obj = new JSONObject();
					obj.put("usr_id", ll.get(0).getUsr_id());
					obj.put("usr_no", ll.get(0).getUsr_no());
					obj.put("usr_name", ll.get(0).getUsr_name());
					obj.put("usr_pwd", ll.get(0).getUsr_pwd());
					obj.put("usr_role", ll.get(0).getUsr_role());
					if(unit_name!=null&&!"".equals(unit_name)||unit_qq_no!=null&&!"".equals(unit_qq_no)||
							unit_phone_no!=null&&!"".equals(unit_phone_no)||unit_email_no!=null&&!"".equals(unit_email_no)){
						obj.put("org_usr_name",unit_name);
						obj.put("qq",unit_qq_no);
						obj.put("phone_no",unit_phone_no);
						obj.put("email",unit_email_no);
					}else{
						obj.put("org_usr_name",user_name);
						obj.put("qq",qq_no);
						obj.put("phone_no",phone_no);
						obj.put("email",email_no);
					}
					
					ro.setObj(obj);
					ro.setSuccess("success");
				}
				LogDao.getInstance().addLogInfo(log_user,"成功", "edit","UserMgrServlet");
				
			} catch (NumberFormatException e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"失败", "edit",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delete")){
			try {
				String domain_id = request.getParameter("domain_id");
				UserDao ud = new UserDao();
				int k=0;
				if(domain_id!=null&&!"".equals(domain_id)){
					String org_usr_id = ud.GetOrgUsrId(Integer.parseInt(domain_id));
					if(org_usr_id!=null&&org_usr_id.length()>14){
						k=ud.DeleteOrgUsr(org_usr_id);
					}
				}
				int i=ud.DeleteUser(domain_id);
				if(i>0){
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"成功", "delete","UserMgrServlet");
					}else{
					ro.setSuccess("fail");
					}
				
			} catch (NumberFormatException e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"失败", "delete",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		
		else if(type.equals("selectCompany")){
			List<OrgInfo> oi = OrgManagerDao.getInstance().getCompanyNames(null);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(oi);
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("accountAdd")){
			try {
				String org_id=request.getParameter("org_id");
				String userName = request.getParameter("userName");
				String password = request.getParameter("password");
				String role = request.getParameter("role");
				/*user_name:data.user_name,
				  phone_no:data.phone_no,
				  qq_no:data.qq_no,
				  email_no:data.email_no,*/
				String phone_no = request.getParameter("phone_no");
				String user_name = request.getParameter("user_name");
				String qq_no = request.getParameter("qq_no");
				String email_no = request.getParameter("email_no");
				/*@author xianing
				 *unit_name:data.unit_name,
				  unit_phone_no:data.unit_phone_no,
				  unit_qq_no:data.unit_qq_no,
				  unit_email_no:data.unit_email_no,*/
				String unit_name=request.getParameter("unit_name");
				String unit_phone_no=request.getParameter("unit_phone_no");
				String unit_qq_no=request.getParameter("unit_qq_no");
				String unit_email_no=request.getParameter("unit_email_no");
				String departmentId=request.getParameter("departmentId");
				String roleName=request.getParameter("roleName");
				
				String org_usr_id=request.getParameter("org_usr_id");
				
				session.setAttribute("companyId",org_id);
				session.setAttribute("img_usr_name",userName);
				UserDao ud = new UserDao();
				if(org_id.equals("0000#0000#0000")){
					org_usr_id=null;
				}
				if(role.equals("orgAdmin")){
					org_usr_id=org_id;
				}
				String sr_id=ud.GetUsr_id(userName);
				if(sr_id == null || sr_id.trim().length() == 0){
				 ArrayList<SysUsrPassRole> al=ud.AddUser(userName,password,org_usr_id,role);
				 SysUsrPassRoleVo supr=new SysUsrPassRoleVo();
				//根据用户名获取用户id
				String 	add_id = ud.GetUsr_id(userName);
					
					boolean flag = false;
					if(al.size()>0){
						flag=true;
						if(flag){
						
							//@author xianing
							int j=0;
							int i=0;
							int k=0;
							if(null!=unit_name&&!"".equals(unit_name)){
								
								      if("".equals(departmentId)){
								    	  departmentId=org_id;
								      }
								      String uuid = IDtool.getUUID();
								      j=OrgManagerDao.getInstance().addUser(unit_name,unit_phone_no,unit_qq_no,unit_email_no,
								    		  roleName,departmentId,uuid);
								      k=ud.UpdateOrgUsrIdByUsrId(uuid, add_id);
									}else{
									  i=OrgManagerDao.getInstance().addUser(user_name,phone_no,qq_no,email_no,
				                                null,SmsErrMessage.CHECK_COMPANY_DEPARTMENTID,add_id);
									 
										supr.setUsr_id(add_id);
								    	supr.setUsr_name(userName);
								    	supr.setUsr_pwd(password);
								    	supr.setUsr_role(role);
								    	supr.setOrg_usr_name(user_name);
								    	supr.setPhone_no(phone_no);
								    	supr.setQq(qq_no);
								    	supr.setEmail(email_no);
									  
									}
							
							if(i>0||(j>0&&k>0)){
								ro.setError(0);
								ro.setSuccess("success");
								ro.setObj(supr);
							}else{
								ro.setError(1);
								ro.setSuccess("fail");
							}
						}
						
						}else{
							ro.setError(1);
							ro.setSuccess("fail");
						}
				}else{
					ro.setError(0);
					ro.setSuccess("fail");
				}
				LogDao.getInstance().addLogInfo(log_user,"成功", "accountAdd","UserMgrServlet");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"失败", "accountAdd",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("identifyId")){
			//System.out.println("identifyId-in");
			UserDao ud = new UserDao();
			String id = request.getParameter("id");
			String org_id=request.getParameter("org_id");
			//System.out.println(org_id+" "+id);
			int i=ud.identifyId(org_id,id);
			//System.out.println(i);
			if(i<0){
				ro.setError(-1);
				ro.setSuccess("fail");
				}
			
			else{
				ro.setError(0);
				ro.setSuccess("success");	
			}
		ro.ToJsp(response);
		return;
		
	}
		else if(type.equals("initTesTingCompanyTable")){
			UserDao ud = new UserDao();
			List<SysUsrPassRoleVo> ll = ud.initTesTingCompanyTable();
			if(ll.size()>0){
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("initKeepingCompanyTable")){
			UserDao ud = new UserDao();
			String org_id=request.getParameter("org_id");
			List<SysUsrPassRoleVo> ll = ud.initKeepingCompanyTable(org_id);
			if(ll.size()>=0){
			
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}
		else if(type.equals("identifyIdTesting")){
			UserDao ud = new UserDao();
			String id = request.getParameter("id");
			String org_id=request.getParameter("org_id");
			//System.out.println(org_id+" "+id);
			int i=ud.identifyIdTesting(org_id,id);
			//System.out.println(i);
			if(i<0){
				ro.setError(-1);
				ro.setSuccess("fail");
				}
			
			else{
				ro.setError(0);
				ro.setSuccess("success");	
			}
		ro.ToJsp(response);
		return;
		}
		else if(type.equals("getOrg_usr_id")){
			UserDao ud = new UserDao();
			String usr_id=request.getParameter("usr_id");
			List<OrgUserInfo> ll = ud.getOrg_usr_id(usr_id);
			if(ll.size()>=0){
			
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}
		
}
	private String getRoleName(String role){
		if("orgAdmin".equals(role)){
			return "管养公司管理员";
		}else if("orgCharge".equals(role)){
			return "管养公司桥梁主管";
		}else if("orgDuty".equals(role)){
			return "管养公司桥梁分管";
		}else{
			return "管养公司分区工程师";
		}
	}
}
