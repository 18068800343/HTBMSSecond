package hs.bm.vo;

public class CheckBrgDefectPhoto {

	private String photo_name;
	private String photo_path;
	
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}
	public String getPhoto_path() {
		return photo_path;
	}
	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}
	@Override
	public String toString() {
		return "CheckBrgDefectPhoto [photo_name=" + photo_name + ", photo_path=" + photo_path + "]";
	}
	
}
