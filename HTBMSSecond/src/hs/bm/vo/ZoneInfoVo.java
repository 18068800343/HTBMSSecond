package hs.bm.vo;

public class ZoneInfoVo {
	String zone_id;
	String org_id;
	String zone_name;
	String build_prj;
	String engineer_name;
	String dutyman_name;
	String check_people;
	String prj_charge_man;
	public ZoneInfoVo() {
		super();
	}
	public ZoneInfoVo(String zone_id, String org_id, String zone_name, String build_prj, String engineer_name,
			String dutyman_name, String check_people, String prj_charge_man) {
		super();
		this.zone_id = zone_id;
		this.org_id = org_id;
		this.zone_name = zone_name;
		this.build_prj = build_prj;
		this.engineer_name = engineer_name;
		this.dutyman_name = dutyman_name;
		this.check_people = check_people;
		this.prj_charge_man = prj_charge_man;
	}
	public String getZone_id() {
		return zone_id;
	}
	public void setZone_id(String zone_id) {
		this.zone_id = zone_id;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getZone_name() {
		return zone_name;
	}
	public void setZone_name(String zone_name) {
		this.zone_name = zone_name;
	}
	public String getBuild_prj() {
		return build_prj;
	}
	public void setBuild_prj(String build_prj) {
		this.build_prj = build_prj;
	}
	public String getEngineer_name() {
		return engineer_name;
	}
	public void setEngineer_name(String engineer_name) {
		this.engineer_name = engineer_name;
	}
	public String getDutyman_name() {
		return dutyman_name;
	}
	public void setDutyman_name(String dutyman_name) {
		this.dutyman_name = dutyman_name;
	}
	public String getCheck_people() {
		return check_people;
	}
	public void setCheck_people(String check_people) {
		this.check_people = check_people;
	}
	public String getPrj_charge_man() {
		return prj_charge_man;
	}
	public void setPrj_charge_man(String prj_charge_man) {
		this.prj_charge_man = prj_charge_man;
	}
	
}
