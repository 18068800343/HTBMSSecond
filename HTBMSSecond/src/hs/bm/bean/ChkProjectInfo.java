package hs.bm.bean;

public class ChkProjectInfo {

	/**项目编号(编码规范)*/
	private String prj_id;
	/**项目描述*/
	private String prj_desc;
	/**检查类型（定期、特殊）*/
	private String chk_type;
	/**结构数量*/
	private int struct_no;
	/**构件数量*/
	private int member_no;
	/**已检查构件数量*/
	private int member_chk_no;
	/**已检查结构物*/
	private int struct_checked;
	/**已评定结构物*/
	private int struct_eva;
	/**系统管理员*/
	private String prj_manager;
	/**项目负责人*/
	private String prj_charge_man;
	/**项目参与人（多个，用#分隔，限定提交人在此范围内）*/
	private String prj_member;
	/**审核状态（待审、在审、完毕）*/
	private String prj_audit_state;
	/**审核时间*/
	private String prj_audit_date;
	/**检查报告状态（有、无）*/
	private String prj_report_state;
	/**检查报告地址（下载链接）*/
	private String prj_report_path;
	/**项目状态（待下载、已下载、已完成、异常）*/
	private int prj_state;
	/**项目建立时间*/
	private String prj_establish_tm;
	/**项目完成时间*/
	private String prj_complete_tm;
	/**养护单位*/
	private String maintain_org;
	/**分区*/
	private String zone_id;
	/**检测单位*/
	private String ht_input;
	public String getPrj_id() {
		return prj_id;
	}

	public void setPrj_id(String prj_id) {
		this.prj_id = prj_id;
	}

	public void setPrj_desc(String prj_desc){
		this.prj_desc=prj_desc;
	}

	public String getPrj_desc(){
		return prj_desc;
	}

	public void setChk_type(String chk_type){
		this.chk_type=chk_type;
	}

	public String getChk_type(){
		return chk_type;
	}

	public void setStruct_no(int struct_no){
		this.struct_no=struct_no;
	}

	public int getStruct_no(){
		return struct_no;
	}

	public void setMember_no(int member_no){
		this.member_no=member_no;
	}

	public int getMember_no(){
		return member_no;
	}

	public void setMember_chk_no(int member_chk_no){
		this.member_chk_no=member_chk_no;
	}

	public int getMember_chk_no(){
		return member_chk_no;
	}

	public void setStruct_checked(int struct_checked){
		this.struct_checked=struct_checked;
	}

	public int getStruct_checked(){
		return struct_checked;
	}

	public void setStruct_eva(int struct_eva){
		this.struct_eva=struct_eva;
	}

	public int getStruct_eva(){
		return struct_eva;
	}

	public void setPrj_manager(String prj_manager){
		this.prj_manager=prj_manager;
	}

	public String getPrj_manager(){
		return prj_manager;
	}

	public void setPrj_charge_man(String prj_charge_man){
		this.prj_charge_man=prj_charge_man;
	}

	public String getPrj_charge_man(){
		return prj_charge_man;
	}

	public void setPrj_member(String prj_member){
		this.prj_member=prj_member;
	}

	public String getPrj_member(){
		return prj_member;
	}

	public void setPrj_audit_state(String prj_audit_state){
		this.prj_audit_state=prj_audit_state;
	}

	public String getPrj_audit_state(){
		return prj_audit_state;
	}

	public void setPrj_audit_date(String prj_audit_date){
		this.prj_audit_date=prj_audit_date;
	}

	public String getPrj_audit_date(){
		return prj_audit_date;
	}

	public void setPrj_report_state(String prj_report_state){
		this.prj_report_state=prj_report_state;
	}

	public String getPrj_report_state(){
		return prj_report_state;
	}

	public void setPrj_report_path(String prj_report_path){
		this.prj_report_path=prj_report_path;
	}

	public String getPrj_report_path(){
		return prj_report_path;
	}

	

	public int getPrj_state() {
		return prj_state;
	}

	public void setPrj_state(int prj_state) {
		this.prj_state = prj_state;
	}

	public void setPrj_establish_tm(String prj_establish_tm){
		this.prj_establish_tm=prj_establish_tm;
	}

	public String getPrj_establish_tm(){
		return prj_establish_tm;
	}

	public void setPrj_complete_tm(String prj_complete_tm){
		this.prj_complete_tm=prj_complete_tm;
	}

	public String getPrj_complete_tm(){
		return prj_complete_tm;
	}

	public void setMaintain_org(String maintain_org){
		this.maintain_org=maintain_org;
	}

	public String getMaintain_org(){
		return maintain_org;
	}

	public String getZone_id() {
		return zone_id;
	}

	public void setZone_id(String zone_id) {
		this.zone_id = zone_id;
	}

	public String getHt_input() {
		return ht_input;
	}

	public void setHt_input(String ht_input) {
		this.ht_input = ht_input;
	}
	
	
}
