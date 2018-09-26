package hs.bm.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.Filemanage;
import hs.bm.bean.Report;
import hs.bm.dao.FileManageDao;
import hs.bm.dao.LogDao;
import hs.bm.util.FileManageUtil;
import hs.bm.vo.ReportStructs;
import hs.bm.vo.ReportVO;
import hs.bm.vo.ResObj;
import hs.bm.vo.StructInformation;
public class FileManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FileManageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		
		if(type==null){
			//String fn=request.getHeader("filename");
			String ExtraName=request.getHeader("extraname");
			String filetype=request.getHeader("filetype");
			String uuid=UUID.randomUUID().toString();
			String fileName =uuid.replaceAll("-", "")+ "." + ExtraName;
			//String filename=request.getHeader("filename");
			String savePath = "";
			try {
				InputStream is = getClass().getResourceAsStream("/config.properties");
				Properties p = new Properties();
				p.load(is);
				if(filetype==null){
					savePath=p.getProperty("rootDir")+File.separator+"uploadFile"+File.separator+"document";
				}else{
					savePath=p.getProperty("rootDir")+File.separator+"uploadFile"+File.separator+"report";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			File file=new File(savePath);
			if(!file.exists()){
				file.mkdirs();
			}
			//System.out.println(fileName);
			file=new File(savePath+File.separator+fileName);
			String path =FileManageUtil.fileUploadToDisk(file,  request);
			if(path!=null){
				ro.setObj(path);
				ro.setSuccess("success");
				ro.setError(0);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("holddata")){
			//String fn=request.getHeader("filename");
			Date date=new Date();
			SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String filedate=sd.format(date);
			String nickname=request.getParameter("nickname");
			String filename=request.getParameter("filename");
			String filetype=request.getParameter("filetype");
			String note=request.getParameter("note");
			String user_name=(String) session.getAttribute("username");
			String path=request.getParameter("path");
			String realname=path.substring(path.lastIndexOf("\\")+1, path.length());
			File file=new File(path);
			long size=file.length();
			int filesize=(int) (size/1024);
			if(nickname.trim().equals("")){
				nickname=filename.substring(0,filename.lastIndexOf("."));
			}
			Filemanage fm=new Filemanage();
			fm.setFile_name(realname);
			fm.setFile_date(filedate);
			fm.setFile_id(UUID.randomUUID().toString());
			fm.setFile_extension(filename.substring(filename.lastIndexOf(".")+1, filename.length()));
			fm.setFile_nickname(nickname);
			fm.setFile_note(note);
			fm.setFile_size(filesize);
			fm.setFile_type(filetype);
			fm.setUser_name(user_name);
			int i=FileManageDao.getInstance().addFileData(fm);
			if(i>0){
				ro.setObj(fm);
				ro.setSuccess("success");
				ro.setError(0);
			}
			ro.ToJsp(response);
			return;
		}
		
		
		
		if(type.equals("initShare")){
			List<Filemanage> lfm=FileManageDao.getInstance().getAllFile();
			ro.setObj(lfm);
			ro.setSuccess("success");
			ro.setError(0);
			ro.ToJsp(response);
			return;
		}
		if(type.equals("initMine")){
			String user_name=(String) session.getAttribute("username");
			System.out.println(user_name);
			List<Filemanage> lfm=FileManageDao.getInstance().getMineFile(user_name);
			ro.setObj(lfm);
			ro.setSuccess("success");
			ro.setError(0);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("downloadFile")){
			String filename=request.getParameter("filename");
			String nickname=request.getParameter("nickname");
			String filetype=request.getParameter("filetype");
			String savePath = "";
			try {
				InputStream is = getClass().getResourceAsStream("/config.properties");
				Properties p = new Properties();
				p.load(is);
				if(filetype==null){
					savePath=p.getProperty("rootDir")+File.separator+"uploadFile"+File.separator+"document";
				}else {
					savePath=p.getProperty("rootDir")+File.separator+"uploadFile"+File.separator+"report";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			File file=new File(savePath+File.separator+filename);
			//System.out.println(savePath+File.separator+filename);
			if(file.exists()){
				try {
					fileDownload(file, response,getStr(request, nickname));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return;
		}
		
		if(type.equals("editFileData")){
			Filemanage fm= JSON.parseObject(request.getParameter("info"),Filemanage.class);
			int i=FileManageDao.getInstance().editFileData(fm);
			if(i>0){
				ro.setSuccess("success");
				ro.setError(0);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("deleteFile")){
			try {
				String file_id=request.getParameter("file_id");
				int i=FileManageDao.getInstance().deleteFileData(file_id);
				if(i>0){
					ro.setSuccess("success");
					ro.setError(0);
					LogDao.getInstance().addLogInfo(log_user,"删除成功", "FileManageServlet+deleteFile","deleteFile");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "FileManageServlet+deleteFile",e.getMessage());
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("initUser")){
			List<String> ls=FileManageDao.getInstance().initUser();
			if(ls.size()>0){
				ro.setSuccess("success");
				ro.setError(0);
				ro.setObj(ls);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("reportFile")){
			Report report=new Report();
			String reporttype=request.getParameter("reporttype");
			String reportname=request.getParameter("reportname");
			String reportid=request.getParameter("reportid");
			String missionno=request.getParameter("missionno");
			String prjname=request.getParameter("prjname");
			String user=request.getParameter("user");
			String publishdate=request.getParameter("publishdate");
			String copies=request.getParameter("copies");
			String filingdate=request.getParameter("filingdate");
			String recordno=request.getParameter("recordno");
			String publicornot=request.getParameter("publicornot");
			String contractFiling=request.getParameter("contractFiling");
			String note=request.getParameter("note");
			String path=request.getParameter("path");
			File f=new File(path);
			String fn=f.getName();
			String extension=fn.substring(fn.lastIndexOf(".")+1, fn.length());
			report.setId(UUID.randomUUID().toString());
			report.setCharge_man(user);
			report.setCopies(copies);
			report.setFiling_date(filingdate);
			report.setIs_public(publicornot);
			report.setContract_filing(contractFiling);
			report.setMission_no(missionno);
			report.setNote(note);
			report.setProject_name(prjname);
			report.setPublish_date(publishdate);
			report.setRecord_no(recordno);
			report.setReport_id(reportid);
			report.setReport_name(reportname);
			report.setReport_type(reporttype);
			report.setReport_dir(path);
			report.setReport_size(f.length()/1024+"");
			report.setReport_extension(extension);
			String structsJSON = request.getParameter("structs");
			System.out.println(structsJSON);
			List<StructInformation> ll = JSON.parseArray(structsJSON, StructInformation.class);
			
			int i=FileManageDao.getInstance().addReport(report, ll);
			if(i>0){
				ro.setSuccess("success");
				ro.setError(0);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("updateReport")){
			try {
				Report report=new Report();
				String id=request.getParameter("id");
				String reporttype=request.getParameter("reporttype");
				String reportname=request.getParameter("reportname");
				String reportid=request.getParameter("reportid");
				String missionno=request.getParameter("missionno");
				String prjname=request.getParameter("prjname");
				String user=request.getParameter("user");
				String publishdate=request.getParameter("publishdate");
				String copies=request.getParameter("copies");
				String filingdate=request.getParameter("filingdate");
				String recordno=request.getParameter("recordno");
				String publicornot=request.getParameter("publicornot");
				String contractFiling=request.getParameter("contractFiling");
				String note=request.getParameter("note");
				String path=request.getParameter("path");
				String fn=null;
				String extension=null;
				if(path!=null){
					File f=new File(path);
					fn=f.getName();
					extension=fn.substring(fn.lastIndexOf(".")+1, fn.length());
					report.setReport_size(f.length()/1024+"");
				}
				report.setCharge_man(user);
				report.setCopies(copies);
				report.setFiling_date(filingdate);
				report.setIs_public(publicornot);
				report.setContract_filing(contractFiling);
				report.setMission_no(missionno);
				report.setNote(note);
				report.setProject_name(prjname);
				report.setPublish_date(publishdate);
				report.setRecord_no(recordno);
				report.setReport_id(reportid);
				report.setReport_name(reportname);
				report.setReport_type(reporttype);
				report.setReport_dir(path);
				report.setReport_extension(extension);
				String structsJSON = request.getParameter("structs");
				List<StructInformation> ll = JSON.parseArray(structsJSON, StructInformation.class);
				int i=FileManageDao.getInstance().updateReport(report, ll,id);
				if(i>0){
					ro.setSuccess("success");
					ro.setError(0);
				}
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("initStructs")){
			ReportStructs rst=FileManageDao.getInstance().initStructs();
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(rst);
			ro.ToJsp(response);
			return;
		}
		if(type.equals("checkReportID")){
			String report_id=request.getParameter("report_id");
			boolean bl=FileManageDao.getInstance().checkReportID(report_id);
			if(bl){
				ro.setSuccess("success");
				ro.setError(0);	
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("initEditReport")){
			String id=request.getParameter("id");
			ReportVO rv=FileManageDao.getInstance().initEditReport(id);
			ro.setSuccess("success");
			ro.setError(0);	
			ro.setObj(rv);
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("initSearch")){
			List<Report> lr=FileManageDao.getInstance().initSearch();
			if(lr.size()>0){
				ro.setSuccess("success");
				ro.setError(0);
				ro.setObj(lr);
			}
			ro.ToJsp(response);
			return;
		}
		
		if(type.equals("search")){
			Report rp=JSON.parseObject(request.getParameter("info"),Report.class);
			String manage_name=request.getParameter("manage_name");
			String section_name=request.getParameter("section_name");
			String struct_name=request.getParameter("struct_name");
			List<ReportVO> lr=FileManageDao.getInstance().search(rp,manage_name,section_name,struct_name);
			if(lr.size()>0){
				ro.setSuccess("success");
				ro.setError(0);
				ro.setObj(lr);
			}
			ro.ToJsp(response);
			return;
		}
		
	}
	public String getStr(HttpServletRequest request, String realFileName) throws Exception {
			  String browName = null;
			  String clientInfo = request.getHeader("User-agent");
			  System.out.println(clientInfo);
			  if (clientInfo != null && clientInfo.indexOf("MSIE") > 0) {//
			   // IE采用URLEncoder方式处理
			   if (clientInfo.indexOf("MSIE 6") > 0
			     || clientInfo.indexOf("MSIE 5") > 0) {// IE6，用GBK，此处实现由局限性
			    browName = new String(realFileName.getBytes("GBK"),
			      "ISO-8859-1");
			   } else {// ie7+用URLEncoder方式
			    browName = java.net.URLEncoder.encode(realFileName, "UTF-8");
			   }
			  } else {//其他浏览器
			   browName = new String(realFileName.getBytes("GBK"), "ISO-8859-1");
			  }
			  return browName;
	 }
	
	//下载文件
	public void fileDownload(File file,HttpServletResponse response,String filename) throws IOException{
		if(file.exists()){
			response.setHeader("Content-Disposition","attachment; filename="+filename);
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new FileInputStream(file);
				out = response.getOutputStream();
				byte[] bs = new byte[1024];
				int i= -1;
				while((i=in.read(bs))!=-1){
					out.write(bs, 0, i);
				}
				out.flush();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				out.close();
				in.close();
			}
		}else{
			PrintWriter writer = response.getWriter();
			writer.write("请求的文件不存在，请重新生成！".toCharArray());
			writer.flush();
			writer.close();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
