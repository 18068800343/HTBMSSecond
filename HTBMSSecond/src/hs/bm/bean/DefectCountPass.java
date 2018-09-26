package hs.bm.bean;

public class DefectCountPass {

	/***/
	private long count_id;
	/***/
	private String defect_serial;
	/***/
	private String struct_id;
	/***/
	private String chk_id;
	/***/
	private String member_no;
	/***/
	private String defect_id;
	/***/
	private String defect_record;
	/***/
	private String defect_record_val;
	/***/
	private String defect_record_type;
	/**保存时间*/
	private String save_date;

	public void setCount_id(long count_id){
		this.count_id=count_id;
	}

	public long getCount_id(){
		return count_id;
	}

	public void setDefect_serial(String defect_serial){
		this.defect_serial=defect_serial;
	}

	public String getDefect_serial(){
		return defect_serial;
	}

	public void setStruct_id(String struct_id){
		this.struct_id=struct_id;
	}

	public String getStruct_id(){
		return struct_id;
	}

	public void setChk_id(String chk_id){
		this.chk_id=chk_id;
	}

	public String getChk_id(){
		return chk_id;
	}

	public void setMember_no(String member_no){
		this.member_no=member_no;
	}

	public String getMember_no(){
		return member_no;
	}

	public void setDefect_id(String defect_id){
		this.defect_id=defect_id;
	}

	public String getDefect_id(){
		return defect_id;
	}

	public void setDefect_record(String defect_record){
		this.defect_record=defect_record;
	}

	public String getDefect_record(){
		return defect_record;
	}

	public void setDefect_record_val(String defect_record_val){
		this.defect_record_val=defect_record_val;
	}

	public String getDefect_record_val(){
		return defect_record_val;
	}

	public void setDefect_record_type(String defect_record_type){
		this.defect_record_type=defect_record_type;
	}

	public String getDefect_record_type(){
		return defect_record_type;
	}

	public void setSave_date(String save_date){
		this.save_date=save_date;
	}

	public String getSave_date(){
		return save_date;
	}

}
