package hs.bm.vo;
import java.util.List;

import hs.bm.bean.*;
public class DicEval11VO {
	/**指标集编码*/
	private String indexset_id;
	/**指标集名*/
	private String indexset_name;
	/**指标集合*/
	private List<IndexsetIndex> indexs;
	public String getIndexset_id() {
		return indexset_id;
	}
	public void setIndexset_id(String indexset_id) {
		this.indexset_id = indexset_id;
	}
	public String getIndexset_name() {
		return indexset_name;
	}
	public void setIndexset_name(String indexset_name) {
		this.indexset_name = indexset_name;
	}
	public List<IndexsetIndex> getIndexs() {
		return indexs;
	}
	public void setIndexs(List<IndexsetIndex> indexs) {
		this.indexs = indexs;
	}
	
	
	
}
