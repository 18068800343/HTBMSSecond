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
import hs.bm.util.ReadFileUtil;

public class SendMessageListener implements ServletContextListener {
	
	public static ScheduledThreadPoolExecutor schedule;
    public SendMessageListener() {
    	 schedule = new ScheduledThreadPoolExecutor(5);
    }

    public void contextDestroyed(ServletContextEvent arg0)  { 
    	
    }

    public void contextInitialized(ServletContextEvent arg0)  {
    	
    	long waitTime = 21600;
    	long dailyWaitTime = 5;
    	long nextMontWaitTime = 5;
//    	long waitTime = 60;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Date nowDate = new Date();
		String nowDateStr = simpleDateFormat.format(nowDate).substring(0, 10);
	    String nextMonth = ReadFileUtil.getNextMonthFmt(nowDate);
		String tommorow = ReadFileUtil.getTomorrowFmt(nowDate);
		System.out.println(nowDateStr);
	      try {
	    	Date monthDate = simpleDateFormat.parse(nextMonth+" 17:30:00");
	    	Date dailyDate = simpleDateFormat.parse(nowDateStr+" 17:30:00");
			Date date = simpleDateFormat.parse(tommorow+" 9:00:00");
			waitTime = (date.getTime()-nowDate.getTime())/1000;
			dailyWaitTime = (dailyDate.getTime()-nowDate.getTime())/1000;
			nextMontWaitTime = (monthDate.getTime()-nowDate.getTime())/1000;
			if(ConfigInfo.sendMessageWeightAndHealth){
				schedule.scheduleWithFixedDelay(new AutoSendMessage(), 5, 3600, TimeUnit.SECONDS);
				schedule.scheduleWithFixedDelay(new AutoSendMessageHealth(), 5, 3600, TimeUnit.SECONDS);
				schedule.scheduleWithFixedDelay(new DailyAutoSendMessage(), waitTime, 86400, TimeUnit.SECONDS);
				schedule.scheduleWithFixedDelay(new DailyPrjChkAutoSendMessage(), dailyWaitTime, 86400, TimeUnit.SECONDS);
			   if(nowDateStr.endsWith("01")){
			    schedule.scheduleWithFixedDelay(new MonthPrjChkAutoSendMessage(), dailyWaitTime, 86400,TimeUnit.SECONDS);
			   }
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
//    	schedule.scheduleWithFixedDelay(new AutoBackUpDataBase("系统"), waitTime, 172800, TimeUnit.SECONDS);
//    	schedule.scheduleWithFixedDelay(new AutoBackUpDataBase("系统"), waitTime, 120, TimeUnit.SECONDS);
    }
    public static void main(String[] args) {
    	
	}
	
}
