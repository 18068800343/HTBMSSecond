package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicMemberCondition;
import hs.bm.bean.DicMemberStandard;
import hs.bm.dao.GetFileSizeDao;
import hs.bm.dao.LogDao;
import hs.bm.dao.MemberStandardDao;
import hs.bm.vo.ResObj;

public class DicMemberStandardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DicMemberStandardServlet() {
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
		
		if(type.equals("initTree")){
			List<DicMemberCondition> lc=MemberStandardDao.getInstance().initTree();
			if(lc.size()>0){
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(lc);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("initTable")){
			String condition_id = request.getParameter("condition_id");
			List<DicMemberStandard> lc=MemberStandardDao.getInstance().initTable(condition_id);
			if(lc.size()>0){
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(lc);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("edit")){
			String info=request.getParameter("info"); 
			DicMemberStandard dms=JSON.parseObject(info, DicMemberStandard.class);
			int i=0;
			try {
				i = MemberStandardDao.getInstance().editStandard(dms);
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicMemberStandardServlet+edit+dms:"+dms);
			}
			
			if(i>0){
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicMemberStandardServlet+edit");
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delete")){
			String standard_id=request.getParameter("standard_id"); 
			try {
				int i=MemberStandardDao.getInstance().delStandard(standard_id);
				if(i>0){
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicMemberStandardServlet+delete");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DicMemberStandardServlet+delete+standard_id:"+standard_id);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("delete2")){
			String condition_id=request.getParameter("condition_id");
			try {
				int i1=MemberStandardDao.getInstance().delCondition1(condition_id);
				int i=MemberStandardDao.getInstance().delCondition(condition_id);
				
				if(i>0&&i1>=0){
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicMemberStandardServlet+delete2");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DicMemberStandardServlet+delete2+condition_id:"+condition_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addCondition")){
			String info=request.getParameter("info"); 
			DicMemberCondition dmc=JSON.parseObject(info, DicMemberCondition.class);
			String uuid=UUID.randomUUID().toString();
			dmc.setCondition_id(uuid);
			int i = 0;
			List<DicMemberCondition> list = MemberStandardDao.getInstance().nameJudge(dmc);
			if(null != list && list.size()>0){
				ro.setError(0);
				ro.setSuccess("repetition");
			} else
				try {
					i = MemberStandardDao.getInstance().addCondition(dmc);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicMemberStandardServlet+addCondition+dmc:"+dmc);
				} 
			if(i>0){
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicMemberStandardServlet+addCondition");
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addStandard")){
			String info=request.getParameter("info"); 
			DicMemberStandard dms=JSON.parseObject(info, DicMemberStandard.class);
			String uuid=UUID.randomUUID().toString();
			dms.setStandard_id(uuid);
			try {
				int i=MemberStandardDao.getInstance().addStandard(dms); 
				if(i>0){
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicMemberStandardServlet+addStandard");
					ro.setObj(dms);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicMemberStandardServlet+addStandard+dms:"+dms);
			}
			ro.ToJsp(response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
