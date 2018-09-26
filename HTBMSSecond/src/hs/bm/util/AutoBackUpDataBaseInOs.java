package hs.bm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import hs.bm.dao.BackUpDao;
import hs.bm.server.AutoBackUpDataBase;
import hs.bm.server.AutoProgress;
import hs.bm.server.AutoSetDefectRatio;
import hs.bm.server.GetFTPFile;

public class AutoBackUpDataBaseInOs {
	public static ScheduledThreadPoolExecutor schedule;
	
	
	public static void main(String[] args){
		schedule = new ScheduledThreadPoolExecutor(5);
		long waitTime = 21600;
//    	long waitTime = 0;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Date nowDate = new Date();
		String nowDateStr = simpleDateFormat.format(nowDate).substring(0, 10);
		System.out.println(nowDateStr);
	      try {
			Date date = simpleDateFormat.parse(nowDateStr+" 24:00:00");
			waitTime = (date.getTime()-nowDate.getTime())/1000;
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	long stmp = BackUpDao.getInstance().getLastBackStmp();
    	if(stmp!=0){
    		long waitTime2 = (stmp+172800000-nowDate.getTime())/1000;
//    		long waitTime2 = (stmp+120000-nowDate.getTime())/1000;
    		if(waitTime2>0){
    			waitTime = waitTime2;
    		}
    	}
    	System.out.println(waitTime);
    	schedule.scheduleWithFixedDelay(new AutoBackUpDataBase("系统"), waitTime, 172800, TimeUnit.SECONDS);
//    	schedule.scheduleWithFixedDelay(new AutoBackUpDataBase("系统"), waitTime, 120, TimeUnit.SECONDS);
	}

}
