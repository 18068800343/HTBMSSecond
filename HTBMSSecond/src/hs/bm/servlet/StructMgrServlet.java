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

import com.alibaba.fastjson.JSON;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.DicManageOrg;
import hs.bm.bean.SysOrgInfo;
import hs.bm.bean.SysOrgUsrInfo;
import hs.bm.bean.SysSectionInfo;
import hs.bm.bean.SysUsrUsrInfo;
import hs.bm.bean.SysZoneInfo;
import hs.bm.dao.LogDao;
import hs.bm.dao.ManageOrgMgrDao;
import hs.bm.dao.StructMgrDao;
import hs.bm.vo.BridgeEvalVO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;
import hs.bm.vo.StructInformation;
import hs.bm.vo.StructSearch;

public class StructMgrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StructMgrServlet() {
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

		if (type.equals("searchStruct")) {
			String info = request.getParameter("info");
			String superQueryType = request.getParameter("superQueryType");
			
			StructSearch ssh = JSON.parseObject(info, StructSearch.class);
			if("superAdmin".equals(superQueryType)){
				ssh.setManage("%");
			}
			List<StructInformation> ll = StructMgrDao.getInstance().searchStruct(ssh);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initBridge")) {
			String mode = request.getParameter("mode");
			List<BrgCardAdminId> ll = StructMgrDao.getInstance().initBridge(mode);
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

		if (type.equals("initOrg")) {
			HttpSession session = request.getSession();
			String orgid = (String) session.getAttribute("orgid");
			if(orgid==null){
				orgid = "%";
			}
			List<SysOrgInfo> sysOrgInfos = StructMgrDao.getInstance().initOrg(orgid);
			if (sysOrgInfos.size() == 0) {
				ro.setError(2);
			} else if (sysOrgInfos.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(sysOrgInfos);
			} else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initSection")) {
			List<SysSectionInfo> sectionInfos = StructMgrDao.getInstance().initSection();
			if (sectionInfos == null) {
				ro.setError(2);
			} else if (sectionInfos.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(sectionInfos);
			} else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initZone")) {
			List<SysZoneInfo> sysZoneInfos = StructMgrDao.getInstance().initZone();
			if (sysZoneInfos == null) {
				ro.setError(2);
			} else if (sysZoneInfos.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(sysZoneInfos);
			} else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		/*
		 * if(type.equals("initTable")){ List<StructInformation> ll =
		 * StructMgrDao.getInstance().initTable(); if(ll==null){ ro.setError(2);
		 * }else if(ll.size()>0){ ro.setError(0); ro.setSuccess("success");
		 * ro.setObj(ll); }else{ ro.setError(1); } ro.ToJsp(response); return; }
		 */

		if (type.equals("setConstruct")) {
			// TODO:设置当前操作对象，增加prj_id
			String info = request.getParameter("info");
			String prj_id = request.getParameter("prj_id");
			OperationConstruct oc = new OperationConstruct();
			oc = JSON.parseObject(info, OperationConstruct.class);
			oc.setPrj_id(prj_id);
			// 修改该接口获取选择项项目的结果
			oc = StructMgrDao.getInstance().getStructChk(oc);
			// System.out.println(oc.getPrj_id());
			request.getSession().setAttribute("OperationConstruct", oc);
			ro.setSuccess("success");
			ro.setObj(oc);
			ro.ToJsp(response);
			return;
		}

		if (type.equals("delStruct")) {
			
			String data = request.getParameter("data");
			StructInformation structInformation = JSON.parseObject(data, StructInformation.class);
			try {
				int i = StructMgrDao.getInstance().delStruct(structInformation.getStruct_id(),
						structInformation.getStruct_mode());
				if (i < 0) {
					ro.setError(2);
				} else if (i > 0) {
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"删除结构", "操作成功","StructMgrServlet+delStruct+"+structInformation.getStruct_id()+"+"+structInformation.getStruct_mode());
				} else {
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除结构", "操作失败",e.getMessage()+"StructMgrServlet+delStruct+"+structInformation.getStruct_id()+"+"+structInformation.getStruct_mode());
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
			
			lb = StructMgrDao.getInstance().initIndexBrg(prj_id, highway_id, manage_id, section_id,
						zone_id);
			
			
			if (lb.size() > 0) {
				ro.setSuccess("success");
				ro.setObj(lb);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("getHighwayBridge")) {
			Map<String, List<BrgCardAdminId>> map = StructMgrDao.getInstance().getHighwayBridge();
			if (map.size() > 0) {
				ro.setSuccess("success");
				ro.setObj(map);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("getBridgeEval")) {
			List<BridgeEvalVO> lb = StructMgrDao.getInstance().getBridgeEval();
			if (lb.size() > 0) {
				ro.setSuccess("success");
				ro.setObj(lb);
			}
			ro.ToJsp(response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
