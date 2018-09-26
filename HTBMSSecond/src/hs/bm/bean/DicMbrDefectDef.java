package hs.bm.bean;

public class DicMbrDefectDef {

	/**部件类型编码*/
	private String component_id;
	/**病害编号*/
	private String defect_f_id;
	/**相关程度*/
	private int ratio;
	/**备注*/
	private String memo;

	public void setComponent_id(String component_id){
		this.component_id=component_id;
	}

	public String getComponent_id(){
		return component_id;
	}

	public void setDefect_f_id(String defect_f_id){
		this.defect_f_id=defect_f_id;
	}

	public String getDefect_f_id(){
		return defect_f_id;
	}

	public void setRatio(int ratio){
		this.ratio=ratio;
	}

	public int getRatio(){
		return ratio;
	}

	public void setMemo(String memo){
		this.memo=memo;
	}

	public String getMemo(){
		return memo;
	}

}
