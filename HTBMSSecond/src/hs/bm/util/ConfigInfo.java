package hs.bm.util;

public class ConfigInfo {
	
	/**评定程序路径命令*/
	public static String autoBuild = "cmd.exe /c D:\\AutoBuild\\";
	/**备份数据库名称和命令地址*/
	public static String dataBase = "D:\\mysql-5.6.28-winx64\\bin\\mysqldump htbmssecond >";
	/**登陆后跳转路径*/
	public static String indexPage = "jsp/indexV2.jsp";
//	public static String indexPage = "jsp/structMgr.jsp";
	
	/**是否运行FTP文件定时任务*/
	public static boolean ftp = true;
	
	/**是否运行数据库定时备份任务*/
	public static boolean backUp = false;
	
	/**是否运行定时生成日常检查任务*/
	public static boolean dailyPrj = false;
	/**是否运行定时检测健康及称重数据*/
	public static boolean sendMessageWeightAndHealth = false;
	/**是否运行自动恢复报告生成程序*/
	public static boolean autoRunReportQueue = true;
	/**APP文件名*/
	public static String apkName = "huatong.apk";
//	public static String apkName = "seitbridge.apk";

}
