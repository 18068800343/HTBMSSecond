package hs.bm.bean;

public class PassMbrInfo {

	/***/
	private String r_id;
	/**跨信息编号*/
	private String s_id;
	/***/
	private String member_type;
	/***/
	private String member_no;
	/***/
	private String member_desc;
	/***/
	private String member_model;

	public void setR_id(String r_id){
		this.r_id=r_id;
	}

	public String getR_id(){
		return r_id;
	}

	public void setS_id(String s_id){
		this.s_id=s_id;
	}

	public String getS_id(){
		return s_id;
	}

	public void setMember_type(String member_type){
		this.member_type=member_type;
	}

	public String getMember_type(){
		return member_type;
	}

	public void setMember_no(String member_no){
		this.member_no=member_no;
	}

	public String getMember_no(){
		return member_no;
	}

	public void setMember_desc(String member_desc){
		this.member_desc=member_desc;
	}

	public String getMember_desc(){
		return member_desc;
	}

	public void setMember_model(String member_model){
		this.member_model=member_model;
	}

	public String getMember_model(){
		return member_model;
	}

}
