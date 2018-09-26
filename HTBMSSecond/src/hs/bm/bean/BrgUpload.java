
package hs.bm.bean;

public class BrgUpload {
	
	private int brgId;
	private String brgName;
	private String brgUploadTime;
	private String brgUser;
	private String brgUploadStatus;
	private String brgUrl;
	public BrgUpload() {
		super();
	}
	public BrgUpload(int brgId, String brgName, String brgUploadTime, String brgUser, String brgUploadStatus,
			String brgUrl) {
		super();
		this.brgId = brgId;
		this.brgName = brgName;
		this.brgUploadTime = brgUploadTime;
		this.brgUser = brgUser;
		this.brgUploadStatus = brgUploadStatus;
		this.brgUrl = brgUrl;
	}
	public int getBrgId() {
		return brgId;
	}
	public void setBrgId(int brgId) {
		this.brgId = brgId;
	}
	public String getBrgName() {
		return brgName;
	}
	public void setBrgName(String brgName) {
		this.brgName = brgName;
	}
	public String getBrgUploadTime() {
		return brgUploadTime;
	}
	public void setBrgUploadTime(String brgUploadTime) {
		this.brgUploadTime = brgUploadTime;
	}
	public String getBrgUser() {
		return brgUser;
	}
	public void setBrgUser(String brgUser) {
		this.brgUser = brgUser;
	}
	public String getBrgUploadStatus() {
		return brgUploadStatus;
	}
	public void setBrgUploadStatus(String brgUploadStatus) {
		this.brgUploadStatus = brgUploadStatus;
	}
	public String getBrgUrl() {
		return brgUrl;
	}
	public void setBrgUrl(String brgUrl) {
		this.brgUrl = brgUrl;
	}
	@Override
	public String toString() {
		return "BrgUpload [brgId=" + brgId + ", brgName=" + brgName + ", brgUploadTime=" + brgUploadTime + ", brgUser="
				+ brgUser + ", brgUploadStatus=" + brgUploadStatus + ", brgUrl=" + brgUrl + "]";
	}
	
	

}
