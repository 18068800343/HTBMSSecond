package hs.bm.bean;

public class ReportQueue {

	private Integer id;
	private String report_id;
	private String report_op;
	private String prj_id;
	private String struct_id;
	private String struct_mode;
	private String chk_type;
	private String report_build;
	private String insert_time;
	private String taskName;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	public String getReport_op() {
		return report_op;
	}
	public void setReport_op(String report_op) {
		this.report_op = report_op;
	}
	public String getInsert_time() {
		return insert_time;
	}
	public void setInsert_time(String insert_time) {
		this.insert_time = insert_time;
	}
	public String getPrj_id() {
		return prj_id;
	}
	public void setPrj_id(String prj_id) {
		this.prj_id = prj_id;
	}
	public String getStruct_id() {
		return struct_id;
	}
	public void setStruct_id(String struct_id) {
		this.struct_id = struct_id;
	}
	public String getStruct_mode() {
		return struct_mode;
	}
	public void setStruct_mode(String struct_mode) {
		this.struct_mode = struct_mode;
	}
	public String getChk_type() {
		return chk_type;
	}
	public void setChk_type(String chk_type) {
		this.chk_type = chk_type;
	}
	public String getReport_build() {
		return report_build;
	}
	public void setReport_build(String report_build) {
		this.report_build = report_build;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	
}
