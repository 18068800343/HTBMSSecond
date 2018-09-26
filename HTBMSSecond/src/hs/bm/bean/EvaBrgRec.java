package hs.bm.bean;

public class EvaBrgRec {

	/***/
	private int er_no;
	/***/
	private String bridge_id;
	/***/
	private String prj_id;
	/***/
	private String er_std;
	/**评定时间*/
	private String er_date;
	/**审核状态*/
	private String audit_state;
	/**pdf路径*/
	private String pdf;

	public void setEr_no(int er_no){
		this.er_no=er_no;
	}

	public int getEr_no(){
		return er_no;
	}

	public void setBridge_id(String bridge_id){
		this.bridge_id=bridge_id;
	}

	public String getBridge_id(){
		return bridge_id;
	}

	public void setPrj_no(String prj_id){
		this.prj_id=prj_id;
	}

	public String getPrj_no(){
		return prj_id;
	}

	public void setEr_std(String er_std){
		this.er_std=er_std;
	}

	public String getEr_std(){
		return er_std;
	}

	public void setEr_date(String er_date){
		this.er_date=er_date;
	}

	public String getEr_date(){
		return er_date;
	}

	public void setAudit_state(String audit_state){
		this.audit_state=audit_state;
	}

	public String getAudit_state(){
		return audit_state;
	}

	public void setPdf(String pdf){
		this.pdf=pdf;
	}

	public String getPdf(){
		return pdf;
	}

}
