package hs.bm.server;

import hs.bm.util.PropertiesUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PDFDownLoadServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PDFDownLoadServer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		response.setHeader("Pragma","No-cache");    
		response.setHeader("Cache-Control","no-cache");    
		response.setDateHeader("Expires", 0);  
		
		String path= request.getParameter("path");
		path= URLDecoder.decode(path,"UTF-8");
		
		System.out.println(PropertiesUtil.getPropertiesByName("rootDir")+File.separator+path);
		File file = new File(PropertiesUtil.getPropertiesByName("rootDir")+File.separator+path);
		if(!file.exists()){
			file = new File(getServletContext().getRealPath("/"),"img\\nofile.jpg");
		}
		
		response.setContentType("application/pdf");  
		response.setHeader("Content-Disposition","filename="+file.getName());
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
