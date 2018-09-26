package hs.bm.bean;

public class ChkBrgRegular {

	/***/
	private String chk_id;
	/**项目编号*/
	private String prj_id;
	/**路线编码*/
	private String line_no;
	/**路线名称*/
	private String line_name;
	/**桥位桩号*/
	private String stub_no;
	/**桥梁编码*/
	private String bridge_id;
	/**桥梁名称*/
	private String bridge_name;
	/**下穿通道名*/
	private String down_lane_name;
	/**桥长（m）*/
	private float bridge_len;
	/**主跨结构*/
	private String main_span_struct;
	/**最大跨径（m）*/
	private float span_len;
	/**管养单位*/
	private String maintain_org;
	/**建成年月*/
	private String construct_ym;
	/**跨径*/
	private String struct_span;
	/**上部结构*/
	private String top_struct_type;
	/**下部结构*/
	private String down_struct_type;
	/**上次大中修日期*/
	private String last_maintain_date;
	/**上次检查日期*/
	private String last_check_date;
	/**本次检查日期*/
	private String check_date;
	/**气候*/
	private String climate;
	/**总体状况评定等级*/
	private String total_level;
	/**全桥清洁状况评分*/
	private float total_cleanliness_score;
	/**保养、小修状况评分*/
	private float maintain_score;
	/**经常性养护建议*/
	private String regular_maintain_rec;
	/**记录人*/
	private String record_person;
	/**负责人*/
	private String response_person;
	/**下次检查时间*/
	private String next_check_date;
	/**缺损说明*/
	private String defect_desc;
	/**审核状态*/
	private String audit_state;
	/***/
	private String eval_level;

	public void setChk_id(String chk_id){
		this.chk_id=chk_id;
	}

	public String getChk_id(){
		return chk_id;
	}

	public void setPrj_id(String prj_id){
		this.prj_id=prj_id;
	}

	public String getPrj_id(){
		return prj_id;
	}

	public void setLine_no(String line_no){
		this.line_no=line_no;
	}

	public String getLine_no(){
		return line_no;
	}

	public void setLine_name(String line_name){
		this.line_name=line_name;
	}

	public String getLine_name(){
		return line_name;
	}

	public void setStub_no(String stub_no){
		this.stub_no=stub_no;
	}

	public String getStub_no(){
		return stub_no;
	}

	public void setBridge_id(String bridge_id){
		this.bridge_id=bridge_id;
	}

	public String getBridge_id(){
		return bridge_id;
	}

	public void setBridge_name(String bridge_name){
		this.bridge_name=bridge_name;
	}

	public String getBridge_name(){
		return bridge_name;
	}

	public void setDown_lane_name(String down_lane_name){
		this.down_lane_name=down_lane_name;
	}

	public String getDown_lane_name(){
		return down_lane_name;
	}

	public void setBridge_len(float bridge_len){
		this.bridge_len=bridge_len;
	}

	public float getBridge_len(){
		return bridge_len;
	}

	public void setMain_span_struct(String main_span_struct){
		this.main_span_struct=main_span_struct;
	}

	public String getMain_span_struct(){
		return main_span_struct;
	}

	public void setSpan_len(float span_len){
		this.span_len=span_len;
	}

	public float getSpan_len(){
		return span_len;
	}

	public void setMaintain_org(String maintain_org){
		this.maintain_org=maintain_org;
	}

	public String getMaintain_org(){
		return maintain_org;
	}

	public void setConstruct_ym(String construct_ym){
		this.construct_ym=construct_ym;
	}

	public String getConstruct_ym(){
		return construct_ym;
	}

	public void setStruct_span(String struct_span){
		this.struct_span=struct_span;
	}

	public String getStruct_span(){
		return struct_span;
	}

	public void setTop_struct_type(String top_struct_type){
		this.top_struct_type=top_struct_type;
	}

	public String getTop_struct_type(){
		return top_struct_type;
	}

	public void setDown_struct_type(String down_struct_type){
		this.down_struct_type=down_struct_type;
	}

	public String getDown_struct_type(){
		return down_struct_type;
	}

	public void setLast_maintain_date(String last_maintain_date){
		this.last_maintain_date=last_maintain_date;
	}

	public String getLast_maintain_date(){
		return last_maintain_date;
	}

	public void setLast_check_date(String last_check_date){
		this.last_check_date=last_check_date;
	}

	public String getLast_check_date(){
		return last_check_date;
	}

	public void setCheck_date(String check_date){
		this.check_date=check_date;
	}

	public String getCheck_date(){
		return check_date;
	}

	public void setClimate(String climate){
		this.climate=climate;
	}

	public String getClimate(){
		return climate;
	}

	public void setTotal_level(String total_level){
		this.total_level=total_level;
	}

	public String getTotal_level(){
		return total_level;
	}

	public void setTotal_cleanliness_score(float total_cleanliness_score){
		this.total_cleanliness_score=total_cleanliness_score;
	}

	public float getTotal_cleanliness_score(){
		return total_cleanliness_score;
	}

	public void setMaintain_score(float maintain_score){
		this.maintain_score=maintain_score;
	}

	public float getMaintain_score(){
		return maintain_score;
	}

	public void setRegular_maintain_rec(String regular_maintain_rec){
		this.regular_maintain_rec=regular_maintain_rec;
	}

	public String getRegular_maintain_rec(){
		return regular_maintain_rec;
	}

	public void setRecord_person(String record_person){
		this.record_person=record_person;
	}

	public String getRecord_person(){
		return record_person;
	}

	public void setResponse_person(String response_person){
		this.response_person=response_person;
	}

	public String getResponse_person(){
		return response_person;
	}

	public void setNext_check_date(String next_check_date){
		this.next_check_date=next_check_date;
	}

	public String getNext_check_date(){
		return next_check_date;
	}

	public void setDefect_desc(String defect_desc){
		this.defect_desc=defect_desc;
	}

	public String getDefect_desc(){
		return defect_desc;
	}

	public void setAudit_state(String audit_state){
		this.audit_state=audit_state;
	}

	public String getAudit_state(){
		return audit_state;
	}

	public void setEval_level(String eval_level){
		this.eval_level=eval_level;
	}

	public String getEval_level(){
		return eval_level;
	}

}
