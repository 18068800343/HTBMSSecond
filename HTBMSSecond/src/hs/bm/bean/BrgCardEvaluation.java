package hs.bm.bean;

public class BrgCardEvaluation {

	/**编号*/
	private String r_id;
	/**桥梁编号*/
	private String bridge_id;
	/**检查年月*/
	private String check_ym;
	/**定期或特殊检查*/
	private String eva_type;
	/**全桥评定等级*/
	private String eva_level;
	/**桥台与基础*/
	private String abutment;
	/**桥墩与基础*/
	private String pier;
	/**地基冲刷*/
	private String erosion;
	/**上部结构*/
	private String top_structure;
	/**支座*/
	private String support;
	/**经常保养小修*/
	private String is_often_maintain;
	/**处治对策*/
	private String treatment;
	/**下次检查年份*/
	private String next_time_year;

	public void setR_id(String r_id){
		this.r_id=r_id;
	}

	public String getR_id(){
		return r_id;
	}

	public void setBridge_id(String bridge_id){
		this.bridge_id=bridge_id;
	}

	public String getBridge_id(){
		return bridge_id;
	}

	public void setCheck_ym(String check_ym){
		this.check_ym=check_ym;
	}

	public String getCheck_ym(){
		return check_ym;
	}

	public void setEva_type(String eva_type){
		this.eva_type=eva_type;
	}

	public String getEva_type(){
		return eva_type;
	}

	public void setEva_level(String eva_level){
		this.eva_level=eva_level;
	}

	public String getEva_level(){
		return eva_level;
	}

	public void setAbutment(String abutment){
		this.abutment=abutment;
	}

	public String getAbutment(){
		return abutment;
	}

	public void setPier(String pier){
		this.pier=pier;
	}

	public String getPier(){
		return pier;
	}

	public void setErosion(String erosion){
		this.erosion=erosion;
	}

	public String getErosion(){
		return erosion;
	}

	public void setTop_structure(String top_structure){
		this.top_structure=top_structure;
	}

	public String getTop_structure(){
		return top_structure;
	}

	public void setSupport(String support){
		this.support=support;
	}

	public String getSupport(){
		return support;
	}

	public void setIs_often_maintain(String is_often_maintain){
		this.is_often_maintain=is_often_maintain;
	}

	public String getIs_often_maintain(){
		return is_often_maintain;
	}

	public void setTreatment(String treatment){
		this.treatment=treatment;
	}

	public String getTreatment(){
		return treatment;
	}

	public void setNext_time_year(String next_time_year){
		this.next_time_year=next_time_year;
	}

	public String getNext_time_year(){
		return next_time_year;
	}

}
