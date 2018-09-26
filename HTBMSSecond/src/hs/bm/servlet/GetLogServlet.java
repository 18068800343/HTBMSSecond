package hs.bm.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hs.bm.dao.GetLogDao;
import hs.bm.util.ToJSONStr;

public class GetLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetLogServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String log_user=(String) request.getSession().getAttribute("username");
		String json=ToJSONStr.getJSON(GetLogDao.getInstance().GetLog(), null);
		PrintWriter out = response.getWriter();
		out.write(json);
		out.close();
		out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
