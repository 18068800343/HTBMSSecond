package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSON;

import hs.bm.bean.ScoreIndexset2011;
import hs.bm.dao.DicMemEvalDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.DicMemEval;
import hs.bm.vo.ResObj;

public class DicMemEvalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DicMemEvalServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String type = request.getParameter("type"); 
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		
		if(type.equals("initBridgeTypeOption")){
			List<String> ll = DicMemEvalDao.getInstance().initBridgeTypeOption();
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
		
		if(type.equals("initIndexsetOption")){
			List<ScoreIndexset2011> ll = DicMemEvalDao.getInstance().initIndexsetOption();
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
		
		if(type.equals("initTable")){
			List<DicMemEval> ll = DicMemEvalDao.getInstance().initTable();
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
		
		if(type.equals("add")){
			String info=request.getParameter("info"); 
			DicMemEval dme=JSON.parseObject(info, DicMemEval.class);
			int i = 0;
			if(DicMemEvalDao.getInstance().checkRepeat(dme)){
				i = -2;
			}else{
				dme.setId(UUID.randomUUID().toString().replaceAll("-", ""));
				try {
					i = DicMemEvalDao.getInstance().addData(dme);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicMemEvalServlet+add+dme:"+dme);
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
				ro.setObj(dme.getId());
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicMemEvalServlet+add");
				break;
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("del")){
			String id=request.getParameter("id"); 
			try {
				int i = DicMemEvalDao.getInstance().delData(id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicMemEvalServlet+del");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DicMemEvalServlet+del+id:"+id);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("edit")){
			String info=request.getParameter("info"); 
			DicMemEval dme=JSON.parseObject(info, DicMemEval.class);
			int i = 0;
			if(DicMemEvalDao.getInstance().checkRepeat2(dme)){
				i = -2;
			}else{
				try {
					i = DicMemEvalDao.getInstance().editData(dme);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicMemEvalServlet+edit+dme:"+dme);
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
				ro.setObj(dme.getId());
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicMemEvalServlet+edit");
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
