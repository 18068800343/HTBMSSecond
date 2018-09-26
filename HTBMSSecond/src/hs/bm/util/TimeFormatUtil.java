package hs.bm.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author xianing
 */
public class TimeFormatUtil {

	//获取规定格式时间
	public static String getYMDtime(String format,Date date){
		SimpleDateFormat dateFormater = new SimpleDateFormat(format);
		return dateFormater.format(date);
	}
	
	
}
