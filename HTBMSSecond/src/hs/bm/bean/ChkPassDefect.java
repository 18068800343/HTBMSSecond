package hs.bm.bean;

public class ChkPassDefect {

	/**病害流水号*/
	private String defect_serial;
	/**病害记录编号*/
	private String defect_id;
	/**通道构件检查记录编号*/
	private String mbr_chk_id;
	/**构件编号*/
	private String mbr_no;
	/***/
	private String defect_name_f;
	/**病害名称*/
	private String defect_name;
	/**病害位置描述（基于模板）*/
	private String defect_location_desc;
	/**病害数量描述（基于模板）裂缝病害的描述是多个参数项，其他则用是一句话描述*/
	private String defect_count;
	/**病害位置描述存值*/
	private String defect_location_desc_val;
	/**备注*/
	private String chk_defect_memo;
	/**病害数量描述存值*/
	private String defect_count_val;
	/**修补状态（默认未修补）*/
	private String repair_state;
	/**发展状态*/
	private String develop_state;
//	/**病害照片*/
//	private String defect_photo;
//	/**病害照片描述*/
//	private String defect_photo_memo;
	/**病害属性*/
	private String defect_attr;
	/**是否上传（y/n）*/
	private String is_uploaded;
	/**是否当前病害*/
	private String current;

	public void setDefect_serial(String defect_serial){
		this.defect_serial=defect_serial;
	}

	public String getDefect_serial(){
		return defect_serial;
	}

	public void setDefect_id(String defect_id){
		this.defect_id=defect_id;
	}

	public String getDefect_id(){
		return defect_id;
	}

	public void setMbr_chk_id(String mbr_chk_id){
		this.mbr_chk_id=mbr_chk_id;
	}

	public String getMbr_chk_id(){
		return mbr_chk_id;
	}

	public void setMbr_no(String mbr_no){
		this.mbr_no=mbr_no;
	}

	public String getMbr_no(){
		return mbr_no;
	}

	public void setDefect_name_f(String defect_name_f){
		this.defect_name_f=defect_name_f;
	}

	public String getDefect_name_f(){
		return defect_name_f;
	}

	public void setDefect_name(String defect_name){
		this.defect_name=defect_name;
	}

	public String getDefect_name(){
		return defect_name;
	}

	public void setDefect_location_desc(String defect_location_desc){
		this.defect_location_desc=defect_location_desc;
	}

	public String getDefect_location_desc(){
		return defect_location_desc;
	}

	public void setDefect_count(String defect_count){
		this.defect_count=defect_count;
	}

	public String getDefect_count(){
		return defect_count;
	}

	public void setDefect_location_desc_val(String defect_location_desc_val){
		this.defect_location_desc_val=defect_location_desc_val;
	}

	public String getDefect_location_desc_val(){
		return defect_location_desc_val;
	}

	public void setChk_defect_memo(String chk_defect_memo){
		this.chk_defect_memo=chk_defect_memo;
	}

	public String getChk_defect_memo(){
		return chk_defect_memo;
	}

	public void setDefect_count_val(String defect_count_val){
		this.defect_count_val=defect_count_val;
	}

	public String getDefect_count_val(){
		return defect_count_val;
	}

	public void setRepair_state(String repair_state){
		this.repair_state=repair_state;
	}

	public String getRepair_state(){
		return repair_state;
	}

	public void setDevelop_state(String develop_state){
		this.develop_state=develop_state;
	}

	public String getDevelop_state(){
		return develop_state;
	}

//	public void setDefect_photo(String defect_photo){
//		this.defect_photo=defect_photo;
//	}
//
//	public String getDefect_photo(){
//		return defect_photo;
//	}
//
//	public void setDefect_photo_memo(String defect_photo_memo){
//		this.defect_photo_memo=defect_photo_memo;
//	}
//
//	public String getDefect_photo_memo(){
//		return defect_photo_memo;
//	}

	public void setDefect_attr(String defect_attr){
		this.defect_attr=defect_attr;
	}

	public String getDefect_attr(){
		return defect_attr;
	}

	public void setIs_uploaded(String is_uploaded){
		this.is_uploaded=is_uploaded;
	}

	public String getIs_uploaded(){
		return is_uploaded;
	}

	public void setCurrent(String current){
		this.current=current;
	}

	public String getCurrent(){
		return current;
	}

}
