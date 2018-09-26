package hs.bm.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import hs.bm.bean.BrgMonitor;
import hs.bm.bean.BrgWeightLoadRatio;
import hs.bm.bean.MaxGw;
import hs.bm.bean.MaxGw8;
import hs.bm.bean.MaxGwInfo;
import hs.bm.bean.MaxGwInfo8;
import hs.bm.bean.NumOvlo;
import hs.bm.bean.NumOvlo8;
import hs.bm.bean.NumVehi;
import hs.bm.bean.NumVehi8;
import hs.bm.bean.ProbOvlo;
import hs.bm.bean.ProbOvlo8;
import hs.bm.bean.RatioOvlo;
import hs.bm.bean.RatioOvlo8;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.BrgMonitorDao;
import hs.bm.dao.MaxGwDao;
import hs.bm.dao.MaxGwInfoDao;
import hs.bm.dao.NumOvloDao;
import hs.bm.dao.NumVehiDao;
import hs.bm.dao.ProbOvloDao;
import hs.bm.dao.RatioOvloDao;
import hs.bm.util.RunBatTest;
import hs.bm.vo.ResObj;

public class NumVehiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public NumVehiServlet() {
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
		if("getWeight".equals(type)){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
			String brg_id=request.getParameter("brg_id");
			String brg_no = BrgCardDao.getInstance().getBrgCardAdminIdData(brg_id).get(0).getBridge_no();
			String item_first=request.getParameter("item_first");
			String item_second=request.getParameter("item_second");
			String mode=request.getParameter("mode");
			String time=request.getParameter("time");
			String lastTime="";
			
			if(mode.equals("hour")){
				time=time+"-00";
				try {
					long t=sdf.parse(time).getTime()-1800000;
					Date date=new Date(t);
					lastTime=sdf.format(date);
					time=sdf.format(new Date(sdf.parse(time).getTime()+60000));
				} catch (ParseException e1) {
					e1.printStackTrace();
				}
			}
			
			JSONObject obj=  new JSONObject();
			JSONArray array = new JSONArray();
			if(item_second.equals("车辆荷载")){
				if("G25LR0040320800".equals(brg_no)||"G15320682L0100".equals(brg_no)||"G15320921L0010".equals(brg_no)){
					List<NumVehi8>list1=NumVehiDao.getInstance().selectNumVehi8(brg_no,mode,time,lastTime);
					List<MaxGw8>list2=MaxGwDao.getInstance().selectMaxGw8(brg_no,mode,time,lastTime);
					List<MaxGwInfo8>list3=MaxGwInfoDao.getInstance().selectMaxGwInfo8(brg_no,mode,time,lastTime);
					List<NumOvlo8>list4=NumOvloDao.getInstance().selectNumOvlo8(brg_no,mode,time,lastTime);
					List<RatioOvlo8>list5=RatioOvloDao.getInstance().selectRatioOvlo8(brg_no,mode,time,lastTime);
					List<ProbOvlo8>list6=ProbOvloDao.getInstance().selectProbOvlo8(brg_no,mode,time,lastTime);
					List<BrgWeightLoadRatio>list7=ProbOvloDao.getInstance().getOneByID(brg_no,mode,time,lastTime);
					List<BrgMonitor>list8=BrgMonitorDao.getIntance().selectBrgMonitor(item_first, item_second, brg_id);
					obj.put("NumVehi8", list1);
					obj.put("MaxGw8", list2);
					obj.put("MaxGwInfo8", list3);
					obj.put("NumOvlo8", list4);
					obj.put("RatioOvlo8", list5);
					obj.put("ProbOvlo8", list6);
					obj.put("LoadRadio", list7);
					obj.put("monitor",list8);
					array.add(obj);
				}else{
					List<NumVehi>list1=NumVehiDao.getInstance().selectNumVehi(brg_no,mode,time,lastTime);
					List<MaxGw>list2=MaxGwDao.getInstance().selectMaxGw(brg_no,mode,time,lastTime);
					List<MaxGwInfo>list3=MaxGwInfoDao.getInstance().selectMaxGwInfo(brg_no,mode,time,lastTime);
					List<NumOvlo>list4=NumOvloDao.getInstance().selectNumOvlo(brg_no,mode,time,lastTime);
					List<RatioOvlo>list5=RatioOvloDao.getInstance().selectRatioOvlo(brg_no,mode,time,lastTime);
					List<ProbOvlo>list6=ProbOvloDao.getInstance().selectProbOvlo(brg_no,mode,time,lastTime);
					List<BrgWeightLoadRatio>list7=ProbOvloDao.getInstance().getOneByID(brg_no,mode,time,lastTime);
					List<BrgMonitor>list8=BrgMonitorDao.getIntance().selectBrgMonitor(item_first, item_second, brg_id);
					obj.put("NumVehi", list1);
					obj.put("MaxGw", list2);
					obj.put("MaxGwInfo", list3);
					obj.put("NumOvlo", list4);
					obj.put("RatioOvlo", list5);
					obj.put("ProbOvlo", list6);
					obj.put("LoadRadio", list7);
					obj.put("monitor",list8);
					array.add(obj);
				}
			}
			ro.setObj(array);
			ro.ToJsp(response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
