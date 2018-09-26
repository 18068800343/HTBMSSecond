package hs.bm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicBrgStructComponentDef;
import hs.bm.dao.DicComTypeDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.ResObj;

public class DicComTypeServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public DicComTypeServlet() {
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
		
		if(type.equals("initComType")){
			List<DicBrgStructComponentDef> ll = DicComTypeDao.getInstance().initComType();
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
		
		if(type.equals("newComType")){
			String dbsStr = request.getParameter("info");
			DicBrgStructComponentDef dbs = JSON.parseObject(dbsStr, DicBrgStructComponentDef.class);			
			int i = 0;
			try {
				if(DicComTypeDao.getInstance().checkNameId(dbs.getComponent_name(), dbs.getComponent_id(),"component",dbs.getSpecification())){
					i=-2;
				}else{
					i = DicComTypeDao.getInstance().newComType(dbs);
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
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicComTypeServlet+newComType");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicComTypeServlet+newComType+dbs:"+dbs);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("deleteComType")){
			String component_id = request.getParameter("component_id");
			try {
				int i = DicComTypeDao.getInstance().deleteComType(component_id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicComTypeServlet+deleteComType");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除",e.getMessage(),"DicComTypeServlet+deleteComType+component_id:"+component_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("editComType")){
			String dbsStr = request.getParameter("info");
			DicBrgStructComponentDef dbs = JSON.parseObject(dbsStr, DicBrgStructComponentDef.class);			
			int i = 0;
			try {
				if(DicComTypeDao.getInstance().checkName(dbs.getComponent_name(), "component",dbs.getSpecification())){
					i=-2;
				}else{
					i = DicComTypeDao.getInstance().editComType(dbs);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicComTypeServlet+editComType");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicComTypeServlet+editComType+dbs:"+dbs);
			}
			ro.ToJsp(response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
