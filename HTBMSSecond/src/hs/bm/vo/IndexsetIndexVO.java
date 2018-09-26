package hs.bm.vo;

public class IndexsetIndexVO {

	/**指标编码*/
	private String index_id;
	/**指标名*/
	private String index_name;
	/**标度范围*/
	private String index_scale;
	/**指标集编码*/
	private String indexset_id;
	/**指标对应的分值*/
	private String value;
	public String getIndex_id() {
		return index_id;
	}
	public void setIndex_id(String index_id) {
		this.index_id = index_id;
	}
	public String getIndex_name() {
		return index_name;
	}
	public void setIndex_name(String index_name) {
		this.index_name = index_name;
	}
	public String getIndex_scale() {
		return index_scale;
	}
	public void setIndex_scale(String index_scale) {
		this.index_scale = index_scale;
	}
	public String getIndexset_id() {
		return indexset_id;
	}
	public void setIndexset_id(String indexset_id) {
		this.indexset_id = indexset_id;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
}
