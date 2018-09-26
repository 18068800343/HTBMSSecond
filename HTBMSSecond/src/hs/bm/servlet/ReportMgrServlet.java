package hs.bm.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import hs.bm.bean.ImgPackage;
import hs.bm.bean.ReportInfo;
import hs.bm.dao.LogDao;
import hs.bm.dao.ReportMgrDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.CopyFile;
import hs.bm.util.DeleteFileUtil;
import hs.bm.util.FileManageUtil;
import hs.bm.util.GetMacAndNetCard;
import hs.bm.util.PackageFile;
import hs.bm.util.PropertiesUtil;
import hs.bm.util.TimeFormatUtil;
import hs.bm.util.ZipManageUtil;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;
import hs.bm.vo.StructInformation;

public class ReportMgrServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public ReportMgrServlet()
	{
		super(); 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String type = request.getParameter("type");
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		
		if (type.equals("initBridgeTable"))
		{
			String prj_id = request.getParameter("prj_id");
			List<StructInformation> ll = ReportMgrDao.getInstance().initStructTable( prj_id );
			if (ll == null)
			{
				ro.setError(2);
			} else if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initTable"))
		{
			String tableData = request.getParameter("tableData");
			ReportInfo rt = JSON.parseObject(tableData, ReportInfo.class);
			List<ReportInfo> ll = ReportMgrDao.getInstance().initTable(rt);
			if (ll == null)
			{
				ro.setError(2);
			} else if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initTableAll"))
		{
			HttpSession session = request.getSession();
			String orgid = (String) session.getAttribute("orgid");
			String userRole = (String) session.getAttribute("userRole");
			List<ReportInfo> ll = new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole)
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				orgid=orgid.substring(0,4)+"%";
				ll = ReportMgrDao.getInstance().initTableAll2(orgid);
			}else {
				ll = ReportMgrDao.getInstance().initTableAll();
			}
			if (ll == null)
			{
				ro.setError(2);
			} else if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initPrj"))
		{
			String id = request.getParameter("id");
			String mode = request.getParameter("mode");
			List<Map<String, String>> ll = ReportMgrDao.getInstance().initPrj(id, mode);
			if (ll == null)
			{
				ro.setError(2);
			} else if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("addReport"))
		{
			try {
				String code = GetMacAndNetCard.readLicense();
				String report_times = GetMacAndNetCard.getMac(GetMacAndNetCard.getBase64Decodec(code), "reportTimes");
				String report_count = GetMacAndNetCard.getReportCount();
				String date = GetMacAndNetCard.getMac(GetMacAndNetCard.getBase64Decodec(code), "limitDate");
				String end = date.split("!")[1];
				/* 报告生成次数超过限定 */
				System.out.println(report_count + "/" + report_times+"//"+end);
				
				if (report_times.equals("*")||end.equals("#")){
					String tableData = request.getParameter("tableData");
					String taskId=request.getParameter("taskId");
					String report_id=UUID.randomUUID().toString().replaceAll("-", "");
					ReportInfo rt = JSON.parseObject(tableData, ReportInfo.class);
					String report_build=rt.getReport_build();
					JSONObject jsonobj=new JSONObject().parseObject(report_build);
					rt.setReport_build((String) jsonobj.get("arg"));
					rt.setReport_id(report_id);
					String userName=taskId.split("-")[0];
					String startTime=taskId.split("-")[1];
					String count=taskId.split("-")[2];
					rt.setTask_id(taskId);
					rt.setUser_name(userName);
					rt.setReport_start_time(startTime);
					rt.setReport_count(Integer.valueOf(count));
					rt.setReport_file_path("");
					rt.setReport_status("生成中");
					rt.setReport_date("");
					
					String s_spans=jsonobj.getString("s_spans");
					String x_spans=jsonobj.getString("x_spans");
					String w_spans=jsonobj.getString("w_spans");
					if(!s_spans.equals("")){
						s_spans="(上行："+s_spans+")";
					}else{
						s_spans="";
					}
					if(!x_spans.equals("")){
						x_spans="(下行："+x_spans+")";
					}else{
						x_spans="";
					}
					if(!w_spans.equals("")){
						w_spans="(无："+w_spans+")";
					}else{
						w_spans="";
					}
					String taskName=s_spans+x_spans+w_spans;
					ReportMgrDao.getInstance().addReport(rt);
						
					
					
					//String path = CMDUtil.buildReport(rt.getPrj_id(), rt.getStruct_id(), rt.getStruct_mode(), rt.getChk_type(), rt.getReport_build());
					List ll = CMDUtil.buildReportBySpan(rt.getPrj_id(), rt.getStruct_id(), rt.getStruct_mode(), rt.getChk_type(), report_build);	
					int i = 0;
					if (ll.size()<=0){
						i = -2;
					} else{
						String basePath = new File(PropertiesUtil.getPropertiesByName("rootDir")).getPath() + File.separator;
						String path=(String) ll.get(0);
						String newPath=path.replace(path.split("\\\\")[5], "")+UUID.randomUUID();
						String zipPath=path.replace(path.split("\\\\")[5], "")+UUID.randomUUID();
						String fileName = ReportMgrDao.getInstance().getFileName(rt.getStruct_id(),rt.getStruct_mode());
						
						String zipName=fileName+taskName;
						for (int j = 0; j < ll.size(); j++){
							 File dir= new File(newPath); 
							 if(dir.mkdirs()){
								 System.out.println("文件创建成功");
							 }
							String llpath=(String) ll.get(j);
							try{
								if(llpath.indexOf("(")>0||llpath.indexOf("（")>0){
									String lastPath=llpath.split("\\\\")[5].substring(llpath.split("\\\\")[5].indexOf("(")+1,llpath.split("\\\\")[5].indexOf(")"));
									String lastPathName=fileName+"("+lastPath+").docx";
									CopyFile copy=new CopyFile();//拷贝文件
									copy.copyFile(dir, llpath, lastPathName);
								}else{
									String lastPathName=fileName+".docx";
									CopyFile copy=new CopyFile();//拷贝文件
									copy.copyFile(dir, llpath, lastPathName);
									
								}
							}catch (Exception e) {
								
							}
						}
						File zipdir= new File(zipPath); 
						 if( zipdir.mkdirs()){
							 System.out.println("zip文件夹创建成功");
						 }
						PackageFile p=new PackageFile();//压缩zip
						if(taskName.indexOf("*")>0){
							p.fileToZip(newPath, zipPath,fileName.replace(":", "：").replace(";", ","));
							String report_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
							i = ReportMgrDao.getInstance().updateReport(zipPath+File.separator+fileName.replace(";", ",")+".zip", report_date, "成功", report_id);
						}else{
							p.fileToZip(newPath, zipPath,zipName.replace(":", "：").replace(";", ","));
							String report_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
							i = ReportMgrDao.getInstance().updateReport(zipPath+File.separator+zipName.replace(";", ",")+".zip", report_date, "成功", report_id);
						}
						
						
						
//			System.out.println("等待资源释放。。。。");
//			synchronized (this) {
//				try {
//					Thread.sleep(15000);
//					DeleteFileUtil dfu=new DeleteFileUtil();//删除copy文件夹
//					dfu.deleteDirectory(newPath);
//				} catch (InterruptedException e) {
//					e.printStackTrace();
//				}
//			}
						
					}
					switch (i){
						case 0:
							ReportMgrDao.getInstance().updateReportStatus("生成失败", report_id);
							ro.setError(1);
							ro.setSuccess("fail");
							break;
						case -1:
							ReportMgrDao.getInstance().updateReportStatus("生成失败", report_id);
							ro.setError(2);
							ro.setSuccess("fail");
							break;
						case -2:
							ReportMgrDao.getInstance().updateReportStatus("生成失败", report_id);
							ro.setError(3);
							ro.setSuccess("fail");
							break;
						default:
							ro.setError(0);
							ro.setSuccess("success");
							ro.setObj(rt);
							break;
					}
				} else
				{   
						String tableData = request.getParameter("tableData");
						ReportInfo rt = JSON.parseObject(tableData, ReportInfo.class);
						rt.setReport_id(UUID.randomUUID().toString().replaceAll("-", ""));
						String path = CMDUtil.buildReport(rt.getPrj_id(), rt.getStruct_id(), rt.getStruct_mode(), "regular", rt.getReport_build());
						int i = 0;
						if (path == null)
						{
							i = -2;
						} else
						{
							String basePath = new File(PropertiesUtil.getPropertiesByName("rootDir")).getPath() + File.separator;
							path = path.replace(basePath, "");
							rt.setReport_file_path(path);
							rt.setReport_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
							i = ReportMgrDao.getInstance().addReport(rt);
						}
						switch (i)
						{
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
							ro.setObj(rt);
							break;
						}
				     }
				LogDao.getInstance().addLogInfo(log_user,"生成报告成功", "ReportMgrServlet+addReport","ReportMgrServlet");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"生成报告出错", "ReportMgrServlet+addReport",e.getMessage()+" *** ");
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("delReport"))
		{
			String report_id = request.getParameter("report_id");
			try {
				int i = ReportMgrDao.getInstance().delReport(report_id);
				switch (i)
				{
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
					LogDao.getInstance().addLogInfo(log_user,"删除成功", "ReportMgrServlet+delReport","ReportMgrServlet");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "ReportMgrServlet+delReport",e.getMessage()+" *** "+report_id);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("downFile")){
			boolean flag = false;
			String dirRoot = PropertiesUtil.getPropertiesByName("rootDir");
			String report_id = URLDecoder.decode(request.getParameter("report_id"), "UTF-8");
			String struct_mode = URLDecoder.decode(request.getParameter("struct_mode"), "UTF-8");
			String struct_id = URLDecoder.decode(request.getParameter("struct_id"), "UTF-8");
			String suff = ".zip";
			String filePath=ReportMgrDao.getInstance().getFilePath(report_id);
			if (!filePath.contains(dirRoot)) {
				filePath =dirRoot+File.separator+filePath;
				flag = true;
			}
			File file  = new File(filePath);
			String fileName="";
			if (flag) {
				 fileName = ReportMgrDao.getInstance().getFileName(struct_id,struct_mode);
				 if (file.exists())
					{
						suff = file.getName().substring(file.getName().lastIndexOf("."));
						fileName = fileName+suff;
					}
			}else {
				fileName=filePath.split("\\\\")[filePath.split("\\\\").length-1].replace(":", "：");
			}
			System.out.println("下载报告"+struct_id);
			System.out.println("下载报告"+fileName);
			//File file = new File(filePath.replace(filePath.split("\\\\")[filePath.split("\\\\").length-1],fileName));
			
			
			//ie
			if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			{
				fileName = URLEncoder.encode(fileName, "UTF-8");
			}
			//其他
			else
			{
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			}
			System.out.println(file);
			FileManageUtil.fileDownloadName(file, response, fileName);
			return;
		}
		
		if (type.equals("downFile2")){
			String files=request.getParameter("files");
			File file=new File(files);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
			String fileName=sdf.format(new Date())+".zip";
			FileManageUtil.fileDownloadName(file, response, fileName);
			return;
		}
		
		if (type.equals("downFileAll")){
			String filePaths =request.getParameter("structs");
			net.sf.json.JSONArray object = net.sf.json.JSONArray.fromObject(filePaths);
			List<String> list = new ArrayList<>(); 
			for(int i=0;i<object.size();i++){
				net.sf.json.JSONObject obj = (net.sf.json.JSONObject) object.get(i);
				String path = obj.get("report_file_path").toString();
				list.add(path);
			}
			try {
				String time = TimeFormatUtil.getYMDtime("yyyy-MM-dd HH-mm", new Date());
				String userName = (String) request.getSession().getAttribute("realUserName");
				FileManageUtil.getAllFile(list.toString(),"D:\\downloadAll\\"+userName+"_"+time+".zip");
				ro.setObj("D:\\downloadAll\\"+userName+"_"+time+".zip");
				ro.setError(0);
				ro.setSuccess("success");
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				ro.setError(1);
				ro.setSuccess("fail");
			}catch (Exception e) {
				e.printStackTrace();
				ro.setError(2);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		
		
		
		if (type.equals("addPackage"))
		{
			try {
				String package_name = request.getParameter("package_name");
				String prj_id = request.getParameter("prj_id");
				OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
				String id = oc.getId();
				String mode = oc.getMode();
				String path = ReportMgrDao.getInstance().buildPackage(id, prj_id, mode);
				String basePath = new File(PropertiesUtil.getPropertiesByName("rootDir")).getPath() + File.separator;
				path = path.replace(basePath, "");
				ImgPackage pg = new ImgPackage();
				pg.setPackage_id(UUID.randomUUID().toString().replaceAll("-", ""));
				pg.setPackage_name(package_name);
				pg.setPackage_path(path);
				pg.setStruct_id(id);
				pg.setStruct_mode(mode);
				pg.setPrj_id(prj_id);
				pg.setBuild_date(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				int i = ReportMgrDao.getInstance().addPackage(pg);
				switch (i)
				{
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
					LogDao.getInstance().addLogInfo(log_user,"增加成功", "ReportMgrServlet+addPackage","ReportMgrServlet");
					ro.setObj(pg);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "ReportMgrServlet+addPackage",e.getMessage()+" *** ");
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initPackage"))
		{
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			String id = oc.getId();
			List<ImgPackage> ll = ReportMgrDao.getInstance().initPackage(id);
			if (ll == null)
			{
				ro.setError(2);
			} else if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("delPackage"))
		{
			try {
				String package_id = request.getParameter("package_id");
				int i = ReportMgrDao.getInstance().delPackage(package_id);
				switch (i)
				{
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
					LogDao.getInstance().addLogInfo(log_user,"删除成功", "ReportMgrServlet+addPackage","WeightHealthServlet");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "ReportMgrServlet+addPackage",e.getMessage()+" *** ");
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("downPackage"))
		{
			String filePath = URLDecoder.decode(request.getParameter("filePath"), "UTF-8");
			String fileName = URLDecoder.decode(request.getParameter("fileName"), "UTF-8");
			if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0)
			{
				fileName = URLEncoder.encode(fileName, "UTF-8");
			} else
			{
				fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
			}
			String basePath = PropertiesUtil.getPropertiesByName("rootDir");
			File file = new File(basePath, filePath);
			FileManageUtil.fileDownloadName(file, response, fileName + ".zip");
			return;
		}
		
		if (type.equals("getDircetionSpan"))
		{
			String infoStr = request.getParameter("struct");
			StructInformation sf = JSON.parseObject(infoStr, StructInformation.class);
			Map<String, String> map = ReportMgrDao.getInstance().getDircetionSpan(sf);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}


}
