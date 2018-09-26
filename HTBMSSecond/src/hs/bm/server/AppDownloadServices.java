package hs.bm.server;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hs.bm.util.ConfigInfo;
import hs.bm.util.PropertiesUtil;

public class AppDownloadServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AppDownloadServices() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Pragma","No-cache");    
		response.setHeader("Cache-Control","no-cache");    
		response.setDateHeader("Expires", 0);  
		String path=PropertiesUtil.getPropertiesByName("rootDir");
		File file = new File(path, ConfigInfo.apkName);
		if(!file.exists()){
			file = new File(getServletContext().getRealPath("/"),"img\\nofile.jpg");
		}
		response.setHeader("Content-Disposition","attachment; filename="+file.getName());
		response.setHeader("Content-Length", file.length()+"");
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
