package hs.bm.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.core.util.UuidUtil;

import hs.bm.bean.BrgMbrInfo;
import hs.bm.dao.BrgUploadDao;
import hs.bm.dao.LogDao;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BrgSpanInfoVO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;


public class UpLoadFileServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String history_id="";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");
		 ResObj ro = new ResObj();
		 String log_user=(String) request.getSession().getAttribute("username");
		 request.setCharacterEncoding("utf-8");//防止中文名乱码
         int sizeThreshold=1024 * 1024 * 24; //缓存区大小
         long sizeMax = 1024 * 1024 * 24;//设置文件的大小为2M
         final String allowExtNames = "xlsx,csv,xlsm,xml,xlt,ods,xls";
         DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
         diskFileItemFactory.setSizeThreshold(sizeThreshold);
         ServletFileUpload servletFileUpload=new ServletFileUpload(diskFileItemFactory);
         servletFileUpload.setSizeMax(sizeMax);
         String basePath  = PropertiesUtil.getPropertiesByName("rootDir");
         List<FileItem> fileItems = null;
         String fileName="";
         try{
             fileItems = servletFileUpload.parseRequest(request);
             for(FileItem fileItem:fileItems){
                 String filePath = fileItem.getName();
                 if(filePath==null || filePath.trim().length()==0)
                     continue;
                 fileName=filePath.substring(filePath.lastIndexOf(File.separator)+1);

                 String extName=filePath.substring(filePath.lastIndexOf(".")+1);
         
                 if(allowExtNames.indexOf(extName)!=-1){
                     try {
                         fileItem.write(new File(basePath+File.separator+fileName));
                         
                         ro.ToJsp(response);
                     } catch (Exception e) {
                         e.printStackTrace();
                     }
                 }
                 else{
                     throw new FileUploadException("file type is not allowed");
                 }
             }
             //读取本地文件并解析
             String excelPath  = "D:\\repository\\"+fileName;
             File excel = new File(excelPath);
             SAXReader reader = new SAXReader(); 
             reader.setEncoding("utf-8");
             if(excel.isFile() && excel.exists()){//判断文件是否存在
            	 String[] split = excel.getName().split("\\.");  //.是特殊字符，需要转义
            	 Workbook wb=null;
            	 if ( "xlsx".equals(split[1]) || "csv".equals(split[1]) ||"xlsm".equals(split[1])
            		 ||"xml".equals(split[1]) || "xlt".equals(split[1]) ||"ods".equals(split[1]) ||"xls".equals(split[1])){
            		FileInputStream fis = new FileInputStream(excel);   //文件流对象
                    try {
						wb = WorkbookFactory.create(fis);
					} catch (InvalidFormatException e) {
						e.printStackTrace();
					}
                 }else {
                     System.out.println("文件类型错误!");
                     return;
                 }
            	 //开始解析
            	 Sheet sheet = wb.getSheetAt(0); //读取sheet 0
            	 int firstRowIndex = sheet.getFirstRowNum()+1;   //第一行是列名，所以不读
            	 int lastRowIndex = sheet.getLastRowNum();
            	 //System.out.println("firstRowIndex: "+firstRowIndex);
                 //System.out.println("lastRowIndex: "+lastRowIndex);
            	 
            	 BrgSpanInfoVO bsinfoVo=new BrgSpanInfoVO();
            	 BrgMbrInfo bminfo=new BrgMbrInfo();
            	 for(int rIndex=firstRowIndex;rIndex<lastRowIndex;rIndex++){  //遍历行
            		 Row row = sheet.getRow(rIndex);
            		 if(row!=null){
            			 int firstCellIndex = row.getFirstCellNum();
                         int lastCellIndex = row.getLastCellNum();
                         //System.out.println(firstCellIndex);
                         //System.out.println(lastCellIndex);
                         for(int cIndex=firstCellIndex;cIndex < lastCellIndex; cIndex++){//遍历列
                        	 Cell cell = row.getCell(cIndex);
                        	 if (cell != null&&!"".equals(cell.toString().trim())) {
                        		 switch(cIndex)
                                 {
                                     case 0://方向
                                    	 String direction=cell.toString();
                                    	 bsinfoVo.setDirection(direction);
                                         //System.out.println("1:"+direction);
                                         break;
                                     case 1://跨号
                                         String span_no=cell.toString().split("\\.")[0];
                                         bsinfoVo.setSpan_no(span_no);
                                         //System.out.println("2:"+span_no);
                                         break;
                                     case 2://桥型
                                         String brg_type_name=cell.toString();
                                         bsinfoVo.setBrg_type_name(brg_type_name);
                                         //System.out.println("3:"+brg_type_name);
                                         break;
                                     case 3://联号
                                    	 String span_line_no=cell.toString().split("\\.")[0];
                                    	 bsinfoVo.setSpan_line_no(span_line_no);
                                         //System.out.println("4:"+span_line_no);
                                         break;
                                     case 4://跨径
                                    	 String span_length=cell.toString().split("\\.")[0];
                                    	 bsinfoVo.setSpan_length(span_length);
                                         //System.out.println("5:"+span_length);
                                         break;
                                     case 5://材料
                                    	 String span_material=cell.toString();
                                    	 bsinfoVo.setSpan_material(span_material);
                                         //System.out.println("6:"+span_material);
                                         break;
                                     case 6://跨越情况
                                    	 String spanning_case=cell.toString();
                                    	 bsinfoVo.setSpanning_case(spanning_case);
                                         //System.out.println("7:"+spanning_case);
                                         break;
                                     case 7://净空
                                         String clearance=cell.toString().split("\\.")[0];
                                         bsinfoVo.setClearance(clearance);
                                         //System.out.println("8:"+clearance);
                                         break;
                                     case 8://构件类型
                                    	 String member_type=cell.toString();
                                    	 bminfo.setMember_type(member_type);
                                         //System.out.println("9:"+member_type);
                                         break;
                                     case 9://构件名称
                                    	 String member_no=cell.toString();
                                    	 bminfo.setMember_no(member_no);
                                         //System.out.println("10:"+member_no);
                                         break;
                                     case 10://构件型号
                                    	 String member_model=cell.toString();
                                    	 bminfo.setMember_model(member_model);
                                         //System.out.println("11:"+member_model);
                                         break;
                                     default:
                                         break;
                                 }
                        	 }
                        	 
                         }
                         //得到所有数据
                         //System.out.println(bsinfoVo);
                         //System.out.println(bminfo);
             			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");  
             			String id = UUID.randomUUID().toString().replaceAll("-", "");
             			bsinfoVo.setS_id(id);
             			String btId=BrgUploadDao.getIntance().selectbrgTypeId(bsinfoVo);
             			//System.out.println(btId);
             			bsinfoVo.setBrg_type_id(btId);
             			int i=BrgUploadDao.getIntance().countOf(oc,bsinfoVo);
             			//System.out.println(i);
             			if(i==0){
             				i=BrgUploadDao.getIntance().addBsInfo(oc,bsinfoVo);
             				//System.out.println(i);
             					history_id=id;
             			 }else{
             				id=history_id;
             			 }
             			bminfo.setS_id(id);
             			bminfo.setR_id(UUID.randomUUID().toString().replaceAll("-", ""));
             			i=BrgUploadDao.getIntance().addBmInfo(bminfo);
             			switch (i) {
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
        					LogDao.getInstance().addLogInfo(log_user,"新增","上传成功", "FileUploadServlet");
        					break;
        				}
            		 }
            	 }
            	 
            	 
             }
             
             
             
             
         }catch(FileSizeLimitExceededException e){
             System.out.println("file size is not allowed");
             LogDao.getInstance().addLogInfo(log_user,"上传失败", "FileUploadServlet",e.getMessage());
         }catch(FileUploadException e1){
             e1.printStackTrace();
             LogDao.getInstance().addLogInfo(log_user,"上传失败", "FileUploadServlet",e1.getMessage());
        } 
	       //ro.setObj("eee");
			ro.ToJsp(response);
			return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
