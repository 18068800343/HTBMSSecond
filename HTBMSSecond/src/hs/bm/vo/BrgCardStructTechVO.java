package hs.bm.vo;

import hs.bm.bean.BrgCardDownStruct;
import hs.bm.bean.BrgCardTopStruct;

import java.util.ArrayList;

public class BrgCardStructTechVO
{
	/**桥梁编号*/
	private String bridge_id;
	/**桥长（m）*/
	private String bridge_len;
	/**桥面总宽（m）*/
	private String bridge_width;
	/**车型道宽（m）*/
	private String lane_width;
	/**桥面标高（m）*/
	private String bridge_t_s_height;
	/**桥下静高（m）*/
	private String bridge_b_height;
	/**桥上静高（m）*/
	private String bridge_t_height;
	/**引道总宽（m）*/
	private String approach_total_width;
	/**引道路面宽（m）*/
	private String approach_width;
	/**引道线形*/
	private String approach_line_type;
	/**伸缩缝类型*/
	private String expansion_joint_type;
	/**支座形式*/
	private String support_type;
	/**地震动峰值加速度系数*/
	private String acceleration_factor;
	/**桥台护坡*/
	private String abutment_slope;
	/**护墩体*/
	private String guard_pier_body;
	/**调治结构物*/
	private String treatment_struct;
	/**常水位*/
	private String water_level;
	/**设计水位*/
	private String design_level;
	/**历史洪水位*/
	private String his_flood_level;
	/**上部结构*/
	private ArrayList<BrgCardDownStruct> brgCardDownStruct;
	/**下部结构*/
	private ArrayList<BrgCardTopStruct> brgCardTopStruct;
	
	public String getBridge_id()
	{
		return bridge_id;
	}
	public void setBridge_id(String bridge_id)
	{
		this.bridge_id = bridge_id;
	}
	public String getBridge_len()
	{
		return bridge_len;
	}
	public void setBridge_len(String bridge_len)
	{
		this.bridge_len = bridge_len;
	}
	public String getBridge_width()
	{
		return bridge_width;
	}
	public void setBridge_width(String bridge_width)
	{
		this.bridge_width = bridge_width;
	}
	public String getLane_width()
	{
		return lane_width;
	}
	public void setLane_width(String lane_width)
	{
		this.lane_width = lane_width;
	}
	public String getBridge_t_s_height()
	{
		return bridge_t_s_height;
	}
	public void setBridge_t_s_height(String bridge_t_s_height)
	{
		this.bridge_t_s_height = bridge_t_s_height;
	}
	public String getBridge_b_height()
	{
		return bridge_b_height;
	}
	public void setBridge_b_height(String bridge_b_height)
	{
		this.bridge_b_height = bridge_b_height;
	}
	public String getBridge_t_height()
	{
		return bridge_t_height;
	}
	public void setBridge_t_height(String bridge_t_height)
	{
		this.bridge_t_height = bridge_t_height;
	}
	public String getApproach_total_width()
	{
		return approach_total_width;
	}
	public void setApproach_total_width(String approach_total_width)
	{
		this.approach_total_width = approach_total_width;
	}
	public String getApproach_width()
	{
		return approach_width;
	}
	public void setApproach_width(String approach_width)
	{
		this.approach_width = approach_width;
	}
	public String getApproach_line_type()
	{
		return approach_line_type;
	}
	public void setApproach_line_type(String approach_line_type)
	{
		this.approach_line_type = approach_line_type;
	}
	public String getExpansion_joint_type()
	{
		return expansion_joint_type;
	}
	public void setExpansion_joint_type(String expansion_joint_type)
	{
		this.expansion_joint_type = expansion_joint_type;
	}
	public String getSupport_type()
	{
		return support_type;
	}
	public void setSupport_type(String support_type)
	{
		this.support_type = support_type;
	}
	public String getAcceleration_factor()
	{
		return acceleration_factor;
	}
	public void setAcceleration_factor(String acceleration_factor)
	{
		this.acceleration_factor = acceleration_factor;
	}
	public String getAbutment_slope()
	{
		return abutment_slope;
	}
	public void setAbutment_slope(String abutment_slope)
	{
		this.abutment_slope = abutment_slope;
	}
	public String getGuard_pier_body()
	{
		return guard_pier_body;
	}
	public void setGuard_pier_body(String guard_pier_body)
	{
		this.guard_pier_body = guard_pier_body;
	}
	public String getTreatment_struct()
	{
		return treatment_struct;
	}
	public void setTreatment_struct(String treatment_struct)
	{
		this.treatment_struct = treatment_struct;
	}
	public String getWater_level()
	{
		return water_level;
	}
	public void setWater_level(String water_level)
	{
		this.water_level = water_level;
	}
	public String getDesign_level()
	{
		return design_level;
	}
	public void setDesign_level(String design_level)
	{
		this.design_level = design_level;
	}
	public String getHis_flood_level()
	{
		return his_flood_level;
	}
	public void setHis_flood_level(String his_flood_level)
	{
		this.his_flood_level = his_flood_level;
	}
	public ArrayList<BrgCardDownStruct> getBrgCardDownStruct()
	{
		return brgCardDownStruct;
	}
	public void setBrgCardDownStruct(ArrayList<BrgCardDownStruct> brgCardDownStruct)
	{
		this.brgCardDownStruct = brgCardDownStruct;
	}
	public ArrayList<BrgCardTopStruct> getBrgCardTopStruct()
	{
		return brgCardTopStruct;
	}
	public void setBrgCardTopStruct(ArrayList<BrgCardTopStruct> brgCardTopStruct)
	{
		this.brgCardTopStruct = brgCardTopStruct;
	}
}
