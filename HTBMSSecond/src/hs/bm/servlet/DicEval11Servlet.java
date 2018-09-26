package hs.bm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.IndexsetIndex;
import hs.bm.bean.ScoreIndexset2011;
import hs.bm.dao.DicEval11Dao;
import hs.bm.dao.LogDao;
import hs.bm.vo.DicEval11VO;
import hs.bm.vo.ResObj;


public class DicEval11Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type"); 
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
	
		if(type.equals("initTable")){
			List<DicEval11VO> ll = DicEval11Dao.getInstance().initTable();
			if(ll==null){
				ro.setError(2);
			}else if(ll.size()>0){
					ro.setError(0);
					ro.setSuccess("success");
					ro.setObj(ll);
			}else{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("addIndexSet")){
			String info = request.getParameter("info");
			ScoreIndexset2011 scoreIndexset = JSON.parseObject(info, ScoreIndexset2011.class);
			int i = 0;
			if(DicEval11Dao.getInstance().checkNameId_f(scoreIndexset.getIndexset_id(), scoreIndexset.getIndexset_name())){
				i=-2;
			}else{
				try {
					i = DicEval11Dao.getInstance().addIndexSet(scoreIndexset);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicEval11Servlet+addIndexSet+scoreIndexset:"+scoreIndexset);
				}
			}
			switch (i) {
			case 0:
				ro.setError(1);
				ro.setSuccess("fail");
				break;
			case -1:
				ro.setError(2);
				ro.setSuccess("fail");
				break;
			case -2:
				ro.setError(3);
				ro.setSuccess("fail");
				break;
			default:
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicEval11Servlet+addIndexSet");
				break;
				}				
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delIndexSet")){
			String indexset_id = request.getParameter("indexset_id");
			try {
				int i = DicEval11Dao.getInstance().delIndexSet(indexset_id);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				case -2:
					ro.setError(3);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicEval11Servlet+delIndexSet");
					break;
					}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DicEval11Servlet+delIndexSet+indexset_id:"+indexset_id);
			}				
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("editIndexSet")){
			String info = request.getParameter("info");
			String old_id = request.getParameter("old_id");
			String old_name = request.getParameter("old_name");
			ScoreIndexset2011 scoreIndexset = JSON.parseObject(info, ScoreIndexset2011.class);
			int i = 0;
			if(DicEval11Dao.getInstance().checkName_f( scoreIndexset.getIndexset_id(), scoreIndexset.getIndexset_name(), old_id, old_name)){
				i=-2;
			}else{
				try {
					i = DicEval11Dao.getInstance().editIndexSet(scoreIndexset, old_id);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicEval11Servlet+editIndexSet+scoreIndexset:"+scoreIndexset+"+old_id:"+old_id);
				}
			}
			switch (i) {
			case 0:
				ro.setError(1);
				ro.setSuccess("fail");
				break;
			case -1:
				ro.setError(2);
				ro.setSuccess("fail");
				break;
			case -2:
				ro.setError(3);
				ro.setSuccess("fail");
				break;
			default:
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicEval11Servlet+editIndexSet");
				break;
				}				
			ro.ToJsp(response);
			return;
		}
		
		
		if(type.equals("addIndex")){
			String info = request.getParameter("info");
			IndexsetIndex index = JSON.parseObject(info, IndexsetIndex.class);
			int i = 0;
			if(DicEval11Dao.getInstance().checkNameId_s(index.getIndex_id(), index.getIndex_name(),index.getIndexset_id())){
				i=-2;
			}else{
				String score = index.getIndex_scale();
				String[] socres = score.split(",");
				String maxSoc = socres[socres.length-1];
				maxSoc = maxSoc.split(":")[0];
				index.setIndex_scalemax(maxSoc);
				try {
					i = DicEval11Dao.getInstance().addIndex(index);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicEval11Servlet+addIndex+index:"+index);
				}
			}
			switch (i) {
			case 0:
				ro.setError(1);
				ro.setSuccess("fail");
				break;
			case -1:
				ro.setError(2);
				ro.setSuccess("fail");
				break;
			case -2:
				ro.setError(3);
				ro.setSuccess("fail");
				break;
			default:
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicEval11Servlet+addIndex");
				break;
				}				
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delIndex")){
			String index_id = request.getParameter("index_id");
			try {
				int i = DicEval11Dao.getInstance().delIndex(index_id);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				case -2:
					ro.setError(3);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicEval11Servlet+delIndex");
					break;
					}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DicEval11Servlet+delIndex+index_id:"+index_id);
			}				
			ro.ToJsp(response);
			return;
		}
		
		
		if(type.equals("editIndex")){
			String info = request.getParameter("info");
			IndexsetIndex index = JSON.parseObject(info, IndexsetIndex.class);
			String old_id = request.getParameter("old_id");
			int i = 0;
			try {
				if(index.getIndex_id().equals(old_id)){
					if(DicEval11Dao.getInstance().checkName_s( index.getIndex_id(),index.getIndex_name(),index.getIndexset_id())){
						i=-2;
					}else{
						String score = index.getIndex_scale();
						String[] socres = score.split(",");
						String maxSoc = socres[socres.length-1];
						maxSoc = maxSoc.split(":")[0];
						index.setIndex_scalemax(maxSoc);
						i = DicEval11Dao.getInstance().editIndex(index, old_id);
					}
				}else{
					if(DicEval11Dao.getInstance().checkName_s( old_id,index.getIndex_name(),index.getIndexset_id())){
						i=-2;
					}else if(DicEval11Dao.getInstance().checkId_s( index.getIndex_id())){
						i=-2;
					}else{
						String score = index.getIndex_scale();
						String[] socres = score.split(",");
						String maxSoc = socres[socres.length-1];
						maxSoc = maxSoc.split(":")[0];
						index.setIndex_scalemax(maxSoc);
						i = DicEval11Dao.getInstance().editIndex(index, old_id);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicEval11Servlet+editIndex+index:"+index+"+old_id:"+old_id);
			}
			
			switch (i) {
			case 0:
				ro.setError(1);
				ro.setSuccess("fail");
				break;
			case -1:
				ro.setError(2);
				ro.setSuccess("fail");
				break;
			case -2:
				ro.setError(3);
				ro.setSuccess("fail");
				break;
			default:
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicEval11Servlet+editIndex");
				break;
			}
			ro.ToJsp(response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	


}
