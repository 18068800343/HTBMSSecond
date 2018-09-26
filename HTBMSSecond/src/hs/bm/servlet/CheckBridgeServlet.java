package hs.bm.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.BrgMbrInfo;
import hs.bm.bean.BrgSpanInfo;
import hs.bm.bean.ChkSpanRecord;
import hs.bm.dao.BrgMbrDao;
import hs.bm.dao.CheckBridgeDao;
import hs.bm.dao.CheckSpanDao;
import hs.bm.dao.CurrentControlDao;
import hs.bm.dao.LogDao;
import hs.bm.util.FileManageUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BridgeChk;
import hs.bm.vo.BridgeMemAll;
import hs.bm.vo.DicDefect;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;

public class CheckBridgeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckBridgeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		OperationConstruct op = (OperationConstruct)session.getAttribute("OperationConstruct");
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		
		if(type.equals("getSpan")){
			String bridge_id= request.getParameter("bridge_id"); 
			List<BrgSpanInfo> ll = CheckBridgeDao.getInstance().getSpan(bridge_id);
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
		
		if(type.equals("getPerson")){
			String prj_id= request.getParameter("prj_id"); 
			String names = CheckBridgeDao.getInstance().getPerson(prj_id);
			if(names==null){
				ro.setError(2);
			}else{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(names);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("checkState")){
			String info = request.getParameter("info");
			OperationConstruct oc = JSON.parseObject(info, OperationConstruct.class);
			String username=(String) request.getSession().getAttribute("username");
			ro=CheckBridgeDao.getInstance().CheckState(username, oc);
			if(ro.getSuccess().equals("fail")){
				ro.ToJsp(response);
				return;
			}else{
				BridgeChk bc = (BridgeChk)ro.getObj();
				bc = CheckBridgeDao.getInstance().getAllSpansData(bc);
				ro.setObj(bc);
				ro.ToJsp(response);
				return;
			}
		}
		
		if(type.equals("editSpan")){
			String info=request.getParameter("info");
			ChkSpanRecord cs=JSON.parseObject(info, ChkSpanRecord.class);
			try {
				int i=CheckBridgeDao.getInstance().editSpan(cs);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckBridgeServlet+editSpan");
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckBridgeServlet+editSpan+cs:"+cs);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("delSpan")){
			String span_chk_id=request.getParameter("span_chk_id");
			try {
				List<String> ll = CheckBridgeDao.getInstance().getDefectPhoto(span_chk_id);
				int i=CheckBridgeDao.getInstance().delSpan(span_chk_id);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);	
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckBridgeServlet+delSpan");
						FileManageUtil.deleteAll(ll);
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckBridgeServlet+delSpan+span_chk_id:"+span_chk_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("overCheck")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			String chk_id = request.getParameter("chk_id");
			String temp = request.getParameter("temp");
			System.out.println(temp);
			
			if(oc==null){
				ro.setError(3);
				ro.ToJsp(response);
				return;
			}
			if (temp != null) {
				CheckSpanDao.getInstance().setTemp(op.getChk_id(), temp);
			}
			int i = CheckBridgeDao.getInstance().overCheck(oc, chk_id);
			switch (i) {
			case 0:
				ro.setError(1);
				ro.setSuccess("fail");
				break;
			case -1:
				ro.setError(2);
				ro.setSuccess("fail");
				break;
			case -3:
				ro.setError(4);
				ro.setSuccess("fail");
				break;
			default:
				ro.setError(0);
				ro.setSuccess("success");
				break;
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addSpan")){
			String info=request.getParameter("info");
			ChkSpanRecord cs=JSON.parseObject(info, ChkSpanRecord.class);
			
			String username = (String)request.getSession().getAttribute("username");
			cs.setRecord_person(username);
			String uuid=UUID.randomUUID().toString().replaceAll("-", "");
			cs.setSpan_chk_id(uuid);
			try {
				int i=CheckBridgeDao.getInstance().addSpan(cs);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"增加", "操作成功","CheckBridgeServlet+addSpan");
						ro.setObj(uuid);
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加", e.getMessage(),"CheckBridgeServlet+addSpan+cs:"+cs);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("setTopConstruct")){
			String direction = request.getParameter("direction");
			String id = request.getParameter("id");
			String span_no = request.getParameter("span_no");
			String brg_type_name = CheckBridgeDao.getInstance().getTopConstruct(id, direction, span_no);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(brg_type_name);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("setDownConstruct")){
			String id = request.getParameter("id");
			List<String> ll = CheckBridgeDao.getInstance().getDownConstruct(id);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("initPhoto")){
			String id = request.getParameter("id");
			String prj_id = request.getParameter("prj_id");
			Map<String, String> map= CheckBridgeDao.getInstance().initPhoto( id, prj_id );
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("updatePhoto")){
			String id = request.getParameter("id");
			String prj_id = request.getParameter("prj_id");
			String path = request.getParameter("path");
			File baseDir = new File(PropertiesUtil.getPropertiesByName("rootDir"));
			File fileDir = new File(baseDir, id+File.separator+"card");
			path = FileManageUtil.fileMove(new File(baseDir, path), fileDir);
			path = path.replace(baseDir.getAbsolutePath()+File.separator, "");
			String photo_type = request.getParameter("photo_type");
			try {
				CheckBridgeDao.getInstance().updatePhoto( id, prj_id, path, photo_type);
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckBridgeServlet+updatePhoto");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckBridgeServlet+updatePhoto+id"+id+"+prj_id:"+prj_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("changeState")){
			String chk_id = request.getParameter("chk_id");
			String prj_id = request.getParameter("prj_id");
			try {
				int i = CheckBridgeDao.getInstance().changeState(chk_id,prj_id);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				case -3:
					ro.setError(4);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckBridgeServlet+updatePhoto");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckBridgeServlet+updatePhoto+chk_id:"+chk_id+"+prj_id:"+prj_id);
			}
			ro.ToJsp(response);
			return;
		}
		if("initDailyChkTable".equals(type)){
			List<BridgeMemAll> list = CurrentControlDao.getInstance().getMember_typeByBrg_id(op.getId());
			String date = CurrentControlDao.getInstance().getDailyChk_date(op.getPrj_id());
			for (int i = 0; i < list.size(); i++)
			{
				BridgeMemAll entity = list.get(i);
				entity.setChk_date(date);
			}
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		if("initSpan_no".equals(type)){
			String direction = request.getParameter("direction");
			String member_type = request.getParameter("member_type");
			List<BrgSpanInfo> list = CurrentControlDao.getInstance().get_Span_no_by_brgID_direction_memType(op.getId(), direction, member_type);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		if("initMember_type".equals(type)){
			String direction = request.getParameter("direction");
			String member_type = request.getParameter("member_type");
			String span_no = request.getParameter("span_no");
			List<BrgMbrInfo> list = CurrentControlDao.getInstance().getDailyChk_MemberType(op.getId(), direction, member_type, span_no);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		if("initMember_name".equals(type)){
			String direction = request.getParameter("direction");
			String member_type = request.getParameter("member_type");
			String span_no = request.getParameter("span_no");
			List<BrgMbrInfo> list = CurrentControlDao.getInstance().getDailyChk_MemberName(op.getId(), direction, member_type, span_no);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		if("initDefect_f".equals(type)){
			String member_type = request.getParameter("member_type");
			member_type=CheckSpanDao.getInstance().selectComponent8(member_type);
			List<DicDefect> list = CheckSpanDao.getInstance().getDefect(member_type);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		if("setTemp".equals(type)){
			String tem = request.getParameter("tem");
			int i = CheckSpanDao.getInstance().setTemp(op.getChk_id(), tem);
			System.out.println("更新"+i+"座桥的温度");
			ro.setError(0);
			ro.setSuccess("success");
			ro.ToJsp(response);
			return;
		}
		if("getTemp".equals(type)){
			String temp = CheckSpanDao.getInstance().getTemp(op.getChk_id());
			ro.setError(0);
			ro.setObj(temp);
			ro.setSuccess("success");
			ro.ToJsp(response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
