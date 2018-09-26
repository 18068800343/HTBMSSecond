package hs.bm.vo;

import java.util.List;

public class CheckBrgDefectVo {

	private String chk_type;
	private String prj_id;
	private String span_chk_id;
	private String bridge_id;
	private String direction;
	private String span_no;
	private String mbr_type;
	private String mbr_no;
	private String defect_type;
	private String defect_name;
	private String defect_id;
	private String chk_defect_memo;
	private String defect_location_desc;
	private String defect_count;
	private String defect_location_desc_val;
	private String defect_count_val;
	List<CheckBrgDefectPhoto> photoList;
	
	public String getChk_type() {
		return chk_type;
	}
	public void setChk_type(String chk_type) {
		this.chk_type = chk_type;
	}
	public String getPrj_id() {
		return prj_id;
	}
	public void setPrj_id(String prj_id) {
		this.prj_id = prj_id;
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
	public String getMbr_type() {
		return mbr_type;
	}
	public void setMbr_type(String mbr_type) {
		this.mbr_type = mbr_type;
	}
	public String getMbr_no() {
		return mbr_no;
	}
	public void setMbr_no(String mbr_no) {
		this.mbr_no = mbr_no;
	}
	public String getDefect_type() {
		return defect_type;
	}
	public void setDefect_type(String defect_type) {
		this.defect_type = defect_type;
	}
	public String getDefect_name() {
		return defect_name;
	}
	public void setDefect_name(String defect_name) {
		this.defect_name = defect_name;
	}
	public String getDefect_id() {
		return defect_id;
	}
	public void setDefect_id(String defect_id) {
		this.defect_id = defect_id;
	}
	public String getChk_defect_memo() {
		return chk_defect_memo;
	}
	public void setChk_defect_memo(String chk_defect_memo) {
		this.chk_defect_memo = chk_defect_memo;
	}
	public List<CheckBrgDefectPhoto> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(List<CheckBrgDefectPhoto> photoList) {
		this.photoList = photoList;
	}
	
	public String getDefect_location_desc() {
		return defect_location_desc;
	}
	public void setDefect_location_desc(String defect_location_desc) {
		this.defect_location_desc = defect_location_desc;
	}
	public String getDefect_count() {
		return defect_count;
	}
	public void setDefect_count(String defect_count) {
		this.defect_count = defect_count;
	}
	public String getDefect_location_desc_val() {
		return defect_location_desc_val;
	}
	public void setDefect_location_desc_val(String defect_location_desc_val) {
		this.defect_location_desc_val = defect_location_desc_val;
	}
	public String getDefect_count_val() {
		return defect_count_val;
	}
	public void setDefect_count_val(String defect_count_val) {
		this.defect_count_val = defect_count_val;
	}
	@Override
	public String toString() {
		return "CheckBrgDefectVo [chk_type=" + chk_type + ", prj_id=" + prj_id + ", span_chk_id=" + span_chk_id
				+ ", bridge_id=" + bridge_id + ", direction=" + direction + ", span_no=" + span_no + ", mbr_type="
				+ mbr_type + ", mbr_no=" + mbr_no + ", defect_type=" + defect_type + ", defect_name=" + defect_name
				+ ", defect_id=" + defect_id + ", chk_defect_memo=" + chk_defect_memo + ", defect_location_desc="
				+ defect_location_desc + ", defect_count=" + defect_count + ", defect_location_desc_val="
				+ defect_location_desc_val + ", defect_count_val=" + defect_count_val + ", photoList=" + photoList
				+ "]";
	}
	
	
	
}
