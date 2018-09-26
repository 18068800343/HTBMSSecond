package hs.bm.vo;

public class DicHwBrgSectionRelationVO {
	/**路线编号*/
	private String highway_id;
	/**段区编号*/
	private String section_id;
	/**经度*/
	private String longitude;
	/**纬度*/
	private String latitude;
	/**结构物编号*/
	private String struct_id;
	/**结构类型（桥梁/通道/涵洞）*/
	private String struct_type;
	/**结构物名称*/
	private String Struct_name;
	private String stub_no;
	
	
	public String getStub_no() {
		return stub_no;
	}
	public void setStub_no(String stub_no) {
		this.stub_no = stub_no;
	}
	public String getHighway_id() {
		return highway_id;
	}
	public void setHighway_id(String highway_id) {
		this.highway_id = highway_id;
	}
	public String getSection_id() {
		return section_id;
	}
	public void setSection_id(String section_id) {
		this.section_id = section_id;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getStruct_id() {
		return struct_id;
	}
	public void setStruct_id(String struct_id) {
		this.struct_id = struct_id;
	}
	public String getStruct_type() {
		return struct_type;
	}
	public void setStruct_type(String struct_type) {
		this.struct_type = struct_type;
	}
	public String getStruct_name() {
		return Struct_name;
	}
	public void setStruct_name(String struct_name) {
		Struct_name = struct_name;
	}
	
}
