package hs.bm.vo;

import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicBrgCardItem;

public class BridgeCardTreeInfo {
	
	private String root;
	private List<DicBrgCardItem> items;
	
	public BridgeCardTreeInfo(){
		items = new ArrayList<DicBrgCardItem>();
	}
	
	public String getRoot() {
		return root;
	}
	public void setRoot(String root) {
		this.root = root;
	}
	public List<DicBrgCardItem> getItems() {
		return items;
	}
	public void setItems(List<DicBrgCardItem> items) {
		this.items = items;
	}
	
	

}
