package hs.bm.vo;

public class ZoneInfo {
	String zone_id;
	String zone_name;
	String build_prj;
	String engineer_name;
	String dutyman_name;
	public String getZone_id() {
		return zone_id;
	}
	public String getBuild_prj() {
		return build_prj;
	}
	public void setBuild_prj(String build_prj) {
		this.build_prj = build_prj;
	}
	public void setZone_id(String zone_id) {
		this.zone_id = zone_id;
	}
	public String getZone_name() {
		return zone_name;
	}
	public void setZone_name(String zone_name) {
		this.zone_name = zone_name;
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
}
