package hs.bm.vo;

import java.util.List;

import hs.bm.bean.DicBrgStructMemberDef;
import hs.bm.bean.DicBrgStructTypeDef;

public class BrgLXVO {
	/**桥型*/
	private List<DicBrgStructTypeDef> qx;
	
	/**构件类型*/
	private List<DicBrgStructMemberDef> gjlx;
	
	/**桥梁编号*/
	private String bridge_id;
	public List<DicBrgStructTypeDef> getQx() {
		return qx;
	}

	public void setQx(List<DicBrgStructTypeDef> qx) {
		this.qx = qx;
	}

	public List<DicBrgStructMemberDef> getGjlx() {
		return gjlx;
	}

	public void setGjlx(List<DicBrgStructMemberDef> gjlx) {
		this.gjlx = gjlx;
	}


	public String getBridge_id() {
		return bridge_id;
	}

	public void setBridge_id(String bridge_id) {
		this.bridge_id = bridge_id;
	}
	
	
	
}
