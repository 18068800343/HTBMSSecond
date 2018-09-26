
package hs.bm.bean;

public class BrgMonitorStrainc {

	private String monitor_id;
	private String time;
	private String mode;
	private String max;
	private String tantile_95;
	private String min;
	private String tantile_5;
	private String variance;
	private String type;
    private String avg;
    private Integer sort;
	public BrgMonitorStrainc() {
		super();
	}
	public BrgMonitorStrainc(String monitor_id, String time, String mode, String max, String tantile_95, String min,
			String tantile_5, String variance, String type, String avg, Integer sort) {
		super();
		this.monitor_id = monitor_id;
		this.time = time;
		this.mode = mode;
		this.max = max;
		this.tantile_95 = tantile_95;
		this.min = min;
		this.tantile_5 = tantile_5;
		this.variance = variance;
		this.type = type;
		this.avg = avg;
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
	public String getTantile_95() {
		return tantile_95;
	}
	public void setTantile_95(String tantile_95) {
		this.tantile_95 = tantile_95;
	}
	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}
	public String getTantile_5() {
		return tantile_5;
	}
	public void setTantile_5(String tantile_5) {
		this.tantile_5 = tantile_5;
	}
	public String getVariance() {
		return variance;
	}
	public void setVariance(String variance) {
		this.variance = variance;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAvg() {
		return avg;
	}
	public void setAvg(String avg) {
		this.avg = avg;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
    
}
