package hs.bm.server;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import hs.bm.dao.BackUpDao;
import hs.bm.util.ConfigInfo;

public class LoopJobListener implements ServletContextListener {
	
	public static ScheduledThreadPoolExecutor schedule;
    public LoopJobListener() {
    	 schedule = new ScheduledThreadPoolExecutor(6);
    }

    public void contextDestroyed(ServletContextEvent arg0)  { 
    	
    }

    public void contextInitialized(ServletContextEvent arg0)  {
    	
    	long waitTime = 21600;
//    	long waitTime = 60;
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
    	schedule.scheduleWithFixedDelay(new AutoProgress(), 5, 3600, TimeUnit.SECONDS);
    	if(ConfigInfo.ftp){
    		schedule.scheduleWithFixedDelay(new GetFTPFile(), 60, 1860, TimeUnit.SECONDS);
    		//schedule.scheduleWithFixedDelay(new DownloadFromFTP(), waitTime+7200, 259200,  TimeUnit.SECONDS);
    	}
    	schedule.scheduleWithFixedDelay(new AutoSetDefectRatio(), waitTime, 86400, TimeUnit.SECONDS);
    	if(ConfigInfo.dailyPrj){
    		schedule.scheduleWithFixedDelay(new AutoBuildDailyProject(), waitTime+3600, 86400, TimeUnit.SECONDS);
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
    	if(ConfigInfo.backUp){
    		schedule.scheduleWithFixedDelay(new AutoBackUpDataBase("系统"), waitTime, 172800, TimeUnit.SECONDS);
    	}
    	
    	if(ConfigInfo.autoRunReportQueue){
    		schedule.scheduleWithFixedDelay(new AutoReRunReportQueue(), 60, 1200, TimeUnit.SECONDS);
    	}
    	/*if(ConfigInfo.sendMessageWeightAndHealth){
	    	schedule.scheduleWithFixedDelay(new AutoSendMessage(), 5, 3600, TimeUnit.SECONDS);
	    }*/
//    	schedule.scheduleWithFixedDelay(new AutoBackUpDataBase("系统"), waitTime, 172800, TimeUnit.SECONDS);
//    	schedule.scheduleWithFixedDelay(new AutoBackUpDataBase("系统"), waitTime, 120, TimeUnit.SECONDS);
    }
	
}
