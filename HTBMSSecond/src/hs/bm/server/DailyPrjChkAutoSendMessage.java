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
import hs.bm.bean.ChkProjectInfo;
import hs.bm.bean.WaitSendMessage;
import hs.bm.dao.BackUpDao;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.CheckBridgeDao;
import hs.bm.dao.GetFileSizeDao;
import hs.bm.dao.SendMessageDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.ReadFileUtil;

public class DailyPrjChkAutoSendMessage implements Runnable{
	
	
	public DailyPrjChkAutoSendMessage() {
		super();
	}


	@Override
	public  void run() {
		List<ChkProjectInfo> list=CheckBridgeDao.getInstance().getPrj_desc("daily");
		for(ChkProjectInfo chkProjectInfo:list){
			String prj_desc = chkProjectInfo.getPrj_desc();
			String date = chkProjectInfo.getPrj_establish_tm();
			String charge_mans =  chkProjectInfo.getPrj_charge_man();
			String[] charge_manArr= charge_mans.split("#");
			for(String person:charge_manArr){
				String phone_no = CheckBridgeDao.getInstance().getPhone(person);
				
				try {
					ShortMessageServiceV2.getInstance().SendMessage(phone_no,"{project:'"+prj_desc+"'}","SMS_105310062");
				} catch (ClientException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}
	
	
	public static void main(String[] args){
		Thread thread = new Thread(new DailyPrjChkAutoSendMessage());
		thread.start();
	}
}

