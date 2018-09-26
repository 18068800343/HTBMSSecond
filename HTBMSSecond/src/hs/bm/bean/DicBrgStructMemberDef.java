package hs.bm.bean;

public class DicBrgStructMemberDef {

	/**构件类型编码*/
	private String member_id;
	/**构件类型名称*/
	private String member_name;
	/**11评定梁式桥*/
	private String component1;
	/**11评定板、肋、箱、双曲拱桥*/
	private String component2;
	/**11评定刚架、桁架拱桥*/
	private String component3;
	/**11评定钢-混组合拱桥*/
	private String component4;
	/**11评定悬索桥*/
	private String component5;
	/**11评定斜拉桥*/
	private String component6;
	/**04评定部件*/
	private String component7;
	/**桥梁检查记录*/
	private String component8;
	/**通道检查记录*/
	private String component9;
	/**涵洞检查记录*/
	private String component10;
	/**分布结构名称*/
	private String distr_name;

	public void setMember_id(String member_id){
		this.member_id=member_id;
	}

	public String getMember_id(){
		return member_id;
	}

	public void setMember_name(String member_name){
		this.member_name=member_name;
	}

	public String getMember_name(){
		return member_name;
	}

	public void setComponent1(String component1){
		this.component1=component1;
	}

	public String getComponent1(){
		return component1;
	}

	public void setComponent2(String component2){
		this.component2=component2;
	}

	public String getComponent2(){
		return component2;
	}

	public void setComponent3(String component3){
		this.component3=component3;
	}

	public String getComponent3(){
		return component3;
	}

	public void setComponent4(String component4){
		this.component4=component4;
	}

	public String getComponent4(){
		return component4;
	}

	public void setComponent5(String component5){
		this.component5=component5;
	}

	public String getComponent5(){
		return component5;
	}

	public void setComponent6(String component6){
		this.component6=component6;
	}

	public String getComponent6(){
		return component6;
	}

	public void setComponent7(String component7){
		this.component7=component7;
	}

	public String getComponent7(){
		return component7;
	}

	public void setComponent8(String component8){
		this.component8=component8;
	}

	public String getComponent8(){
		return component8;
	}

	public void setComponent9(String component9){
		this.component9=component9;
	}

	public String getComponent9(){
		return component9;
	}

	public void setComponent10(String component10){
		this.component10=component10;
	}

	public String getComponent10(){
		return component10;
	}

	public void setDistr_name(String distr_name){
		this.distr_name=distr_name;
	}

	public String getDistr_name(){
		return distr_name;
	}

}
