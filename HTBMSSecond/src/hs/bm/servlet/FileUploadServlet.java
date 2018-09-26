package hs.bm.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import hs.bm.bean.BrgUpload;
import hs.bm.dao.BrgUploadDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.ResObj;

public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public FileUploadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		ResObj ro = new ResObj();
		String log_user=(String) request.getSession().getAttribute("username");
		 request.setCharacterEncoding("utf-8");//防止中文名乱码
         int sizeThreshold=1024*6; //缓存区大小
         String basePath = this.getServletContext().getRealPath("/upload/");
         File repository = new File(basePath); //缓存区目录
         long sizeMax = 1024 * 1024 * 2;//设置文件的大小为2M
         final String allowExtNames = "jpg,gif,bmp,rar,rar,txt,docx,m";
         DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
         diskFileItemFactory.setRepository(repository);
         diskFileItemFactory.setSizeThreshold(sizeThreshold);
         ServletFileUpload servletFileUpload=new ServletFileUpload(diskFileItemFactory);
         servletFileUpload.setSizeMax(sizeMax);
         
         List<FileItem> fileItems = null;
         try{
             fileItems = servletFileUpload.parseRequest(request);
             
             for(FileItem fileItem:fileItems){
                 long size=0;
                 String filePath = fileItem.getName();
                 if(filePath==null || filePath.trim().length()==0)
                     continue;
                 String fileName=filePath.substring(filePath.lastIndexOf(File.separator)+1);

                 String extName=filePath.substring(filePath.lastIndexOf(".")+1);

                 if(allowExtNames.indexOf(extName)!=-1){
                     try {
                         fileItem.write(new File(basePath+File.separator+fileName));
                         
                         SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                         String now=sdf.format(new Date());
                         String brgName=(String) request.getSession().getAttribute("username");
                         BrgUpload upload=new BrgUpload();
                         upload.setBrgName(fileName);
                         upload.setBrgUploadTime(now);
                         upload.setBrgUrl(basePath+fileName);
                         upload.setBrgUser(brgName);
                         upload.setBrgUploadStatus("成功");
                      
                         BrgUploadDao dao=new BrgUploadDao();
                         dao.AddBrgUpload(upload);
                         ro.setObj(upload);
                         ro.ToJsp(response);
                     } catch (Exception e) {
                         e.printStackTrace();
                         LogDao.getInstance().addLogInfo(log_user,"上传失败", "FileUploadServlet",e.getMessage());
                     }
                 }
                 else{
                	 LogDao.getInstance().addLogInfo(log_user,"上传失败", "FileUploadServlet","file type is not allowed");
                     throw new FileUploadException("file type is not allowed");
                 }
             }
         }catch(FileSizeLimitExceededException e){
             System.out.println("file size is not allowed");
             LogDao.getInstance().addLogInfo(log_user,"上传失败", "FileUploadServlet",e.getMessage());
         }catch(FileUploadException e1){
             e1.printStackTrace();
             LogDao.getInstance().addLogInfo(log_user,"上传失败", "FileUploadServlet",e1.getMessage());
        }
	         
	         
	         
	         
	         
	         
	         
	        ro.setObj("eee");
			ro.ToJsp(response);
			return;
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
