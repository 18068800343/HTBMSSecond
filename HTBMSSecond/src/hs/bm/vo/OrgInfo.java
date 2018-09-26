package hs.bm.vo;

import java.util.UUID;

public class OrgInfo {
String org_id;
String org_name;
String org_no;
String tech_section;
String tech_section_id;
String chargeman_name;
String org_name_short;
String section_name;
String section_id;

public String getSection_id() {
	return section_id;
}
public void setSection_id(String section_id) {
	this.section_id = section_id;
}
public String getOrg_name_short() {
	return org_name_short;
}
public void setOrg_name_short(String org_name_short) {
	this.org_name_short = org_name_short;
}
public String getSection_name() {
	return section_name;
}
public void setSection_name(String section_name) {
	this.section_name = section_name;
}
public String getChargeman_name() {
	return chargeman_name;
}
public void setChargeman_name(String chargeman_name) {
	this.chargeman_name = chargeman_name;
}
public String getTech_section() {
	return tech_section;
}
public void setTech_section(String tech_section) {
	this.tech_section = tech_section;
}
public String getTech_section_id() {
	return tech_section_id;
}
public void setTech_section_id(String tech_section_id) {
	this.tech_section_id = tech_section_id;
}
public String getOrg_no() {
	return org_no;
}
public void setOrg_no(String org_no) {
	this.org_no = org_no;
}
public String getOrg_id() {
	return org_id;
}
public void setOrg_id(String org_id) {
	this.org_id = org_id;
}
public String getOrg_name() {
	return org_name;
}
public void setOrg_name(String org_name) {
	this.org_name = org_name;
}
public static void main(String args[]){
//	UUID uuid  =  UUID.randomUUID(); 
//	String s = UUID.randomUUID().toString();
//	System.out.println(s);
	//System.out.println(Integer.parseInt("0000")==0);
		
		String id="0002#0000#0000#0000";
		
		String id1=id.substring(0, 10);//0002
		System.out.println(id1);
		int i=Integer.parseInt(id1);//2
		System.out.println(i);
		i++;//3
		id1=String.valueOf(i);
		System.out.println(id1.length());
		int length=id1.length();
		for(int j=4;j>length;j--){
			id1="0"+id1;
			System.out.println(id1);
		}
		
}

}
