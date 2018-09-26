package hs.bm.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import hs.bm.dao.UserDao;
import hs.bm.vo.ResObj;

public class ChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		String oldpassword=request.getParameter("oldpassword");
		String passWord1=request.getParameter("password1");
		String passWord2=request.getParameter("password2");
		System.out.println(username);
		System.out.println(passWord1);
		System.out.println(passWord2);
		System.out.println(oldpassword);
		System.out.println(password);
		
		ResObj ro = new ResObj();
		
		UserDao ud = new UserDao();
		int i =0;
		if(password.equals(oldpassword)){
		if(passWord1.equals(passWord2)){
			try {
				i = ud.UpdateUsr_pwd(username, passWord1);//.changePass(userName1, passWord1);
				if(i>0){
					ro.setError(0);
					ro.setSuccess("success");
					session.setAttribute("password", passWord1);
				}else{
					ro.setError(-1);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
			}
		}else{
			ro.setError(1);
			ro.setSuccess("fail");
		}
	}else{
		ro.setError(2);
		ro.setSuccess("fail");
	}
		ro.ToJsp(response);
	}
}
