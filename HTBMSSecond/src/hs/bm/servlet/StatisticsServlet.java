package hs.bm.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tools.ant.util.SymbolicLinkUtils;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicBrgStructTypeDef;
import hs.bm.bean.DicCulStructTypeDef;
import hs.bm.bean.DicPassStructTypeDef;
import hs.bm.dao.DicStructTypeDao;
import hs.bm.dao.StatisticsDao;
import hs.bm.vo.BrgStructTypeVO;
import hs.bm.vo.DefectStatistics;
import hs.bm.vo.EvalStatistics;
import hs.bm.vo.MemberStatistics;
import hs.bm.vo.ResObj;

public class StatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StatisticsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);

		if (type.equals("initProject")) {
			HttpSession session = request.getSession();
			String orgid = (String) session.getAttribute("orgid");
			String userRole = (String) session.getAttribute("userRole");
			
			List<Map<String, String>> ll = new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) /*|| "superAdmin".equals(userRole)*/
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				String zone_id= orgid.substring(0,4)+"%";
				ll = StatisticsDao.getInstance().initProject2(zone_id);
			} else {
				ll = StatisticsDao.getInstance().initProject();
			}
			
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
		
		if (type.equals("getProject")) {
			HttpSession session = request.getSession();
			String orgid = (String) session.getAttribute("orgid");
			String userRole = (String) session.getAttribute("userRole");
			String norm=request.getParameter("norm");
			String custodyId=request.getParameter("custodyId");
			List<Map<String, String>> ll = new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) /*|| "superAdmin".equals(userRole)*/
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				String zone_id= orgid.substring(0,4)+"%";
				ll = StatisticsDao.getInstance().getProject2(norm,zone_id);
			} else {
				ll = StatisticsDao.getInstance().getProject1(norm,custodyId);
			}
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initStruct")) {
			HttpSession session = request.getSession();
			String orgid = (String) session.getAttribute("orgid");
			String userRole = (String) session.getAttribute("userRole");
			
			Map<String, List<Map<String, String>>> ll = new HashMap<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole)
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				if(null!=orgid&&!"".equals(orgid)){
				orgid = orgid.substring(0,4)+"%";
				ll = StatisticsDao.getInstance().GetAllStruct2(orgid);
				}
			}else {
				
				ll = StatisticsDao.getInstance().GetAllStruct();
			}
			
			if (ll == null) {
				ro.setError(2);
			} else if (ll.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				
				ro.setObj(ll);
			} else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initStructType")) {
			HttpSession session = request.getSession();
			String userRole = (String) session.getAttribute("userRole");
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) || "superAdmin".equals(userRole)
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {

			}
			List<BrgStructTypeVO> lb1 = DicStructTypeDao.getInstance().initBridgeType();
			List<DicCulStructTypeDef> lc = DicStructTypeDao.getInstance().initCulvertType();
			List<DicPassStructTypeDef> lp = DicStructTypeDao.getInstance().initPassType();
			List<DicBrgStructTypeDef> lb = new ArrayList<DicBrgStructTypeDef>();
			for (int i = 0; i < lb1.size(); i++) {
				lb.addAll(lb1.get(i).getLl());
			}
			Map<String, List<Map<String, String>>> ll = new HashMap<String, List<Map<String, String>>>();
			List<Map<String, String>> mb = new ArrayList<Map<String, String>>();
			for (DicBrgStructTypeDef db : lb) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("id", db.getBrg_type_id());
				map.put("name", db.getBrg_type_name());
				mb.add(map);
			}
			ll.put("bridge", mb);
			List<Map<String, String>> mc = new ArrayList<Map<String, String>>();
			for (DicCulStructTypeDef dc : lc) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("id", dc.getCul_type_id());
				map.put("name", dc.getCul_type_name());
				mc.add(map);
			}
			ll.put("culvert", mc);
			List<Map<String, String>> mp = new ArrayList<Map<String, String>>();
			for (DicPassStructTypeDef dp : lp) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("id", dp.getPass_type_id());
				map.put("name", dp.getPass_type_name());
				mp.add(map);
			}
			ll.put("pass", mp);
			if (ll.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initComponent")) {
			List<String> bridge = StatisticsDao.getInstance().initComponent("桥梁检查记录");
			List<String> pass = StatisticsDao.getInstance().initComponent("通道检查记录");
			List<String> culvert = StatisticsDao.getInstance().initComponent("涵洞检查记录");
			Map<String, List<String>> map = new HashMap<String, List<String>>();
			map.put("bridge", bridge);
			map.put("pass", pass);
			map.put("culvert", culvert);
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}

		if (type.equals("searchMember")) {
			String info = request.getParameter("info");
			MemberStatistics statistics = JSON.parseObject(info, MemberStatistics.class);
			List<MemberStatistics> ll = StatisticsDao.getInstance().searchMember(statistics);
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}

		if (type.equals("searchDefect")) {
			String info = request.getParameter("info");
			DefectStatistics statistics = JSON.parseObject(info, DefectStatistics.class);
			List<DefectStatistics> ll = StatisticsDao.getInstance().searchDefect(statistics);
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}

		if (type.equals("searchEval")) {
			String info = request.getParameter("info");
			EvalStatistics statistics = JSON.parseObject(info, EvalStatistics.class);
			List<EvalStatistics> ll = StatisticsDao.getInstance().searchEval(statistics);
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("chioceProject")){
			String projectType=request.getParameter("chioceType");
			String orgId=request.getParameter("orgId");
			List<Map<String, String>> ll = new ArrayList<>();
			ll = StatisticsDao.getInstance().chioceProject(projectType, orgId);
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("reportCount")){
			String name=(String) request.getSession().getAttribute("username");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
			String startTime=sdf.format(new Date());
			int i=StatisticsDao.getInstance().initCount(name, startTime);
			String taskId=name+"-"+startTime+"-"+(i+1);
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(taskId);
			ro.ToJsp(response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
