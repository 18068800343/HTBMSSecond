package hs.bm.bean;

public class ChkBrgRecord {

	/**编号*/
	private String mbr_chk_id;
	/**跨检查记录编号*/
	private String span_chk_id;
	/**桥梁编号*/
	private String bridge_id;
	/**方向*/
	private String direction;
	/**跨号*/
	private String span_no;
	/**构件类型*/
	private String mbr_type;
	/**构件编号*/
	private String mbr_no;
	/**构件位置*/
	private String mbr_location;
	/**构件描述*/
	private String mbr_desc;
	/**构件型号*/
	private String mbr_model;
	/**病害描述编号（全局唯一？）*/
	private String defect_desc_id;
	/**构件检查时间*/
	private String mbr_chk_date;
	/**构件检查人*/
	private String mbr_chk_person;
	/**是否上传（y/n）*/
	private String is_uploaded;
	/**上传时间*/
	private String upload_time;
	/**是否评分*/
	private String Is_evaluate;
	/**评分时间*/
	private String evaluate_time;

	public void setMbr_chk_id(String mbr_chk_id){
		this.mbr_chk_id=mbr_chk_id;
	}

	public String getMbr_chk_id(){
		return mbr_chk_id;
	}

	public void setSpan_chk_id(String span_chk_id){
		this.span_chk_id=span_chk_id;
	}

	public String getSpan_chk_id(){
		return span_chk_id;
	}

	public void setBridge_id(String bridge_id){
		this.bridge_id=bridge_id;
	}

	public String getBridge_id(){
		return bridge_id;
	}

	public void setDirection(String direction){
		this.direction=direction;
	}

	public String getDirection(){
		return direction;
	}

	public void setSpan_no(String span_no){
		this.span_no=span_no;
	}

	public String getSpan_no(){
		return span_no;
	}

	public void setMbr_type(String mbr_type){
		this.mbr_type=mbr_type;
	}

	public String getMbr_type(){
		return mbr_type;
	}

	public void setMbr_no(String mbr_no){
		this.mbr_no=mbr_no;
	}

	public String getMbr_no(){
		return mbr_no;
	}

	public void setMbr_location(String mbr_location){
		this.mbr_location=mbr_location;
	}

	public String getMbr_location(){
		return mbr_location;
	}

	public void setMbr_desc(String mbr_desc){
		this.mbr_desc=mbr_desc;
	}

	public String getMbr_desc(){
		return mbr_desc;
	}

	public void setMbr_model(String mbr_model){
		this.mbr_model=mbr_model;
	}

	public String getMbr_model(){
		return mbr_model;
	}

	public void setDefect_desc_id(String defect_desc_id){
		this.defect_desc_id=defect_desc_id;
	}

	public String getDefect_desc_id(){
		return defect_desc_id;
	}

	public void setMbr_chk_date(String mbr_chk_date){
		this.mbr_chk_date=mbr_chk_date;
	}

	public String getMbr_chk_date(){
		return mbr_chk_date;
	}

	public void setMbr_chk_person(String mbr_chk_person){
		this.mbr_chk_person=mbr_chk_person;
	}

	public String getMbr_chk_person(){
		return mbr_chk_person;
	}

	public void setIs_uploaded(String is_uploaded){
		this.is_uploaded=is_uploaded;
	}

	public String getIs_uploaded(){
		return is_uploaded;
	}

	public void setUpload_time(String upload_time){
		this.upload_time=upload_time;
	}

	public String getUpload_time(){
		return upload_time;
	}

	public void setIs_evaluate(String Is_evaluate){
		this.Is_evaluate=Is_evaluate;
	}

	public String getIs_evaluate(){
		return Is_evaluate;
	}

	public void setEvaluate_time(String evaluate_time){
		this.evaluate_time=evaluate_time;
	}

	public String getEvaluate_time(){
		return evaluate_time;
	}

	@Override
	public String toString() {
		return "ChkBrgRecord [mbr_chk_id=" + mbr_chk_id + ", span_chk_id=" + span_chk_id + ", bridge_id=" + bridge_id
				+ ", direction=" + direction + ", span_no=" + span_no + ", mbr_type=" + mbr_type + ", mbr_no=" + mbr_no
				+ ", mbr_location=" + mbr_location + ", mbr_desc=" + mbr_desc + ", mbr_model=" + mbr_model
				+ ", defect_desc_id=" + defect_desc_id + ", mbr_chk_date=" + mbr_chk_date + ", mbr_chk_person="
				+ mbr_chk_person + ", is_uploaded=" + is_uploaded + ", upload_time=" + upload_time + ", Is_evaluate="
				+ Is_evaluate + ", evaluate_time=" + evaluate_time + "]";
	}

}
