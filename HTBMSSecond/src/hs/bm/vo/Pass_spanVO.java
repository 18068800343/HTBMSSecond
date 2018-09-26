package hs.bm.vo;

public class Pass_spanVO
{
	private String s_id;
	private String pass_id;
	public String getS_id()
	{
		return s_id;
	}
	public void setS_id(String s_id)
	{
		this.s_id = s_id;
	}
	public String getPass_id()
	{
		return pass_id;
	}
	public void setPass_id(String pass_id)
	{
		this.pass_id = pass_id;
	}
	public String getDirection()
	{
		return direction;
	}
	public void setDirection(String direction)
	{
		this.direction = direction;
	}
	public String getSpan_no()
	{
		return span_no;
	}
	public void setSpan_no(String span_no)
	{
		this.span_no = span_no;
	}
	public String getPass_type_id()
	{
		return pass_type_id;
	}
	public void setPass_type_id(String pass_type_id)
	{
		this.pass_type_id = pass_type_id;
	}
	public String getPass_type_name()
	{
		return pass_type_name;
	}
	public void setPass_type_name(String pass_type_name)
	{
		this.pass_type_name = pass_type_name;
	}
	private String direction;
	private String span_no;
	private String pass_type_id;
	private String pass_type_name;
}
