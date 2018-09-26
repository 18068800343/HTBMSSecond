package hs.bm.servlet;

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

import hs.bm.bean.BrgMbrInfo;
import hs.bm.bean.CulInfo;
import hs.bm.bean.CulMbrInfo;
import hs.bm.bean.CulSpanInfo;
import hs.bm.bean.DicCulStructTypeDef;
import hs.bm.bean.DicHwInfo;
import hs.bm.bean.DicManageSection;
import hs.bm.dao.BrgMbrDao;
import hs.bm.dao.CulMbrDao;
import hs.bm.dao.LogDao;
import hs.bm.dao.PassMbrDao;
import hs.bm.util.IDtool;
import hs.bm.vo.Cul_SpanVO;
import hs.bm.vo.Cul_memberVO;
import hs.bm.vo.DicHwBrgSectionRelationVO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;


/**
 * Servlet implementation class CulMbrServlet
 */
public class CulMbrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CulMbrServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String choice=request.getParameter("choice");
		if(choice.equals("loadCulvert_type"))
		{
			loadCulvert_type(request,response);
		}else if (choice.equals("add_culvert_span"))
		{
			add_culvert_span(request,response);
		}else if(choice.equals("querySpan"))
		{
			querySpan(request,response);
		}else if(choice.equals("editspan"))
		{
			editspan(request,response);
		}else if (choice.equals("deleteSpan"))
		{
			deleteSpan(request,response);
		}else if(choice.equals("queryMember"))
		{
			queryMember(request,response);
		}
		else if (choice.equals("addMember")) 
		{
			addMember(request,response);
		}
		else if (choice.equals("editMember"))
		{
			editMember(request,response);
		}
		else if (choice.equals("delMember"))
		{
			delMember(request,response);
		}
		/**加载涵洞名称和编号*/
		if(choice.equals("getAllCul")){
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			CulMbrDao cmd = new CulMbrDao();
			ArrayList<CulInfo> list = cmd.getAllcul();
			if (list.size()>0)
			{
				ro.setObj(list);
				ro.setError(0);
			
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		/**
		 * 拷备整个涵洞的构件
		 */
		if(choice.equals("copyAllMem")){
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			String copyBridge = request.getParameter("copyBridge");
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			CulMbrDao cmd = new CulMbrDao();
			boolean flag = cmd.copyAllMem(copyBridge, oc.getId());
			ro.setObj(flag);
			ro.ToJsp(response);
			return;
		}
		if(choice.equals("initTree")){
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			ArrayList<CulSpanInfo> culSpanInfo = CulMbrDao.getInstance().getCulSpanInfoDirection(oc.getId());
			ro.setObj(culSpanInfo);
			ro.ToJsp(response);
			return;
		}
		if(choice.equals("isCheckAudited")){
			ResObj ro = new ResObj();
			OperationConstruct op = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			String audit_state = CulMbrDao.getInstance().isCheckAudited(op.getId(), op.getPrj_id());
			if (!audit_state.equals(""))
			{
				ro.setError(0);
				ro.setSuccess(audit_state);
			}else{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}

	}
	
	
	/**
	 * 删除构建
	 * @author sundj
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void delMember(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String log_user=(String) request.getSession().getAttribute("username");
		CulMbrDao cmd=new CulMbrDao();
		ResObj ro=new ResObj();
		CulMbrInfo cmi = new CulMbrInfo();
		cmi.setR_id(request.getParameter("r_id"));
		cmi.setS_id(request.getParameter("s_id"));
		try {
			int i = cmd.delCul_Mbr_Info(cmi);
			if (i == 1)
			{
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","CulMbrServlet+delMember");
				ro.setError(0);
			}
			else {
				ro.setSuccess("fail");
				ro.setError(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"删除",e.getMessage(),"CulMbrServlet+delMember+cmi:"+cmi);
		}
		ro.ToJsp(response);
	}

	/**
	 * 修改构件
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void editMember(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String log_user=(String) request.getSession().getAttribute("username");
		int i =0;
		CulMbrDao cmd=new CulMbrDao();
		ResObj ro=new ResObj();
		CulMbrInfo cmi = new CulMbrInfo();
		cmi.setR_id(request.getParameter("r_id"));
		cmi.setMember_type(request.getParameter("member_type"));
		/*
		if (request.getParameter("member_desc").equals("")||request.getParameter("member_desc")==null)
		{
			cmi.setMember_desc("无");
		}else {
			cmi.setMember_desc(request.getParameter("member_desc"));
		}
		*/
		try {
			cmi.setMember_no(request.getParameter("member_no"));
			if (cmd.isExit_member(cmi)!=1)
			{
				i = cmd.updateCul_Mbr_Info(cmi);
				if (i==1)
				{
					Cul_memberVO cm = cmd.getCul_memberVObyR_id(cmi);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CulMbrServlet+editMember");
					ro.setObj(cm);
					ro.setError(0);
				}else {
					ro.setSuccess("fail");
					ro.setError(1);
				}
			}else {
				ro.setSuccess("fail");
				ro.setError(2);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CulMbrServlet+editMember+cmi:"+cmi);
		}
		
		ro.ToJsp(response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void loadCulvert_type(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		ResObj ro=new ResObj();
		ArrayList<DicCulStructTypeDef> list = CulMbrDao.getInstance().getCul_type();
		if (list.size()>0) 
		{
			ro.setError(0);
			ro.setObj(list);
			ro.setSuccess("success");
		}else {
			ro.setError(1);
			ro.setSuccess("fail");
		}
		ro.ToJsp(response);
	}
	/**
	 * 增加涵洞跨
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void add_culvert_span(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		OperationConstruct oc = (OperationConstruct) session.getAttribute("OperationConstruct");
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro= new ResObj();
		CulSpanInfo csi = new CulSpanInfo();
		csi.setS_id(IDtool.getUUID().replace("-", ""));
		csi.setDirection(request.getParameter("culvert_direction"));
		csi.setSpan_no(Integer.parseInt(request.getParameter("culvert_span")));
		csi.setCul_type_id(request.getParameter("culvert_type"));
		csi.setCulvert_id(oc.getId());
		CulMbrDao cmd=new CulMbrDao();
		try {
			int i = 0;
			if (oc != null){
				if (cmd.isExit_span(csi)!=1){
					i = cmd.insertCul_Span_info(csi);
					cmd.updateCul_Info(cmd.getCulTypeName(csi), oc.getId());
					if (i!=0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CulMbrServlet+add_culvert_span");
						ro.setObj(csi);
					}
					else {
						ro.setError(1);
						ro.setSuccess("fail");
					}
				}else {
					ro.setError(2);
					ro.setSuccess("fail");
				}
			}else {
				ro.setError(1);
				ro.setSuccess("empty");
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CulMbrServlet+add_culvert_span+csi:"+csi);
		}
		ro.ToJsp(response);
		
	}
	/**
	 * 删除跨号
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void deleteSpan(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String log_user=(String) request.getSession().getAttribute("username");
		CulMbrDao cmd=new CulMbrDao();
		ResObj ro=new ResObj();
		CulSpanInfo csi = new CulSpanInfo();
		try {
			csi.setS_id(request.getParameter("s_id"));
			int i = cmd.span_del(csi);
			if (i != 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CulMbrServlet+deleteSpan");
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"新增",e.getMessage(),"CulMbrServlet+deleteSpan+s_id:"+request.getParameter("s_id"));
		}
		ro.ToJsp(response);
	}
	/**
	 * 修改跨信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void editspan(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String log_user=(String) request.getSession().getAttribute("username");
		CulMbrDao cmd=new CulMbrDao();
		ResObj ro=new ResObj();
		HttpSession session = request.getSession();
		OperationConstruct oc = (OperationConstruct) session.getAttribute("OperationConstruct");
		//涵洞-跨
		CulSpanInfo csi = new CulSpanInfo();
		csi.setS_id(request.getParameter("s_id"));
		csi.setCul_type_id(request.getParameter("cul_type_id"));
		csi.setDirection(request.getParameter("direction"));
		csi.setSpan_no(Integer.parseInt(request.getParameter("span_no")));
		csi.setCulvert_id(oc.getId());
		int i = 0;
		try {
			if (cmd.isExit_span(csi) !=1)
			{
				i = cmd.updateCul_Span_info(csi);
				cmd.updateCul_Info(cmd.getCulTypeName(csi), oc.getId());
				if (i==1)
				{
					ro.setError(0);
					ro.setObj(csi);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CulMbrServlet+editspan");
				}else{
					ro.setError(1);
					ro.setSuccess("fail");
				}
			}else {
				ro.setError(2);
				ro.setSuccess("fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CulMbrServlet+editspan+id:"+oc.getId());
		}
		ro.ToJsp(response);
	}

	/**
	 * 查询所有跨号
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void querySpan(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		OperationConstruct oc = (OperationConstruct) session.getAttribute("OperationConstruct");
		ResObj ro=new ResObj();
		CulMbrDao cmd=new CulMbrDao();
		if (oc!=null)
		{
			String culvert_id = oc.getId();
			ArrayList<Cul_SpanVO> list= cmd.cul_span_all(culvert_id);
			if (list.size()>0)
			{
				ro.setObj(list);
				ro.setSuccess("success");
				ro.setError(0);
			}else{
				ro.setSuccess("fail");
				ro.setError(1);
			}
		}else {
			ro.setError(1);
			ro.setSuccess("empty");
		}
		ro.ToJsp(response);
		
	}
	/**
	 * 查询构件
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void queryMember(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		CulMbrInfo cmi = new CulMbrInfo();
		CulMbrDao cmd=new CulMbrDao();
		cmi.setS_id(request.getParameter("s_id"));
		ArrayList<Cul_memberVO> list = cmd.getCul_memberVObyS_id(cmi);
		ResObj ro=new ResObj();
		if (list.size()>0)
		{
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(list);
		}else {
			ro.setError(1);
			ro.setSuccess("fail");
		}
		ro.ToJsp(response);
	}
	/**
	 * 添加构件
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void addMember(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String log_user=(String) request.getSession().getAttribute("username");
		CulMbrDao cmd=new CulMbrDao();
		//涵洞构件对象
		CulMbrInfo cmi = new CulMbrInfo();
		cmi.setR_id(IDtool.getUUID().replace("-", ""));
		cmi.setS_id(request.getParameter("s_id"));
		cmi.setMember_type(request.getParameter("member_type"));
		/*
		if (request.getParameter("member_desc").equals("")||request.getParameter("member_desc")==null)
		{
			cmi.setMember_desc("无");
		}else {
			cmi.setMember_desc(request.getParameter("member_desc"));
		}
		*/
		cmi.setMember_no(request.getParameter("member_no"));
		ResObj ro=new ResObj();
		int i = 0;
		try {
			if (cmd.isExit_member(cmi)!=1)
			{
					i = cmd.add_member(cmi);
					if (i==1)
					{
						Cul_memberVO cm = cmd.getCul_memberVObyR_id(cmi);
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CulMbrServlet+addMember");
						ro.setObj(cm);
					}else {
						ro.setError(1);
						ro.setSuccess("fail");
					}
			}else {
				ro.setSuccess("fail");
				ro.setError(2);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CulMbrServlet+addMember+cmi:"+cmi);
		}
		ro.ToJsp(response);
	}
	
}
