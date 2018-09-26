package hs.bm.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import hs.bm.bean.ChkProjectInfo;
import hs.bm.bean.CulSpanInfo;
import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.ChkCulvertRecord;
import hs.bm.bean.ChkPassRecord;
import hs.bm.bean.SysZoneInfo;
import hs.bm.dao.ChkAuditDao;
import hs.bm.dao.DailyChkAuditDao;
import hs.bm.dao.EvalAuditDao;
import hs.bm.dao.LogDao;
import hs.bm.dao.StructMgrDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BriCulPassId;
import hs.bm.vo.DailyChkVO;
import hs.bm.vo.Dailychk_dataVO;
import hs.bm.vo.ModeIdName;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.PDF;
import hs.bm.vo.ResObj;

/**
 * Servlet implementation class ChkAuditServlet
 */
public class DailyChkAuditServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DailyChkAuditServlet()
	{
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		/*基础路径*/
		String root = PropertiesUtil.getPropertiesByName("rootDir");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		HttpSession session = request.getSession();
		OperationConstruct op = (OperationConstruct) session.getAttribute("OperationConstruct");
		/*登录人员的org_id*/
		String org_id = (String) session.getAttribute("orgid");
		/*登录人员的账号*/
		String username = (String)session.getAttribute("username");
		/*初始化下拉框*/
		if(type.equals("initZone_select")){
			String role=request.getParameter("role");
			String date = request.getParameter("date");
			ArrayList<SysZoneInfo> list = new ArrayList<SysZoneInfo>();
			/*负责人*/
			if(role.equals("duty")){
				list = DailyChkAuditDao.getInstance().get_dutyman_SysZoneInfo(username);
			}
			/*桥梁主管*/
			else{
				list = DailyChkAuditDao.getInstance().getSysZoneInfo_all(org_id);
			}
			if (list.size()>0)
			{
				ro.setObj(list);
				ro.setSuccess("success");
				ro.setError(0);
			}
			ro.ToJsp(response);
		}
		if(type.equals("prj_Pass")){
			boolean flag = false;
			String prj_id = request.getParameter("prj_id");
			try {
				int i = DailyChkAuditDao.getInstance().completeDailyPrj_brg_regular(prj_id);
				if(i>0){
					i = DailyChkAuditDao.getInstance().completeDailyPrj(prj_id);
					if(i>0){
						flag=true;
					}
				}
				if(flag){
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(username,"修改", "操作成功","DailyChkAuditServlet+prj_Pass");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(username,"修改", e.getMessage(),"DailyChkAuditServlet+prj_Pass+prj_id:"+prj_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		/*按分区读取日常检查审核数据*/
		if(type.equals("queryDailyChk_byZone")){
			String zone_id = request.getParameter("zone_id");
			String date = request.getParameter("date");
			String model = request.getParameter("model");
			ArrayList<Dailychk_dataVO> list = new ArrayList<Dailychk_dataVO>();
			list = DailyChkAuditDao.getInstance().queryDailyChk_byZone(zone_id,date,model);
			if(list.size()>0){
				ro.setObj(list);
				ro.setSuccess("success");
				ro.setError(0);
			}
			ro.ToJsp(response);
		}
		/*审核*/
		if(type.equals("DailyChk_audit")){
			String chk_id = request.getParameter("chk_id");
			try {
				int i = DailyChkAuditDao.getInstance().DailyChk_audit(chk_id);
				if(i>0){
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(username,"修改审核状态", "操作成功","DailyChkAuditServlet+DailyChk_audit");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(username,"修改审核状态", e.getMessage(),"DailyChkAuditServlet+DailyChk_audit+chk_id:"+chk_id);
			}
			ro.ToJsp(response);
		}
		//分区日常检查与时间相关信息
		if(type.equals("getCalendarData")){
			String zone_id = request.getParameter("zone_id");
			ArrayList<DailyChkVO> list = DailyChkAuditDao.getInstance().getCalendarData(zone_id);
			if(list != null){
				ro.setObj(list);
				String start_date = DailyChkAuditDao.getInstance().getDailyChkStartDate(zone_id);
				if(!start_date.equals("")){
					ro.setSuccess(start_date);
					ro.setError(0);
				}
			}
			ro.ToJsp(response);
		}
		/*生成PDF*/
		if(type.equals("loadPDF")){
			String prj_id = request.getParameter("prj_id");
			String brg_id = request.getParameter("brg_id");
			String chk_id = request.getParameter("chk_id");
			PDF pdf = new PDF();
			String path = DailyChkAuditDao.getInstance().getPDF_path(chk_id);
			try {
				if(null != path&& !path.equals("")){
					File file = new File(root+File.separator+path);
					if (file.exists())
					{
						pdf.setBid(brg_id);
						pdf.setPath(path);
						pdf.setModel("daily");
						ro.setObj(pdf);
						ro.setSuccess("success");
						ro.setError(0);
					}else{
						path = buildPdf(brg_id,prj_id);
						if (null != path && !path.equals(""))
						{
							path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
							DailyChkAuditDao.getInstance().storePDF_path(chk_id, path);
							pdf.setBid(brg_id);
							pdf.setPath(path);
							pdf.setModel("daily");
							ro.setObj(pdf);
							ro.setSuccess("success");
							ro.setError(0);
						}else{
							ro.setError(1);
							ro.setSuccess("fail");
						}
					}
				}else{
					path = buildPdf(brg_id,prj_id);
					if (null != path && !path.equals(""))
					{
						path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
						DailyChkAuditDao.getInstance().storePDF_path(chk_id, path);
						pdf.setBid(brg_id);
						pdf.setPath(path);
						pdf.setModel("daily");
						ro.setObj(pdf);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(username,"修改PDF路径", "操作成功","DailyChkAuditServlet+loadPDF");
						ro.setError(0);
					}else{
						ro.setError(1);
						ro.setSuccess("fail");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(username,"修改PDF路径", e.getMessage(),"DailyChkAuditServlet+loadPDF+chk_id:"+chk_id+"+path:"+path);
			}
			ro.ToJsp(response);
		}
	}
	/**
	 * buildPdf
	 * 生成pdf
	 * @return
	 */
	public String buildPdf(String brg_id,String prj_id){
		String path="";
		path = CMDUtil.buildDailyCheck(prj_id, brg_id, "daily");
		return path;
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
