package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hs.bm.bean.DicDefReference;
import hs.bm.dao.DefReferenceDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.ResObj;

public class DefReferenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DefReferenceServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type"); 
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		

		if(type.equals("initReference")){
			List<DicDefReference> ll = DefReferenceDao.getInstance().initReference();
			if(ll==null){
				ro.setError(2);
			}else if(ll.size()>0){
					ro.setError(0);
					ro.setSuccess("success");
					ro.setObj(ll);
			}else{
				ro.setError(1);
			}
			
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("newReference")){
			String reference_name = request.getParameter("reference_name");
			int i = 0;
			if(DefReferenceDao.getInstance().checkName(reference_name)){
				i = -2;
			}else{
				try {
					i = DefReferenceDao.getInstance().newDefReference(reference_name);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DefReferenceServlet+delMember+reference_name:"+reference_name);
				}
			}
			switch (i) {
			case 0:
				ro.setError(1);
				ro.setSuccess("fail");
				break;
			case -1:
				ro.setError(2);
				ro.setSuccess("fail");
				break;
			case -2:
				ro.setError(3);
				ro.setSuccess("fail");
				break;
			default:
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DefReferenceServlet+delMember");
				break;
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("deleteReference")){
			String reference_name = request.getParameter("reference_name");
			try {
				int i = DefReferenceDao.getInstance().delDefReference(reference_name);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DefReferenceServlet+deleteReference");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DefReferenceServlet+deleteReference+reference_name:"+reference_name);
			}
			ro.ToJsp(response);
			return;
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
