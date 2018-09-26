package hs.bm.bean;

public class EvaMbrCalcu {

	/***/
	private int eva_mbr_calcu_id;
	/***/
	private String member_id;
	/***/
	private String component_id;
	/***/
	private String prj_id;
	/***/
	private String bridge_id;
	/***/
	private String bridge_direction;
	/***/
	private String bridge_part;
	/***/
	private String member_no;
	/***/
	private float eva_mbr_calcu_value;
	/***/
	private String span_id;
	/***/
	private String bridge_type;

	public void setEva_mbr_calcu_id(int eva_mbr_calcu_id){
		this.eva_mbr_calcu_id=eva_mbr_calcu_id;
	}

	public int getEva_mbr_calcu_id(){
		return eva_mbr_calcu_id;
	}

	public void setMember_id(String member_id){
		this.member_id=member_id;
	}

	public String getMember_id(){
		return member_id;
	}

	public void setComponent_id(String component_id){
		this.component_id=component_id;
	}

	public String getComponent_id(){
		return component_id;
	}

	public void setPrj_no(String prj_id){
		this.prj_id=prj_id;
	}

	public String getPrj_no(){
		return prj_id;
	}

	public void setBridge_id(String bridge_id){
		this.bridge_id=bridge_id;
	}

	public String getBridge_id(){
		return bridge_id;
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

	public void setMember_no(String member_no){
		this.member_no=member_no;
	}

	public String getMember_no(){
		return member_no;
	}

	public void setEva_mbr_calcu_value(float eva_mbr_calcu_value){
		this.eva_mbr_calcu_value=eva_mbr_calcu_value;
	}

	public float getEva_mbr_calcu_value(){
		return eva_mbr_calcu_value;
	}

	public void setSpan_id(String span_id){
		this.span_id=span_id;
	}

	public String getSpan_id(){
		return span_id;
	}

	public void setBridge_type(String bridge_type){
		this.bridge_type=bridge_type;
	}

	public String getBridge_type(){
		return bridge_type;
	}

}
