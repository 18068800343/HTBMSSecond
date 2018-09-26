package hs.bm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import hs.bm.bean.BrgUpload;
import hs.bm.dao.BrgUploadDao;
import hs.bm.vo.ResObj;

public class GetFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetFileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type=request.getParameter("type");
		ResObj ro = new ResObj();
		String log_user=(String) request.getSession().getAttribute("username");
		BrgUploadDao dao=new BrgUploadDao();
		List<BrgUpload>list1=dao.selectNameByBrgUpload("lanetell.m");
		if(list1.size()==0){
			BrgUpload upload=new BrgUpload();
			upload.setBrgId(1);
			upload.setBrgUploadStatus("");
			upload.setBrgUploadTime("");
			list1.add(upload);
		}
		List<BrgUpload>list2=dao.selectNameByBrgUpload("overload.m");
		if(list2.size()==0){
			BrgUpload upload=new BrgUpload();
			upload.setBrgId(2);
			upload.setBrgUploadStatus("");
			upload.setBrgUploadTime("");
			list2.add(upload);
		}
		List<BrgUpload>list3=dao.selectNameByBrgUpload("WIM_Mainfunc.m");
		if(list3.size()==0){
			BrgUpload upload=new BrgUpload();
			upload.setBrgId(3);
			upload.setBrgUploadStatus("");
			upload.setBrgUploadTime("");
			list3.add(upload);
		}
		List<BrgUpload>list4=dao.selectNameByBrgUpload("axletell.m");
		if(list4.size()==0){
			BrgUpload upload=new BrgUpload();
			upload.setBrgId(4);
			upload.setBrgUploadStatus("");
			upload.setBrgUploadTime("");
			list4.add(upload);
		}
		List<BrgUpload>list5=dao.selectNameByBrgUpload("axletellhou.m");
		if(list5.size()==0){
			BrgUpload upload=new BrgUpload();
			upload.setBrgId(5);
			upload.setBrgUploadStatus("");
			upload.setBrgUploadTime("");
			list5.add(upload);
		}
		JSONObject obj=  new JSONObject();
		obj.put("list1", list1);
		obj.put("list2", list2);
		obj.put("list3", list3);
		obj.put("list4", list4);
		obj.put("list5", list5);
		JSONArray array = new JSONArray();
		array.add(obj);
		ro.setObj(array);
		ro.ToJsp(response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
