package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicManageOrg;
import hs.bm.dao.LogDao;
import hs.bm.dao.ManageOrgMgrDao;
import hs.bm.vo.ResObj;

public class ManageOrgMgrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManageOrgMgrServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String log_user=(String) request.getSession().getAttribute("username");
		String type = request.getParameter("type"); 
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		
		if(type.equals("initTable")){
			List<DicManageOrg> ll = ManageOrgMgrDao.getInstance().initTable();
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
		
		
		
		if(type.equals("editManage")){
			try {
				String dhiStr = request.getParameter("info");
				DicManageOrg dmo = JSON.parseObject(dhiStr, DicManageOrg.class);
				int i = ManageOrgMgrDao.getInstance().editManage(dmo);
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
					break;
				}
				LogDao.getInstance().addLogInfo(log_user,"修改成功", "ManageOrgMgrServlet+editManage","editManage");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "ManageOrgMgrServlet+editManage",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delManage")){
			String manage_id = request.getParameter("manage_id");
			try {
				int i = ManageOrgMgrDao.getInstance().delManage(manage_id);
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
					break;
				}
				LogDao.getInstance().addLogInfo(log_user,"删除成功", "ManageOrgMgrServlet+delManage","delManage");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "ManageOrgMgrServlet+delManage",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addManage")){
			try {
				String dmoStr = request.getParameter("info");
				DicManageOrg dmo = JSON.parseObject(dmoStr, DicManageOrg.class);
				String manage_id = UUID.randomUUID().toString().replaceAll("-", "");
				dmo.setManage_id(manage_id);
				int i = ManageOrgMgrDao.getInstance().addManage(dmo);
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
					LogDao.getInstance().addLogInfo(log_user,"增加成功", "ManageOrgMgrServlet+addManage","addManage");
					ro.setObj(manage_id);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "ManageOrgMgrServlet+addManage",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
