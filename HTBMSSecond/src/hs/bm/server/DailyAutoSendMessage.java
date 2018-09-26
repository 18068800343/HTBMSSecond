package hs.bm.server;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.aliyuncs.exceptions.ClientException;

import hs.bm.bean.BackUpDataBase;
import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgSystem;
import hs.bm.bean.BrgWeightStatistic;
import hs.bm.bean.WaitSendMessage;
import hs.bm.dao.BackUpDao;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.GetFileSizeDao;
import hs.bm.dao.SendMessageDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.ReadFileUtil;

public class DailyAutoSendMessage implements Runnable{
	
	
	public DailyAutoSendMessage() {
		super();
	}


	@Override
	public void run() {
		List<WaitSendMessage> list = SendMessageDao.getInstance().getWaitSendMessage(new Date());
		for(WaitSendMessage waitSendMessage : list){
			try {
				ShortMessageServiceV2.getInstance().SendMessage(waitSendMessage.getPhone_nums(),
						waitSendMessage.getMessage_variable(),waitSendMessage.getCode());
				SendMessageDao.getInstance().updateIfSendState(waitSendMessage.getId(),"1");
			} catch (ClientException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		}
	}
	
	
	public static void main(String[] args){
		Thread thread = new Thread(new DailyAutoSendMessage());
		thread.start();
	}
}

