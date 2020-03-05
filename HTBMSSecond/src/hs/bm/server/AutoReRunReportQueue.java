package hs.bm.server;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.aliyuncs.exceptions.ClientException;

import hs.bm.bean.BackUpDataBase;
import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgSystem;
import hs.bm.bean.BrgWeightStatistic;
import hs.bm.bean.ReportQueueFlag;
import hs.bm.bean.WaitSendMessage;
import hs.bm.dao.BackUpDao;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.GetFileSizeDao;
import hs.bm.dao.ReportMgrDao;
import hs.bm.dao.SendMessageDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.ReadFileUtil;

public class AutoReRunReportQueue implements Runnable{
	
	
	public AutoReRunReportQueue() {
		super();
	}


	@Override
	public void run() {
		reRunReportQueue();
	}
	
	private static void reRunReportQueue() {
		boolean flagIn = false;
		ReportQueueFlag reportQueueFlag = new ReportQueueFlag();
		reportQueueFlag.setFlagIn(flagIn);
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		Integer count = ReportMgrDao.getInstance().getReportQueueCount();
		String allThreadName = getAllThread();
		if(!allThreadName.contains("autoReportThread")&&count>0) {
			Thread autoReportThread = new Thread(new AutoReportQueue(reportQueueFlag),"autoReportThread");
			autoReportThread.start();
		}
	}
	
	public static void main(String[] args){
		getAllThread();
		Map map=Thread.getAllStackTraces(); //也可以map<Thread, StackTraceElement[]>
		System.out.println("当前线程数："+map.size());
		Iterator it=map.keySet().iterator();
		while (it.hasNext()) {
			Thread t=(Thread) it.next(); //
			System.out.println(t.getName());
		}
		
	}
	public static String getAllThread() {
		ThreadGroup group = Thread.currentThread().getThreadGroup();  
		ThreadGroup topGroup = group;  
		// 遍历线程组树，获取根线程组  
		while (group != null) {  
		    topGroup = group;  
		    group = group.getParent();  
		}  
		// 激活的线程数加倍  
		int estimatedSize = topGroup.activeCount() * 4;  
		Thread[] slackList = new Thread[estimatedSize];  
		// 获取根线程组的所有线程  
		int actualSize = topGroup.enumerate(slackList);  
		// copy into a list that is the exact size  
		Thread[] list = new Thread[actualSize];  
		System.arraycopy(slackList, 0, list, 0, actualSize);  
		System.out.println("Thread list size == " + list.length);  
		String str = "";
		for (Thread thread : list) {  
		    System.out.println(thread.getName());  
		    str+=thread.getName()+",";
		}  
		return str;
	}

}
