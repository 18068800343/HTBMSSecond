package hs.bm.bean;

public class EvaBridgePart {

	/***/
	private int eva_bridge_part_id;
	/***/
	private String prj_no;
	/***/
	private String bridge_no;
	/***/
	private String bridge_type;
	/***/
	private String eva_bridge_part_value1;
	/***/
	private String eva_bridge_part_value2;
	/***/
	private String eva_bridge_part_value3;
	/***/
	private String bridge_direction;
	/***/
	private String bridge_spans;
	/***/
	private byte eva_bridge_part_index1;
	/***/
	private byte eva_bridge_part_index2;
	/***/
	private byte eva_bridge_part_index3;
	/***/
	private String eva_bridge_part_value;
	/***/
	private String eva_bridge_part_grde;
	private String bridge_type_name;
	
	

	public String getBridge_type_name() {
		return bridge_type_name;
	}

	public void setBridge_type_name(String bridge_type_name) {
		this.bridge_type_name = bridge_type_name;
	}

	public void setEva_bridge_part_id(int eva_bridge_part_id){
		this.eva_bridge_part_id=eva_bridge_part_id;
	}

	public int getEva_bridge_part_id(){
		return eva_bridge_part_id;
	}

	public void setPrj_no(String prj_no){
		this.prj_no=prj_no;
	}

	public String getPrj_no(){
		return prj_no;
	}

	public void setBridge_no(String bridge_no){
		this.bridge_no=bridge_no;
	}

	public String getBridge_no(){
		return bridge_no;
	}

	public void setBridge_type(String bridge_type){
		this.bridge_type=bridge_type;
	}

	public String getBridge_type(){
		return bridge_type;
	}

	public String getEva_bridge_part_value1() {
		return eva_bridge_part_value1;
	}

	public void setEva_bridge_part_value1(String eva_bridge_part_value1) {
		this.eva_bridge_part_value1 = eva_bridge_part_value1;
	}

	public String getEva_bridge_part_value2() {
		return eva_bridge_part_value2;
	}

	public void setEva_bridge_part_value2(String eva_bridge_part_value2) {
		this.eva_bridge_part_value2 = eva_bridge_part_value2;
	}

	public String getEva_bridge_part_value3() {
		return eva_bridge_part_value3;
	}

	public void setEva_bridge_part_value3(String eva_bridge_part_value3) {
		this.eva_bridge_part_value3 = eva_bridge_part_value3;
	}

	public void setEva_bridge_part_value(String eva_bridge_part_value) {
		this.eva_bridge_part_value = eva_bridge_part_value;
	}

	public void setBridge_direction(String bridge_direction){
		this.bridge_direction=bridge_direction;
	}

	public String getBridge_direction(){
		return bridge_direction;
	}

	public void setBridge_spans(String bridge_spans){
		this.bridge_spans=bridge_spans;
	}

	public String getBridge_spans(){
		return bridge_spans;
	}

	public void setEva_bridge_part_index1(byte eva_bridge_part_index1){
		this.eva_bridge_part_index1=eva_bridge_part_index1;
	}

	public byte getEva_bridge_part_index1(){
		return eva_bridge_part_index1;
	}

	public void setEva_bridge_part_index2(byte eva_bridge_part_index2){
		this.eva_bridge_part_index2=eva_bridge_part_index2;
	}

	public byte getEva_bridge_part_index2(){
		return eva_bridge_part_index2;
	}

	public void setEva_bridge_part_index3(byte eva_bridge_part_index3){
		this.eva_bridge_part_index3=eva_bridge_part_index3;
	}

	public byte getEva_bridge_part_index3(){
		return eva_bridge_part_index3;
	}

	public String getEva_bridge_part_value() {
		return eva_bridge_part_value;
	}

	public void setEva_bridge_part_grde(String eva_bridge_part_grde){
		this.eva_bridge_part_grde=eva_bridge_part_grde;
	}

	public String getEva_bridge_part_grde(){
		return eva_bridge_part_grde;
	}

}
