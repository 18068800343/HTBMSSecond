package hs.bm.bean;

public class MemMemberTypeDef {

	/**构件类型编号*/
	private String member_id;
	/**构件类型名称*/
	private String member_name;
	/**构件型号名称*/
	private String member_type_name;

	public void setMember_id(String member_id){
		this.member_id=member_id;
	}

	public String getMember_id(){
		return member_id;
	}

	public void setMember_name(String member_name){
		this.member_name=member_name;
	}

	public String getMember_name(){
		return member_name;
	}

	public void setMember_type_name(String member_type_name){
		this.member_type_name=member_type_name;
	}

	public String getMember_type_name(){
		return member_type_name;
	}

}
