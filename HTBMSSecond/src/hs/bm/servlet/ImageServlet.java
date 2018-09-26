package hs.bm.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hs.bm.bean.BackUpDataBase;
import hs.bm.dao.BackUpDao;
import hs.bm.server.ShortMessageService;
import hs.bm.vo.ResObj;

public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  this.doPost(request, response);  
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String localPath = request.getParameter("localPath");
			localPath=URLDecoder.decode(localPath, "UTF-8");
		String log_user=(String) request.getSession().getAttribute("username");
		//读取本地图片输入流  
        FileInputStream inputStream = new FileInputStream(localPath);  
        int i = inputStream.available();  
        //byte数组用于存放图片字节数据  
        byte[] buff = new byte[i];  
        inputStream.read(buff);  
        //记得关闭输入流  
        inputStream.close();  
        //设置发送到客户端的响应内容类型  
        response.setContentType("image/*");  
        OutputStream out = response.getOutputStream();  
        out.write(buff);  
        //关闭响应输出流  
        out.close();  
	}

}
