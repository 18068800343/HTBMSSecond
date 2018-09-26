package hs.bm.bean;

public class CulSpanInfo {

	/**编号*/
	private String s_id;
	/**涵洞编号*/
	private String culvert_id;
	/**方向*/
	private String direction;
	/**跨号*/
	private int span_no;
	/**涵洞类型编码*/
	private String cul_type_id;

	public void setS_id(String s_id){
		this.s_id=s_id;
	}

	public String getS_id(){
		return s_id;
	}

	public void setCulvert_id(String culvert_id){
		this.culvert_id=culvert_id;
	}

	public String getCulvert_id(){
		return culvert_id;
	}

	public void setDirection(String direction){
		this.direction=direction;
	}

	public String getDirection(){
		return direction;
	}

	public void setSpan_no(int span_no){
		this.span_no=span_no;
	}

	public int getSpan_no(){
		return span_no;
	}

	public void setCul_type_id(String cul_type_id){
		this.cul_type_id=cul_type_id;
	}

	public String getCul_type_id(){
		return cul_type_id;
	}

}
