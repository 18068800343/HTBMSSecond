package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicManageZone;
import hs.bm.dao.LogDao;
import hs.bm.dao.ManageZoneMgrDao;
import hs.bm.vo.ResObj;

public class ManageZoneMgrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManageZoneMgrServlet() {
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
		
		if(type.equals("initTable")){
			List<DicManageZone> ll = ManageZoneMgrDao.getInstance().initTable();
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
		
		if(type.equals("editZone")){
			try {
				String dhiStr = request.getParameter("info");
				DicManageZone dmo = JSON.parseObject(dhiStr, DicManageZone.class);
				int i = ManageZoneMgrDao.getInstance().editZone(dmo);
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
					LogDao.getInstance().addLogInfo(log_user,"修改成功", "ManageZoneMgrServlet+editZone","editZone");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "ManageZoneMgrServlet+editZone",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delZone")){
			try {
				String zone_id = request.getParameter("zone_id");
				int i = ManageZoneMgrDao.getInstance().delZone(zone_id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除成功", "ManageZoneMgrServlet+editZone","editZone");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "ManageZoneMgrServlet+delZone",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addZone")){
			try {
				String dmoStr = request.getParameter("info");
				DicManageZone dmo = JSON.parseObject(dmoStr, DicManageZone.class);
				String zone_id = UUID.randomUUID().toString().replaceAll("-", "");
				dmo.setZone_id(zone_id);
				int i = ManageZoneMgrDao.getInstance().addZone(dmo);
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
					LogDao.getInstance().addLogInfo(log_user,"增加成功", "ManageZoneMgrServlet+addZone","addZone");
					ro.setObj(zone_id);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "ManageZoneMgrServlet+addZone",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
