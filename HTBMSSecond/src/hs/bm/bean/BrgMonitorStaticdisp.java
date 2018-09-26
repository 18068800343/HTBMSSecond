package hs.bm.bean;

public class BrgMonitorStaticdisp {

	private String monitor_id;
	private String time;
	private String mode;
	private String max;
	private String min;
	private String type;
	private Integer sort;
	public BrgMonitorStaticdisp() {
		super();
	}
	public BrgMonitorStaticdisp(String monitor_id, String time, String mode, String max, String min, String type,
			Integer sort) {
		super();
		this.monitor_id = monitor_id;
		this.time = time;
		this.mode = mode;
		this.max = max;
		this.min = min;
		this.type = type;
		this.sort = sort;
	}
	public String getMonitor_id() {
		return monitor_id;
	}
	public void setMonitor_id(String monitor_id) {
		this.monitor_id = monitor_id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
}
