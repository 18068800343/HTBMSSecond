package hs.bm.vo;

import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicBrgStructTypeDef;

public class BrgStructTypeVO {
   private String brg_base_type;
   private List<DicBrgStructTypeDef> ll;
   public BrgStructTypeVO(){
	ll=new ArrayList<DicBrgStructTypeDef>();
}
public String getBrg_base_type() {
	return brg_base_type;
}
public void setBrg_base_type(String brg_base_type) {
	this.brg_base_type = brg_base_type;
}
public List<DicBrgStructTypeDef> getLl() {
	return ll;
}
public void setLl(List<DicBrgStructTypeDef> ll) {
	this.ll = ll;
}
}
