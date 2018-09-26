package hs.bm.vo;

import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.ChkBrgDefect;

public class SpanMem {
	
	private String mbr_chk_id;
	private String span_chk_id;
	private String bridge_id;
	private String direction;
	private String span_no;
	private String member_name;
	private String mbr_no;
	private String member_no;
	private String component_name;
	private String distr_name;
	private String mbr_chk_person;
	
	private List<ChkBrgDefect> defects;
	
	
	public String getMbr_no() {
		return mbr_no;
	}

	public void setMbr_no(String mbr_no) {
		this.mbr_no = mbr_no;
	}

	public String getMbr_chk_person() {
		return mbr_chk_person;
	}

	public void setMbr_chk_person(String mbr_chk_person) {
		this.mbr_chk_person = mbr_chk_person;
	}

	public SpanMem(){
		defects = new ArrayList<ChkBrgDefect>();
	}

	public String getMbr_chk_id() {
		return mbr_chk_id;
	}

	public void setMbr_chk_id(String mbr_chk_id) {
		this.mbr_chk_id = mbr_chk_id;
	}

	

	public String getSpan_chk_id() {
		return span_chk_id;
	}

	public void setSpan_chk_id(String span_chk_id) {
		this.span_chk_id = span_chk_id;
	}

	public String getBridge_id() {
		return bridge_id;
	}

	public void setBridge_id(String bridge_id) {
		this.bridge_id = bridge_id;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getSpan_no() {
		return span_no;
	}

	public void setSpan_no(String span_no) {
		this.span_no = span_no;
	}

	

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

	public String getComponent_name() {
		return component_name;
	}

	public void setComponent_name(String component_name) {
		this.component_name = component_name;
	}

	public String getDistr_name() {
		return distr_name;
	}

	public void setDistr_name(String distr_name) {
		this.distr_name = distr_name;
	}

	public List<ChkBrgDefect> getDefects() {
		return defects;
	}

	public void setDefects(List<ChkBrgDefect> defects) {
		this.defects = defects;
	}

	
	
}
