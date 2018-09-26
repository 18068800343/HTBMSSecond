package hs.bm.bean;

public class ReportInfo {

	/**报告编码*/
	private String report_id;
	/**项目编号*/
	private String prj_id;
	/**项目名称*/
	private String prj_name;
	
	private String chk_type;
	/***/
	private String struct_id;
	/***/
	private String struct_no;
	
	private String struct_name;
	
	private String struct_mode;
	/***/
	private String report_file_name;
	/***/
	private String report_file_path;
	/***/
	private String report_date;
	
	private String report_start_time;
	/***/
	private String report_sp;
	/***/
	private String report_build;
	
	private String report_status;
	
	private String user_name;
	
	private int report_count;

	private String task_id;
	
	
	
	public String getTask_id() {
		return task_id;
	}

	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}

	public String getReport_start_time() {
		return report_start_time;
	}

	public void setReport_start_time(String report_start_time) {
		this.report_start_time = report_start_time;
	}

	public String getReport_status() {
		return report_status;
	}

	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public void setReport_id(String report_id){
		this.report_id=report_id;
	}

	public String getReport_id(){
		return report_id;
	}

	public void setPrj_id(String prj_id){
		this.prj_id=prj_id;
	}

	public String getPrj_id(){
		return prj_id;
	}

	public void setPrj_name(String prj_name){
		this.prj_name=prj_name;
	}

	public String getPrj_name(){
		return prj_name;
	}

	public void setStruct_id(String struct_id){
		this.struct_id=struct_id;
	}

	public String getStruct_id(){
		return struct_id;
	}

	public void setStruct_mode(String struct_mode){
		this.struct_mode=struct_mode;
	}

	public String getStruct_mode(){
		return struct_mode;
	}
	

	public String getStruct_no() {
		return struct_no;
	}

	public void setStruct_no(String struct_no) {
		this.struct_no = struct_no;
	}

	public String getStruct_name() {
		return struct_name;
	}

	public void setStruct_name(String struct_name) {
		this.struct_name = struct_name;
	}

	public void setReport_file_name(String report_file_name){
		this.report_file_name=report_file_name;
	}

	public String getReport_file_name(){
		return report_file_name;
	}

	public void setReport_file_path(String report_file_path){
		this.report_file_path=report_file_path;
	}

	public String getReport_file_path(){
		return report_file_path;
	}

	public void setReport_date(String report_date){
		this.report_date=report_date;
	}

	public String getReport_date(){
		return report_date;
	}

	public void setReport_sp(String report_sp){
		this.report_sp=report_sp;
	}

	public String getReport_sp(){
		return report_sp;
	}

	public void setReport_build(String report_build){
		this.report_build=report_build;
	}

	public String getReport_build(){
		return report_build;
	}

	public String getChk_type() {
		return chk_type;
	}

	public void setChk_type(String chk_type) {
		this.chk_type = chk_type;
	}
	
	

}
