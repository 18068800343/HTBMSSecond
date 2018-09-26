package hs.bm.bean;

public class PassPrjPhoto {

	/***/
	private String pass_id;
	/**项目编号*/
	private String prj_id;
	/**文件路径*/
	private String path;
	/**正面照或立面照*/
	private String photo_type;

	public void setPass_id(String pass_id){
		this.pass_id=pass_id;
	}

	public String getPass_id(){
		return pass_id;
	}

	public void setPrj_id(String prj_id){
		this.prj_id=prj_id;
	}

	public String getPrj_id(){
		return prj_id;
	}

	public void setPath(String path){
		this.path=path;
	}

	public String getPath(){
		return path;
	}

	public void setPhoto_type(String photo_type){
		this.photo_type=photo_type;
	}

	public String getPhoto_type(){
		return photo_type;
	}

}
