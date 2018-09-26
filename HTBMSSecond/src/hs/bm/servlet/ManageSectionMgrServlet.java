package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicManageSection;
import hs.bm.dao.LogDao;
import hs.bm.dao.ManageSectionMgrDao;
import hs.bm.vo.ResObj;

public class ManageSectionMgrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManageSectionMgrServlet() {
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
			List<DicManageSection> ll = ManageSectionMgrDao.getInstance().initTable();
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
		
		if(type.equals("editSection")){
			try {
				String dhiStr = request.getParameter("info");
				DicManageSection dmo = JSON.parseObject(dhiStr, DicManageSection.class);
				int i = ManageSectionMgrDao.getInstance().editSection(dmo);
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
					LogDao.getInstance().addLogInfo(log_user,"修改成功", "ManageSectionMgrServlet+editSection","editSection");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "ManageSectionMgrServlet+editSection",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delSection")){
			try {
				String section_id = request.getParameter("section_id");
				int i = ManageSectionMgrDao.getInstance().delSection(section_id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除成功", "ManageSectionMgrServlet+delSection","delSection");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "ManageSectionMgrServlet+delSection",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addSection")){
			try {
				String dmoStr = request.getParameter("info");
				DicManageSection dmo = JSON.parseObject(dmoStr, DicManageSection.class);
				String section_id = UUID.randomUUID().toString().replaceAll("-", "");
				dmo.setSection_id(section_id);
				int i = ManageSectionMgrDao.getInstance().addSection(dmo);
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
					LogDao.getInstance().addLogInfo(log_user,"增加成功", "ManageSectionMgrServlet+addSection","addSection");
					ro.setObj(section_id);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "ManageSectionMgrServlet+addSection",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
