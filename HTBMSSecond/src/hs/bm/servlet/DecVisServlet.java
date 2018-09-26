package hs.bm.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.dao.DecVisDao;
import hs.bm.dao.StatisticsDao;
import hs.bm.vo.Connect;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;

public class DecVisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DecVisServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		OperationConstruct op = (OperationConstruct) session.getAttribute("OperationConstruct");
		String bridge_id=op.getId();
		String type = request.getParameter("type");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		if(type.equals("initTree")){
			List<Connect> ll = DecVisDao.getInstance().getConnect(bridge_id);
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
		
		
		
		if(type.equals("initProject")){
			
			String orgid = (String) session.getAttribute("orgid");
			String userRole = (String) session.getAttribute("userRole");
			List<Map<String, String>> ll = new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) || "superAdmin".equals(userRole)
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				
				orgid = orgid.substring(0,4)+"%";
				ll = DecVisDao.getInstance().initProject2(bridge_id,orgid);
				
			}else {
				
				ll = DecVisDao.getInstance().initProject(bridge_id);
			}
			
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
		
		if(type.equals("initTable")){
			String prj_id=request.getParameter("prj_id");
			String direction=request.getParameter("direction");
			String span_no=request.getParameter("span_no");
			List<ChkBrgDefect> ll = DecVisDao.getInstance().initTable(prj_id,bridge_id,direction,span_no);
			List<ChkBrgDefect> ll1 = DecVisDao.getInstance().initTable2(prj_id,bridge_id,direction,span_no,"横向裂缝");
			List<ChkBrgDefect> ll2 = DecVisDao.getInstance().initTable2(prj_id,bridge_id,direction,span_no,"竖向裂缝");
			List<ChkBrgDefect> ll3 = DecVisDao.getInstance().initTable2(prj_id,bridge_id,direction,span_no,"纵向裂缝");
			List<ChkBrgDefect> ll4 = DecVisDao.getInstance().initTable2(prj_id,bridge_id,direction,span_no,"斜向裂缝");
			List<ChkBrgDefect> ll5 = DecVisDao.getInstance().initTable2(prj_id,bridge_id,direction,span_no,"水平裂缝");
	//		List<ChkBrgDefect> ll6 = DecVisDao.getInstance().initTable2(prj_id,bridge_id,direction,span_no,"环向裂缝");
			List<ChkBrgDefect> ll7 = DecVisDao.getInstance().initTable2(prj_id,bridge_id,direction,span_no,"网状裂缝");
			List<ChkBrgDefect> ll8 = DecVisDao.getInstance().initTable2(prj_id,bridge_id,direction,span_no,"其他裂缝");
			int i = DecVisDao.getInstance().getBeamNo(bridge_id, direction, span_no);
			if(ll==null){
				ro.setError(2);
			}else if(ll.size()>=0){
					ro.setError(0);
					ro.setSuccess("success");
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("beam", i);
					map.put("list", ll);
					map.put("list1", ll1);
					map.put("list2", ll2);
					map.put("list3", ll3);
					map.put("list4", ll4);
					map.put("list5", ll5);
	//				map.put("list6", ll6);
					map.put("list7", ll7);
					map.put("list8", ll8);
					ro.setObj(map);
			}else{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
			
		}
		
		
		
		if(type.equals("initSpanNum")){
			Map<String, Integer> ll = DecVisDao.getInstance().initSpanNum(bridge_id);
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
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
