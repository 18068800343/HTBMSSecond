package hs.bm.bean;

public class BrgCardDocument {

	/**桥梁编号*/
	private String bridge_id;
	/**设计图纸*/
	private String blueprint_state;
	/**设计文件*/
	private String design_file_state;
	/**施工文件*/
	private String construct_file_state;
	/**竣工图纸*/
	private String complete_file_state;
	/**验收文件*/
	private String acceptance_file_state;
	/**行政文件*/
	private String administrate_file_state;
	/**定期检查报告*/
	private String regular_report_state;
	/**特殊检查报告*/
	private String special_report_state;
	/**历次维修资料*/
	private String history_maintain_state;
	/**档案号*/
	private String document_no;
	/**存档案*/
	private String document;
	/**建档年/月*/
	private String document_time;

	public void setBridge_id(String bridge_id){
		this.bridge_id=bridge_id;
	}

	public String getBridge_id(){
		return bridge_id;
	}

	public void setBlueprint_state(String blueprint_state){
		this.blueprint_state=blueprint_state;
	}

	public String getBlueprint_state(){
		return blueprint_state;
	}

	public void setDesign_file_state(String design_file_state){
		this.design_file_state=design_file_state;
	}

	public String getDesign_file_state(){
		return design_file_state;
	}

	public void setConstruct_file_state(String construct_file_state){
		this.construct_file_state=construct_file_state;
	}

	public String getConstruct_file_state(){
		return construct_file_state;
	}

	public void setComplete_file_state(String complete_file_state){
		this.complete_file_state=complete_file_state;
	}

	public String getComplete_file_state(){
		return complete_file_state;
	}

	public void setAcceptance_file_state(String acceptance_file_state){
		this.acceptance_file_state=acceptance_file_state;
	}

	public String getAcceptance_file_state(){
		return acceptance_file_state;
	}

	public void setAdministrate_file_state(String administrate_file_state){
		this.administrate_file_state=administrate_file_state;
	}

	public String getAdministrate_file_state(){
		return administrate_file_state;
	}

	public void setRegular_report_state(String regular_report_state){
		this.regular_report_state=regular_report_state;
	}

	public String getRegular_report_state(){
		return regular_report_state;
	}

	public void setSpecial_report_state(String special_report_state){
		this.special_report_state=special_report_state;
	}

	public String getSpecial_report_state(){
		return special_report_state;
	}

	public void setHistory_maintain_state(String history_maintain_state){
		this.history_maintain_state=history_maintain_state;
	}

	public String getHistory_maintain_state(){
		return history_maintain_state;
	}

	public void setDocument_no(String document_no){
		this.document_no=document_no;
	}

	public String getDocument_no(){
		return document_no;
	}

	public void setDocument(String document){
		this.document=document;
	}

	public String getDocument(){
		return document;
	}

	public void setDocument_time(String document_time){
		this.document_time=document_time;
	}

	public String getDocument_time(){
		return document_time;
	}

}
