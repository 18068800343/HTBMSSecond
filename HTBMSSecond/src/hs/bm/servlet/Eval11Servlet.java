package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.EvaBridgePart;
import hs.bm.dao.CheckSpanDao;
import hs.bm.dao.Eval11Dao;
import hs.bm.dao.LogDao;
import hs.bm.util.CMDUtil;
import hs.bm.vo.Eval11Info;
import hs.bm.vo.IndexsetIndexVO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;

public class Eval11Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Eval11Servlet() {
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
		
		if(type.equals("forceEval")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			boolean flag = CMDUtil.forceEval(oc.getPrj_id(), oc.getId(), "2011", oc.getChk_type());
			ro.setSuccess("success");;
			ro.setError(0);
			ro.setObj(flag);
			ro.ToJsp(response);
			return;
		}
		
//		if(type.equals("buildPDF")){
//			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
//			String path = CMDUtil.buildEval(oc.getPrj_id(), oc.getId(), "2011", oc.getChk_type());
//			String sql = "UPDATE eva_brg_rec set pdf=? where prj_no=? and bridge_no=? and ER_STD ='2011'";
//			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
//			dataOperation.executeUpdate(sql, new String[]{path, oc.getPrj_id(), oc.getId() });
//			dataOperation.close();
//			return;
//		}
		
		if(type.equals("initTable")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			Map<String, Object> map = Eval11Dao.getInstance().initTable(oc);
			if(map==null){
				ro.setError(2);
			}else{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(map);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("getIndex")){
			String data = request.getParameter("data");
			System.out.println(data);
			Eval11Info ev = JSON.parseObject(data, Eval11Info.class);
			List<IndexsetIndexVO> ll = Eval11Dao.getInstance().getIndex(ev);
			if(ll==null){
				ro.setError(2);
			}else if(ll.size()>0){
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("saveIndex")){
			String data = request.getParameter("data");
			Eval11Info ev = JSON.parseObject(data, Eval11Info.class);
			String list = request.getParameter("list");
			List<IndexsetIndexVO> ll = JSON.parseArray(list, IndexsetIndexVO.class);
			try {
				int i = Eval11Dao.getInstance().saveIndex(ev, ll);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","Eval11Servlet+saveIndex");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"Eval11Servlet+saveIndex+ll:"+ll+"+prj_id:"+ev.getPrj_id()+"+bridge_id:"+ev.getBridge_id()+"+mbr_chk_id:"+ev.getMbr_chk_id());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("overEval")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			Map<String, String> map = Eval11Dao.getInstance().getScore(oc.getPrj_id(), oc.getId());
			int i=0;
			/*
			if(map.get("score_clean")==null || map.get("score_clean").equals("") || map.get("score_fix")==null || map.get("score_fix").equals("")){
				i =4;
			}else{
			*/
				i = Eval11Dao.getInstance().overEval(oc.getId(), oc.getPrj_id());
			//}
			switch (i) {
			case 0:
				ro.setError(1);
				ro.setSuccess("fail");
				break;
			case 4:
				ro.setError(4);
				ro.setSuccess("fail");
				break;
			case -1:
				ro.setError(2);
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
		
		if(type.equals("lookDefect")){
			String mbr_chk_id = request.getParameter("mbr_chk_id");
			List<ChkBrgDefect> ll= CheckSpanDao.getInstance().getDefectList(mbr_chk_id);
			if(ll==null){
				ro.setError(2);
			}else if(ll.size()>0){
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("evaRes")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			//List<EvaluationRec> ll = new ArrayList<EvaluationRec>();
			Map<String, Map<String, EvaBridgePart>> map= Eval11Dao.getInstance().getEvaRes(oc.getPrj_id(), oc.getId());
			ro.setSuccess("success");;
			ro.setError(0);
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("getScore")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			Map<String, String> map = Eval11Dao.getInstance().getScore(oc.getPrj_id(), oc.getId());
			ro.setSuccess("success");;
			ro.setError(0);
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("setScore")){
			String score_clean = request.getParameter("score_clean");
			String score_fix = request.getParameter("score_fix");
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			try {
				int i = Eval11Dao.getInstance().setScore(score_clean, score_fix, oc.getPrj_id(), oc.getId());
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","Eval11Servlet+setScore");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"Eval11Servlet+setScore+score_clean:"+score_clean+"+score_fix:"+score_fix+"+prj_id:"+oc.getPrj_id()+"+id:"+oc.getId());
			}
			ro.ToJsp(response);
			return;
 		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
