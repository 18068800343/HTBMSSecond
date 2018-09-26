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

import hs.bm.bean.ChkProjectInfo;
import hs.bm.bean.CulSpanInfo;
import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.ChkCulvertRecord;
import hs.bm.bean.ChkPassRecord;
import hs.bm.dao.ChkAuditDao;
import hs.bm.dao.EvalAuditDao;
import hs.bm.dao.StructMgrDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BriCulPassId;
import hs.bm.vo.ModeIdName;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.PDF;
import hs.bm.vo.ResObj;

/**
 * Servlet implementation class ChkAuditServlet
 */
public class ChkAuditServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChkAuditServlet()
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
		String root = PropertiesUtil.getPropertiesByName("rootDir");
		EvalAuditDao ead = new EvalAuditDao();
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		HttpSession session = request.getSession();
		// 构建类型
		OperationConstruct op = (OperationConstruct) session.getAttribute("OperationConstruct");
		ChkAuditDao cad = new ChkAuditDao();
		/* 基础树 */
		if (type.equals("BaseTree"))
		{
			List<ModeIdName> ll = new ArrayList<ModeIdName>();
			if (op == null)
			{
				ro.setSuccess("empty");
			} else if (op.getPrj_id() == null)
			{
				ro.setSuccess("noprj");
			} else
			{
				try
				{
					ll = cad.showFirstTree(op.getId(), op.getName(), op.getMode(), op.getPrj_id());
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
				if (ll.size() == 0 || ll == null)
				{
					ro.setSuccess("fail");
				} else
				{
					ro.setSuccess("success");
					ro.setObj(ll);
				}
			}
			ro.ToJsp(response);
		}
		if (type.equals("TreeSB"))
		{
			String hid = request.getParameter("hid");
			List<ChkBrgRecord> ll = new ArrayList<ChkBrgRecord>();
			try
			{
				ll = cad.showThirdTreeB(hid,op.getPrj_id());
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
			if (ll.size() == 0 || ll == null)
			{
				ro.setSuccess("fail");
			} else
			{
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
		}
		/*涵洞或者通道二级树*/
		if (type.equals("CulTreeSB"))
		{
			String prj_id = op.getPrj_id();
			String hid = request.getParameter("hid");
			List ll = new ArrayList();
			try
			{
				if (op.getMode().equals("pass"))
				{ 
					ll = cad.showSecondTreeP(hid,prj_id);
				}else{
					ll = cad.showSecondTreeC(hid,prj_id);
				}
				
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
			if (ll.size() == 0 || ll == null)
			{
				ro.setSuccess("fail");
			} else
			{
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
		}
		/*涵洞或通道三级*/
		if(type.equals("showTreeTC")){
			String prj_id = op.getPrj_id();
			String hsid = request.getParameter("hsid");// 方向
			String briid = request.getParameter("briid");// 编号
			if (hsid.equals("无方向"))
			{
				hsid="无";
			}
			List ll = new ArrayList();
			try
			{
				if (op.getMode().equals("pass"))
				{ 
					ll = cad.getPassSpanNo(hsid,briid,prj_id);
				}
				else{
					ll = cad.getCulSpanNo(hsid,briid,prj_id);
				}
				
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
			if (ll.size() == 0 || ll == null)
			{
				ro.setSuccess("fail");
			} else
			{
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
		}

		if (type.equals("TreeTB"))
		{
			String hsid = request.getParameter("hsid");// 方向
			String briid = request.getParameter("briid");// 桥梁编号
			List<ChkBrgRecord> ll = new ArrayList<ChkBrgRecord>();
			try
			{
				ll = cad.showFourthTreeP(hsid, briid,op.getPrj_id());
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
			if (ll.size() == 0 || ll == null)
			{
				ro.setSuccess("fail");
			} else
			{
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
		}
		/**
		 * 刷新桥梁的pdf
		 */
		if (type.equals("refreshPDF"))
		{
			int i = 0;
			String span_no = request.getParameter("spanid");// 跨号
			String dir = request.getParameter("dir");// 桥梁方向
			String briid = request.getParameter("briid");// 桥梁编号
			String prj_id = op.getPrj_id();
			String mode= op.getMode();
			PDF pdf = new PDF();
			List<PDF> list = new ArrayList<PDF>();
			String path = "";
			if(mode.equals("bridge")){
				path = CMDUtil.buildCheck(prj_id, briid, "regular", dir, span_no);
				if (path != null&&!path.equals(""))
				{
					path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
					i = cad.updatePath(span_no, dir, briid, path,prj_id);
					pdf.setBid(briid);
					pdf.setPath(path);
					list.add(pdf);
					ro.setError(0);
					ro.setObj(list);
					ro.setSuccess("success");
	
				} else
				{
					ro.setError(1);
					ro.setSuccess("pdf_fail");
				}
			}
			else{
				if (dir.equals("无方向"))
				{
					dir="无";
				}
				if (op.getMode().equals("pass"))
				{
					path = CMDUtil.buildPassCheck(prj_id, briid, "regular", dir,span_no);
				} else
				{
					path = CMDUtil.buildCulvertCheck(prj_id, briid, "regular", dir,span_no);
				}
				if (null != path && !path.equals(""))
				{
					path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
					cad.storePassOrCul_Path(mode, briid, prj_id, dir, span_no, path);
					pdf.setBid(briid);
					pdf.setPath(path);
					list.add(pdf);
					ro.setObj(list);
					ro.setSuccess("success");
					ro.setError(0);
				}else {
					ro.setSuccess("pdf_fail");
					ro.setError(1);
				}
			}
			ro.ToJsp(response);
		}
		/**
		 * 桥梁pdf
		 */
		if (type.equals("initBPDF"))
		{
			int i = 0;
			String span_no = request.getParameter("id");// 跨号
			String dir = request.getParameter("dir");// 桥梁方向
			String briid = request.getParameter("briid");// 桥梁编号
			String prj_id = op.getPrj_id();
			PDF pdf = new PDF();
			List<PDF> list = new ArrayList<PDF>();
			String path = cad.getSpan_card(span_no, dir, briid,prj_id);
			if (path != null&&!path.equals(""))
			{
				File file = new File(root+File.separator+path);
				if (file.exists())
				{
					pdf.setBid(briid);
					pdf.setPath(path);
					list.add(pdf);
					ro.setError(0);
					ro.setObj(list);
					ro.setSuccess("success");
				} else
				{
					path = CMDUtil.buildCheck(prj_id, briid, "regular", dir, span_no);
					if (path != null)
					{
						path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
						i = cad.updatePath(span_no, dir, briid, path,prj_id);
						pdf.setBid(briid);
						pdf.setPath(path);
						list.add(pdf);
						ro.setError(0);
						ro.setObj(list);
						ro.setSuccess("success");
					} else
					{
						ro.setError(1);
						ro.setSuccess("pdf_fail");
					}
				}
			} else
			{
				path = CMDUtil.buildCheck(prj_id, briid, "regular", dir, span_no);
				if (path != null&&!path.equals(""))
				{
					path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
					i = cad.updatePath(span_no, dir, briid, path,prj_id);
					pdf.setBid(briid);
					pdf.setPath(path);
					list.add(pdf);
					ro.setError(0);
					ro.setObj(list);
					ro.setSuccess("success");

				} else
				{
					ro.setError(1);
					ro.setSuccess("pdf_fail");
				}
			}
			ro.ToJsp(response);
			
		}
		/**
		 * 涵洞或通道pdf
		 */
		if (type.equals("initCPDF"))
		{
			PDF pdf = new PDF();
			List<PDF> list = new ArrayList<PDF>();
			String id = op.getId();// 涵洞或通道编号
			String mode = op.getMode();
			String prj_id = op.getPrj_id();
			String dir = request.getParameter("dir");
			if (dir.equals("无方向"))
			{
				dir="无";
			}
			String span_no = request.getParameter("spanid");
			String path = cad.getPassOrCul_Path(mode, id, prj_id, dir, span_no);
			if (null==path||path.equals(""))
			{
				if (op.getMode().equals("pass"))
				{
					path = CMDUtil.buildPassCheck(prj_id, id, "regular", dir,span_no);
				} else
				{
					path = CMDUtil.buildCulvertCheck(prj_id, id, "regular",dir,span_no);
				}
				if (null != path && !path.equals(""))
				{
					path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
					cad.storePassOrCul_Path(mode, id, prj_id, dir, span_no, path);
					pdf.setBid(id);
					pdf.setPath(path);
					list.add(pdf);
					ro.setObj(list);
					ro.setSuccess("success");
					ro.setError(0);
				}else {
					ro.setSuccess("fail");
					ro.setError(1);
				}
			}else {
				File file = new File(root+File.separator+path);
				if (file.exists())
				{
					pdf.setBid(id);
					pdf.setPath(path);
					list.add(pdf);
					ro.setObj(list);
					ro.setSuccess("success");
					ro.setError(0);
				}else {
					if (op.getMode().equals("pass"))
					{
						path = CMDUtil.buildPassCheck(prj_id, id, "regular", dir,span_no);
					} else
					{
						path = CMDUtil.buildCulvertCheck(prj_id, id, "regular",dir,span_no);
					}
					if (null != path && !path.equals(""))
					{
						path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
						cad.storePassOrCul_Path(mode, id, prj_id, dir, span_no, path);
						pdf.setBid(id);
						pdf.setPath(path);
						list.add(pdf);
						ro.setObj(list);
						ro.setSuccess("success");
						ro.setError(0);
					}else {
						ro.setSuccess("fail");
						ro.setError(1);
					}
				}
			}
			ro.ToJsp(response);
		}
		/**
		 * 审核置为2(审核)
		 */
		if (type.equals("Audit"))
		{
			boolean flag = false;
			int i = 0;
			if (op.getMode().equals("bridge"))
			{
				i = cad.chkbAudit(op.getId(), op.getPrj_id());
			} else if (op.getMode().equals("pass"))
			{

				i = cad.chkPAudit(op.getId(), op.getPrj_id());
			} else if (op.getMode().equals("culvert"))
			{

				i = cad.chkCAudit(op.getId(), op.getPrj_id());
			}
			if (i > 0 && op.getMode().equals("bridge"))
			{
				if (cad.addStruct_checked(op.getPrj_id()))
				{

					/*
					 * if (cad.EvalChk(op.getId(), op.getPrj_id())) { if
					 * (cad.EvalAdd(op.getId(), op.getPrj_id())) {
					 */
					ro.setSuccess("success");
					ro.setError(0);
					/*
					 * } } else { ro.setSuccess("success"); ro.setError(0);
					 * System.out.println("已存在了评定审核记录"); }
					 */
				}
			} else if (i > 0 && !op.getMode().equals("bridge"))
			{
				if (cad.addStruct_checked(op.getPrj_id()))
				{
					if (ead.addStruct_eva(op.getPrj_id()))
					{
						ro.setSuccess("success");
						ro.setError(0);
					}
				}
			} else
			{
				ro.setSuccess("fail");
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		/**
		 * 退审核置为1(未审核)
		 */
		if (type.equals("reAudit"))
		{
			
			int i = 0;
			if (op.getMode().equals("bridge"))
			{
				i = cad.rechkBAudit(op.getId(), op.getPrj_id());

			} else if (op.getMode().equals("pass"))
			{

				i = cad.rechkPAudit(op.getId());
			} else if (op.getMode().equals("culvert"))
			{
				i = cad.rechkCAudit(op.getId());
			}

			boolean flag = false;
			if (i > 0 && op.getMode().equals("bridge"))
			{
				if (cad.minStruct_checked(op.getPrj_id()))
				{
					flag = true;
				}
			}
			else if (i > 0 && !op.getMode().equals("bridge"))
			{
				if (cad.minStruct_checked(op.getPrj_id()))
				{
					if(ead.minStruct_eva(op.getPrj_id()))
					{
						flag = true;
					}
				}
			} 
			if (flag)
			{
				ro.setError(0);
				ro.setSuccess("success");
			} else
			{
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}

		/**
		 * 涵洞或通道审核置为2
		 */
		if (type.equals("AuditCP"))
		{
			String id = op.getId();// 涵洞或通道编号
			int i = 0;
			boolean flag = false;
			if (op.getMode().equals("pass"))
			{
				i = cad.chkPAudit(id, op.getPrj_id());
				if (i > 0)
				{
					flag = true;
				}
				if (flag)
				{
					ro.setError(0);
					ro.setSuccess("success");
				} else
				{
					ro.setSuccess("fail");
				}
			} else
			{
				i = cad.chkCAudit(id, op.getPrj_id());
				if (i > 0)
				{
					flag = true;
				}
				if (flag)
				{
					ro.setError(0);
					ro.setSuccess("success");
				} else
				{
					ro.setSuccess("fail");
				}
			}
			ro.ToJsp(response);
		}
		/**
		 * 涵洞或通道审核置为1
		 */
		if (type.equals("reAuditCP"))
		{
			String id = op.getId();// 涵洞或通道编号
			int i = 0;
			boolean flag = false;
			if (op.getMode().equals("pass"))
			{
				i = cad.rechkPAudit(id);
				if (i > 0)
				{
					flag = true;
				}
				if (flag)
				{
					ro.setError(0);
					ro.setSuccess("success");
				} else
				{
					ro.setSuccess("fail");
				}
			} else
			{
				i = cad.rechkCAudit(id);
				if (i > 0)
				{
					flag = true;
				}
				if (flag)
				{
					ro.setError(0);
					ro.setSuccess("success");
				} else
				{
					ro.setSuccess("fail");
				}
			}
			ro.ToJsp(response);
		}


		if (type.equals("AuditBri"))
		{
			String briid = request.getParameter("briid");// 桥梁编号

			// }
			ro.ToJsp(response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
