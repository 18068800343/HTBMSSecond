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
import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.ChkCulvertRecord;
import hs.bm.bean.ChkPassRecord;
import hs.bm.dao.ChkAuditDao;
import hs.bm.dao.EvalAuditDao;
import hs.bm.dao.StructMgrDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BriCulPassId;
import hs.bm.vo.EvalBean;
import hs.bm.vo.EvalTree;
import hs.bm.vo.ModeIdName;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.PDF;
import hs.bm.vo.ResObj;

/**
 * Servlet implementation class ChkAuditServlet
 */
public class EvalAuditServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EvalAuditServlet()
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
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		HttpSession session = request.getSession();
		// 构建类型
		OperationConstruct op = (OperationConstruct) session.getAttribute("OperationConstruct");
		// 构建树
		EvalTree tree = new EvalTree();
		List<EvalTree> list = new ArrayList<EvalTree>();

		EvalAuditDao ead = new EvalAuditDao();
		/**
		 * 初始化数据
		 */
		if (type.equals("initTree"))
		{
			List<EvalBean> ll = new ArrayList<EvalBean>();
			if (op.getMode().equals("bridge"))
			{
				ll = ead.InitTree(op.getId(), op.getName(), op.getMode(),op.getPrj_id());
				if (ll.size() == 0 || ll == null)
				{
					ro.setSuccess("fail");
				} else
				{
					tree.setText(op.getName());
					tree.setState("{ 'open' : true }");

					ro.setSuccess("success");
					for (int i = 0; i < ll.size(); i++)
					{
						EvalBean eb = ll.get(i);
						EvalTree child = new EvalTree();
						if (eb.getStandard().contains("2004"))
						{
							child.setText("04评定标准");
						} else if (eb.getStandard().contains("2011"))
						{
							child.setText("11评定标准");
						}
						child.setState("closed");
						list.add(child);
					}
					tree.setChildren(list);
					ro.setObj(tree);
				}
			} else
			{
				ro.setError(1);
				ro.setSuccess("error type");
			}
			ro.ToJsp(response);
		}

		else if (type.equals("BaseTree"))
		{
			List<EvalBean> ll = new ArrayList<EvalBean>();
			if (op==null)
			{
				ro.setError(1);
				ro.setSuccess("empty");
			}else if (op.getPrj_id() == null)
			{
				ro.setSuccess("noprj");
			}
			else {
				ll = ead.InitTree(op.getId(), op.getName(), op.getMode(),op.getPrj_id());
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
		if (type.equals("sta_state"))
		{
			String id = request.getParameter("sta");
			List<EvalBean> ll = new ArrayList<EvalBean>();
			if (id.startsWith("2011"))
			{
				ll = ead.queryState(op.getId(),"2011",op.getPrj_id());
			} else if (id.startsWith("2004"))
			{
				ll = ead.queryState(op.getId(),"2004",op.getPrj_id());
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
		 * 桥梁评定审核置为2(审核)
		 */
		if (type.equals("Audit"))
		{
			boolean flag = false;
			String sta_no = request.getParameter("id");
			int i =0;
			if (sta_no.startsWith("2011"))
			{
				i = ead.evalAudit(op.getId(),"2011",op.getPrj_id());
				
			} else if (sta_no.startsWith("2004"))
			{
				i = ead.evalAudit(op.getId(),"2004",op.getPrj_id());
			}
			
			if (i > 0)
			{
				flag = true;
				String str = ead.chkEvalState( op.getPrj_id(),op.getId());
				if (!str.equals("")&&str.equals("add"))
				{
					 ead.addStruct_eva(op.getPrj_id());
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
		 * 桥梁评定审核置为1(退审核)
		 */
		if (type.equals("reAudit"))
		{
			String sta_no = request.getParameter("id");
			int i = 0;
			if (sta_no.startsWith("2011"))
			{
				i = ead.reEvalAudit(op.getId(),"2011",op.getPrj_id());
			} else if (sta_no.startsWith("2004"))
			{
				i = ead.reEvalAudit(op.getId(),"2004",op.getPrj_id());
			}
			boolean flag = false;
			if (i > 0)
			{
				flag = true;
				String str = ead.chkEvalState(op.getPrj_id(),op.getId());
				if (!str.equals("")&&str.equals("reduce"))
				{
					ead.minStruct_eva(op.getPrj_id());
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
		 * 桥梁pdf
		 */
		if (type.equals("initBriPDF"))
		{
			String path = null;
			String mode = request.getParameter("mode");// 评定标准
			String prj_id = op.getPrj_id();
			String id = op.getId();
			PDF pdf = new PDF();
			List<PDF> ll = new ArrayList<PDF>();
			if (mode.contains("04"))
			{
				mode="2004";
			}else if (mode.contains("11"))
			{
				mode="2011";
			}
			path = ead.getEvaPath(id, prj_id, mode);
			if (path!=null&&!path.equals(""))
			{
				File file = new File(root+File.separator+path);
				if (file.exists())
				{
					pdf.setBid(id);
					pdf.setPath(path);
					ll.add(pdf);
					ro.setError(0);
					ro.setObj(ll);
					ro.setSuccess("success");
				}
				else {
					path=CMDUtil.buildEval(prj_id, id, mode, "regular");
					if (path!=null&&!path.equals(""))
					{
						path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
						ead.updateEvaPath(id, prj_id, mode, path);
						pdf.setBid(id);
						pdf.setPath(path);
						ll.add(pdf);
						ro.setError(0);
						ro.setObj(ll);
						ro.setSuccess("success");
					}else {
						ro.setError(1);
						ro.setSuccess("pdf_fail");
					}
				}
			}
			else {
				path=CMDUtil.buildEval(prj_id, id, mode, "regular");
				if (path!=null&&!path.equals(""))
				{
					path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
					ead.updateEvaPath(id, prj_id, mode, path);
					pdf.setBid(id);
					pdf.setPath(path);
					ll.add(pdf);
					ro.setError(0);
					ro.setObj(ll);
					ro.setSuccess("success");
					
				}
				else{
					ro.setError(1);
					ro.setSuccess("pdf_fail");
				}
			}
			ro.ToJsp(response);
		}
		if(type.equals("refreshPDF")){
			String path = null;
			String mode = request.getParameter("mode");// 评定标准
			String prj_id = op.getPrj_id();
			String id = op.getId();
			PDF pdf = new PDF();
			List<PDF> ll = new ArrayList<PDF>();
			if (mode.contains("04"))
			{
				mode="2004";
			}else if (mode.contains("11"))
			{
				mode="2011";
			}
			path=CMDUtil.buildEval(prj_id, id, mode, "regular");
			if (path!=null&&!path.equals(""))
			{
				path = path.replace(PropertiesUtil.getPropertiesByName("rootDir")+File.separator, "");
				ead.updateEvaPath(id, prj_id, mode, path);
				pdf.setBid(id);
				pdf.setPath(path);
				ll.add(pdf);
				ro.setError(0);
				ro.setObj(ll);
				ro.setSuccess("success");
			}
			else{
				ro.setError(1);
				ro.setSuccess("pdf_fail");
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
