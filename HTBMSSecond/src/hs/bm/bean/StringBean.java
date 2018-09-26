package hs.bm.bean;

public class StringBean {

	private String table_name;

	public StringBean() {
		super();
	}

	public StringBean(String table_name) {
		super();
		this.table_name = table_name;
	}

	public String getStr() {
		return table_name;
	}

	public void setStr(String table_name) {
		this.table_name = table_name;
	}

	@Override
	public String toString() {
		return "StringBean [table_name=" + table_name + "]";
	}
	
	
}
