package hs.bm.bean;

public class DicManageZone {

	/***/
	private String zone_id;
	/***/
	private String zone_no;
	/***/
	private String zone_name;
	/***/
	private String manage_id;
	
	private String manage_name;
	
	private String manage_no;

	public String getManage_name() {
		return manage_name;
	}

	public void setManage_name(String manage_name) {
		this.manage_name = manage_name;
	}

	public String getManage_no() {
		return manage_no;
	}

	public void setManage_no(String manage_no) {
		this.manage_no = manage_no;
	}

	public void setZone_id(String zone_id){
		this.zone_id=zone_id;
	}

	public String getZone_id(){
		return zone_id;
	}

	public void setZone_no(String zone_no){
		this.zone_no=zone_no;
	}

	public String getZone_no(){
		return zone_no;
	}

	public void setZone_name(String zone_name){
		this.zone_name=zone_name;
	}

	public String getZone_name(){
		return zone_name;
	}

	public void setManage_id(String manage_id){
		this.manage_id=manage_id;
	}

	public String getManage_id(){
		return manage_id;
	}

}
