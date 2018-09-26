package hs.bm.bean;

public class StaffNumber {
	
	private String brg_no;
	private String phone;
	private String type;
	private String item_second;
	private String name;
	public StaffNumber() {
		super();
	}
	public StaffNumber(String brg_no, String phone, String type, String item_second, String name) {
		super();
		this.brg_no = brg_no;
		this.phone = phone;
		this.type = type;
		this.item_second = item_second;
		this.name = name;
	}
	public String getBrg_no() {
		return brg_no;
	}
	public void setBrg_no(String brg_no) {
		this.brg_no = brg_no;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getItem_second() {
		return item_second;
	}
	public void setItem_second(String item_second) {
		this.item_second = item_second;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
}
