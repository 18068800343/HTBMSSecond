package hs.bm.servlet;

import hs.bm.dao.ContactDao;
import hs.bm.dao.LogDao;
import hs.bm.util.IDtool;
import hs.bm.vo.ResObj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ContactUsServlet extends HttpServlet
{
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String choice = req.getParameter("choice");
		String log_user=(String) req.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		HttpSession session = req.getSession();
		if(choice.equals("save")){
			String id = IDtool.getUUID().replace("-", "");
			String name = req.getParameter("name");
			String add = req.getParameter("add");
			String company = req.getParameter("company");
			String phone = req.getParameter("phone");
			String qq_number = req.getParameter("qq_number");
			try {
				int i = ContactDao.getInstance().saveContact(id, name, add, company, phone, qq_number);
				if(i == 1){
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","ContactUsServlet+save");
					ro.setError(0);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"ContactUsServlet+save+name:"+name+"+id:"+id+"+add:"+add+"+company:"+company+"+qq_number:"+qq_number);
			}
			ro.ToJsp(resp);
		}
	}
	
}
