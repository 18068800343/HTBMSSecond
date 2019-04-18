package hs.bm.bean;

import java.util.ArrayList;
import java.util.List;

public class Connect {
	
	private String id;
	private String name;
	private String type;
	private String bgco;
	private String name_no;
	
	private List<Connect> children;
	
	public Connect(){
		this.children = new ArrayList<Connect>();
		
	}

	
	
	public String getName_no() {
		return name_no;
	}



	public void setName_no(String name_no) {
		this.name_no = name_no;
	}



	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBgco() {
		return bgco;
	}

	public void setBgco(String bgco) {
		this.bgco = bgco;
	}

	public List<Connect> getChildren() {
		return children;
	}

	public void setChildren(List<Connect> children) {
		this.children = children;
	}
	
	
	

}
