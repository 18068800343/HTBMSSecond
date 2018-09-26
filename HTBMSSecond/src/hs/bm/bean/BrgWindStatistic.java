package hs.bm.bean;

import java.util.Date;
public class BrgWindStatistic {

	/**编号*/
	private String r_id;
	/**桥梁编号*/
	private String bridge_id;
	/**开始时间*/
	private String start_time;
	/**结束时间*/
	private String end_time;
	/**数据文件名称*/
	private String data_file;
	/**文件大小*/
	private int file_size;
	/***/
	private String file_time;
	/**备注*/
	private String memo;
    private String bridge_no;
    private int is_download;
	public int getIs_download() {
		return is_download;
	}

	public void setIs_download(int is_download) {
		this.is_download = is_download;
	}
	public String getBridge_no() {
		return bridge_no;
	}

	public void setBridge_no(String bridge_no) {
		this.bridge_no = bridge_no;
	}

	public void setR_id(String r_id){
		this.r_id=r_id;
	}

	public String getR_id(){
		return r_id;
	}


	public String getBridge_id() {
		return bridge_id;
	}

	public void setBridge_id(String bridge_id) {
		this.bridge_id = bridge_id;
	}

	public void setStart_time(String start_time){
		this.start_time=start_time;
	}

	public String getStart_time(){
		return start_time;
	}

	public void setEnd_time(String end_time){
		this.end_time=end_time;
	}

	public String getEnd_time(){
		return end_time;
	}

	public void setData_file(String data_file){
		this.data_file=data_file;
	}

	public String getData_file(){
		return data_file;
	}

	public void setFile_size(int file_size){
		this.file_size=file_size;
	}

	public int getFile_size(){
		return file_size;
	}

	public void setFile_time(String file_time){
		this.file_time=file_time;
	}

	public String getFile_time(){
		return file_time;
	}

	public void setMemo(String memo){
		this.memo=memo;
	}

	public String getMemo(){
		return memo;
	}

}
