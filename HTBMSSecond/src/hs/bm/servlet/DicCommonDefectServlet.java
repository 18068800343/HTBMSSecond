package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicBrgStructComponentDef;
import hs.bm.bean.DicMbrDefectDef;
import hs.bm.bean.DicMbrDefectF;
import hs.bm.dao.DicCommonDefectDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.ResObj;

public class DicCommonDefectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DicCommonDefectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String type = request.getParameter("type"); 
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		
		
		/**初始化部件列表组*/
		if(type.equals("initComponentItems")){
			String specification = request.getParameter("specification");
			List<DicBrgStructComponentDef> ll = DicCommonDefectDao.getInstance().initComponentItems(specification);
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
		
		
		
		if(type.equals("initMbrDefectDef")){
			String component_id = request.getParameter("component_id");
			List<Map<String, String>> ll = DicCommonDefectDao.getInstance().initMbrDefectDef(component_id);
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
		
		if(type.equals("initDefectOption")){
			List<DicMbrDefectF> ll = DicCommonDefectDao.getInstance().initDefectOption();
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
		
		/**保存部件和病害的关系*/
		if(type.equals("saveMbrDefectDef")){
			String component_id = request.getParameter("component_id");
			String info = request.getParameter("info");
			List<DicMbrDefectDef> ll = JSON.parseArray(info, DicMbrDefectDef.class);
			try {
				int i = DicCommonDefectDao.getInstance().saveMbrDefectDef(ll, component_id);
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
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CulMbrServlet+saveMbrDefectDef");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CulMbrServlet+saveMbrDefectDef+ll:"+ll+"+component_id:"+component_id);
			}
			ro.ToJsp(response);
			return;
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
