package hs.bm.servlet;

import java.io.IOException;
import java.text.ParseException;
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

import org.apache.catalina.tribes.group.RpcCallback;

import com.alibaba.fastjson.JSONArray;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgMonitor;
import hs.bm.bean.BrgWeightLoadRatio;
import hs.bm.bean.StaffNumber;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.BrgMonitorDao;
import hs.bm.dao.LogDao;
import hs.bm.dao.MonitoringDao;
import hs.bm.dao.StructMgrDao;
import hs.bm.vo.ResObj;

public class BrgMonitorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
    public BrgMonitorServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type=request.getParameter("type");
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		if("queryDate".equals(type)){
			String brg_id=request.getParameter("brgId");
			String item_first=request.getParameter("item_first");
			String item_second=request.getParameter("item_second");
			String mode=request.getParameter("mode");
			String monitor_id=BrgMonitorDao.getIntance().getMonitor_id(item_first, item_second, brg_id);
			//List list1=BrgMonitorDao.getIntance().selectCableforce(monitor_id, mode);
			//List list2=BrgMonitorDao.getIntance().selectDynadisp(monitor_id, mode);
			//List list3=BrgMonitorDao.getIntance().selectStrainc(monitor_id, mode);
			//List list4=BrgMonitorDao.getIntance().selectStrains(monitor_id, mode);
			//List list5=BrgMonitorDao.getIntance().selectTemp(monitor_id, mode);
		}
		if("getStrainc".equals(type)){
			try {
				String brg_id=request.getParameter("bridge_id");
				String item_first=request.getParameter("item_first");
				String item_second=request.getParameter("item_second");
				String mode=request.getParameter("mode");
				String time = request.getParameter("time");
				String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
				String monitor_id=BrgMonitorDao.getIntance().getMonitor_id(item_first, item_second, brg_id);
				BrgMonitor brgMonitor = BrgMonitorDao.getIntance().getMonitor(monitor_id);
				String[] chanelNums=null;
				String startTime="";
				if(brgMonitor!=null&&brgMonitor.getChanelNum()!=null){
					chanelNums = brgMonitor.getChanelNum().trim().split(",");
				}
				String[] pointsNos=null;
				if(brgMonitor!=null&&brgMonitor.getPointsNo()!=null){
					pointsNos = brgMonitor.getPointsNo().trim().split(",");
				}
				List straincs = new ArrayList<>();
				if("hour".equals(mode)){
					time=time+"-00";
					try {
						long t=sdf.parse(time).getTime()-1800000;
						Date date=new Date(t);
						startTime=sdf.format(date);
						time=sdf.format(new Date(sdf.parse(time).getTime()+60000));
					} catch (ParseException e1) {
						e1.printStackTrace();
					}
					 straincs=BrgMonitorDao.getIntance().selectStrainc(brg_no, mode,startTime,time);
				}else{
					 straincs=BrgMonitorDao.getIntance().selectStrainc(brg_no, mode,time);
				}
			
				ro.setSuccess("success");
				List list = new ArrayList();
				list.add(0, straincs);
				list.add(1, chanelNums);
				list.add(2,pointsNos);
				list.add(3,brgMonitor);
				
				ro.setObj(list);
			} catch (Exception e) {
				e.printStackTrace();
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		if("getStrains".equals(type)){
			try {
				String brg_id=request.getParameter("bridge_id");
				String item_first=request.getParameter("item_first");
				String item_second=request.getParameter("item_second");
				String mode=request.getParameter("mode");
				String time = request.getParameter("time");
				String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
				String monitor_id=BrgMonitorDao.getIntance().getMonitor_id(item_first, item_second, brg_id);
				BrgMonitor brgMonitor = BrgMonitorDao.getIntance().getMonitor(monitor_id);
				String[] chanelNums=null;
				if(brgMonitor!=null&&brgMonitor.getChanelNum()!=null){
					chanelNums = brgMonitor.getChanelNum().trim().split(",");
				}
				String[] pointsNos=null;
				if(brgMonitor!=null&&brgMonitor.getPointsNo()!=null){
					pointsNos = brgMonitor.getPointsNo().trim().split(",");
				}
				String startTime="";
				List strainss = new ArrayList<>();
				if("hour".equals(mode)){
					time=time+"-00";
					try {
						long t=sdf.parse(time).getTime()-1800000;
						Date date=new Date(t);
						startTime=sdf.format(date);
						time=sdf.format(new Date(sdf.parse(time).getTime()+60000));
					} catch (ParseException e1) {
						e1.printStackTrace();
					}
					strainss=BrgMonitorDao.getIntance().selectStrains(brg_no, mode,startTime,time);
				}else{
					strainss=BrgMonitorDao.getIntance().selectStrains(brg_no, mode,time);
				}
				
				ro.setSuccess("success");
				List list = new ArrayList();
				list.add(0, strainss);
				list.add(1, chanelNums);
				list.add(2,pointsNos);
				list.add(3,brgMonitor);
				ro.setObj(list);
			} catch (Exception e) {
				e.printStackTrace();
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		if("getDynadisp".equals(type)){
			try {
				String brg_id=request.getParameter("bridge_id");
				String item_first=request.getParameter("item_first");
				String item_second=request.getParameter("item_second");
				String mode=request.getParameter("mode");
				String time = request.getParameter("time");
				String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
				String monitor_id=BrgMonitorDao.getIntance().getMonitor_id(item_first, item_second, brg_id);
				BrgMonitor brgMonitor = BrgMonitorDao.getIntance().getMonitor(monitor_id);
				String[] chanelNums=null;
				if(brgMonitor!=null&&brgMonitor.getChanelNum()!=null){
					chanelNums = brgMonitor.getChanelNum().trim().split(",");
				}
 				String[] pointsNos=null;
				if(brgMonitor!=null&&brgMonitor.getPointsNo()!=null){
					pointsNos = brgMonitor.getPointsNo().trim().split(",");
				}
				String startTime="";
				List dynadisps = new ArrayList<>();
				if("hour".equals(mode)){
					time=time+"-00";
					try {
						long t=sdf.parse(time).getTime()-1800000;
						Date date=new Date(t);
						startTime=sdf.format(date);
						time=sdf.format(new Date(sdf.parse(time).getTime()+60000));
					} catch (ParseException e1) {
						e1.printStackTrace();
					}
					dynadisps=BrgMonitorDao.getIntance().selectDynadisp(brg_no, mode,startTime,time);
				}else{
					dynadisps=BrgMonitorDao.getIntance().selectDynadisp(brg_no, mode,time);
				}
				ro.setSuccess("success");
				List list = new ArrayList();
				list.add(0, dynadisps);
				list.add(1, chanelNums);
				list.add(2,pointsNos);
				list.add(3,brgMonitor);
				ro.setObj(list);
			} catch (Exception e) {
				e.printStackTrace();
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		if("getTemp".equals(type)){
			try {
				String brg_id=request.getParameter("bridge_id");
				String item_first=request.getParameter("item_first");
				String item_second=request.getParameter("item_second");
				String mode=request.getParameter("mode");
				String time = request.getParameter("time");
				String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
				String monitor_id=BrgMonitorDao.getIntance().getMonitor_id(item_first, item_second, brg_id);
				BrgMonitor brgMonitor = BrgMonitorDao.getIntance().getMonitor(monitor_id);
				String[] chanelNums=null;
				if(brgMonitor!=null&&brgMonitor.getChanelNum()!=null){
					chanelNums = brgMonitor.getChanelNum().trim().split(",");
				}
 				String[] pointsNos=null;
				if(brgMonitor!=null&&brgMonitor.getPointsNo()!=null){
					pointsNos = brgMonitor.getPointsNo().trim().split(",");
				}
				String startTime = "";
				List temp = new ArrayList<>();
				if("hour".equals(mode)){
					time=time+"-00";
					try {
						long t=sdf.parse(time).getTime()-1800000;
						Date date=new Date(t);
						startTime=sdf.format(date);
						time=sdf.format(new Date(sdf.parse(time).getTime()+60000));
					} catch (ParseException e1) {
						e1.printStackTrace();
					}
					temp=BrgMonitorDao.getIntance().selectTemp(brg_no, mode,startTime,time);
				}else{
					temp=BrgMonitorDao.getIntance().selectTemp(brg_no, mode,time);
				}
				ro.setSuccess("success");
				List list = new ArrayList();
				list.add(0, temp);
				list.add(1, chanelNums);
				list.add(2,pointsNos);
				list.add(3,brgMonitor);
				ro.setObj(list);
			} catch (Exception e) {
				e.printStackTrace();
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		if("getCableforce".equals(type)){
			try {
				String brg_id=request.getParameter("bridge_id");
				String item_first=request.getParameter("item_first");
				String item_second=request.getParameter("item_second");
				String mode=request.getParameter("mode");
				String time = request.getParameter("time");
				String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
				String monitor_id=BrgMonitorDao.getIntance().getMonitor_id(item_first, item_second, brg_id);
				BrgMonitor brgMonitor = BrgMonitorDao.getIntance().getMonitor(monitor_id);
				String[] chanelNums=null;
				if(brgMonitor!=null&&brgMonitor.getChanelNum()!=null){
					chanelNums = brgMonitor.getChanelNum().trim().split(",");
				}
 				String[] pointsNos=null;
				if(brgMonitor!=null&&brgMonitor.getPointsNo()!=null){
					pointsNos = brgMonitor.getPointsNo().trim().split(",");
				}
				
				String startTime = "";
				List cableforces = new ArrayList<>();
				if("hour".equals(mode)){
					time=time+"-00";
					try {
						long t=sdf.parse(time).getTime()-1800000;
						Date date=new Date(t);
						startTime=sdf.format(date);
						time=sdf.format(new Date(sdf.parse(time).getTime()+60000));
					} catch (ParseException e1) {
						e1.printStackTrace();
					}
					cableforces=BrgMonitorDao.getIntance().selectCableforce(brg_no, mode,startTime,time);
				}else{
					cableforces=BrgMonitorDao.getIntance().selectCableforce(brg_no, mode,time);
				}
				
				ro.setSuccess("success");
				List list = new ArrayList();
				list.add(0, cableforces);
				list.add(1, chanelNums);
				list.add(2,pointsNos);
				list.add(3,brgMonitor);
				ro.setObj(list);
			} catch (Exception e) {
				e.printStackTrace();
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		
		if("getStaticdisp".equals(type)){
			try {
				String brg_id=request.getParameter("bridge_id");
				String item_first=request.getParameter("item_first");
				String item_second=request.getParameter("item_second");
				String mode=request.getParameter("mode");
				String time = request.getParameter("time");
				String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
				String monitor_id=BrgMonitorDao.getIntance().getMonitor_id(item_first, item_second, brg_id);
				BrgMonitor brgMonitor = BrgMonitorDao.getIntance().getMonitor(monitor_id);
				String[] chanelNums=null;
				if(brgMonitor!=null&&brgMonitor.getChanelNum()!=null){
					chanelNums = brgMonitor.getChanelNum().trim().split(",");
				}
 				String[] pointsNos=null;
				if(brgMonitor!=null&&brgMonitor.getPointsNo()!=null){
					pointsNos = brgMonitor.getPointsNo().trim().split(",");
				}
				
				String startTime = "";
				List staticdisps = new ArrayList<>();
				if("hour".equals(mode)){
					time=time+"-00";
					try {
						long t=sdf.parse(time).getTime()-1800000;
						Date date=new Date(t);
						startTime=sdf.format(date);
						time=sdf.format(new Date(sdf.parse(time).getTime()+60000));
					} catch (ParseException e1) {
						e1.printStackTrace();
					}
					staticdisps=BrgMonitorDao.getIntance().selectStaticdisp(brg_no, mode,startTime,time);
				}else{
					staticdisps=BrgMonitorDao.getIntance().selectStaticdisp(brg_no, mode,time);
				}
				
				ro.setSuccess("success");
				List list = new ArrayList();
				list.add(0, staticdisps);
				list.add(1, chanelNums);
				list.add(2,pointsNos);
				list.add(3,brgMonitor);
				ro.setObj(list);
			} catch (Exception e) {
				e.printStackTrace();
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		
		if("lineData".equals(type)){
			String dataName=request.getParameter("dataName");
			String brg_id=request.getParameter("brg_id");
			String item_second=request.getParameter("item_second");
			String mode=request.getParameter("mode");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
			String tableName=dataName.split(",")[0];
			String rowName=dataName.split(",")[1];

			Map<String,List> map=BrgMonitorDao.getIntance().getRowList(tableName, rowName, brg_no, mode);
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}
		if("lineMonitorData".equals(type)){
			String dataName=request.getParameter("dataName");
			String brg_id=request.getParameter("brg_id");
			String mode=request.getParameter("mode");
			String tableName=dataName.split(",")[0];
			String rowName=dataName.split(",")[1];
			String sort = dataName.split(",")[2];
			String item_first=request.getParameter("item_first");
			String item_second=request.getParameter("item_second");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
			String monitor_id=BrgMonitorDao.getIntance().getMonitor_id(item_first, item_second, brg_id);
			List<String>list1=BrgMonitorDao.getIntance().getlineList1(tableName, brg_no, mode);
			List<String> list=BrgMonitorDao.getIntance().getRowListBySort(tableName, rowName, brg_no, mode,sort);
			Map map=new HashMap<>();
			map.put("x",list1);
			map.put("y", list);
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}
		if("getitem_second".equals(type)){
			String brg_id=request.getParameter("brg_id");
			String item_first=request.getParameter("item_first");
			List<String>list=BrgMonitorDao.getIntance().getItem_2(item_first, brg_id);
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		
		if("selectStaffNumber".equals(type)){
			Map<String,List>map=new HashMap<>();
			String brg_id=request.getParameter("brg_id");
			String item_all=request.getParameter("item_all");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
			String monitorType=request.getParameter("monitorType");
			List<StaffNumber> list1=BrgMonitorDao.getIntance().selectByNo(brg_no,monitorType,item_all);
			List<String>list2=BrgMonitorDao.getIntance().getItem_second(brg_id);
			map.put("list1", list1);
			map.put("list2", list2);
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}
		
		if("selectPhone".equals(type)){
			String brg_id=request.getParameter("brg_id");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
			String monitorType=request.getParameter("monitorType");
			String item_second=request.getParameter("item_second");
			StaffNumber phone=BrgMonitorDao.getIntance().selectByItem(brg_no, monitorType, item_second);
			
			ro.setObj(phone);
			ro.ToJsp(response);
			return;
		}
		
		if("selectPhoneOfWu".equals(type)){
			String brg_id=request.getParameter("brg_id");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
			String monitorType=request.getParameter("monitorType");
			String item_all=request.getParameter("item_all");
			List<StaffNumber>list=BrgMonitorDao.getIntance().selectByNo(brg_no,monitorType,item_all);
			StaffNumber phone = new StaffNumber();
			if(list.size()>0){
				phone=list.get(0);
			}
			ro.setObj(phone);
			ro.ToJsp(response);
			return;
		}
		
		if("updatePhoneOfwu".equals(type)){
			try {
				String monitorType=request.getParameter("monitorType");
				String brg_id=request.getParameter("brg_id");
				String item_all=request.getParameter("item_all");
				String name = request.getParameter("name");
				String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
				String phone=request.getParameter("phone");
				if(phone.indexOf("，")>0){
					phone=phone.replace("，", ",");
				}
				int i=0;
				List<StaffNumber>list=BrgMonitorDao.getIntance().selectByNo(brg_no,monitorType,item_all);
				StaffNumber sn=new StaffNumber();
				sn.setBrg_no(brg_no);
				sn.setType(monitorType);
				sn.setPhone(phone);
				sn.setName(name);
				sn.setItem_second(item_all);
				if(list.size()==0){
					i=BrgMonitorDao.getIntance().insertStaffNumber(sn);
				}else{
					i=BrgMonitorDao.getIntance().updateStaffNumber(sn);
				}
				ro.setObj(i);
				LogDao.getInstance().addLogInfo(log_user,"成功", "updatePhoneOfwu","BrgMonitorServlet");
				ro.ToJsp(response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"失败", "img",e.getMessage());
			}
		}
		
		if("updatePhoneOfAbnormal".equals(type)){
			try {
				String monitorType=request.getParameter("monitorType");
				String brg_id=request.getParameter("brg_id");
				String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
				String phone2=request.getParameter("phone2");
				String name = request.getParameter("name2");
				if(phone2.indexOf("，")>0){
					phone2=phone2.replace("，", ",");
				}
				if(name.indexOf("，")>0){
					name=name.replace("，", ",");
				}
				String item_second=request.getParameter("item_second");
				int i=0;
				String phoneNo=BrgMonitorDao.getIntance().selectByItem(brg_no, monitorType, item_second).getPhone();
				StaffNumber sn=new StaffNumber();
				sn.setBrg_no(brg_no);
				sn.setType(monitorType);
				sn.setPhone(phone2);
				sn.setItem_second(item_second);
				sn.setName(name);
				if(phoneNo==null){
					i=BrgMonitorDao.getIntance().insertStaffNumber(sn);
				}else{
					i=BrgMonitorDao.getIntance().updateStaffNumber(sn);
				}
				ro.setObj(i);
				LogDao.getInstance().addLogInfo(log_user,"成功", "updatePhoneOfAbnormal","BrgMonitorServlet");
				
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"失败", "updatePhoneOfAbnormal",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if("getInitBrgAndTime".equals(type)){
			Map<String,List>map=new HashMap<>();
			String zoneId=(String) request.getSession().getAttribute("orgid");
			String zone=null;
			if(zoneId!=null){
				zone=zoneId.substring(0,4)+"%";
			}
			List<BrgWeightLoadRatio>list=BrgMonitorDao.getIntance().getInitBrgIdAndTime();
			String brgNo=list.get(0).getBridge_id();
			String time=list.get(0).getStart_time();
			String brgId=BrgCardDao.getInstance().getBrgCardAdminIdDataByNo(brgNo).getBridge_id();
			List list1=new ArrayList<>();
			list1.add(0, brgId);
			list1.add(1, time);
			map.put("list1", list1);
			
			List<BrgCardAdminId> ll = MonitoringDao.getInstance().getScan_struct(zone);
			map.put("list2", ll);
			
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}
		
		
		if("initTime".equals(type)){
			String item_second=request.getParameter("item_second");
			String brgId=request.getParameter("brg_id");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brgId).get(0).getBridge_no();
			String tableName=null;
			String time=null;
			if("车辆荷载".equals(item_second)){
				time=BrgMonitorDao.getIntance().getBrgTime(brg_no,"hour");
			}else if("温度".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_temp", brgId,"hour");
			}else if("动位移".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_dynadisp", brgId,"hour");
			}else if("混凝土应变".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_strainc", brgId,"hour");
			}else if("钢应变".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_strains", brgId,"hour");
			}else if("索力".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_cableforce", brgId,"hour");
			}else if("静位移".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_staticdisp", brgId,"hour");
			}
			ro.setObj(time);
			ro.ToJsp(response);
			return;
		}
		
		if("initTimeOfDay".equals(type)){
			String item_second=request.getParameter("item_second");
			String brgId=request.getParameter("brg_id");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brgId).get(0).getBridge_no();
			String tableName=null;
			String time=null;
			if("车辆荷载".equals(item_second)){
				time=BrgMonitorDao.getIntance().getBrgTime(brg_no,"day");
			}else if("温度".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_temp", brgId,"day");
			}else if("动位移".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_dynadisp", brgId,"day");
			}else if("混凝土应变".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_strainc", brgId,"day");
			}else if("钢应变".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_strains", brgId,"day");
			}else if("索力".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_cableforce", brgId,"day");
			}else if("静位移".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_staticdisp", brgId,"day");
			}
			ro.setObj(time);
			ro.ToJsp(response);
			return;
		}
		
		if("initTimeOfMonth".equals(type)){
			String item_second=request.getParameter("item_second");
			String brgId=request.getParameter("brg_id");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brgId).get(0).getBridge_no();
			String tableName=null;
			String time=null;
			if("车辆荷载".equals(item_second)){
				time=BrgMonitorDao.getIntance().getBrgTime(brg_no,"month");
			}else if("温度".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_temp", brgId,"month");
			}else if("动位移".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_dynadisp", brgId,"month");
			}else if("混凝土应变".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_strainc", brgId,"month");
			}else if("钢应变".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_strains", brgId,"month");
			}else if("索力".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_cableforce", brgId,"month");
			}else if("静位移".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_staticdisp", brgId,"month");
			}
			ro.setObj(time);
			ro.ToJsp(response);
			return;
		}
		
		if("initTimeOfYear".equals(type)){
			String item_second=request.getParameter("item_second");
			String brgId=request.getParameter("brg_id");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brgId).get(0).getBridge_no();
			String tableName=null;
			String time=null;
			if("车辆荷载".equals(item_second)){
				time=BrgMonitorDao.getIntance().getBrgTime(brg_no,"year");
			}else if("温度".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_temp", brgId,"year");
			}else if("动位移".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_dynadisp", brgId,"year");
			}else if("混凝土应变".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_strainc", brgId,"year");
			}else if("钢应变".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_strains", brgId,"year");
			}else if("索力".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_cableforce", brgId,"year");
			}else if("静位移".equals(item_second)){
				time=BrgMonitorDao.getIntance().getTimeMonitor("brg_monitor_staticdisp", brgId,"year");
			}
			ro.setObj(time);
			ro.ToJsp(response);
			return;
		}
		
		
		if("getItem_first".equals(type)){
			String brgId=request.getParameter("brgId");
			List<String>list=BrgMonitorDao.getIntance().getItem_first(brgId);
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		
		if("dayHours".equals(type)){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String brgId=request.getParameter("brgId");
			String item_second=request.getParameter("item_second");
			String brgNo=BrgCardDao.getInstance().getBrgCardAdminIdData(brgId).get(0).getBridge_no();
			String dayTime=sdf.format(new Date())+"%";
			List<String>list=BrgMonitorDao.getIntance().getDayHours(item_second, brgNo, dayTime);
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
