package hs.bm.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.javafx.collections.MappingChange.Map;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgGpsStatistic;
import hs.bm.bean.BrgHealthStatistic;
import hs.bm.bean.BrgStaticStatistic;
import hs.bm.bean.BrgSystem;
import hs.bm.bean.BrgWeightLoadRatio;
import hs.bm.bean.BrgWeightStatistic;
import hs.bm.bean.BrgWindStatistic;
import hs.bm.bean.Connect;
import hs.bm.bean.DicBrgMonitoringItem;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.BrgMonitorDao;
import hs.bm.dao.GetFileSizeDao;
import hs.bm.dao.LogDao;
import hs.bm.dao.MonitoringDao;
import hs.bm.util.GetDayBetweenStartAndEnd;
import hs.bm.vo.CalendarVO;
import hs.bm.vo.ManageSectionBridge;
import hs.bm.vo.ResObj;

public class WeightHealthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WeightHealthServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		HttpSession session = request.getSession();
		String userRole = (String) session.getAttribute("userRole");
		String log_user=(String) request.getSession().getAttribute("username");
		if(type.equals("addBrgWeightSystem")){
			String bridge_id = request.getParameter("bridge_id");
			try {
				if(!GetFileSizeDao.getInstance().checkDir(bridge_id,"w")){
					ro.setError(2);
				}else{
					int i = GetFileSizeDao.getInstance().addBrgSystem(bridge_id,"w");
					if(i<=0){
						ro.setError(1);
					}else{
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"增加成功", "addBrgWeightSystem","WeightHealthServlet");
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "addBrgWeightSystem",e.getMessage()+" *** "+bridge_id);
			}
			ro.ToJsp(response);
			return;
		}
	
		if("getInfo".equals(type)) {
			List<DicBrgMonitoringItem> ll = MonitoringDao.getInstance().getItem_first();
			HashMap<String,List<DicBrgMonitoringItem>> map = new HashMap<String,List<DicBrgMonitoringItem>>();
			for (int i = 0; i < ll.size(); i++) {
				DicBrgMonitoringItem entity = ll.get(i);
				List<DicBrgMonitoringItem> list_second =  MonitoringDao.getInstance().getItem_second(entity);
				map.put(entity.getItem_first(), list_second);
			}
			if (map.size()>0) {
				ro.setError(0);
				ro.setObj(map);
				ro.setSuccess("success");
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if ("initItem_first".equals(type)) {
			List<DicBrgMonitoringItem> ll = MonitoringDao.getInstance().getItem_first();
			if (ll.size()>0) {
				ro.setError(0);
				ro.setObj(ll);
				ro.setSuccess("success");
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if(type.equals("addBrgHealthSystem")){
			String bridge_id = request.getParameter("bridge_id");
			try {
				if(!GetFileSizeDao.getInstance().checkDir(bridge_id,"s")){
					ro.setError(2);
				}else{
					int i = GetFileSizeDao.getInstance().addBrgSystem(bridge_id,"s");
					if(i<=0){
						ro.setError(1);
					}else{
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"增加成功", "addBrgHealthSystem","WeightHealthServlet");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "addBrgHealthSystem",e.getMessage()+" *** "+bridge_id);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("addBrgWindSystem")){
			String bridge_id = request.getParameter("bridge_id");
			try {
				if(!GetFileSizeDao.getInstance().checkDirWind(bridge_id,"f")){
					ro.setError(2);
				}else{
					int i = GetFileSizeDao.getInstance().addBrgSystemWind(bridge_id,"f");
					if(i<=0){
						ro.setError(1);
					}else{
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"增加成功", "addBrgWindSystem","WeightHealthServlet");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "addBrgWindSystem",e.getMessage()+" *** "+bridge_id);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("addBrgGpsSystem")){
			String bridge_id = request.getParameter("bridge_id");
			try {
				if(!GetFileSizeDao.getInstance().checkDirGPS(bridge_id,"g")){
					ro.setError(2);
				}else{
					int i = GetFileSizeDao.getInstance().addBrgSystemGPS(bridge_id,"g");
					if(i<=0){
						ro.setError(1);
					}else{
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"增加成功", "addBrgGpsSystem","WeightHealthServlet");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "addBrgGpsSystem",e.getMessage()+" *** "+bridge_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addBrgStaticSystem")){
			String bridge_id = request.getParameter("bridge_id");
			try {
				if(!GetFileSizeDao.getInstance().checkDir(bridge_id,"j")){
					ro.setError(2);
				}else{
					int i = GetFileSizeDao.getInstance().addBrgSystem(bridge_id,"j");
					if(i<=0){
						ro.setError(1);
					}else{
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"增加成功", "addBrgStaticSystem","WeightHealthServlet");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "addBrgStaticSystem",e.getMessage()+" *** "+bridge_id);
			}
			ro.ToJsp(response);
			return;
		}
		if("Sourcedata".equals(type)) {
			String bridge_id = request.getParameter("bridge_id");
			String data_type = request.getParameter("data_type");
			HashMap<String, Object> rs = new HashMap<String, Object>();
			System.out.println(data_type);
			System.out.println(bridge_id);
			List ll = null; 
			if ("weight".equals(data_type)) {
				 ll = GetFileSizeDao.getInstance().GetWeightData(bridge_id);
				 String starttime = GetFileSizeDao.getInstance().getMonitor_startTime(bridge_id, data_type);
				 System.out.println(starttime);
				 java.util.Map<String, Integer> map =  GetDayBetweenStartAndEnd.getBetweenDates(starttime);
				 for (int i = 0; i < ll.size(); i++) {
					 BrgWeightStatistic entity = (BrgWeightStatistic) ll.get(i);
					 String date = entity.getStart_time().split(" ")[0];
					 if (map.containsKey(date)) {
						int a = (int) map.get(date);
						map.put(date, a+1);
					}
				}
				 ArrayList<CalendarVO> calendar = GetDayBetweenStartAndEnd.getMapAfterCounting(map);
				 rs.put("table", ll);
				 rs.put("calendar", calendar);
				 System.out.println(calendar.size());
			}else if("health".equals(data_type)) {
				ll = GetFileSizeDao.getInstance().GetHealthData(bridge_id);
				 String starttime = GetFileSizeDao.getInstance().getMonitor_startTime(bridge_id, data_type);
				 System.out.println(starttime);
				 java.util.Map<String, Integer> map =  GetDayBetweenStartAndEnd.getBetweenDates(starttime);
				 for (int i = 0; i < ll.size(); i++) {
					 BrgHealthStatistic entity = (BrgHealthStatistic) ll.get(i);
					 String date = entity.getStart_time().split(" ")[0];
					 if (map.containsKey(date)) {
						int a = (int) map.get(date);
						map.put(date, a+1);
					}
				}
				 ArrayList<CalendarVO> calendar = GetDayBetweenStartAndEnd.getMapAfterCounting(map);
				 rs.put("table", ll);
				 rs.put("calendar", calendar);
				 System.out.println(calendar.size());
				
			}else if("gps".equals(data_type)){		
				String bridge_name = request.getParameter("bridge_name");
				ll = GetFileSizeDao.getInstance().GetGpsData(bridge_id,bridge_name);
				String starttime = GetFileSizeDao.getInstance().getMonitor_startTime(bridge_id, data_type);
				System.out.println(starttime);
				java.util.Map<String,Integer> map = GetDayBetweenStartAndEnd.getBetweenDates(starttime);
				for(int i = 0;i<ll.size();i++) {
					BrgGpsStatistic entity = (BrgGpsStatistic) ll.get(i);
					String date = entity.getStart_time().split(" ")[0];
					if(map.containsKey(date)) {
						int a = map.get(date);
						map.put(date, a + 1);
					}
				}
				 ArrayList<CalendarVO> calendar = GetDayBetweenStartAndEnd.getMapAfterCounting(map);
				 rs.put("table", ll);
				 rs.put("calendar", calendar);
				 System.out.println(calendar.size());
			}else if("static".equals(data_type)){
				ll = GetFileSizeDao.getInstance().GetStaticData(bridge_id);
				String starttime = GetFileSizeDao.getInstance().getMonitor_startTime(bridge_id, data_type);
				System.out.println(starttime);
				java.util.Map<String,Integer> map = GetDayBetweenStartAndEnd.getBetweenDates(starttime);
				for(int i = 0;i<ll.size();i++) {
					BrgStaticStatistic entity = (BrgStaticStatistic) ll.get(i);
					String date = entity.getStart_time().split(" ")[0];
					if(map.containsKey(date)) {
						int a = map.get(date);
						map.put(date, a + 1);
					}
				}
				 ArrayList<CalendarVO> calendar = GetDayBetweenStartAndEnd.getMapAfterCounting(map);
				 rs.put("table", ll);
				 rs.put("calendar", calendar);
				 System.out.println(calendar.size());
			}else  {
				//GPS数据
			}
			if (rs !=null&&rs.size()>0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(rs);
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if("getStart_date".equals(type)) {
			String brg_id = request.getParameter("brg_id");
			String data_type = request.getParameter("data_type");
			String starttime = GetFileSizeDao.getInstance().getMonitor_startTime(brg_id, data_type);
			System.out.println(starttime);
			ro.setSuccess(starttime);
			ro.setError(0);
			ro.ToJsp(response);
		}
		if(type.equals("weight")){
			String bridge_id = request.getParameter("bridge_id");
			List<BrgWeightStatistic> ll = GetFileSizeDao.getInstance().GetWeightData(bridge_id);
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
		if("hideBtn".equals(type)) {
			String brg_id = request.getParameter("brg_id");
			ArrayList<BrgSystem> ll = GetFileSizeDao.getInstance().getAllSystemBtOneBridge(brg_id);
			if (ll.size()>0) {
				ro.setObj(ll);
				ro.setError(0);
				ro.setSuccess("success");
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if(type.equals("health")){
			String bridge_id = request.getParameter("bridge_id");
			List<BrgHealthStatistic> ll = GetFileSizeDao.getInstance().GetHealthData(bridge_id);
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
		if(type.equals("wind")){
			String bridge_id = request.getParameter("bridge_id");
			List<BrgWindStatistic> ll = GetFileSizeDao.getInstance().GetWindData(bridge_id);
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
		if(type.equals("gps")) {
			String bridge_id = request.getParameter("bridge_id");
			String bridge_name = request.getParameter("bridge_name");
			if(bridge_name == null) {
				List<BrgGpsStatistic> ll = GetFileSizeDao.getInstance().GetGpsDataS(bridge_id);
				if(ll == null) {
					ro.setError(2);
				}else if(ll.size() > 0) {
					ro.setError(0);
					ro.setSuccess("success");
					ro.setObj(ll);
				}else {
					ro.setError(1);
				}
				ro.ToJsp(response);
				return;
			}
			
			List<BrgGpsStatistic> ll = GetFileSizeDao.getInstance().GetGpsData(bridge_id,bridge_name);
			if(ll == null) {
				ro.setError(2);
			}else if(ll.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("static")) {
			String bridge_id = request.getParameter("bridge_id");
			List<BrgStaticStatistic> ll = GetFileSizeDao.getInstance().GetStaticData(bridge_id);
			if(ll == null) {
				ro.setError(2);
			}else if(ll.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("getWeightNo")){
			int i=GetFileSizeDao.getInstance().GetFileInTime(10,type);
			ro.setObj(i);
			ro.ToJsp(response);
			return;
		}
		if(type.equals("getHealthNo")){
			int i=GetFileSizeDao.getInstance().GetFileInTime(10,type);
			ro.setObj(i);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("initWeightTree")){
			String orgid = (String) session.getAttribute("orgid");
			List<Connect> ll=new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) 
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				
				orgid= orgid.substring(0,4)+"%";
				
				ll=GetFileSizeDao.getInstance().initWeightTree2(orgid);
			}else {
				ll=GetFileSizeDao.getInstance().initWeightTree();
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
		
		
		if(type.equals("initHealthTree")){
			String orgid = (String) session.getAttribute("orgid");
			List<Connect> ll = new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) 
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				
				orgid= orgid.substring(0,4)+"%";
				ll=GetFileSizeDao.getInstance().initHealthTree2(orgid);
			}else {
				ll=GetFileSizeDao.getInstance().initHealthTree();
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
		
		if(type.equals("initWindTree")){
			String orgid = (String) session.getAttribute("orgid");
			List<Connect> ll=new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) 
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				
				orgid= orgid.substring(0,4)+"%";
				
				ll=GetFileSizeDao.getInstance().initWindTree2(orgid);
			}else {
				ll=GetFileSizeDao.getInstance().initWindTree();
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
		
		if(type.equals("initGPSTree")){
			String orgid = (String) session.getAttribute("orgid");
			List<Object> list = new ArrayList<>();
			List<Connect> ll=new ArrayList<>();
			List<Connect> children = new ArrayList<>();
			List<BrgSystem> brgSystems = new ArrayList<>();
			java.util.Map<String,List<BrgSystem>> map  = new HashMap<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) 
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				
				orgid= orgid.substring(0,4)+"%";
				
				ll=GetFileSizeDao.getInstance().initGPSTree2(orgid);
			}else {
				ll=GetFileSizeDao.getInstance().initGPSTreeOne();
				children=ll.get(0).getChildren();
				if(children.size()>0){
					for(Connect connect:children){
						brgSystems = GetFileSizeDao.getInstance().getBrgSystemsById(connect.getId(),connect.getBgco());
						map.put(connect.getId(), brgSystems);
					}
				}
			}
			list.add(ll);
			list.add(map);
			if(ll==null){
				ro.setError(2);
			}else if(ll.size()>0){
				
					ro.setError(0);
					ro.setSuccess("success");
					ro.setObj(list);
			}else{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
	
		if(type.equals("initStaticTree")){
			String orgid = (String) session.getAttribute("orgid");
			List<Connect> ll=new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) 
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				
				orgid= orgid.substring(0,4)+"%";
				
				ll=GetFileSizeDao.getInstance().initStaticTree2(orgid);
			}else {
				ll=GetFileSizeDao.getInstance().initStaticTree();
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
		
		if(type.equals("initManageSection")){
			List<ManageSectionBridge> ll=GetFileSizeDao.getInstance().initManageSection();
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
		if("getScan_struct".equals(type)) {
			List<BrgCardAdminId> ll = MonitoringDao.getInstance().getScan_struct(null);
			if (ll.size()>0) {
				ro.setError(0);
				ro.setObj(ll);
				ro.setSuccess("success");
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
