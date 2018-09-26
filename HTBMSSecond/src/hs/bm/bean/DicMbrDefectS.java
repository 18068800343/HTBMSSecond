package hs.bm.bean;

public class DicMbrDefectS {

	/**病害编号*/
	private String defect_id;
	/**病害名称*/
	private String defect_name;
	/**病害位置定义*/
	private String defect_loc_def;
	/**病害定量描述*/
	private String defect_def;
	/**变量模板定义*/
	private String defect_template;
	/***/
	private String defect_f_id;
	/**附加属性*/
	private String defect_attr;
	
	private String defect_statistics;
	private String defect_summary;

	public void setDefect_id(String defect_id){
		this.defect_id=defect_id;
	}

	public String getDefect_id(){
		return defect_id;
	}

	public void setDefect_name(String defect_name){
		this.defect_name=defect_name;
	}

	public String getDefect_name(){
		return defect_name;
	}

	public void setDefect_loc_def(String defect_loc_def){
		this.defect_loc_def=defect_loc_def;
	}

	public String getDefect_loc_def(){
		return defect_loc_def;
	}

	public void setDefect_def(String defect_def){
		this.defect_def=defect_def;
	}

	public String getDefect_def(){
		return defect_def;
	}

	public void setDefect_template(String defect_template){
		this.defect_template=defect_template;
	}

	public String getDefect_template(){
		return defect_template;
	}

	public void setDefect_f_id(String defect_f_id){
		this.defect_f_id=defect_f_id;
	}

	public String getDefect_f_id(){
		return defect_f_id;
	}

	public void setDefect_attr(String defect_attr){
		this.defect_attr=defect_attr;
	}

	public String getDefect_attr(){
		return defect_attr;
	}

	public String getDefect_statistics() {
		return defect_statistics;
	}

	public void setDefect_statistics(String defect_statistics) {
		this.defect_statistics = defect_statistics;
	}

	public String getDefect_summary() {
		return defect_summary;
	}

	public void setDefect_summary(String defect_summary) {
		this.defect_summary = defect_summary;
	}
	
	

}
