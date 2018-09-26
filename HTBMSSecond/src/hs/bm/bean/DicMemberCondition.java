package hs.bm.bean;

public class DicMemberCondition {

	/***/
	private String condition_id;
	/***/
	private String bridge_type;
	/***/
	private String condition_style;
	/***/
	private String condition_norm;
	/***/
	private String location;

	public void setCondition_id(String condition_id){
		this.condition_id=condition_id;
	}

	public String getCondition_id(){
		return condition_id;
	}

	public void setBridge_type(String bridge_type){
		this.bridge_type=bridge_type;
	}

	public String getBridge_type(){
		return bridge_type;
	}

	public void setCondition_style(String condition_style){
		this.condition_style=condition_style;
	}

	public String getCondition_style(){
		return condition_style;
	}

	public void setCondition_norm(String condition_norm){
		this.condition_norm=condition_norm;
	}

	public String getCondition_norm(){
		return condition_norm;
	}

	public void setLocation(String location){
		this.location=location;
	}

	public String getLocation(){
		return location;
	}

}
