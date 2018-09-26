package hs.bm.bean;

public class BrgSystem {
	private String id;
	private String mode;
	private String bridge_id;
	private String dir_name;
	private String monitor_starttime;
	private String out_time;
	private String brg_pass_no;
	private String brg_name;
	public BrgSystem() {
		super();
	}
	public BrgSystem(String id, String mode, String bridge_id, String dir_name, String monitor_starttime,
			String out_time, String brg_pass_no, String brg_name) {
		super();
		this.id = id;
		this.mode = mode;
		this.bridge_id = bridge_id;
		this.dir_name = dir_name;
		this.monitor_starttime = monitor_starttime;
		this.out_time = out_time;
		this.brg_pass_no = brg_pass_no;
		this.brg_name = brg_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getBridge_id() {
		return bridge_id;
	}
	public void setBridge_id(String bridge_id) {
		this.bridge_id = bridge_id;
	}
	public String getDir_name() {
		return dir_name;
	}
	public void setDir_name(String dir_name) {
		this.dir_name = dir_name;
	}
	public String getMonitor_starttime() {
		return monitor_starttime;
	}
	public void setMonitor_starttime(String monitor_starttime) {
		this.monitor_starttime = monitor_starttime;
	}
	public String getOut_time() {
		return out_time;
	}
	public void setOut_time(String out_time) {
		this.out_time = out_time;
	}
	public String getBrg_pass_no() {
		return brg_pass_no;
	}
	public void setBrg_pass_no(String brg_pass_no) {
		this.brg_pass_no = brg_pass_no;
	}
	public String getBrg_name() {
		return brg_name;
	}
	public void setBrg_name(String brg_name) {
		this.brg_name = brg_name;
	}
	@Override
	public String toString() {
		return "BrgSystem [id=" + id + ", mode=" + mode + ", bridge_id=" + bridge_id + ", dir_name=" + dir_name
				+ ", monitor_starttime=" + monitor_starttime + ", out_time=" + out_time + ", brg_pass_no=" + brg_pass_no
				+ ", brg_name=" + brg_name + "]";
	}
	
}
