package hs.bm.bean;

public class BrgCardDocumentIndex {

	/**编号*/
	private String r_id;
	/**桥梁编号*/
	private String bridge_id;
	/**存储路径*/
	private String path;
	/**类型（立面照、正面照、设计图纸、设计文件等）*/
	private String type;

	public void setR_id(String r_id){
		this.r_id=r_id;
	}

	public String getR_id(){
		return r_id;
	}

	public void setBridge_id(String bridge_id){
		this.bridge_id=bridge_id;
	}

	public String getBridge_id(){
		return bridge_id;
	}

	public void setPath(String path){
		this.path=path;
	}

	public String getPath(){
		return path;
	}

	public void setType(String type){
		this.type=type;
	}

	public String getType(){
		return type;
	}

}
