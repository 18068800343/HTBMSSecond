package hs.bm.vo;

import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicMbrDefectS;

public class DicDefect {
	
	private String defect_f_id;
	private String defect_f_name;
	private List<DicMbrDefectS> defects;

	public DicDefect(){
		defects = new ArrayList<DicMbrDefectS>();
	}


	public String getDefect_f_id() {
		return defect_f_id;
	}

	public void setDefect_f_id(String defect_f_id) {
		this.defect_f_id = defect_f_id;
	}

	public String getDefect_f_name() {
		return defect_f_name;
	}

	public void setDefect_f_name(String defect_f_name) {
		this.defect_f_name = defect_f_name;
	}

	public List<DicMbrDefectS> getDefects() {
		return defects;
	}

	public void setDefects(List<DicMbrDefectS> defects) {
		this.defects = defects;
	}
	
	
}
