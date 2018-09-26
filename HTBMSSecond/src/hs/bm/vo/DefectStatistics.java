package hs.bm.vo;

public class DefectStatistics {
	private String project;
	//路线名称（传过去路线编号；like）
    private String line;
    //段区名称（传过去编号；like）
    private String section;
    //管养单位名称（传过去编号；like）
    private String manage;
    //管养分区名称（传过去编号；like）
    private String zone;
     private String struct_mode;
     private String struct;
     private String direction;
     private String span;
     private String struct_type;
     private String distr_name;
     private String component_name;
     private String member_name;
     private String member_no;
     private String memType;
     //一级病害名，like
     private String defect_name_f;
     //二级病害名，like
     private String defect_name;
     private String defect_location_desc;
     private String defect_count;
     //defect_attr
     private String important;
     //发展状态
     private String develop;
     
     private String bridge_pile_no;
     
     
     
	public String getBridge_pile_no() {
		return bridge_pile_no;
	}
	public void setBridge_pile_no(String bridge_pile_no) {
		this.bridge_pile_no = bridge_pile_no;
	}
	public String getDefect_name_f() {
		return defect_name_f;
	}
	public void setDefect_name_f(String defect_name_f) {
		this.defect_name_f = defect_name_f;
	}
	public String getDefect_name() {
		return defect_name;
	}
	public void setDefect_name(String defect_name) {
		this.defect_name = defect_name;
	}
	public String getDefect_location_desc() {
		return defect_location_desc;
	}
	public void setDefect_location_desc(String defect_location_desc) {
		this.defect_location_desc = defect_location_desc;
	}
	public String getDefect_count() {
		return defect_count;
	}
	public void setDefect_count(String defect_count) {
		this.defect_count = defect_count;
	}
	public String getImportant() {
		return important;
	}
	public void setImportant(String important) {
		this.important = important;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getStruct_mode() {
		return struct_mode;
	}
	public void setStruct_mode(String struct_mode) {
		this.struct_mode = struct_mode;
	}
	public String getStruct() {
		return struct;
	}
	public void setStruct(String struct) {
		this.struct = struct;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getSpan() {
		return span;
	}
	public void setSpan(String span) {
		this.span = span;
	}
	public String getStruct_type() {
		return struct_type;
	}
	public void setStruct_type(String struct_type) {
		this.struct_type = struct_type;
	}
	public String getDistr_name() {
		return distr_name;
	}
	public void setDistr_name(String distr_name) {
		this.distr_name = distr_name;
	}
	public String getComponent_name() {
		return component_name;
	}
	public void setComponent_name(String component_name) {
		this.component_name = component_name;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public String getManage() {
		return manage;
	}
	public void setManage(String manage) {
		this.manage = manage;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getDevelop() {
		return develop;
	}
	public void setDevelop(String develop) {
		this.develop = develop;
	}
   
}
