package hs.bm.vo;

public class EvalStatistics {
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

     //结构类型（传过去编号；like）
     private String struct_type;

     private String project;

     private String eval04;
     private String eval11;
     
     
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
	public String getStruct_type() {
		return struct_type;
	}
	public void setStruct_type(String struct_type) {
		this.struct_type = struct_type;
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
	public String getEval04() {
		return eval04;
	}
	public void setEval04(String eval04) {
		this.eval04 = eval04;
	}
	public String getEval11() {
		return eval11;
	}
	public void setEval11(String eval11) {
		this.eval11 = eval11;
	}
	
	
}
