package hs.bm.bean;

public class PassSpanInfo {

	/**编号*/
	private String s_id;
	/**通道编号*/
	private String pass_id;
	/**方向*/
	private String direction;
	/**跨号*/
	private int span_no;
	/**通道类型编码*/
	private String pass_type_id;

	public void setS_id(String s_id){
		this.s_id=s_id;
	}

	public String getS_id(){
		return s_id;
	}

	public void setPass_id(String pass_id){
		this.pass_id=pass_id;
	}

	public String getPass_id(){
		return pass_id;
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

	public void setPass_type_id(String pass_type_id){
		this.pass_type_id=pass_type_id;
	}

	public String getPass_type_id(){
		return pass_type_id;
	}

}
