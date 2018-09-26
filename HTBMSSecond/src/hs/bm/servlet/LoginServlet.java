package hs.bm.servlet;

import hs.bm.bean.SysOrgInfo;
import hs.bm.bean.SysOrgUsrInfo;
import hs.bm.bean.SysUsrUsrInfo;
import hs.bm.control.ControlServices;
import hs.bm.dao.ContactDao;
import hs.bm.dao.StructMgrDao;
import hs.bm.dao.UserDao;
import hs.bm.util.ConfigInfo;
import hs.bm.util.GetMacAndNetCard;
import hs.bm.vo.SysUsrUsrInfoVo;

import java.io.IOException;
import java.net.InetAddress;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;

public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public LoginServlet()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		String log_user=(String) request.getSession().getAttribute("username");
		/* 读取许可加密码 */
		String code = GetMacAndNetCard.readLicense();
		String mac_code = GetMacAndNetCard.getMac(GetMacAndNetCard.getBase64Decodec(code), "mac");
		String mac_loc = GetMacAndNetCard.getLocalMac(InetAddress.getLocalHost());

		/* 获取当前日期 */
		String webUrl = "http://www.baidu.com";
		String date = GetMacAndNetCard.getWebsiteDatetime(webUrl);
		/* 获取限定日期 */
		String date_code = GetMacAndNetCard.getMac(GetMacAndNetCard.getBase64Decodec(code), "limitDate");
		date_code = date_code.split("!")[1]; 

		Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro.ini");
		SecurityManager securityManager = (SecurityManager) factory.getInstance();
		SecurityUtils.setSecurityManager(securityManager);
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		try
		{
			subject.login(token);
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			String userRole = ControlServices.getBaseRole(username);
			session.setAttribute("userRole", userRole);
			String userRoleName = getRoleName(userRole.trim());
			session.setAttribute("roleName", userRoleName);
			SysUsrUsrInfoVo sysUsrUsrInfoVo = StructMgrDao.getInstance().getAllUserInfoByName(username);
			String realUserName = "";
			String org_usr_id = sysUsrUsrInfoVo.getOrg_usr_id();
			String departmentId2 = "";
			if(org_usr_id==null||"".equals(org_usr_id)||"admin".equals(userRole)){
				realUserName=new UserDao().getRealUserNameJC(username);
				session.setAttribute("orgid", null);
				session.setAttribute("orgname",null);
				session.setAttribute("departmentId",null);
				session.setAttribute("realUserName",realUserName);
			}else{
				String departmentId="";
				SysOrgUsrInfo sysOrgUsrInfo = StructMgrDao.getInstance().getOrgUserById(org_usr_id);
				if(sysOrgUsrInfo.getDepartment_id()!=null){
					departmentId = sysOrgUsrInfo.getDepartment_id().substring(0,4)+"%";
				}
				//departmentId = sysOrgUsrInfo.getDepartment_id().substring(0,4)+"%";
				departmentId2 = sysOrgUsrInfo.getDepartment_id();
				SysOrgInfo sysOrgInfo = StructMgrDao.getInstance().initOrg(departmentId).get(0);
				String org_id = sysOrgInfo.getOrg_id();
				String org_name = sysOrgInfo.getOrg_name();
				realUserName=new UserDao().getRealUserNameGY(username);
				session.setAttribute("orgid", org_id);
				session.setAttribute("orgname",org_name);
				session.setAttribute("departmentId",departmentId2);
				session.setAttribute("realUserName", realUserName);
			}
		
			for(Cookie cookie : request.getCookies()){
				cookie.setMaxAge(0);
			}
//			Cookie cookie = new Cookie("structSearchInfo", "");
//			cookie.setMaxAge(1);
//			response.addCookie(cookie);
		
			/* mac比较 */
			if (mac_code.toLowerCase().equals(mac_loc.toLowerCase()))
			{
				if (date_code.equals("#"))
				{
					response.sendRedirect(ConfigInfo.indexPage);
				} else
				{
					/* 授权日期比较 */
					if (GetMacAndNetCard.date_compare(date, date_code))
					{
						/* 客户信息是否录入 */
						if (ContactDao.getInstance().isExit() == 1)
						{
							response.sendRedirect(ConfigInfo.indexPage);
						} else
						{
							/* 跳转录入信息界面 */
							response.sendRedirect("jsp/contactUS.jsp");
//							response.sendRedirect("jsp/index.jsp");
						}
					} else
					{
						/* 授权日期超时 */
						response.sendRedirect("jsp/login.jsp?r=timeout");
					}

				}

			} else
			{
				/* mac地址错误 */
				response.sendRedirect("jsp/login.jsp?r=nolicense");
			}

			// response.sendRedirect("jsp/index.jsp");
		} catch (AuthenticationException ae)
		{
			ae.printStackTrace();
			response.sendRedirect("jsp/login.jsp?r=fail");
		}
	}
	
	private String getRoleName(String role){
		if("orgAdmin".equals(role)||"admin".equals(role)){
			return "管理员";
		}else if("orgCharge".equals(role)){
			return "主管";
		}else if("orgDuty".equals(role)){
			return "分管";
		}else if("orgEngineer".equals(role)){
			return "工程师";
		}else if("superAdmin".equals(role)){
			return "超级管理员";
		}else if("guest".equals(role)){
			return "用户";
		}else{
			return "";
		}
	}

}
