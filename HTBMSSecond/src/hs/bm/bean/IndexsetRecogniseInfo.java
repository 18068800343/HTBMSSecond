package hs.bm.bean;

public class IndexsetRecogniseInfo {

	/**编号*/
	private String id;
	/**指标集编码*/
	private String indexset_id;
	/**构件类型编号*/
	private String member_id;
	/**构件型号名称*/
	private String member_type_name;
	/**评定分类桥型*/
	private String brg_base_type;

	public void setId(String id){
		this.id=id;
	}

	public String getId(){
		return id;
	}

	public void setIndexset_id(String indexset_id){
		this.indexset_id=indexset_id;
	}

	public String getIndexset_id(){
		return indexset_id;
	}

	public void setMember_id(String member_id){
		this.member_id=member_id;
	}

	public String getMember_id(){
		return member_id;
	}

	public void setMember_type_name(String member_type_name){
		this.member_type_name=member_type_name;
	}

	public String getMember_type_name(){
		return member_type_name;
	}

	public void setBrg_base_type(String brg_base_type){
		this.brg_base_type=brg_base_type;
	}

	public String getBrg_base_type(){
		return brg_base_type;
	}

}
