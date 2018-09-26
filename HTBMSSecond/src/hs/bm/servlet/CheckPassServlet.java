package hs.bm.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.ChkBrgPhoto;
import hs.bm.bean.ChkPassPhoto;
import hs.bm.bean.ChkSpanRecord;
import hs.bm.bean.PassSpanInfo;
import hs.bm.dao.CheckBridgeDao;
import hs.bm.dao.CheckPassDao;
import hs.bm.dao.CheckSpanDao;
import hs.bm.dao.LogDao;
import hs.bm.util.FileManageUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BridgeChk;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;

public class CheckPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckPassServlet() {
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
		
		if(type.equals("getSpan")){
			String pass_id= request.getParameter("pass_id"); 
			List<PassSpanInfo> ll = CheckPassDao.getInstance().getSpan(pass_id);
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
			String names = CheckPassDao.getInstance().getPerson(prj_id);
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
			ro=CheckPassDao.getInstance().CheckState(username, oc);
			if(ro.getSuccess().equals("fail")){
				ro.ToJsp(response);
				return;
			}else{
				BridgeChk bc = (BridgeChk)ro.getObj();
				bc = CheckPassDao.getInstance().getAllSpansData(bc);
				ro.setObj(bc);
				ro.ToJsp(response);
				return;
			}
		}
		
		if(type.equals("editSpan")){
			String info=request.getParameter("info");
			ChkSpanRecord cs=JSON.parseObject(info, ChkSpanRecord.class);
			try {
				int i=CheckPassDao.getInstance().editSpan(cs);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckPassServlet+editSpan");
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckPassServlet+editSpan+cs:"+cs);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("delSpan")){
			String span_chk_id=request.getParameter("span_chk_id");
			List<String> ll = CheckBridgeDao.getInstance().getDefectPhoto(span_chk_id);
			try {
				int i=CheckPassDao.getInstance().delSpan(span_chk_id);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);	
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","CheckPassServlet+delSpan");
						FileManageUtil.deleteAll(ll);
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"CheckPassServlet+delSpan+span_chk_id:"+span_chk_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("overCheck")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			String eval_level = request.getParameter("eval_level");
			String inspection_person = request.getParameter("inspection_person");
			String chk_id = request.getParameter("chk_id");
			if(oc==null){
				ro.setError(3);
				ro.ToJsp(response);
				return;
			}
			int i = CheckPassDao.getInstance().overCheck(oc, chk_id, eval_level, inspection_person);
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
				int i=CheckPassDao.getInstance().addSpan(cs);
				if(i<0){
					ro.setError(2);
				}else if(i>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CheckPassServlet+addSpan");
						ro.setObj(uuid);
				}else{
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CheckPassServlet+addSpan+cs:"+cs);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("changeState")){
			String chk_id = request.getParameter("chk_id");
			String prj_id = request.getParameter("prj_id");
			try {
				int i = CheckPassDao.getInstance().changeState(chk_id, prj_id);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckPassServlet+changeState");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckPassServlet+changeState+chk_id:"+chk_id+"+prj_id:"+prj_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("initPhoto")){
			String id = request.getParameter("id");
			String prj_id = request.getParameter("prj_id");
			Map<String, String> map= CheckPassDao.getInstance().initPhoto( id, prj_id );
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
				CheckPassDao.getInstance().updatePhoto( id, prj_id, path, photo_type);
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckPassServlet+updatePhoto");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckPassServlet+updatePhoto+id:"+id+"+prj_id:"+prj_id);
			}
			ro.ToJsp(response);
			return;
		}
		if ("lookImgBySerial".equals(type)) {
			// 查看病害照片
			String serial = request.getParameter("serial");

			List<ChkPassPhoto> photos = CheckSpanDao.getInstance().selectPassPhotoBySerial(serial);

			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(photos);
			ro.ToJsp(response);

			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
