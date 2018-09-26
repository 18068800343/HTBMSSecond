package hs.bm.bean;

public class SysLogLog {

	/**编号*/
	private String log_id;
	/**日志内容*/
	private String log_content;
	/**时间*/
	private String log_time;

	public void setLog_id(String log_id){
		this.log_id=log_id;
	}

	public String getLog_id(){
		return log_id;
	}

	public void setLog_content(String log_content){
		this.log_content=log_content;
	}

	public String getLog_content(){
		return log_content;
	}

	public void setLog_time(String log_time){
		this.log_time=log_time;
	}

	public String getLog_time(){
		return log_time;
	}

}
