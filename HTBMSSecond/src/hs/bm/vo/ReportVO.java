package hs.bm.vo;

import java.util.List;

public class ReportVO {
	/***/
	private String id;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/***/
	private String report_id;
	/***/
	private String report_type;
	/***/
	private String report_name;
	/***/
	private String mission_no;
	/***/
	private String project_name;
	/***/
	private String charge_man;
	/***/
	private String publish_date;
	/***/
	private String copies;
	/***/
	private String filing_date;
	/***/
	private String record_no;
	/***/
	private List<ReportStruct> reportstruct;
	/***/
	private String is_public;
	/***/
	private String contract_filing;
	public String getContract_filing() {
		return contract_filing;
	}

	public void setContract_filing(String contract_filing) {
		this.contract_filing = contract_filing;
	}

	/***/
	private String note;
	/***/
	private String report_dir;
	/***/
	private String report_size;
	/***/
	private String report_extension;

	public void setReport_id(String report_id){
		this.report_id=report_id;
	}

	public String getReport_id(){
		return report_id;
	}

	public void setReport_type(String report_type){
		this.report_type=report_type;
	}

	public String getReport_type(){
		return report_type;
	}

	public void setReport_name(String report_name){
		this.report_name=report_name;
	}

	public String getReport_name(){
		return report_name;
	}

	public void setMission_no(String mission_no){
		this.mission_no=mission_no;
	}

	public String getMission_no(){
		return mission_no;
	}

	public void setProject_name(String project_name){
		this.project_name=project_name;
	}

	public String getProject_name(){
		return project_name;
	}

	public void setCharge_man(String charge_man){
		this.charge_man=charge_man;
	}

	public String getCharge_man(){
		return charge_man;
	}

	public void setPublish_date(String publish_date){
		this.publish_date=publish_date;
	}

	public String getPublish_date(){
		return publish_date;
	}

	public void setCopies(String copies){
		this.copies=copies;
	}

	public String getCopies(){
		return copies;
	}

	public void setFiling_date(String filing_date){
		this.filing_date=filing_date;
	}

	public String getFiling_date(){
		return filing_date;
	}

	public void setRecord_no(String record_no){
		this.record_no=record_no;
	}

	public String getRecord_no(){
		return record_no;
	}


	public List<ReportStruct> getReportstruct() {
		return reportstruct;
	}

	public void setReportstruct(List<ReportStruct> reportstruct) {
		this.reportstruct = reportstruct;
	}

	public void setIs_public(String is_public){
		this.is_public=is_public;
	}

	public String getIs_public(){
		return is_public;
	}

	public void setNote(String note){
		this.note=note;
	}

	public String getNote(){
		return note;
	}

	public void setReport_dir(String report_dir){
		this.report_dir=report_dir;
	}

	public String getReport_dir(){
		return report_dir;
	}

	public void setReport_size(String report_size){
		this.report_size=report_size;
	}

	public String getReport_size(){
		return report_size;
	}

	public void setReport_extension(String report_extension){
		this.report_extension=report_extension;
	}

	public String getReport_extension(){
		return report_extension;
	}

}
