 package hs.bm.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hs.bm.bean.CulInfo;
import hs.bm.bean.CulMbrInfo;
import hs.bm.bean.CulSpanInfo;
import hs.bm.bean.DicBrgStructComponentDef;
import hs.bm.bean.DicCulStructTypeDef;
import hs.bm.bean.DicHwInfo;
import hs.bm.bean.DicManageSection;
import hs.bm.bean.DicPassStructTypeDef;
import hs.bm.bean.PassMbrInfo;
import hs.bm.bean.PassInfo;
import hs.bm.bean.PassMbrInfo;
import hs.bm.bean.PassSpanInfo;
import hs.bm.dao.BrgMbrDao;
import hs.bm.dao.CulMbrDao;
import hs.bm.dao.LogDao;
import hs.bm.dao.PassMbrDao;
import hs.bm.util.IDtool;
import hs.bm.vo.Cul_SpanVO;
import hs.bm.vo.Cul_memberVO;
import hs.bm.vo.DicHwBrgSectionRelationVO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.Pass_memberVO;
import hs.bm.vo.Pass_spanVO;
import hs.bm.vo.ResObj;

/**
 * Servlet implementation class PasMbrServlet
 */
public class PasMbrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String choice=request.getParameter("choice");
		String log_user=(String) request.getSession().getAttribute("username");
		if(choice.equals("loadpass_type"))
		{
			loadpass_type(request,response);
		}else if (choice.equals("add_pass_span"))
		{
			add_pass_span(request,response);
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
		
		/**加载通道名称和编号*/
		if(choice.equals("getAllpass")){
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			PassMbrDao pmd = new PassMbrDao();
			ArrayList<PassInfo> list = pmd.getAllpass();
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
		 * 拷备整个通道的构件
		 */
		if(choice.equals("copyAllMem")){
			ResObj ro = new ResObj();
			try {
				ro.setSuccess("success");
				ro.setError(0);
				String copyBridge = request.getParameter("copyBridge");
				OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
				PassMbrDao pmd = new PassMbrDao();
				boolean flag = pmd.copyAllMem(copyBridge, oc.getId());
				ro.setObj(flag);
				LogDao.getInstance().addLogInfo(log_user,"拷贝成功", "PasMbrServlet+copyAllMem","copyAllMem");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"拷贝失败", "PasMbrServlet+copyAllMem",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(choice.equals("initTree")){
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			ArrayList<PassSpanInfo> passSpanInfo = PassMbrDao.getInstance().getPassSpanInfoDirection(oc.getId());
			ro.setObj(passSpanInfo);
			ro.ToJsp(response);
			return;
		}
		
		if(choice.equals("isCheckAudited")){
			ResObj ro = new ResObj();
			OperationConstruct op = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			String audit_state = PassMbrDao.getInstance().isCheckAudited(op.getId(), op.getPrj_id());
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
		PassMbrDao pmd = new PassMbrDao();
		ResObj ro=new ResObj();
		String log_user=(String) request.getSession().getAttribute("username");
		try {
			PassMbrInfo pmi = new PassMbrInfo();
			pmi.setR_id(request.getParameter("r_id"));
			pmi.setS_id(request.getParameter("s_id"));
			int i = pmd.delPass_Mbr_Info(pmi);
			if (i == 1)
			{
				ro.setSuccess("success");
				ro.setError(0);
			}
			else {
				ro.setSuccess("fail");
				ro.setError(1);
			}
			LogDao.getInstance().addLogInfo(log_user,"删除成功", "PasMbrServlet+delMember","delMember");
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"删除失败", "PasMbrServlet+delMember",e.getMessage());
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
		int i =0;
		String log_user=(String) request.getSession().getAttribute("username");
		PassMbrDao pmd = new PassMbrDao();
		ResObj ro=new ResObj();
		try {
			PassMbrInfo pmi = new PassMbrInfo();
			pmi.setR_id(request.getParameter("r_id"));
			pmi.setMember_type(request.getParameter("member_type"));
			/*
			if (request.getParameter("member_desc").equals(""))
			{
				pmi.setMember_desc("无");
			}else {
				pmi.setMember_desc(request.getParameter("member_desc"));
			}*/
			pmi.setMember_no(request.getParameter("member_no"));
			if (pmd.isExit_member(pmi)!=1)
			{
				i = pmd.updatePass_Mbr_Info(pmi);
				if (i==1)
				{
					Pass_memberVO cm = pmd.getPass_memberVObyR_id(pmi);
					ro.setSuccess("success");
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
			LogDao.getInstance().addLogInfo(log_user,"修改成功", "PasMbrServlet+editMember","editMember");
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"修改失败", "PasMbrServlet+editMember",e.getMessage());
		}
		ro.ToJsp(response);
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void loadpass_type(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		ResObj ro=new ResObj();
		ArrayList<DicPassStructTypeDef> list = PassMbrDao.getInstance().getDicPassStructTypeDef();
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
	 * 增加通道跨
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void add_pass_span(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		OperationConstruct oc = (OperationConstruct) session.getAttribute("OperationConstruct");
		PassMbrDao pmd = new PassMbrDao();
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro=new ResObj();
		try {
			int i = 0;
			if (oc != null)
			{
				PassSpanInfo psi = new PassSpanInfo();
				psi.setS_id(IDtool.getUUID().replace("-", ""));
				psi.setDirection(request.getParameter("pass_direction"));
				psi.setSpan_no(Integer.parseInt(request.getParameter("pass_span")));
				psi.setPass_type_id(request.getParameter("pass_type"));
				psi.setPass_id(oc.getId());
				if (pmd.isExit_span(psi)!=1)
				{
					i = pmd.insertPass_Span_info(psi);
					pmd.updatePass_Info(pmd.getPass_type_name(psi), oc.getId());
					if (i!=0)
					{
						ro.setError(0);
						ro.setSuccess("success");
						ro.setObj(psi);
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
			LogDao.getInstance().addLogInfo(log_user,"增加成功", "PasMbrServlet+add_pass_span","add_pass_span");
		} catch (NumberFormatException e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"增加失败", "PasMbrServlet+add_pass_span",e.getMessage());
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
		PassMbrDao pmd = new PassMbrDao();
		PassSpanInfo psi = new PassSpanInfo();
		ResObj ro=new ResObj();
		String log_user=(String) request.getSession().getAttribute("username");
		try {
			psi.setS_id(request.getParameter("s_id"));
			int i = pmd.span_del(psi);
			if (i != 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"删除成功", "PasMbrServlet+deleteSpan","deleteSpan");
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"删除失败", "PasMbrServlet+deleteSpan",e.getMessage());
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
		PassMbrDao pmd = new PassMbrDao();
		ResObj ro=new ResObj();
		HttpSession session = request.getSession();
		String log_user=(String) request.getSession().getAttribute("username");
		try {
			OperationConstruct oc = (OperationConstruct) session.getAttribute("OperationConstruct");
			//通道-跨
			PassSpanInfo psi = new PassSpanInfo();
			psi.setS_id(request.getParameter("s_id"));
			psi.setPass_type_id(request.getParameter("pass_type_id"));
			psi.setDirection(request.getParameter("direction"));
			psi.setSpan_no(Integer.parseInt(request.getParameter("span_no")));
			psi.setPass_id(oc.getId());
			int i = 0;
			if (pmd.isExit_span(psi) !=1)
			{
				i = pmd.updatePass_Span_info(psi);
				pmd.updatePass_Info(pmd.getPass_type_name(psi), oc.getId());
				if (i==1)
				{
					ro.setError(0);
					ro.setObj(psi);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改成功", "PasMbrServlet+editspan","editspan");
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
			LogDao.getInstance().addLogInfo(log_user,"修改失败", "PasMbrServlet+editspan",e.getMessage());
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
		PassMbrDao pmd = new PassMbrDao();
		if (oc!=null)
		{
			String pass_id = oc.getId();
			ArrayList<Pass_spanVO> list= pmd.pass_span_all(pass_id);
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
		PassMbrInfo pmi = new PassMbrInfo();
		PassMbrDao pmd = new PassMbrDao(); 
		pmi.setS_id(request.getParameter("s_id"));
		ArrayList<Pass_memberVO> list = pmd.getPass_memberVObyS_id(pmi);
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
		PassMbrInfo pmi = new PassMbrInfo();
		PassMbrDao pmd = new PassMbrDao(); 
		pmi.setR_id(IDtool.getUUID().replace("-", ""));
		pmi.setS_id(request.getParameter("s_id"));
		pmi.setMember_type(request.getParameter("member_type"));
		/*
		if (request.getParameter("member_desc").equals(""))
		{
			pmi.setMember_desc("无");
		}else {
			pmi.setMember_desc(request.getParameter("member_desc"));
		}
		*/
		pmi.setMember_no(request.getParameter("member_no"));
		ResObj ro=new ResObj();
		try {
			int i = 0;
			if (pmd.isExit_member(pmi)!=1)
			{
					i = pmd.add_member(pmi);
					if (i==1)
					{
						Pass_memberVO pm = pmd.getPass_memberVObyR_id(pmi);
						ro.setError(0);
						ro.setSuccess("success");
						ro.setObj(pm);
					}else {
						ro.setError(1);
						ro.setSuccess("fail");
					}
			}else {
				ro.setSuccess("fail");
				ro.setError(2);
			}
			LogDao.getInstance().addLogInfo(log_user,"增加成功", "PasMbrServlet+addMember","addMember");
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"增加失败", "PasMbrServlet+addMember",e.getMessage());
		}
		ro.ToJsp(response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	/***************************************************************/
	
	/*
	public void queryBJLX(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<DicBrgStructComponentDef> ll=new ArrayList<DicBrgStructComponentDef>();
		PassMbrDao pmd=new PassMbrDao();
		ResObj ro=new ResObj();
		ll=pmd.queryBJLX(null);
		if(ll.size()==0||ll==null){
			ro.setSuccess("fail");
		}else{
			System.out.println(ll.size());
			ro.setSuccess("success");
			ro.setObj(ll);
		}
		ro.ToJsp(response);
	}
	*/
	/**dao层return值为i的时候的操作*/
	private void returnI(HttpServletResponse response,int i)throws ServletException, IOException{
		 ResObj ro=new ResObj();
		if(i>0){
			ro.setSuccess("success");
		}else{
			ro.setSuccess("fail");
			ro.setError(i);
		}
	}
	
	/**dao层return值为ll的时候的操作*/
	private void returnLL(HttpServletResponse response,List ll)throws ServletException, IOException{
		ResObj ro=new ResObj();
		if(ll==null||ll.size()==0){
			ro.setSuccess("fail");
			
		}else{
			ro.setSuccess("success");
			ro.setObj(ll);
		}
		 ro.ToJsp(response);
	}
	
	
}
