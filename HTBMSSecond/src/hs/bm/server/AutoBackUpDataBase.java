package hs.bm.server;


import java.text.SimpleDateFormat;
import java.util.Date;

import hs.bm.bean.BackUpDataBase;
import hs.bm.dao.BackUpDao;
import hs.bm.util.CMDUtil;

public class AutoBackUpDataBase implements Runnable{
	
	private String user;
	
	public AutoBackUpDataBase(String user) {
		this.user = user;
	}

	@Override
	public void run() {
		System.out.println("准备运行备份命令");
		String path = CMDUtil.buildSqlBack();
		if(path==null){
			System.out.println("备份文件创建失败！");
		}else{
			BackUpDataBase bd = new BackUpDataBase();
			bd.setCreatetime( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			bd.setCreateuser(user);
			bd.setMemo("系统自动备份");
			bd.setPath(path);
			BackUpDao.getInstance().insertDataBaseBack(bd);
			System.out.println(path);
		}
	}
	
	
	public static void main(String[] args){
		//new Thread(new AutoBackUpDataBase("系统")).start();
	}
}

