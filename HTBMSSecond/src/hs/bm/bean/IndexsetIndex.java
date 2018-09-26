package hs.bm.bean;

public class IndexsetIndex {

	/**指标编码*/
	private String index_id;
	/**指标编号*/
	private String index_no;
	/**指标名*/
	private String index_name;
	/**标度最大值*/
	private String index_scalemax;
	/**标度范围*/
	private String index_scale;
	/**指标集编码*/
	private String indexset_id;

	public void setIndex_id(String index_id){
		this.index_id=index_id;
	}

	public String getIndex_id(){
		return index_id;
	}

	public void setIndex_no(String index_no){
		this.index_no=index_no;
	}

	public String getIndex_no(){
		return index_no;
	}

	public void setIndex_name(String index_name){
		this.index_name=index_name;
	}

	public String getIndex_name(){
		return index_name;
	}

	

	public String getIndex_scalemax() {
		return index_scalemax;
	}

	public void setIndex_scalemax(String index_scalemax) {
		this.index_scalemax = index_scalemax;
	}

	public void setIndex_scale(String index_scale){
		this.index_scale=index_scale;
	}

	public String getIndex_scale(){
		return index_scale;
	}

	public void setIndexset_id(String indexset_id){
		this.indexset_id=indexset_id;
	}

	public String getIndexset_id(){
		return indexset_id;
	}

}
