package hs.bm.server;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hs.bm.util.PropertiesUtil;

public class ImageDownLoadServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageDownLoadServer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Pragma","No-cache");    
		response.setHeader("Cache-Control","no-cache");    
		response.setDateHeader("Expires", 0);  
		String path= request.getParameter("path");
		String imgName = request.getParameter("imgName");
		path= URLDecoder.decode(path,"UTF-8");
		path=path.replaceAll("@", "#");
		System.out.println(path);
		//System.out.println("lalalal:"+path);
		String basePath = PropertiesUtil.getPropertiesByName("rootDir");
		File file = new File(basePath, path);
		if(path.equals("")){
			file = new File(getServletContext().getRealPath("/"),"img\\nofile.jpg");
		}
//		System.out.println(file.getAbsolutePath());
		if(!file.exists()){
			file = new File(getServletContext().getRealPath("/"),"img\\nofile.jpg");
		}else{
			if(file.getName().contains("png")){
				response.setContentType("image/png");  
			}
			if(file.getName().contains("jpg")){
				response.setContentType("image/jpg");  
			}
			if(file.getName().contains("gif")){
				response.setContentType("image/gif");  
			}
			if(file.getName().contains("jpeg")){
				response.setContentType("image/jpeg");  
			}
			if(file.getName().contains("bmp")){
				response.setContentType("image/bmp");  
			}
		}
		
		if(imgName==null){
			imgName = file.getName();
		}else{
			imgName = imgName.replaceAll("-", "#");
			if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {  
				imgName = URLEncoder.encode(imgName, "UTF-8");  
			} else {  
				imgName = new String(imgName.getBytes("UTF-8"), "ISO8859-1");  
			}  
		}
		response.setHeader("Content-Disposition","attachment; filename="+imgName);
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
