package hs.bm.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.text.Format;  
import java.text.SimpleDateFormat;  
import java.util.Calendar;  
import java.util.Date;  

public class ReadFileUtil {
	/** 
	* 判断时间是否在时间段内 
	* @param date 
	*            当前时间 yyyy-MM-dd HH:mm:ss 
	* @param strDateBegin 
	*            开始时间 09:00:00 
	* @param strDateEnd 
	*            结束时间 18:00:00 
	*/  
	public static boolean isInDate(Date date) {
		String strDateBegin = ReadFileUtil.getTxtValue("/messagePhoneConfig.txt", "开始时间");
		String strDateEnd = ReadFileUtil.getTxtValue("/messagePhoneConfig.txt", "结束时间");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
		String strDate = sdf.format(date); // 2016-12-16 11:53:54
		// 截取当前时间时分秒 转成整型
		int tempDate = Integer
				.parseInt(strDate.substring(11, 13) + strDate.substring(14, 16) + strDate.substring(17, 19));
		// 截取开始时间时分秒 转成整型
		int tempDateBegin = Integer
				.parseInt(strDateBegin.substring(0, 2) + strDateBegin.substring(3, 5) + strDateBegin.substring(6, 8));
		// 截取结束时间时分秒 转成整型
		int tempDateEnd = Integer
				.parseInt(strDateEnd.substring(0, 2) + strDateEnd.substring(3, 5) + strDateEnd.substring(6, 8));

		if ((tempDate >= tempDateBegin && tempDate <= tempDateEnd)) {
			return true;
		} else {
			return false;
		}
	}

	public static String getTxtValue(String file_path, String system_name) {
		String path = ReadFileUtil.class.getResource(file_path).getPath(); 
		StringBuilder result = new StringBuilder();
		File file = new File(path);
		String value = "";
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));// 构造一个BufferedReader类来读取文件
			String s = null;
			while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
				if (s.contains(system_name)) {
					String[] strings = s.split("=");
					if (strings.length > 1) {
						value = strings[1];
					}

				}
			}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
    public static Date getTomorrow(Date today) {  
        Format f = new SimpleDateFormat("yyyy-MM-dd");  
   
        System.out.println("今天是:" + f.format(today));  
   
        Calendar c = Calendar.getInstance();  
        c.setTime(today);  
        c.add(Calendar.DAY_OF_MONTH, 1);// 今天+1天  
   
        Date tomorrow = c.getTime();  
        
        return tomorrow;  
    }  
    public static String  getTomorrowFmt(Date today) {  
        Format f = new SimpleDateFormat("yyyy-MM-dd");  
   
        System.out.println("今天是:" + f.format(today));  
   
        Calendar c = Calendar.getInstance();  
        c.setTime(today);  
        c.add(Calendar.DAY_OF_MONTH, 1);// 今天+1天  
   
        Date tomorrow = c.getTime();  
        return  f.format(tomorrow);  
    }  
    public static String  getNextMonthFmt(Date today) {  
    	 Format f = new SimpleDateFormat("yyyy-MM-dd");  
    	 Calendar calendar = Calendar.getInstance();
         calendar.set(Calendar.DAY_OF_MONTH, 1);
         calendar.add(Calendar.MONTH, 1);
         String nextMonth = f.format(calendar.getTime());
         return nextMonth;
    }  
	public static void main(String[] args) {
		/*boolean bool = ReadFileUtil.isInDate(new Date());
	    System.out.println(bool);
	    System.out.println(ReadFileUtil.getTxtValue("/messagePhoneConfig.txt", "GPS系统")); */
		//System.out.println(ReadFileUtil.getTomorrowFmt(new Date()));
		System.out.println(24*60*60);
		Date nowDate = new Date();
		long waitTime = 21600;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String nowDateStr = simpleDateFormat.format(nowDate).substring(0, 10);
		String tommorow = ReadFileUtil.getTomorrowFmt(nowDate);
		System.out.println(nowDateStr);
			try {
				Date date = simpleDateFormat.parse(tommorow+" 17:30:00");
				waitTime = (date.getTime()-nowDate.getTime())/1000;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	//[E:, weight_data, 新沭河大桥, 2017-08-19 16-02-30, 2017-08-19 16-02-30.txt]
	//E:\weight_data\永安河大桥\2017-10-25 13-03-05\ratio_ovlo_com.txt
	public static String DateToDB(File file,String[] arr) {
		String value = "";
		try {
				BufferedReader br = new BufferedReader(new FileReader(file));// 构造一个BufferedReader类来读取文件
				String s = null;
				while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
	               value = value+s+",";
				}
				br.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
}
