/**
 * <p>Title: SysZoneInfo.java</p>
 * <p>Description: 华通桥涵管理系统</p>
 * <p>Company: 环水信息技术有限公司</p>
 * @author 马潇霄
 * @version 1.0 创建时间：2017年7月25日 下午5:18:49
 */

package hs.bm.bean;


public class SysZoneInfo {
	private String zone_id;
	private String org_id;
	private String zone_name;
	private String engineer_name;
	private String dutyman_name;
	private String build_prj;
	public String getBuild_prj()
	{
		return build_prj;
	}
	public void setBuild_prj(String build_prj)
	{
		this.build_prj = build_prj;
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
