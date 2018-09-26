package hs.bm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DicBrgStructComponentDef;
import hs.bm.bean.DicBrgStructMemberDef;
import hs.bm.dao.DicBridgeStructDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.ResObj;

public class DicBridgeStructServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DicBridgeStructServlet() {
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
		
		if(type.equals("initTable")){
			List<DicBrgStructMemberDef> ll = DicBridgeStructDao.getInstance().initTable();
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
		
		if(type.equals("initOption")){
			List<DicBrgStructComponentDef> ll = DicBridgeStructDao.getInstance().initOption();
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
		
		if(type.equals("editData2011")){
			String info = request.getParameter("info");
			DicBrgStructMemberDef dbs = JSON.parseObject(info, DicBrgStructMemberDef.class);
			try {
				int i = DicBridgeStructDao.getInstance().editData2011(dbs);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicBridgeStructServlet+editData2011");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicBridgeStructServlet+editData2011+dbs:"+dbs);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("editData2004")){
			String info = request.getParameter("info");
			DicBrgStructMemberDef dbs = JSON.parseObject(info, DicBrgStructMemberDef.class);
			try {
				int i = DicBridgeStructDao.getInstance().editData2014(dbs);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicBridgeStructServlet+editData2004");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicBridgeStructServlet+editData2004+dbs:"+dbs);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("editDataCKB")){
			String info = request.getParameter("info");
			DicBrgStructMemberDef dbs = JSON.parseObject(info, DicBrgStructMemberDef.class);
			try {
				int i = DicBridgeStructDao.getInstance().editDataCKB(dbs);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicBridgeStructServlet+editDataCKB");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicBridgeStructServlet+editDataCKB+dbs:"+dbs);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("editDataCKP")){
			String info = request.getParameter("info");
			DicBrgStructMemberDef dbs = JSON.parseObject(info, DicBrgStructMemberDef.class);
			try {
				int i = DicBridgeStructDao.getInstance().editDataCKP(dbs);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicBridgeStructServlet+editDataCKP");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicBridgeStructServlet+editDataCKP+dbs:"+dbs);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("editDataCKC")){
			String info = request.getParameter("info");
			DicBrgStructMemberDef dbs = JSON.parseObject(info, DicBrgStructMemberDef.class);
			try {
				int i = DicBridgeStructDao.getInstance().editDataCKC(dbs);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicBridgeStructServlet+editDataCKC");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicBridgeStructServlet+editDataCKC+dbs:"+dbs);
			}
			ro.ToJsp(response);
			return;
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
