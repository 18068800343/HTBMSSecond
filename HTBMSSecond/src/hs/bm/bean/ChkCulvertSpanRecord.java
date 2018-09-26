package hs.bm.bean;

public class ChkCulvertSpanRecord {

	/**跨检查记录编号*/
	private String span_chk_id;
	/**涵洞检查记录编号*/
	private String chk_id;
	/**方向*/
	private String direction;
	/**跨号*/
	private String span_no;
	/**备注*/
	private String span_memo;
	/**建议*/
	private String span_suggestion;
	/**检查时间*/
	private String chk_time;
	/**检查天气*/
	private String chk_weather;
	/**气温*/
	private String temp;
	/**完成状态*/
	private String chk_state;
	/***/
	private String record_person;
	/***/
	private String recheck_person;
	/**pdf文件地址*/
	private String pdf;

	public void setSpan_chk_id(String span_chk_id){
		this.span_chk_id=span_chk_id;
	}

	public String getSpan_chk_id(){
		return span_chk_id;
	}

	public void setChk_id(String chk_id){
		this.chk_id=chk_id;
	}

	public String getChk_id(){
		return chk_id;
	}

	public void setDirection(String direction){
		this.direction=direction;
	}

	public String getDirection(){
		return direction;
	}

	public void setSpan_no(String span_no){
		this.span_no=span_no;
	}

	public String getSpan_no(){
		return span_no;
	}

	public void setSpan_memo(String span_memo){
		this.span_memo=span_memo;
	}

	public String getSpan_memo(){
		return span_memo;
	}

	public void setSpan_suggestion(String span_suggestion){
		this.span_suggestion=span_suggestion;
	}

	public String getSpan_suggestion(){
		return span_suggestion;
	}

	public void setChk_time(String chk_time){
		this.chk_time=chk_time;
	}

	public String getChk_time(){
		return chk_time;
	}

	public void setChk_weather(String chk_weather){
		this.chk_weather=chk_weather;
	}

	public String getChk_weather(){
		return chk_weather;
	}

	public void setTemp(String temp){
		this.temp=temp;
	}

	public String getTemp(){
		return temp;
	}

	public void setChk_state(String chk_state){
		this.chk_state=chk_state;
	}

	public String getChk_state(){
		return chk_state;
	}

	public void setRecord_person(String record_person){
		this.record_person=record_person;
	}

	public String getRecord_person(){
		return record_person;
	}

	public void setRecheck_person(String recheck_person){
		this.recheck_person=recheck_person;
	}

	public String getRecheck_person(){
		return recheck_person;
	}

	public void setPdf(String pdf){
		this.pdf=pdf;
	}

	public String getPdf(){
		return pdf;
	}

}
