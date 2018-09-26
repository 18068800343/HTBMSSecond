package hs.bm.bean;

public class DicBrgStructTypeDef {

	/**桥型编码*/
	private String brg_type_id;
	/**桥型名称*/
	private String brg_type_name;
	/***/
	private String brg_base_type;

	public void setBrg_type_id(String brg_type_id){
		this.brg_type_id=brg_type_id;
	}

	public String getBrg_type_id(){
		return brg_type_id;
	}

	public void setBrg_type_name(String brg_type_name){
		this.brg_type_name=brg_type_name;
	}

	public String getBrg_type_name(){
		return brg_type_name;
	}

	public void setBrg_base_type(String brg_base_type){
		this.brg_base_type=brg_base_type;
	}

	public String getBrg_base_type(){
		return brg_base_type;
	}

}
