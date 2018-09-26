package hs.bm.vo;

import java.util.HashSet;
import java.util.Set;

public class ReportStructs {
	private Set<String> manage=new HashSet<String>();
	private Set<String> section=new HashSet<String>();
	private Set<String> structname=new HashSet<String>();
	public Set<String> getManage() {
		return manage;
	}
	public void setManage(Set<String> manage) {
		this.manage = manage;
	}
	public Set<String> getSection() {
		return section;
	}
	public void setSection(Set<String> section) {
		this.section = section;
	}
	public Set<String> getStructname() {
		return structname;
	}
	public void setStructname(Set<String> structname) {
		this.structname = structname;
	}
}
