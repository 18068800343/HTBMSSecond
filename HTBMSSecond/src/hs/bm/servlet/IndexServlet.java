package hs.bm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSONObject;

import hs.bm.dao.CheckPassSpanDao;
import hs.bm.dao.StatisFileNumDao;
import hs.bm.vo.ResObj;
import hs.bm.vo.StatisFileNumVo;

/**
 * Servlet implementation class IndexServlet
 */
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Log log = LogFactory.getLog(CheckPassSpanDao.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String log_user=(String) request.getSession().getAttribute("username");
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			ResObj ro = new ResObj();
			List<StatisFileNumVo> health = StatisFileNumDao.getInstance().statisHealthFiles();
			List<StatisFileNumVo> weight = StatisFileNumDao.getInstance().statisWeightFiles();
			JSONObject json = new JSONObject();
			json.put("health", health);
			json.put("weight", weight);
			ro.setObj(json);
			ro.ToJsp(response);
			response.getWriter().append("Served at: ").append(request.getContextPath());
		} catch (Exception e) {
			log.info(e);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doGet(request, response);
		} catch (Exception e) {
			log.info(e);
		}

	}

}
