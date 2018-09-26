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
import hs.bm.dao.BrgMonitorDao;
import hs.bm.dao.GetFileSizeDao;
import hs.bm.dao.SendMessageDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.ReadFileUtil;

public class AutoSendMessage implements Runnable{
	
	
	private String message = "";
	
	public AutoSendMessage() {
		super();
	}


	@Override
	public void run() {
		SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//List<BrgSystem> brgSystems_s = new ArrayList<BrgSystem>();
		List<BrgSystem> brgSystems_w = new ArrayList<BrgSystem>();
		//brgSystems_s=GetFileSizeDao.getInstance().getBrgSystems("s");
		brgSystems_w=GetFileSizeDao.getInstance().getBrgSystems("w");//动态称重
		for(BrgSystem brgSystem_w:brgSystems_w){
			String out_time = brgSystem_w.getOut_time();
			String brg_name="";
			String zone_id="";
		    String brg_no="";
			String phone_no="";
			ArrayList<BrgCardAdminId> brgCardAdminIds = BrgCardDao.getInstance().getBrgCardAdminIdData(brgSystem_w.getBridge_id());
			if(brgCardAdminIds.size()>0){
				brg_name = brgCardAdminIds.get(0).getBridge_name();
				zone_id = brgCardAdminIds.get(0).getZone_id();
				brg_no = brgCardAdminIds.get(0).getBridge_no();
				try {
					phone_no=BrgMonitorDao.getIntance().selectPhoneNoData(brg_no, "无数据").getPhone();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			List<BrgWeightStatistic> brgWeightStatistics = GetFileSizeDao.getInstance().GetWeightData(brgSystem_w.getBridge_id());
			String end_time="";
			if(brgWeightStatistics.size()>0){
			    end_time = brgWeightStatistics.get(0).getStart_time();
			}
			if(!"".equals(brg_name)&&!"".equals(end_time)){
				try {
					Date date = new Date();
					boolean isInDate =ReadFileUtil.isInDate(date);
					Date end_date = dfs.parse(end_time);
					long between=(date.getTime()-end_date.getTime())/1000;//除以1000是为了转换成秒
					long day=between/(24*3600);
					long hour=between%(24*3600)/3600;
					long minute=between%3600/60;
					if(day>=7&&("3day".equals(out_time)||"0hour".equals(out_time))){
						try {
							if(isInDate){
							String code = ShortMessageServiceV2.getInstance().SendMessage(phone_no,"{system:'"+brg_name+"动态称重系统',time:'"+day+"天'}","SMS_105180086");
							}else{
						     WaitSendMessage waitSendMessage = new WaitSendMessage();
						     waitSendMessage.setBridge_id(brgSystem_w.getBridge_id());
						     waitSendMessage.setCode("SMS_105180086");
						     waitSendMessage.setIf_send("0");
						     waitSendMessage.setMessage_variable("{system:'"+brg_name+"动态称重系统',time:'"+day+"天'}");
						     waitSendMessage.setPhone_nums(phone_no);
						     waitSendMessage.setWait_send_time(ReadFileUtil.getTomorrow(date));
						     SendMessageDao.getInstance().insertWaitSendMessage(waitSendMessage);
							}
							GetFileSizeDao.getInstance().updateBrgSystemOutTime(brgSystem_w.getBridge_id(), "7day","w");
						} catch (ClientException e) {
							e.printStackTrace();
						}
					}else if(day>=3&&day<7&&("1hour".equals(out_time)||"0hour".equals(out_time))){
						try {
							if(isInDate){
								String code = ShortMessageServiceV2.getInstance().SendMessage(phone_no,"{system:'"+brg_name+"动态称重系统',time:'"+day+"天'}","SMS_105180086");
								}else{
							     WaitSendMessage waitSendMessage = new WaitSendMessage();
							     waitSendMessage.setBridge_id(brgSystem_w.getBridge_id());
							     waitSendMessage.setCode("SMS_105180086");
							     waitSendMessage.setIf_send("0");
							     waitSendMessage.setMessage_variable("{system:'"+brg_name+"动态称重系统',time:'"+day+"天'}");
							     waitSendMessage.setPhone_nums(phone_no);
							     waitSendMessage.setWait_send_time(ReadFileUtil.getTomorrow(date));
							     SendMessageDao.getInstance().insertWaitSendMessage(waitSendMessage);
								}
								GetFileSizeDao.getInstance().updateBrgSystemOutTime(brgSystem_w.getBridge_id(), "3day","w");
						} catch (ClientException e) {
							e.printStackTrace();
						}
					}else if(hour>=2&&day<3&&"0hour".equals(out_time)){
						try {
							if(isInDate){
								String code = ShortMessageServiceV2.getInstance().SendMessage(phone_no,"{system:'"+brg_name+"动态称重系统',time:'"+hour+"小时'}","SMS_105180086");
								}else{
							     WaitSendMessage waitSendMessage = new WaitSendMessage();
							     waitSendMessage.setBridge_id(brgSystem_w.getBridge_id());
							     waitSendMessage.setCode("SMS_105180086");
							     waitSendMessage.setIf_send("0");
							     waitSendMessage.setMessage_variable("{system:'"+brg_name+"动态称重系统',time:'"+hour+"小时'}");
							     waitSendMessage.setPhone_nums(phone_no);
							     waitSendMessage.setWait_send_time(ReadFileUtil.getTomorrow(date));
							     SendMessageDao.getInstance().insertWaitSendMessage(waitSendMessage);
								}
								GetFileSizeDao.getInstance().updateBrgSystemOutTime(brgSystem_w.getBridge_id(), "1hour","w");
						} catch (ClientException e) {
							e.printStackTrace();
						}
					}else{
						if(day==0&&hour==0&&minute<=60){
							GetFileSizeDao.getInstance().updateBrgSystemOutTime(brgSystem_w.getBridge_id(), "0hour","w");	
						}
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}
	
	
	public static void main(String[] args){
		Thread thread = new Thread(new AutoSendMessage());
		thread.start();
	}
}

