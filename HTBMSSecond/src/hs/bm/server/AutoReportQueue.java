package hs.bm.server;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.sun.swing.internal.plaf.synth.resources.synth;

import hs.bm.bean.BackUpDataBase;
import hs.bm.bean.ReportQueue;
import hs.bm.bean.ReportQueueFlag;
import hs.bm.dao.BackUpDao;
import hs.bm.dao.ReportMgrDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.CopyFile;
import hs.bm.util.PackageFile;
import hs.bm.util.PropertiesUtil;

public class AutoReportQueue implements Runnable{
	
	public ThreadLocal<ReportQueueFlag> reportQueueFlag ;
	
	public ReportQueueFlag reportQueueFlagPage;
	
	public AutoReportQueue(ReportQueueFlag reportQueueFlagPage) {
		this.reportQueueFlagPage = reportQueueFlagPage;
	}

	@Override
	public void run() {
		reportQueueFlag = new ThreadLocal<ReportQueueFlag>();
		reportQueueFlag.set(reportQueueFlagPage);
		reportMethod(reportQueueFlag);
	}
	
	private void reportMethod(ThreadLocal<ReportQueueFlag> flagIn) {
		try {
			Integer count = ReportMgrDao.getInstance().getReportQueueCount();
			ReportQueueFlag flagIn1 = flagIn.get();
			if((flagIn1.isFlagIn()&&count==1)||(!flagIn1.isFlagIn()&&count>0)) {
				ReportQueue rt = ReportMgrDao.getInstance().getNearlyReportQueue();
				String taskName = rt.getTaskName();
				String report_id = rt.getReport_id();
				List ll = CMDUtil.buildReportBySpan(rt.getPrj_id(), rt.getStruct_id(), rt.getStruct_mode(), rt.getChk_type(), rt.getReport_build());	
				int i = 0;
				if (ll.size()<=0){
					i = -2;
				} else{
					String basePath = new File(PropertiesUtil.getPropertiesByName("rootDir")).getPath() + File.separator;
					String path=(String) ll.get(0);
					String newPath=path.replace(path.split("\\\\")[5], "")+UUID.randomUUID();
					String zipPath=path.replace(path.split("\\\\")[5], "")+UUID.randomUUID();
					String fileName = ReportMgrDao.getInstance().getFileName(rt.getStruct_id(),rt.getStruct_mode());
					
					String zipName=fileName+taskName;
					for (int j = 0; j < ll.size(); j++){
						File dir= new File(newPath); 
						if(dir.mkdirs()){
							System.out.println("文件创建成功");
						}
						String llpath=(String) ll.get(j);
						try{
							if(llpath.indexOf("(")>0||llpath.indexOf("（")>0){
								String lastPath=llpath.split("\\\\")[5].substring(llpath.split("\\\\")[5].indexOf("(")+1,llpath.split("\\\\")[5].indexOf(")"));
								String lastPathName=fileName+"("+lastPath+").docx";
								CopyFile copy=new CopyFile();//拷贝文件
								copy.copyFile(dir, llpath, lastPathName);
							}else{
								String lastPathName=fileName+".docx";
								CopyFile copy=new CopyFile();//拷贝文件
								copy.copyFile(dir, llpath, lastPathName);
								
							}
						}catch (Exception e) {
							
						}
					}
					File zipdir= new File(zipPath); 
					if( zipdir.mkdirs()){
						System.out.println("zip文件夹创建成功");
					}
					PackageFile p=new PackageFile();//压缩zip
					if(taskName.indexOf("*")>0){
						p.fileToZip(newPath, zipPath,fileName.replace(":", "：").replace(";", ","));
						String report_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
						i = ReportMgrDao.getInstance().updateReport(zipPath+File.separator+fileName.replace(";", ",")+".zip", report_date, "成功", report_id);
					}else{
						p.fileToZip(newPath, zipPath,zipName.replace(":", "：").replace(";", ","));
						String report_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
						i = ReportMgrDao.getInstance().updateReport(zipPath+File.separator+zipName.replace(";", ",")+".zip", report_date, "成功", report_id);
					}					
				}
			    int ii = ReportMgrDao.getInstance().deleteReportQueueById(rt.getId());
			    if(ii>0) {
			    	count = ReportMgrDao.getInstance().getReportQueueCount();
			    	if(count>0) {
			    		flagIn1.setFlagIn(false);
			    		flagIn.set(flagIn1);
			    		reportMethod(flagIn);
			    	}else {
			    		return;
			    	}
			    }
			}else {
				return;
			}
		} catch (Exception e) {
			ReportQueueFlag flagIn1 = flagIn.get();
			flagIn1.setFlagIn(false);
    		flagIn.set(flagIn1);
			reportMethod(flagIn);
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args){
		//new Thread(new AutoBackUpDataBase("系统")).start();
		AutoReRunReportQueue.getAllThread();
	}
}

