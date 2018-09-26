package hs.bm.bean;

public class DicBrgStructComponentDef {

	/**部件类型编码*/
	private String component_id;
	/**部件类型名称*/
	private String component_name;
	/**所遵循标准（检查部件、04评定部件、11评定部件）*/
	private String specification;

	public void setComponent_id(String component_id){
		this.component_id=component_id;
	}

	public String getComponent_id(){
		return component_id;
	}

	public void setComponent_name(String component_name){
		this.component_name=component_name;
	}

	public String getComponent_name(){
		return component_name;
	}

	public void setSpecification(String specification){
		this.specification=specification;
	}

	public String getSpecification(){
		return specification;
	}

}
