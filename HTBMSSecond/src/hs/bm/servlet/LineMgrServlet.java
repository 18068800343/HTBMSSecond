package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSON;
import hs.bm.bean.DicHwInfo;
import hs.bm.dao.LIneMgrDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.ResObj;


public class LineMgrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LineMgrServlet() {
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
			List<DicHwInfo> ll = LIneMgrDao.getInstance().initTable();
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
		
		if(type.equals("editHighWay")){
			try {
				String dhiStr = request.getParameter("info");
				DicHwInfo dhi = JSON.parseObject(dhiStr, DicHwInfo.class);
				int i = LIneMgrDao.getInstance().editHighWay(dhi);
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
					LogDao.getInstance().addLogInfo(log_user,"修改成功", "LineMgrServlet+editHighWay","editHighWay");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "LineMgrServlet+editHighWay",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delHighWay")){
			try {
				String highway_id = request.getParameter("highway_id");
				int i = LIneMgrDao.getInstance().delHighway(highway_id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除成功", "LineMgrServlet+delHighWay","delHighWay");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "LineMgrServlet+delHighWay",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addHighWay")){
			try {
				String dhiStr = request.getParameter("info");
				DicHwInfo dhi = JSON.parseObject(dhiStr, DicHwInfo.class);
				String highway_id = UUID.randomUUID().toString().replaceAll("-", "");
				dhi.setHighway_id(highway_id);
				int i = LIneMgrDao.getInstance().addHighWay(dhi);
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
					ro.setObj(highway_id);
					LogDao.getInstance().addLogInfo(log_user,"增加成功", "LineMgrServlet+addHighWay","addHighWay");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "LineMgrServlet+addHighWay",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
