package hs.bm.bean;

public class DicMemberStandard {

	/***/
	private String standard_id;
	/***/
	private String member_type;
	/***/
	private String member_name;
	/***/
	private String member_model;
	/***/
	private String condition_id;

	public void setStandard_id(String standard_id){
		this.standard_id=standard_id;
	}

	public String getStandard_id(){
		return standard_id;
	}

	public void setMember_type(String member_type){
		this.member_type=member_type;
	}

	public String getMember_type(){
		return member_type;
	}

	public void setMember_name(String member_name){
		this.member_name=member_name;
	}

	public String getMember_name(){
		return member_name;
	}

	public void setMember_model(String member_model){
		this.member_model=member_model;
	}

	public String getMember_model(){
		return member_model;
	}

	public void setCondition_id(String condition_id){
		this.condition_id=condition_id;
	}

	public String getCondition_id(){
		return condition_id;
	}

}
