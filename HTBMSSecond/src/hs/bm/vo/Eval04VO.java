package hs.bm.vo;

import java.util.List;

public class Eval04VO {
	/**桥梁评定编号*/
	private String er_no;
	/**评定标准*/
	private String er_std;
	/**桥梁编号*/
	private String bridge_no;
	/**项目编号*/
	private String prj_no;
	/**总分*/
	private String score;
	/**状态的html语言*/
	private String state;
	/**构件类型*/
	private String member_type;
	/**部件类型名称*/
	private String component_name;
	/**部件类型id*/
	private String component_id;
	/**指标的集合*/
	private List<IndexsetIndexVO> iiv;
	public String getEr_no() {
		return er_no;
	}
	public void setEr_no(String er_no) {
		this.er_no = er_no;
	}
	public String getEr_std() {
		return er_std;
	}
	public void setEr_std(String er_std) {
		this.er_std = er_std;
	}
	public String getBridge_no() {
		return bridge_no;
	}
	public void setBridge_no(String bridge_no) {
		this.bridge_no = bridge_no;
	}
	public String getPrj_no() {
		return prj_no;
	}
	public void setPrj_no(String prj_no) {
		this.prj_no = prj_no;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	public String getComponent_name() {
		return component_name;
	}
	public void setComponent_name(String component_name) {
		this.component_name = component_name;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public List<IndexsetIndexVO> getIiv() {
		return iiv;
	}
	public void setIiv(List<IndexsetIndexVO> iiv) {
		this.iiv = iiv;
	}
	public String getComponent_id() {
		return component_id;
	}
	public void setComponent_id(String component_id) {
		this.component_id = component_id;
	}
	
}
