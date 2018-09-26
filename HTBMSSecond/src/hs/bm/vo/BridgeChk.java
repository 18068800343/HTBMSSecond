package hs.bm.vo;

import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.ChkSpanRecord;

public class BridgeChk {
	
	private String prj_id;
	private String prj_desc;
	private String chk_type;
	private String chk_id;
	private String check_date;
	private String audit_state;
	private String eval_level;
	
	
	private List<ChkSpanRecord> spans;
	
	
	public String getEval_level() {
		return eval_level;
	}

	public void setEval_level(String eval_level) {
		this.eval_level = eval_level;
	}

	public String getAudit_state() {
		return audit_state;
	}

	public void setAudit_state(String audit_state) {
		this.audit_state = audit_state;
	}

	public String getCheck_date() {
		return check_date;
	}

	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}

	public BridgeChk(){
		spans = new ArrayList<ChkSpanRecord>();
	}

	public String getPrj_id() {
		return prj_id;
	}

	public void setPrj_id(String prj_id) {
		this.prj_id = prj_id;
	}

	public String getPrj_desc() {
		return prj_desc;
	}

	public void setPrj_desc(String prj_desc) {
		this.prj_desc = prj_desc;
	}

	public String getChk_type() {
		return chk_type;
	}

	public void setChk_type(String chk_type) {
		this.chk_type = chk_type;
	}

	public String getChk_id() {
		return chk_id;
	}

	public void setChk_id(String chk_id) {
		this.chk_id = chk_id;
	}

	public List<ChkSpanRecord> getSpans() {
		return spans;
	}

	public void setSpans(List<ChkSpanRecord> spans) {
		this.spans = spans;
	}

	

	
	
}
