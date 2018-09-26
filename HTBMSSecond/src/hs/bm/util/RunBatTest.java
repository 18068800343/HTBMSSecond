
package hs.bm.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class RunBatTest {
	public void runBat(String batName){
		System.out.println("开始了。。。");
		 String cmd = "cmd.exe /c "+ batName;// pass
	        try {
	            Process ps = Runtime.getRuntime().exec(cmd);
	            ps.waitFor();
	        } catch (IOException ioe) {
	            ioe.printStackTrace();
	        }
	        catch (InterruptedException e) {
	            e.printStackTrace();
	        }
	        System.out.println("生成结束了。。。");
	        UploadFTP ftp=new UploadFTP();
			ftp.upLoadFromProduction("115.159.109.101", "htbms", "htbms123","D:\\htbms","WIM_Mainfunc.exe","C:\\Users\\hp\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\HTBMSSecond\\upload\\WIM_Mainfunc.exe");
	}
	
}
