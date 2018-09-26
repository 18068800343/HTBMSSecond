package hs.bm.bean;

public class BrgCardConstructPrj {

	/**编号*/
	private String r_id;
	/**桥梁编号*/
	private String bridge_id;
	/**施工日期（开工）*/
	private String start_date;
	/**施工日期（竣工）*/
	private String finish_date;
	/**修建类别*/
	private String type;
	/**修建原因*/
	private String reason;
	/**工程范围*/
	private String scope;
	/**工程费用（万元）*/
	private String cost;
	/**经费来源*/
	private String cost_source;
	/**质量评定*/
	private String evaluate_level;
	/**建设单位*/
	private String build_org;
	/**设计单位*/
	private String design_org;
	/**施工单位*/
	private String construct_org;
	/**监理单位*/
	private String supervise_org;
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

	public void setStart_date(String start_date){
		this.start_date=start_date;
	}

	public String getStart_date(){
		return start_date;
	}

	public void setFinish_date(String finish_date){
		this.finish_date=finish_date;
	}

	public String getFinish_date(){
		return finish_date;
	}

	public void setType(String type){
		this.type=type;
	}

	public String getType(){
		return type;
	}

	public void setReason(String reason){
		this.reason=reason;
	}

	public String getReason(){
		return reason;
	}

	public void setScope(String scope){
		this.scope=scope;
	}

	public String getScope(){
		return scope;
	}

	public void setCost(String cost){
		this.cost=cost;
	}

	public String getCost(){
		return cost;
	}

	public void setCost_source(String cost_source){
		this.cost_source=cost_source;
	}

	public String getCost_source(){
		return cost_source;
	}

	public void setEvaluate_level(String evaluate_level){
		this.evaluate_level=evaluate_level;
	}

	public String getEvaluate_level(){
		return evaluate_level;
	}

	public void setBuild_org(String build_org){
		this.build_org=build_org;
	}

	public String getBuild_org(){
		return build_org;
	}

	public void setDesign_org(String design_org){
		this.design_org=design_org;
	}

	public String getDesign_org(){
		return design_org;
	}

	public void setConstruct_org(String construct_org){
		this.construct_org=construct_org;
	}

	public String getConstruct_org(){
		return construct_org;
	}

	public void setSupervise_org(String supervise_org){
		this.supervise_org=supervise_org;
	}

	public String getSupervise_org(){
		return supervise_org;
	}


}
