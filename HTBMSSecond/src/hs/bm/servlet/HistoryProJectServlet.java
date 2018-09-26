package hs.bm.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicBrgStructTypeDef;
import hs.bm.bean.DicCulStructTypeDef;
import hs.bm.bean.DicPassStructTypeDef;
import hs.bm.dao.*;

import hs.bm.vo.BrgStructTypeVO;
import hs.bm.vo.DefectStatistics;
import hs.bm.vo.EvalStatistics;
import hs.bm.vo.HistoryProject;
import hs.bm.vo.MemberStatistics;
import hs.bm.vo.ResObj;

/**
 * Servlet implementation class HistoryProJectServlet
 */
public class HistoryProJectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HistoryProJectServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String log_user=(String) request.getSession().getAttribute("username");
		String userRole = (String) session.getAttribute("userRole");
		String chkType = request.getParameter("chkType");
		String id = request.getParameter("id");
		String id2 = "";
		String mode = request.getParameter("mode");
		String modeTable = "";
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		List<HistoryProject> hsp = new ArrayList<>();
		if (mode.equals("bridge")) {
			modeTable = "chk_brg_regular";
			id2 = "bridge_id";
		} else if (mode.equals("pass")) {
			modeTable = "chk_pass_regular";
			id2 = "pass_id";
		} else if (mode.equals("culvert")) {
			modeTable = "chk_culvert_regular";
			id2 = "culvert_id";
		}

		if (!modeTable.equals("")) {
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) 
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				String orgid = (String) session.getAttribute("orgid");
				if(null!=orgid&&!"".equals(orgid)){
				orgid = orgid.substring(0, 4) + '%';
				}
				 //hsp = HistoryProJectDao.getInstance().getHistoryProjectName2(modeTable, id, id2, orgid);
			 	   hsp = HistoryProJectDao.getInstance().getHistoryProjectNameByChkType2(modeTable, id, id2, orgid, chkType);
			} else {
				//hsp = HistoryProJectDao.getInstance().getHistoryProjectName(modeTable, id, id2);
				  hsp = HistoryProJectDao.getInstance().getHistoryProjectNameByCheckType1(modeTable, id, id2, chkType);

			}

			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(hsp);
			ro.ToJsp(response);
		}

		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
