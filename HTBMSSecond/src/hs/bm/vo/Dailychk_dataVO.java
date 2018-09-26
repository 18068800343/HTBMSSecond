package hs.bm.vo;

public class Dailychk_dataVO
{
	private String brg_id;
	private String brg_no;
	private String brg_name;
	private String audit_state;
	private String chk_id;
	private String line_name;	
	public String getLine_name()
	{
		return line_name;
	}

	public void setLine_name(String line_name)
	{
		this.line_name = line_name;
	}

	public String getChk_id()
	{
		return chk_id;
	}

	public void setChk_id(String chk_id)
	{
		this.chk_id = chk_id;
	}

	private String prj_id;
	public String getBrg_id()
	{
		return brg_id;
	}

	public void setBrg_id(String brg_id)
	{
		this.brg_id = brg_id;
	}

	public String getBrg_no()
	{
		return brg_no;
	}

	public void setBrg_no(String brg_no)
	{
		this.brg_no = brg_no;
	}

	public String getBrg_name()
	{
		return brg_name;
	}

	public void setBrg_name(String brg_name)
	{
		this.brg_name = brg_name;
	}

	public String getAudit_state()
	{
		return audit_state;
	}

	public void setAudit_state(String audit_state)
	{
		this.audit_state = audit_state;
	}

	public String getPrj_id()
	{
		return prj_id;
	}

	public void setPrj_id(String prj_id)
	{
		this.prj_id = prj_id;
	}



}
