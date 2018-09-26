package hs.bm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicMbrDefectF;
import hs.bm.bean.DicMbrDefectS;
import hs.bm.dao.DicDefectDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.DicDefect;
import hs.bm.vo.ResObj;

public class DicDefectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DicDefectServlet() {
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
			List<DicDefect> ll=DicDefectDao.getInstance().initTable();
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
		
		if(type.equals("addDefect_f")){
			String info = request.getParameter("info");
			DicMbrDefectF dmd = JSON.parseObject(info, DicMbrDefectF.class);
			int i = 0;
			if(DicDefectDao.getInstance().checkNameId_f(dmd.getDefect_f_id(), dmd.getDefect_f_name())){
				i=-2;
			}else{
				try {
					i = DicDefectDao.getInstance().addDefect_f(dmd);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicDefectServlet+addDefect_f+dmd:"+dmd);
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
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicDefectServlet+addDefect_f");
				break;
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delDefect_f")){
			String info = request.getParameter("info");
			DicMbrDefectF dmd = JSON.parseObject(info, DicMbrDefectF.class);
			try {
				int i = DicDefectDao.getInstance().delDefect_f(dmd);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicDefectServlet+delDefect_f");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除",e.getMessage(),"DicDefectServlet+delDefect_f+defect_f_id"+dmd.getDefect_f_id());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("editDefect_f")){
			String info = request.getParameter("info");
			String old_id = request.getParameter("old_id");
			String old_name = request.getParameter("old_name");
			DicMbrDefectF dmd = JSON.parseObject(info, DicMbrDefectF.class);
			int i = 0;
			if(DicDefectDao.getInstance().checkName_f( dmd.getDefect_f_id(),dmd.getDefect_f_name(), old_id, old_name)){
				i=-2;
			}else{
				try {
					i = DicDefectDao.getInstance().editDefect_f(dmd, old_id);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicDefectServlet+editDefect_f+dmd+"+dmd+"+old_id:"+old_id);
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
				LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicDefectServlet+editDefect_f");
				break;
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addDefect")){
			String info = request.getParameter("info");
			DicMbrDefectS dmd = JSON.parseObject(info, DicMbrDefectS.class);
			int i = 0;
			if(DicDefectDao.getInstance().checkNameId_s(dmd.getDefect_id(), dmd.getDefect_name(),dmd.getDefect_f_id())){
				i=-2;
			}else{
				try {
					i = DicDefectDao.getInstance().addDefect(dmd);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicDefectServlet+addDefect+dmd:"+dmd);
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
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicDefectServlet+addDefect");
				break;
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delDefect")){
			String defect_id = request.getParameter("defect_id");
			try {
				int i = DicDefectDao.getInstance().delDefect(defect_id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicDefectServlet+delDefect");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DicDefectServlet+delDefect+defect_id:"+defect_id);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("editDefect")){
			String info = request.getParameter("info");
			DicMbrDefectS dmd = JSON.parseObject(info, DicMbrDefectS.class);
			String old_id = request.getParameter("old_id");
			int i = 0;
			try {
				if(dmd.getDefect_id().equals(old_id)){
					if(DicDefectDao.getInstance().checkName_s( dmd.getDefect_id(),dmd.getDefect_name(),dmd.getDefect_f_id())){
						i=-2;
					}else{
						i = DicDefectDao.getInstance().editDefect(dmd, old_id);
					}
				}else{
					if(DicDefectDao.getInstance().checkName_s( old_id,dmd.getDefect_name(),dmd.getDefect_f_id())){
						i=-2;
					}else if(DicDefectDao.getInstance().checkId_s( dmd.getDefect_id())){
						i=-2;
					}else{
						i = DicDefectDao.getInstance().editDefect(dmd, old_id);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicDefectServlet+editDefect+dmd:"+dmd+"+old_id:"+old_id);
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
				LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicDefectServlet+editDefect");
				break;
			}
			ro.ToJsp(response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
