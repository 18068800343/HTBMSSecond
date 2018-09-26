package hs.bm.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSON;
import hs.bm.bean.DicBrgStructMemberDef;
import hs.bm.dao.DicMemTypeDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.ResObj;

public class DicMemTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DicMemTypeServlet() {
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
		
		
		/**初始化构件类型字典数据*/
		if(type.equals("initMemType")){
			List<DicBrgStructMemberDef> ll = DicMemTypeDao.getInstance().initMemType();
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
		
		/**新增构件类型字典数据*/
		if(type.equals("newMemType")){
			String dbsStr = request.getParameter("info");
			DicBrgStructMemberDef dbs = JSON.parseObject(dbsStr, DicBrgStructMemberDef.class);
			int i = 0;
			if(DicMemTypeDao.getInstance().checkNameId(dbs.getMember_name(),dbs.getMember_id(), "member")){
				i = -2;
			}else{
				try {
					i = DicMemTypeDao.getInstance().newMemType(dbs);
				} catch (Exception e) {
					e.printStackTrace();
					LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicMemTypeServlet+newMemType+dbs:"+dbs);
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
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicMemTypeServlet+newMemType");
				break;
			}
			ro.ToJsp(response);
			return;
		}
		
		/**删除构件类型字典数据*/
		if(type.equals("deleteMemType")){
			String member_id = request.getParameter("member_id");
			try {
				int i = DicMemTypeDao.getInstance().deleteMemType(member_id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicMemTypeServlet+deleteMemType");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DicMemTypeServlet+deleteMemType+member_id:"+member_id);
			}
			ro.ToJsp(response);
			return;
		}
		
		/**修改构件类型字典*/
		if(type.equals("editMemType")){
			String dbsStr = request.getParameter("info");
			DicBrgStructMemberDef dbs = JSON.parseObject(dbsStr, DicBrgStructMemberDef.class);			
			int i = 0;
			try {
				if(DicMemTypeDao.getInstance().checkName(dbs.getMember_name(), "member")){
					i=-2;
				}else{
					i = DicMemTypeDao.getInstance().editMemType(dbs);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","DicMemTypeServlet+editMemType");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"DicMemTypeServlet+editMemType+dbs:"+dbs);
			}
			ro.ToJsp(response);
			return;
		}
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
