package hs.bm.bean;

public class DicHwInfo {

	/**编码*/
	private String highway_id;
	/**路线编号*/
	private String highway_no;
	/***/
	private String highway_name;
	/***/
	private String highway_level;

	public void setHighway_id(String highway_id){
		this.highway_id=highway_id;
	}

	public String getHighway_id(){
		return highway_id;
	}

	public void setHighway_no(String highway_no){
		this.highway_no=highway_no;
	}

	public String getHighway_no(){
		return highway_no;
	}

	public void setHighway_name(String highway_name){
		this.highway_name=highway_name;
	}

	public String getHighway_name(){
		return highway_name;
	}

	public void setHighway_level(String highway_level){
		this.highway_level=highway_level;
	}

	public String getHighway_level(){
		return highway_level;
	}

}
