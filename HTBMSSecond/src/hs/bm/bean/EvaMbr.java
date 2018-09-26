package hs.bm.bean;

public class EvaMbr {

	/***/
	private String mbr_no_code;
	/***/
	private String prj_id;
	/***/
	private String bridge_id;
	/**构件检查记录编号*/
	private String mbr_chk_id;
	/**跨号*/
	private String span_no;
	/**部件类型名称*/
	private String component_name;
	/**构建类型名称*/
	private String member_name;
	/***/
	private String index_id;
	/***/
	private String bridge_direction;
	/***/
	private String bridge_part;
	/**分值*/
	private int value;
	/***/
	private String member_no;

	public void setMbr_no_code(String mbr_no_code){
		this.mbr_no_code=mbr_no_code;
	}

	public String getMbr_no_code(){
		return mbr_no_code;
	}

	public void setPrj_id(String prj_id){
		this.prj_id=prj_id;
	}

	public String getPrj_id(){
		return prj_id;
	}

	public void setBridge_id(String bridge_id){
		this.bridge_id=bridge_id;
	}

	public String getBridge_id(){
		return bridge_id;
	}

	public void setMbr_chk_id(String mbr_chk_id){
		this.mbr_chk_id=mbr_chk_id;
	}

	public String getMbr_chk_id(){
		return mbr_chk_id;
	}

	public void setSpan_no(String span_no){
		this.span_no=span_no;
	}

	public String getSpan_no(){
		return span_no;
	}

	public void setComponent_name(String component_name){
		this.component_name=component_name;
	}

	public String getComponent_name(){
		return component_name;
	}

	public void setMember_name(String member_name){
		this.member_name=member_name;
	}

	public String getMember_name(){
		return member_name;
	}

	public void setIndex_id(String index_id){
		this.index_id=index_id;
	}

	public String getIndex_id(){
		return index_id;
	}

	public void setBridge_direction(String bridge_direction){
		this.bridge_direction=bridge_direction;
	}

	public String getBridge_direction(){
		return bridge_direction;
	}

	public void setBridge_part(String bridge_part){
		this.bridge_part=bridge_part;
	}

	public String getBridge_part(){
		return bridge_part;
	}


	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public void setMember_no(String member_no){
		this.member_no=member_no;
	}

	public String getMember_no(){
		return member_no;
	}

}
