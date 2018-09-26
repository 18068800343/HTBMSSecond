package hs.bm.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


public class CMDUtil {
	
	public static String buildCard(String id){
		String path = null;
		String op = "BridgeCheckAutoCalculateServer.exe 4 "+id;
		try {
			Process process = Runtime.getRuntime().exec(ConfigInfo.autoBuild+op);
			InputStream is = process.getInputStream();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			  String line;
			  while((line = reader.readLine())!= null){
			   System.out.println(line);
			   if(line.contains("success:")){
				   path = line.substring(8);
				   System.out.println(path);
			   }
			  }
			  is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(path!=null&&!path.equals("")){
			String dir = PropertiesUtil.getPropertiesByName("rootDir");
			File file = new File(dir,id);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(file,"card");
			if(!file.exists()){
				file.mkdirs();
			}
			try {
				path = FileManageUtil.fileMove(new File(path), file);
			} catch (IOException e) {
				path = null;
				e.printStackTrace();
			}
		}
		System.out.println("real:"+path);
		return path;
	}
	/**
	 * 生成评定pdf
	 * @param prj_id 项目编号
	 * @param id 桥梁编号
	 * @param mode 标准:2004/2011
	 * @param chk_type "regular"
	 * @return path
	 */
	
	public static String buildEval(String prj_id,String id,String mode,String chk_type){
		String path = null;
		String op = "BridgeCheckAutoCalculateServer.exe 1 "+prj_id+" "+id+" "+mode;
		try {
			Process process = Runtime.getRuntime().exec(ConfigInfo.autoBuild+op);
			InputStream is = process.getInputStream();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			  String line;
			  while((line = reader.readLine())!= null){
			   System.out.println(line);
				   if(line.contains("success:")){
					   path = line.substring(8);
				   System.out.println(path);
			   }
			  }
			  is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(path!=null&&!path.equals("")){
			String dir = PropertiesUtil.getPropertiesByName("rootDir");
			File file = new File(dir,id);
			file = new File(file,chk_type);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(file,prj_id);
			if(!file.exists()){
				file.mkdirs();
			}
			try {
				path = FileManageUtil.fileMove(new File(path), file);
			} catch (IOException e) {
				path = null;
				e.printStackTrace();
			}
		}
		System.out.println("real:"+path);
		return path;
	}
	/**
	 * 
	 * @param prj_id 项目编号
	 * @param id 桥梁编号
	 * @param chk_type 检查编号6
	 * @param direction 桥梁方向
	 * @param span 跨号
	 * @return path 路径
	 */
	public static String buildCheck(String prj_id,String id,String chk_type, String direction ,String span){
		String path = null;
		String op = "BridgeCheckAutoCalculateServer.exe 6 "+prj_id+" "+id+" "+direction+" "+span;
		System.out.println(op);
		try {
			Process process = Runtime.getRuntime().exec(ConfigInfo.autoBuild+op);
			InputStream is = process.getInputStream();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			  String line;
			  while((line = reader.readLine())!= null){
				  System.out.println(line);
				   if(line.contains("success:")){
					   path = line.substring(8);
			   }
			  }
			  is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(path!=null&&!path.equals("")){
			String dir = PropertiesUtil.getPropertiesByName("rootDir");
			File file = new File(dir,id);
			file = new File(file,chk_type);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(file,prj_id);
			if(!file.exists()){
				file.mkdirs();
			}
			try {
				path = FileManageUtil.fileMove(new File(path), file);
			} catch (IOException e) {
				path = null;
				e.printStackTrace();
			}
		}
		System.out.println("real:"+path);
		return path;
	}
	
	
	public static String buildDailyCheck(String prj_id,String id,String chk_type){
		String path = null;
		String op = "BridgeCheckAutoCalculateServer.exe 9 "+prj_id+" "+id;
		System.out.println(op);
		try {
			Process process = Runtime.getRuntime().exec(ConfigInfo.autoBuild+op);
			InputStream is = process.getInputStream();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			  String line;
			  while((line = reader.readLine())!= null){
				  System.out.println(line);
				   if(line.contains("success:")){
					   path = line.substring(8);
			   }
			  }
			  is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(path!=null&&!path.equals("")){
			String dir = PropertiesUtil.getPropertiesByName("rootDir");
			File file = new File(dir,id);
			file = new File(file,chk_type);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(file,prj_id);
			if(!file.exists()){
				file.mkdirs();
			}
			try {
				path = FileManageUtil.fileMove(new File(path), file);
			} catch (IOException e) {
				path = null;
				e.printStackTrace();
			}
		}
		System.out.println("real:"+path);
		return path;
	}
	
	/**
	 * 通道
	 * @param prj_id 项目编号
	 * @param id 桥梁编号
	 * @param chk_type 检查编号6
	 * @param direction 桥梁方向
	 * @param span 跨号
	 * @return path 路径
	 */
	public static String buildPassCheck(String prj_id,String id,String chk_type, String direction, String span){
		String path = null;
		String op = "BridgeCheckAutoCalculateServer.exe 8 "+prj_id+" "+id+" "+direction+" "+span;
		System.out.println(op);
		try {
			Process process = Runtime.getRuntime().exec(ConfigInfo.autoBuild+op);
			InputStream is = process.getInputStream();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			  String line;
			  while((line = reader.readLine())!= null){
				  System.out.println(line);
				   if(line.contains("success:")){
					   path = line.substring(8);
			   }
			  }
			  is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(path!=null&&!path.equals("")){
			String dir = PropertiesUtil.getPropertiesByName("rootDir");
			File file = new File(dir,id);
			file = new File(file,chk_type);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(file,prj_id);
			if(!file.exists()){
				file.mkdirs();
			}
			try {
				path = FileManageUtil.fileMove(new File(path), file);
			} catch (IOException e) {
				path = null;
				e.printStackTrace();
			}
		}
		System.out.println("real:"+path);
		return path;
	}
	
	/**
	 * 涵洞
	 * @param prj_id 项目编号
	 * @param id 桥梁编号
	 * @param chk_type 检查编号7
	 * @param direction 桥梁方向
	 * @param span 跨号
	 * @return path 路径
	 */
	public static String buildCulvertCheck(String prj_id,String id,String chk_type, String direction, String span){
		String path = null;
		String op = "BridgeCheckAutoCalculateServer.exe 7 "+prj_id+" "+id+" "+direction+" "+span;
		System.out.println(op);
		try {
			Process process = Runtime.getRuntime().exec(ConfigInfo.autoBuild+op);
			InputStream is = process.getInputStream();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			  String line;
			  while((line = reader.readLine())!= null){
				  System.out.println(line);
				   if(line.contains("success:")){
					   path = line.substring(8);
			   }
			  }
			  is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(path!=null&&!path.equals("")){
			String dir = PropertiesUtil.getPropertiesByName("rootDir");
			File file = new File(dir,id);
			file = new File(file,chk_type);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(file,prj_id);
			if(!file.exists()){
				file.mkdirs();
			}
			try {
				path = FileManageUtil.fileMove(new File(path), file);
			} catch (IOException e) {
				path = null;
				e.printStackTrace();
			}
		}
		System.out.println("real:"+path);
		return path;
	}
	
	
	public static String buildReport(String prj_id,String id,String mode,String chk_type,String build){
		String path = null;
		String op = "";
		if(mode.equals("bridge")){
			op = "BridgeCheckAutoCalculateServer.exe 2 "+prj_id+" "+id+" "+build;
	   }
		if(mode.equals("pass")){
			op = "BridgeCheckAutoCalculateServer.exe 10 "+prj_id+" "+id+" "+build;
		}
		if(mode.equals("culvert")){
			op = "BridgeCheckAutoCalculateServer.exe 11 "+prj_id+" "+id+" "+build;
		}
		System.out.println(op);
		try {
			Process process = Runtime.getRuntime().exec(ConfigInfo.autoBuild+op);
			InputStream is = process.getInputStream();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			  String line;
			  while((line = reader.readLine())!= null){
			   System.out.println(line);
			   if(line.contains("success:")){
				   path = line.substring(8);
				   System.out.println(path);
			   }
			  }
			  is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(path!=null&&!path.equals("")){
			String dir = PropertiesUtil.getPropertiesByName("rootDir");
			File file = new File(dir,id);
			file = new File(file,chk_type);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(file,prj_id);
			if(!file.exists()){
				file.mkdirs();
			}
			try {
				path = FileManageUtil.fileMove(new File(path), file);
			} catch (IOException e) {
				path = null;
				e.printStackTrace();
			}
		}
		System.out.println("real:"+path);
		GetMacAndNetCard.addReportCount();
		return path;
	}

	public static String toJsonExchange(String str){
		String result = "";
		for (int i = 0; i < str.length(); i++)
		{
			String a = str.charAt(i)+"";
			if(a.equals("\"")){
				result += "\\"+a;
			}else{
				result+=a;
			}
		}
		return result;
	}
	
	public static ArrayList buildReportBySpan(String prj_id,String id,String mode,String chk_type,String build){
		ArrayList path_list = new ArrayList();
		ArrayList result = new ArrayList();
		build = toJsonExchange(build);
		String path = null;
		System.out.println(build);
		String op = "";
		if(mode.equals("bridge")){
			if("daily".equals(chk_type)){
				op = "BridgeCheckAutoCalculateServer.exe 13 "+prj_id+" "+id+" ";
			}else{
				op = "BridgeCheckAutoCalculateServer.exe 2 "+prj_id+" "+id+" "+build;
			}
	    }
		if(mode.equals("pass")){
			op = "BridgeCheckAutoCalculateServer.exe 10 "+prj_id+" "+id+" "+build;
		}
		if(mode.equals("culvert")){
			op = "BridgeCheckAutoCalculateServer.exe 11 "+prj_id+" "+id+" "+build;
		}
		System.out.println(op);
		try {
			Process process = Runtime.getRuntime().exec(ConfigInfo.autoBuild+op);
			InputStream is = process.getInputStream();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			  String line;
			  while((line = reader.readLine())!= null){
			   System.out.println(line);
			   if(line.contains("success:")){
				   path = line.replace("success:", "");
				   if(path!=null&&!path.equals("")){
					   path_list.add(path);
				   }
				   System.out.println(path);
			   }
			  }
			  is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(path_list.size()>0){
			String dir = PropertiesUtil.getPropertiesByName("rootDir");
			File file = new File(dir,id);
			file = new File(file,chk_type);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(file,prj_id);
			if(!file.exists()){
				file.mkdirs();
			}
			for (int i = 0; i < path_list.size(); i++)
			{
				path= (String)path_list.get(i);
				try {
					path = FileManageUtil.fileMove(new File(path), file);
					result.add(path);
				} catch (IOException e) {
					path = null;
					e.printStackTrace();
				}
			}
			
		}
		System.out.println(result.size());
		GetMacAndNetCard.addReportCount();
		return result;
	}
	
	public static boolean forceEval(String prj_id,String id,String mode,String chk_type){
		String op = "BridgeCheckAutoCalculateServer.exe 3 "+prj_id+" "+id+" "+mode;
		System.out.println(op);
		boolean flag = false;
		try {
			Process process = Runtime.getRuntime().exec(ConfigInfo.autoBuild+op);
			InputStream is = process.getInputStream();
			  BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			  String line;
			  while((line = reader.readLine())!= null){
			   System.out.println(line);
			   if(line.contains("success")){
				   flag = true;
			   }
			  }
			  is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public static String buildSqlBack(){
		String path = null;
		String date = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date());
		System.out.println(date);
		String basePath = new File(PropertiesUtil.getPropertiesByName("rootDir")).getPath()+File.separator;
		File file = new File(basePath, "backup");
		if(!file.exists()){
			file.mkdirs();
		}
		File backFile = new File(file, date+".sql");
		String op = ConfigInfo.dataBase+backFile.getAbsolutePath();
//		String op = "D:\\mysql-5.6.28-winx64\\bin\\mysqldump htbmssecond >d:\\qq q.sql";
		try {
			Process process = Runtime.getRuntime().exec("cmd.exe /c "+op);
			InputStream is = process.getInputStream();
			BufferedReader reader = new BufferedReader(new InputStreamReader(is, "GBK"));
			String line;
			  while((line = reader.readLine())!= null){
	//			   System.out.println(line);
			  }
			  is.close();
			  if(process.exitValue()==0){
				  path = backFile.getAbsolutePath().replace(basePath, "");
			  }
		} catch (Exception e) {
			path = null;
			e.printStackTrace();
			
		}
		return path;
	}
	
	public static void main(String[] args){
		//buildSqlBack();
		//System.out.println(buildCard("G15320981L0080"));
		//buildCheck(prj_id, id, chk_type, direction, span)
		//CMDUtil.buildReport("5ae12893ba70494d880f13f8123d2911", "f76580f37a1c47db9443bee730be63e1", "bridge", "regular", "[{'arg':'1+5+2+3+6+4'},{'span':'1-2'}]");
		
	}}
