package hs.bm.server;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hs.bm.util.PropertiesUtil;

public class DescripDownloadServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DescripDownloadServices() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Pragma","No-cache");    
		response.setHeader("Cache-Control","no-cache");    
		response.setDateHeader("Expires", 0);  
		String path=PropertiesUtil.getPropertiesByName("rootDir");
		File file = new File(path,"使用说明.pdf");
		if(!file.exists()){
			file = new File(getServletContext().getRealPath("/"),"img\\nofile.jpg");
		}
		String fileName = file.getName();
		if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {  
			fileName = URLEncoder.encode(fileName, "UTF-8");  
		} else {  
			fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");  
		}  
//		response.setHeader("Content-Disposition","attachment; filename="+fileName);
//		response.setHeader("Content-Length", file.length()+"");
		FileInputStream inputStream = new FileInputStream(file);
		byte[] buffer = new byte[1024];
		int i=0;
		OutputStream out = response.getOutputStream();
		while((i=inputStream.read(buffer))!=-1){
			out.write(buffer, 0, i);
		}
		inputStream.close();
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
