package hs.bm.bean;

public class DicManageSection {

	/***/
	private String section_id;
	/***/
	private String section_no;
	/***/
	private String section_name;
	/***/
	private String manage_id;
	
	private String manage_no;
	
	private String manage_name;
	

	public String getManage_no() {
		return manage_no;
	}

	public void setManage_no(String manage_no) {
		this.manage_no = manage_no;
	}

	public String getManage_name() {
		return manage_name;
	}

	public void setManage_name(String manage_name) {
		this.manage_name = manage_name;
	}

	public void setSection_id(String section_id){
		this.section_id=section_id;
	}

	public String getSection_id(){
		return section_id;
	}

	public void setSection_no(String section_no){
		this.section_no=section_no;
	}

	public String getSection_no(){
		return section_no;
	}

	public void setSection_name(String section_name){
		this.section_name=section_name;
	}

	public String getSection_name(){
		return section_name;
	}

	public void setManage_id(String manage_id){
		this.manage_id=manage_id;
	}

	public String getManage_id(){
		return manage_id;
	}

}
