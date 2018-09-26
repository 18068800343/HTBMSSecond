package hs.bm.bean;

public class ImgPackage {

	/***/
	private String package_id;
	/***/
	private String package_name;
	/***/
	private String package_path;
	/***/
	private String struct_id;
	/***/
	private String struct_mode;
	/***/
	private String prj_id;
	private String prj_name;
	/***/
	private String build_date;

	
	public String getPrj_name() {
		return prj_name;
	}

	public void setPrj_name(String prj_name) {
		this.prj_name = prj_name;
	}

	public void setPackage_id(String package_id){
		this.package_id=package_id;
	}

	public String getPackage_id(){
		return package_id;
	}

	public void setPackage_name(String package_name){
		this.package_name=package_name;
	}

	public String getPackage_name(){
		return package_name;
	}

	public void setPackage_path(String package_path){
		this.package_path=package_path;
	}

	public String getPackage_path(){
		return package_path;
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

	public void setPrj_id(String prj_id){
		this.prj_id=prj_id;
	}

	public String getPrj_id(){
		return prj_id;
	}

	public void setBuild_date(String build_date){
		this.build_date=build_date;
	}

	public String getBuild_date(){
		return build_date;
	}

}
