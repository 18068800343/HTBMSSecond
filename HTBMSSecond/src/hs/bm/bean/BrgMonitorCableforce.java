/**
 * <p>Title: BrgMonitorCableforce.java</p>
 * <p>Description: 华通桥涵管理系统</p>
 * <p>Company: 环水信息技术有限公司</p>
 * @author 马潇霄
 * @version 1.0 创建时间：2017年10月16日 上午11:25:48
 */

package hs.bm.bean;

public class BrgMonitorCableforce {

	private String monitor_id;
	private String time;
	private String mode;
	private String avg;
	private String type;
	private Integer sort;
	public BrgMonitorCableforce() {
		super();
	}
	public BrgMonitorCableforce(String monitor_id, String time, String mode, String avg, String type, Integer sort) {
		super();
		this.monitor_id = monitor_id;
		this.time = time;
		this.mode = mode;
		this.avg = avg;
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
	public String getAvg() {
		return avg;
	}
	public void setAvg(String avg) {
		this.avg = avg;
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
