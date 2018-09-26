package hs.bm.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

public class CopyFile {
	public void copyFile(File dir,String llpath,String lastPathName){
		try { 
			@SuppressWarnings("unused")
			int bytesum = 0; 
			int byteread = 0; 
			File oldfile = new File(llpath); 
			if (oldfile.exists()) { //文件存在时 
			InputStream inStream = new FileInputStream(llpath); //读入原文件 
			FileOutputStream fs = new FileOutputStream(dir+ File.separator+lastPathName); 
			byte[] buffer = new byte[1444]; 
			int length; 
			while ( (byteread = inStream.read(buffer)) != -1) { 
			bytesum += byteread; //字节数 文件大小 
			fs.write(buffer, 0, byteread); 
			} 
			fs.close();
			inStream.close(); 
			} 
			} 
			catch (Exception e) { 
			e.printStackTrace(); 
			} 
	}

}
