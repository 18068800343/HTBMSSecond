
package hs.bm.bean;

public class BrgMonitor {

	private String monitor_id;//监测编号
	private String brg_id;//桥梁编号
	private int item_id;//类型编号
	private String ChanelNum;//通道号
	private String pointsNo;//测点号
	private String projectImage;//工程图
	public BrgMonitor() {
		super();
	}
	public BrgMonitor(String monitor_id, String brg_id, int item_id, String chanelNum, String pointsNo,
			String projectImage) {
		super();
		this.monitor_id = monitor_id;
		this.brg_id = brg_id;
		this.item_id = item_id;
		ChanelNum = chanelNum;
		this.pointsNo = pointsNo;
		this.projectImage = projectImage;
	}
	public String getMonitor_id() {
		return monitor_id;
	}
	public void setMonitor_id(String monitor_id) {
		this.monitor_id = monitor_id;
	}
	public String getBrg_id() {
		return brg_id;
	}
	public void setBrg_id(String brg_id) {
		this.brg_id = brg_id;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String getChanelNum() {
		return ChanelNum;
	}
	public void setChanelNum(String chanelNum) {
		ChanelNum = chanelNum;
	}
	public String getPointsNo() {
		return pointsNo;
	}
	public void setPointsNo(String pointsNo) {
		this.pointsNo = pointsNo;
	}
	public String getProjectImage() {
		return projectImage;
	}
	public void setProjectImage(String projectImage) {
		this.projectImage = projectImage;
	}
	
	
}
