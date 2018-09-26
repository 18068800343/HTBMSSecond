package hs.bm.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import hs.bm.control.ControlServices;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.RoleInfo;

public class RoleControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RoleControlServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		String role = ControlServices.getBaseRole(username);
		RoleInfo roleInfo = new RoleInfo();
		if(role.equals("admin")){
			roleInfo.setAdmin(true);
		}
		if(role.equals("guest")){
			roleInfo.setGuest(true);
		}
		if(role.equals("superAdmin")){
			roleInfo.setSuperAdmin(true);
		}
		if(role.equals("orgAdmin")){
			roleInfo.setOrgAdmin(true);
		}
		if(role.equals("orgCharge")){
			roleInfo.setOrgCharge(true);
		}
		if(role.equals("orgDuty")){
			roleInfo.setOrgDuty(true);
		}
		if(role.equals("orgEngineer")){
			roleInfo.setOrgEngineer(true);
		}
		OperationConstruct oct = (OperationConstruct)session.getAttribute("OperationConstruct");
		if(oct!=null&&oct.getPrj_id()!=null){
			int s = ControlServices.getPrjRole(username, oct.getPrj_id());
			if(s==ControlServices.MANAGEANDMEMBER){
				roleInfo.setManage(true);
				roleInfo.setMember(true);
			}
			if(s==ControlServices.MANAGE){
				roleInfo.setManage(true);
				
			}
			if(s==ControlServices.MEMBER){
				roleInfo.setMember(true);
			}
		}
		PrintWriter writer = response.getWriter();
		writer.write(JSON.toJSONString(roleInfo));
		writer.flush();
		writer.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
