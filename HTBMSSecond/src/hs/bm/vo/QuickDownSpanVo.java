package hs.bm.vo;

public class QuickDownSpanVo {
	
    private String quickSpan_no;
	private String quickSpan_duntai_no;
	private String quick_down_struct_type;
	private String quick_down_struct_stuff;
	private String quick_down_struct_base_type;
	private String bridge_id;
	private String ifWadeOrNo;
	private String direction;
	public QuickDownSpanVo() {
		super();
	}
	public QuickDownSpanVo(String quickSpan_no, String quickSpan_duntai_no, String quick_down_struct_type,
			String quick_down_struct_stuff, String quick_down_struct_base_type, String bridge_id, String ifWadeOrNo,
			String direction) {
		super();
		this.quickSpan_no = quickSpan_no;
		this.quickSpan_duntai_no = quickSpan_duntai_no;
		this.quick_down_struct_type = quick_down_struct_type;
		this.quick_down_struct_stuff = quick_down_struct_stuff;
		this.quick_down_struct_base_type = quick_down_struct_base_type;
		this.bridge_id = bridge_id;
		this.ifWadeOrNo = ifWadeOrNo;
		this.direction = direction;
	}
	public String getQuickSpan_no() {
		return quickSpan_no;
	}
	public void setQuickSpan_no(String quickSpan_no) {
		this.quickSpan_no = quickSpan_no;
	}
	public String getQuickSpan_duntai_no() {
		return quickSpan_duntai_no;
	}
	public void setQuickSpan_duntai_no(String quickSpan_duntai_no) {
		this.quickSpan_duntai_no = quickSpan_duntai_no;
	}
	public String getQuick_down_struct_type() {
		return quick_down_struct_type;
	}
	public void setQuick_down_struct_type(String quick_down_struct_type) {
		this.quick_down_struct_type = quick_down_struct_type;
	}
	public String getQuick_down_struct_stuff() {
		return quick_down_struct_stuff;
	}
	public void setQuick_down_struct_stuff(String quick_down_struct_stuff) {
		this.quick_down_struct_stuff = quick_down_struct_stuff;
	}
	public String getQuick_down_struct_base_type() {
		return quick_down_struct_base_type;
	}
	public void setQuick_down_struct_base_type(String quick_down_struct_base_type) {
		this.quick_down_struct_base_type = quick_down_struct_base_type;
	}
	public String getBridge_id() {
		return bridge_id;
	}
	public void setBridge_id(String bridge_id) {
		this.bridge_id = bridge_id;
	}
	public String getIfWadeOrNo() {
		return ifWadeOrNo;
	}
	public void setIfWadeOrNo(String ifWadeOrNo) {
		this.ifWadeOrNo = ifWadeOrNo;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	
	
}
