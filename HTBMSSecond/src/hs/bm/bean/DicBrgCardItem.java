package hs.bm.bean;

public class DicBrgCardItem {

	/**编码*/
	private String item_id;
	/**条目名称*/
	private String item_name;
	/**说明*/
	private String item_desc;
	/**排序*/
	private String item_sort;

	

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public void setItem_name(String item_name){
		this.item_name=item_name;
	}

	public String getItem_name(){
		return item_name;
	}

	public void setItem_desc(String item_desc){
		this.item_desc=item_desc;
	}

	public String getItem_desc(){
		return item_desc;
	}

	public void setItem_sort(String item_sort){
		this.item_sort=item_sort;
	}

	public String getItem_sort(){
		return item_sort;
	}

}
