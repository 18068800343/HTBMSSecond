package hs.bm.util;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileManageUtil {

	
	/**
	 * 用于服务器接收从客户机上传的文件
	 * @author 不想要晴天
	 * @param HttpServletRequest request
	 * @return 文件保存路径
	 */
	public static String fileUploadToDisk(File saveFile, HttpServletRequest request){
		String result = null;
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			for(FileItem fileItem:items){
				if(!fileItem.isFormField()){
					result = saveFile.getAbsolutePath();
					InputStream in = fileItem.getInputStream();
					OutputStream out = new FileOutputStream(saveFile);
					byte[] bs = new byte[1024];
					int i= -1;
					while((i=in.read(bs))!=-1){
						out.write(bs, 0, i);
					}
					out.flush();
					out.close();
					in.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static void getAllFile(String oldPath,String downLoadPath) throws Exception  {
		 //需要压缩的文件--包括文件地址和文件名
        String []path =oldPath.split(",");
        // 要生成的压缩文件地址和文件名称
        String desPath = downLoadPath;
        File zipFile = new File(desPath);
        if(!zipFile.getParentFile().exists()) {  
            //如果目标文件所在的目录不存在，则创建父目录  
            System.out.println("目标文件所在目录不存在，准备创建它！");  
            if(!zipFile.getParentFile().mkdirs()) {  
                System.out.println("创建目标文件所在目录失败！");  
                return;  
            }  
        }  
        ZipOutputStream zipStream = null;
        FileInputStream zipSource = null;
        BufferedInputStream bufferStream = null;
        
        try {
            //构造最终压缩包的输出流
            zipStream = new ZipOutputStream(new FileOutputStream(zipFile));
            
            for(int i =0;i<path.length;i++){
            	if(null!=path[i]&&!"".equals(path[i])){
                File file = new File(path[i].replace("[", "").replace("]", "").trim());
              //将需要压缩的文件格式化为输入流
                zipSource = new FileInputStream(file);
                //压缩条目不是具体独立的文件，而是压缩包文件列表中的列表项，称为条目，就像索引一样
                ZipEntry zipEntry = new ZipEntry(file.getName());
                //定位该压缩条目位置，开始写入文件到压缩包中
                zipStream.putNextEntry(zipEntry);
             //输入缓冲流
             bufferStream = new BufferedInputStream(zipSource, 1024 * 10);
             int read = 0;
             //创建读写缓冲区
             byte[] buf = new byte[1024 * 10];
             while((read = bufferStream.read(buf, 0, 1024 * 10)) != -1)
            {
                zipStream.write(buf, 0, read);
            }
            }
           }
        } catch (FileNotFoundException e) {
            throw new FileNotFoundException("批量下载已选文件存有未存在文件");
        } catch (Exception e) {
        	e.printStackTrace();
        	throw new Exception("批量下载失败");
		}finally {
                //关闭流
                try {
                    if(null != bufferStream) bufferStream.close();
                    if(null != zipStream) zipStream.close();
                    if(null != zipSource) zipSource.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }
    }
	/**
	 * 移动文件
	 * @author 不想要晴天
	 * @param HttpServletRequest request
	 * @return 文件保存路径
	 */
	public static String fileMove (File f1, File fileDir) throws IOException{
		if(!fileDir.exists()){
			fileDir.mkdirs();
		}
		String name = f1.getName();
		InputStream in = new FileInputStream(f1);
		File f2 = new File(fileDir, name);
		OutputStream out = new FileOutputStream(f2);
		int i=0;
		byte[] buff = new byte[1024];
		while((i=in.read(buff))!=-1){
			out.write(buff, 0, i);
		}
		in.close();
		out.close();
		f1.delete();
		return f2.getAbsolutePath();
	}
	
	/**
	 * 复制文件
	 * @author 不想要晴天
	 * @param HttpServletRequest request
	 * @return 文件保存路径
	 */
	public static String fileCopy (File f1, File fileDir){
		if(!fileDir.exists()){
			fileDir.mkdirs();
		}
		if(f1.exists()){
			String name = f1.getName();
			File f2 = new File(fileDir, name);
			try {
				InputStream in = new FileInputStream(f1);
				OutputStream out = new FileOutputStream(f2);
				int i=0;
				byte[] buff = new byte[1024];
				while((i=in.read(buff))!=-1){
					out.write(buff, 0, i);
				}
				in.close();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return f2.getAbsolutePath();
		}else{
			return "";
		}
		
	}
	
	public static String fileCopyName (File f1, File fileDir, String name){
		if(!fileDir.exists()){
			fileDir.mkdirs();
		}
		if(f1.exists()){
			String fileName = f1.getName();
			String suff = fileName.substring(fileName.lastIndexOf("."));
			File f2 = new File(fileDir, name+suff);
			try {
				InputStream in = new FileInputStream(f1);
				OutputStream out = new FileOutputStream(f2);
				int i=0;
				byte[] buff = new byte[1024];
				while((i=in.read(buff))!=-1){
					out.write(buff, 0, i);
				}
				in.close();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return f2.getAbsolutePath();
		}else{
			return "";
		}
		
	}
	
	/**
	 * 从服务器返回客户机请求的文件
	 * @author 不想要晴天
	 * @param 下载文件file
	 * @param HttpServletResponse response
	 * @throws IOException 
	 */
	public static void fileDownload(File file,HttpServletResponse response) throws IOException{
		if(file.exists()){
			response.setHeader("Content-Disposition","attachment; filename="+file.getName());
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
			writer.write("请求的文件不存在，请重新生成＿".toCharArray());
			writer.flush();
			writer.close();
		}
	}
	
	public static void fileDownloadName(File file,HttpServletResponse response, String name) throws IOException{
		String name2=name.replace(",", "#");
		name = name.replace(",", "#");
		System.out.println(file.exists());
		if(file.exists()){
			response.setHeader("Content-Disposition","attachment; filename="+name2);
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
			writer.write("请求的文件不存在，请重新生成＿".toCharArray());
			writer.flush();
			writer.close();
		}
	}
	
	
	public static Boolean fileDownloadNameAll(File file,HttpServletResponse response, String name) throws IOException{
		Boolean flag=false;
		String name2=name.replace(",", "#");
		name = name.replace(",", "#");
		System.out.println(file.exists());
		if(file.exists()){
			response.setHeader("Content-Disposition","attachment; filename="+name2);
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
				flag=true;
				return flag;
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				out.close();
				in.close();
			}
		}
		return flag;
	}
	
	
	//把一個InputStream轉換成String
    public static String readStream(InputStream in) throws Exception {
        //定义丿个内存输出流
        ByteArrayOutputStream baos=new ByteArrayOutputStream();
        int len=-1;
        byte[] buffer=new byte[1024];
        while ((len=in.read(buffer))!=-1){
            baos.write(buffer,0,len);
        }
        in.close();
        String content=new String(baos.toByteArray());
        return content;
    }
	
	public static void deleteAll(List<String> ll){
		try {
			for(String s:ll){
				File file = new File(s);
				if(file.exists()){
					file.delete();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
