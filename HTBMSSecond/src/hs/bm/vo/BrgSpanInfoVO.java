package hs.bm.vo;

public class BrgSpanInfoVO
{
	/** 编号 */
	private String s_id;
	/** 桥梁编号 */
	private String bridge_id;
	/** 方向 */
	private String direction;
	/** 跨号 */
	private String span_no;
	/** 桥型编码 */
	private String brg_type_id;
	/** 桥型名称 */
	private String brg_type_name;
	/** 连号 */
	private String span_line_no;
	/*跨径*/
	private String span_length;
	/*材料*/
	private String span_material;
	/*跨越情况*/
	private String spanning_case;
	/*净空*/
	private String clearance;
	
	
	public String getSpan_length()
	{
		return span_length;
	}

	public void setSpan_length(String span_length)
	{
		this.span_length = span_length;
	}

	public String getSpan_material()
	{
		return span_material;
	}

	public void setSpan_material(String span_material)
	{
		this.span_material = span_material;
	}

	public String getSpanning_case()
	{
		return spanning_case;
	}

	public void setSpanning_case(String spanning_case)
	{
		this.spanning_case = spanning_case;
	}

	public String getClearance()
	{
		return clearance;
	}

	public void setClearance(String clearance)
	{
		this.clearance = clearance;
	}

	public String getSpan_line_no()
	{
		return span_line_no;
	}

	public void setSpan_line_no(String span_line_no)
	{
		this.span_line_no = span_line_no;
	}

	public String getS_id()
	{
		return s_id;
	}

	public void setS_id(String s_id)
	{
		this.s_id = s_id;
	}

	public String getBridge_id()
	{
		return bridge_id;
	}

	public void setBridge_id(String bridge_id)
	{
		this.bridge_id = bridge_id;
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

	public String getBrg_type_id()
	{
		return brg_type_id;
	}

	public void setBrg_type_id(String brg_type_id)
	{
		this.brg_type_id = brg_type_id;
	}

	public String getBrg_type_name()
	{
		return brg_type_name;
	}

	public void setBrg_type_name(String brg_type_name)
	{
		this.brg_type_name = brg_type_name;
	}

	@Override
	public String toString() {
		return "BrgSpanInfoVO [s_id=" + s_id + ", bridge_id=" + bridge_id + ", direction=" + direction + ", span_no="
				+ span_no + ", brg_type_id=" + brg_type_id + ", brg_type_name=" + brg_type_name + ", span_line_no="
				+ span_line_no + ", span_length=" + span_length + ", span_material=" + span_material
				+ ", spanning_case=" + spanning_case + ", clearance=" + clearance + "]";
	}

}
