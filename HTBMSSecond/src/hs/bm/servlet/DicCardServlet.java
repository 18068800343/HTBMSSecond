package hs.bm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSON;
import hs.bm.bean.DicBrgCardDomain;
import hs.bm.dao.DicCardDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.BridgeCardTreeInfo;
import hs.bm.vo.ResObj;

public class DicCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DicCardServlet() {
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
		if(type.equals("initTree")){
			List<BridgeCardTreeInfo> ll = DicCardDao.getInstance().initBridgeCardTree();
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
			String item_id = request.getParameter("item_id");
			List<DicBrgCardDomain> ll = DicCardDao.getInstance().initBridgeCardTable(item_id);
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
		
		if(type.equals("edit")){
			String dcdStr = request.getParameter("info");
			DicBrgCardDomain dcd = JSON.parseObject(dcdStr, DicBrgCardDomain.class);
			try {
				int i = DicCardDao.getInstance().editBridgeCardDomain(dcd);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicCardServlet+edit");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicCardServlet+edit+dcd:"+dcd);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("delete")){
			String domain_id = request.getParameter("domain_id");
			String item_id = request.getParameter("item_id");
			try {
				int i = DicCardDao.getInstance().deleteBridgeCardDomain(domain_id, item_id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicCardServlet+delete");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DicCardServlet+delete+domain_id:"+domain_id+"+item_id:"+item_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("new")){
			String dcdStr = request.getParameter("info");
			DicBrgCardDomain dcd = JSON.parseObject(dcdStr, DicBrgCardDomain.class);
			try {
				int i = DicCardDao.getInstance().newBridgeCardDomain(dcd);
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
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicCardServlet+new");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicCardServlet+new+dcd:"+dcd);
			}
			ro.ToJsp(response);
			return;
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
