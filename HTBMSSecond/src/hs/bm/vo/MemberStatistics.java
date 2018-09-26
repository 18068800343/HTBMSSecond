package hs.bm.vo;

public class MemberStatistics {
	 //路线名称（传过去路线编号；like）
     private String line;
     //段区名称（传过去编号；like）
     private String section;
     //管养单位名称（传过去编号；like）
     private String manage;
     //管养分区名称（传过去编号；like）
     private String zone;
     //结构分类（bridge,culvert,pass）
     private String struct_mode;
     //结构物名称
     private String struct;
     //方向（like）
     private String direction;
     //跨号 like
     private String span;
     //结构类型（传过去编号；like）
     private String struct_type;
     //分布结构名称 like
     private String distr_name;
     //部件类型 like
     private String component_name;
     //构件类型 like
     private String member_name;
     //构件名
     private String member_no;
     private String project;
     //构件型号 member_model
     private String memType;
     
     
     
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
	
}
