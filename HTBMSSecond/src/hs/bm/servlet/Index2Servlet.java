package hs.bm.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.dao.Index2Dao;
import hs.bm.dao.StatisticsDao;
import hs.bm.dao.StructMgrDao;
import hs.bm.vo.ResObj;

public class Index2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public Index2Servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		if("getBrgDate".equals(type)){
            String highway_id=request.getParameter("highway_id");
			String manage_id=request.getParameter("manage_id");
			String section_id=request.getParameter("section_id");
			String zone_id=request.getParameter("zone_id");
			
			Map<String,List> map=Index2Dao.getInstance().getBrgDate(highway_id,manage_id,section_id,zone_id);
			if(map!=null){
				ro.setObj(map);
				ro.setSuccess("success");
				ro.setError(0);
			}
			ro.ToJsp(response);
			return;
		}
		if("getEvaDate".equals(type)){
			String highway_id=request.getParameter("highway_id");
			String manage_id=request.getParameter("manage_id");
			String section_id=request.getParameter("section_id");
			String zone_id=request.getParameter("zone_id");
			
			Map<String,List> map=Index2Dao.getInstance().getEvaDate(highway_id,manage_id,section_id,zone_id);
			if(map!=null){
				ro.setObj(map);
				ro.setSuccess("success");
				ro.setError(0);
			}
			ro.ToJsp(response);
			return;
		}
		if("initDisease".equals(type)){
			String bridgeType=request.getParameter("bridgeType");
			String componentType=request.getParameter("componentType");
			String disease=request.getParameter("disease");
			String diseaseType=request.getParameter("diseaseType");
			String highway_id=request.getParameter("highway_id");
			String manage_id=request.getParameter("manage_id");
			String section_id=request.getParameter("section_id");
			String zone_id=request.getParameter("zone_id");
			Map<String,List<Integer>> map=Index2Dao.getInstance().getDiseaseCount(bridgeType, componentType, disease, diseaseType,highway_id,manage_id,section_id,zone_id);
			ro.setObj(map);
			ro.setSuccess("success");
			ro.setError(0);
			ro.ToJsp(response);
			return;
		}
		
		if("initEvaType".equals(type)){
			String highway_id=request.getParameter("highway_id");
			String manage_id=request.getParameter("manage_id");
			String section_id=request.getParameter("section_id");
			String zone_id=request.getParameter("zone_id");
			Map<String,List> map=Index2Dao.getInstance().getEvaOf0411(highway_id,manage_id,section_id,zone_id);
			if(map!=null){
				ro.setObj(map);
				ro.setSuccess("success");
				ro.setError(0);
			}
			ro.ToJsp(response);
			return;
		}
		
		if (type.equals("initIndexBrg")) {
			String prj_id = request.getParameter("prj_id");
			String eva_type=request.getParameter("eva_type");
			String highway_id = request.getParameter("highway_id");
			String manage_id = request.getParameter("manage_id");
			String section_id = request.getParameter("section_id");
			String zone_id = request.getParameter("zone_id");
			List<BrgCardAdminId> lb =null;
			
			lb = Index2Dao.getInstance().initIndexBrg(prj_id, highway_id, manage_id, section_id,
						zone_id,eva_type);
			
			
			if (lb.size() > 0) {
				ro.setSuccess("success");
				ro.setObj(lb);
			}
			ro.ToJsp(response);
			return;
		}
		
		if (type.equals("getProject")) {
			HttpSession session = request.getSession();
			String userRole = (String) session.getAttribute("userRole");
			String orgid = (String) session.getAttribute("orgid");
			String norm=request.getParameter("norm");
			List<Map<String, String>> ll = new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) /*|| "superAdmin".equals(userRole)*/
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				String zone= orgid.substring(0,4)+"%";
				ll = Index2Dao.getInstance().getProject2(norm,zone);
			} else {
				String manage_id=request.getParameter("manage_id");
				ll = Index2Dao.getInstance().getProject1(norm,manage_id);
			}
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
