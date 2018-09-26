package hs.bm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import hs.bm.dao.DicMemMemberTypeDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.MemMember;
import hs.bm.vo.ResObj;

public class DicMemMemberTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DicMemMemberTypeServlet() {
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
		
		if(type.equals("initTable")){
			List<MemMember> ll=DicMemMemberTypeDao.getInstance().initTable();
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
			MemMember mm=JSON.parseObject(info, MemMember.class);
			try {
				int i=DicMemMemberTypeDao.getInstance().checkRepeat(mm.getMember_id(), mm.getMember_type_name());
				if(i==-1){
					ro.setError(2);
				}else if(i==1){
					ro.setError(3);
				}else{
					int j=DicMemMemberTypeDao.getInstance().addDicMemMemberType(mm.getMember_id(),mm.getMember_name(), mm.getMember_type_name());
					if(j>0){
						ro.setError(0);
						ro.setSuccess("success");
						LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","DicMemMemberTypeServlet+add");
					}else{
						ro.setError(1);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"DicMemMemberTypeServlet+add+mm:"+mm);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("del")){
			String info=request.getParameter("info"); 
			MemMember mm=JSON.parseObject(info, MemMember.class);
			try {
				int i=DicMemMemberTypeDao.getInstance().delDicMemMemberType(mm.getMember_id(), mm.getMember_type_name());
				if(i>0){
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","DicMemMemberTypeServlet+del");
				}else if(i==0){
					ro.setError(1);
					ro.setSuccess("fail");
				}else{
					ro.setError(2);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"DicMemMemberTypeServlet+del+mm:"+mm);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("option")){
			List<String> ll = DicMemMemberTypeDao.getInstance().initOption();
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
