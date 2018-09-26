package hs.bm.bean;

public class DicBrgCardDomain {

	/**编码*/
	private String domain_id;
	/**条目名称*/
	private String item_id;
	/**条目取值*/
	private String item_value;

	public void setDomain_id(String domain_id){
		this.domain_id=domain_id;
	}

	public String getDomain_id(){
		return domain_id;
	}

	

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public void setItem_value(String item_value){
		this.item_value=item_value;
	}

	public String getItem_value(){
		return item_value;
	}

}
