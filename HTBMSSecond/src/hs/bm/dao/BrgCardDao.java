package hs.bm.dao;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgCardConstructPrj;
import hs.bm.bean.BrgCardConstructPrjMemo;
import hs.bm.bean.BrgCardDocument;
import hs.bm.bean.BrgCardDownStruct;
import hs.bm.bean.BrgCardEvaluation;
import hs.bm.bean.BrgCardTopStruct;
import hs.bm.bean.BrgPrjPhoto;
import hs.bm.bean.BrgSpanInfo;
import hs.bm.bean.DicBrgCardDomain;
import hs.bm.bean.DicBrgStructTypeDef;
import hs.bm.bean.DicManageSection;
import hs.bm.bean.DicManageZone;
import hs.bm.bean.SysUsrUsrInfo;
import hs.bm.util.IDtool;
import hs.bm.util.Nullchange;
import hs.bm.vo.BrgCardConstructPrjVO;
import hs.bm.vo.BrgCardInfoVO;
import hs.bm.vo.BrgCardStructTechVO;
import hs.bm.vo.BrgSpanForCardVO;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

public class BrgCardDao
{
	private static BrgCardDao brgCardDao;

	public static BrgCardDao getInstance()
	{
		if (brgCardDao == null)
		{
			brgCardDao = new BrgCardDao();
		}
		return brgCardDao;
	}

	/**
	 * 查询行政识别数据
	 * @author sundj
	 * @param bridge_id 桥梁id
	 * @return BrgCardInfo 行政识别数据
	 */
	public ArrayList<BrgCardInfoVO> getAdministrativeIdentificationData(String bridge_id)
	{
		ArrayList<BrgCardInfoVO> list = new ArrayList<BrgCardInfoVO>();
		String sql = " SELECT *,e.section_name as s_name FROM brg_card_admin_id AS a LEFT JOIN dic_hw_info AS b ON a.highway_id=b.highway_id LEFT JOIN sys_org_info AS c ON a.manage_id = c.org_id LEFT JOIN sys_zone_info AS d ON a.zone_id = d.zone_id LEFT JOIN sys_section_info AS e ON a.section_id = e.section_id WHERE a.bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			while (rs.next())
			{
				BrgCardInfoVO entity = new BrgCardInfoVO();
				entity.setBridge_id(Nullchange.NulltoString(bridge_id));
				entity.setHighway_id(Nullchange.NulltoString(rs.getString("highway_id")));
				entity.setHighway_no(Nullchange.NulltoString(rs.getString("highway_no")));
				entity.setHighway_name(Nullchange.NulltoString(rs.getString("highway_name")));
				entity.setHighway_level(Nullchange.NulltoString(rs.getString("highway_level")));
				entity.setBridge_no(Nullchange.NulltoString(rs.getString("bridge_no")));
				entity.setBridge_name(Nullchange.NulltoString(rs.getString("bridge_name")));
				entity.setBridge_pile_no(Nullchange.NulltoString(rs.getString("bridge_pile_no")));
				entity.setFunction_type(Nullchange.NulltoString(rs.getString("function_type")));
				entity.setBeneath_path_name(Nullchange.NulltoString(rs.getString("beneath_path_name")));
				entity.setBeneath_path_pile_no(Nullchange.NulltoString(rs.getString("beneath_path_pile_no")));
				entity.setDesign_load(Nullchange.NulltoString(rs.getString("design_load")));
				entity.setPass_load(Nullchange.NulltoString(rs.getString("pass_load")));
				entity.setSkew_slope(Nullchange.NulltoString(rs.getString("skew_slope")));
				entity.setDeck_pavement(Nullchange.NulltoString(rs.getString("deck_pavement")));
				entity.setManage_id(Nullchange.NulltoString(rs.getString("org_id")));
				entity.setManage_name(Nullchange.NulltoString(rs.getString("org_name")));
				entity.setBuild_year(Nullchange.NulltoString(rs.getString("build_year")));
				entity.setSpan_build(Nullchange.NulltoString(rs.getString("span_build")));
				entity.setZone_id(Nullchange.NulltoString(rs.getString("zone_id")));
				entity.setZone_name(Nullchange.NulltoString(rs.getString("zone_name")));
				entity.setSection_id(Nullchange.NulltoString(rs.getString("section_id")));
				entity.setSection_name(Nullchange.NulltoString(rs.getString("s_name")));
				entity.setBridge_mode(Nullchange.NulltoString(rs.getString("bridge_mode")));
				entity.setLongitude(Nullchange.NulltoString(rs.getString("longitude")));
				entity.setLatitude(Nullchange.NulltoString(rs.getString("latitude")));
				entity.setMax_kuajing(Nullchange.NulltoString(rs.getString("max_kuajing")));
				entity.setMain_kuajiegou(Nullchange.NulltoString(rs.getString("main_kuajiegou")));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	/**
	 * 
	 * @param bridge_id
	 * @return
	 */
	public ArrayList<BrgCardStructTechVO> getBrgCardStructTechData(String bridge_id)
	{
		isBrgCardTopStructExit(bridge_id);
		isBrgCardDownStructExit(bridge_id);
		ArrayList<BrgCardStructTechVO> brgCardStructTech = new ArrayList<BrgCardStructTechVO>();
		String sql = " SELECT * FROM brg_card_struct_tech WHERE bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			while (rs.next())
			{
				BrgCardStructTechVO entity = new BrgCardStructTechVO();
				entity.setBridge_len(Nullchange.NulltoString(rs.getString("bridge_len")));
				entity.setBridge_width(Nullchange.NulltoString(rs.getString("bridge_width")));
				entity.setLane_width(Nullchange.NulltoString(rs.getString("lane_width")));
				entity.setBridge_t_s_height(Nullchange.NulltoString(rs.getString("bridge_t_s_height")));
				entity.setBridge_b_height(Nullchange.NulltoString(rs.getString("bridge_b_height")));
				entity.setBridge_t_height(Nullchange.NulltoString(rs.getString("bridge_t_height")));
				entity.setApproach_total_width(Nullchange.NulltoString(rs.getString("approach_total_width")));
				entity.setApproach_width(Nullchange.NulltoString(rs.getString("approach_width")));
				entity.setApproach_line_type(Nullchange.NulltoString(rs.getString("approach_line_type")));
				entity.setExpansion_joint_type(Nullchange.NulltoString(rs.getString("expansion_joint_type")));
				entity.setSupport_type(Nullchange.NulltoString(rs.getString("support_type")));
				entity.setAcceleration_factor(Nullchange.NulltoString(rs.getString("acceleration_factor")));
				entity.setAbutment_slope(Nullchange.NulltoString(rs.getString("abutment_slope")));
				entity.setGuard_pier_body(Nullchange.NulltoString(rs.getString("guard_pier_body")));
				entity.setTreatment_struct(Nullchange.NulltoString(rs.getString("treatment_struct")));
				entity.setWater_level(Nullchange.NulltoString(rs.getString("water_level")));
				entity.setDesign_level(Nullchange.NulltoString(rs.getString("design_level")));
				entity.setHis_flood_level(Nullchange.NulltoString(rs.getString("his_flood_level")));
				entity.setBrgCardDownStruct(getBrgCardDownStructData(bridge_id));
				entity.setBrgCardTopStruct(getBrgCardTopStructData(bridge_id));
				brgCardStructTech.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgCardStructTech;
		
	}
	public int isBrgCardDownStructExit(String bridge_id){
		int i =0;
		String sql = " SELECT * FROM brg_card_down_struct WHERE bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			if(!rs.next()){
				addDown(bridge_id, IDtool.getUUID().replace("-", ""));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return i;
	}
	
	public int isBrgCardTopStructExit(String bridge_id){
		int i =0;
		String sql = " SELECT * FROM brg_card_top_struct WHERE bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			if(!rs.next()){
				addTop(bridge_id, IDtool.getUUID().replace("-", ""));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return i;
	}
	
	/*
	 * update by @author xn
	 * */
	public Map<String, List<BrgSpanForCardVO>> getBrgSpanForCardVO_ByDirection(String brg_id,String direction,List<BrgSpanInfo> directions){
		Map<String, List<BrgSpanForCardVO>> map = new HashMap<>();
		List<BrgSpanForCardVO> list = new ArrayList<BrgSpanForCardVO>();
		List<BrgSpanForCardVO> listCompare = new ArrayList<BrgSpanForCardVO>();
		List<BrgSpanForCardVO> listRest = new ArrayList<BrgSpanForCardVO>();
		listCompare = getBrgSpanForCardVOTo(brg_id,direction);
		String sql = " SELECT DISTINCT a.span_no,b.brg_type_name,a.span_length,a.span_material  from brg_span_info  AS a LEFT JOIN dic_brg_struct_type_def AS b ON a.brg_type_id = b.brg_type_id WHERE a.bridge_id=? and a.direction=? ORDER BY a.span_no ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ brg_id , direction});
		try
		{
			while (rs.next())
			{
				BrgSpanForCardVO entity = new BrgSpanForCardVO();
				entity.setSpan_no(rs.getString("span_no"));
				entity.setSpan_length(rs.getString("span_length"));
				entity.setSpan_material(rs.getString("span_material"));
				entity.setBrg_type_name(rs.getString("brg_type_name"));
				list.add(entity);
			}
			
		for(int i=0;i<listCompare.size();i++){
			BrgSpanForCardVO brgCompare = listCompare.get(i);
			for(int k=0;k<list.size();k++){
				BrgSpanForCardVO primaryVo = list.get(k);
				if(ifEquals(brgCompare,primaryVo)){
					list.remove(k);
					listRest.add(primaryVo);
				}
			}
		}
		map.put("list",list);
		map.put("listRest",listRest);
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return map;
	}
	
	//@author xianing
	public List<BrgSpanForCardVO> getBrgSpanForCardVOTo(String brg_id,String direction){
		List<BrgSpanForCardVO> list = new ArrayList<BrgSpanForCardVO>();
		String sql = " SELECT DISTINCT a.span_no,b.brg_type_name,a.span_length,a.span_material  from brg_span_info  AS a LEFT JOIN dic_brg_struct_type_def AS b ON a.brg_type_id = b.brg_type_id WHERE a.bridge_id=?  and a.direction=?  ORDER BY a.span_no ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ brg_id ,getAnothorDirection(direction)});
		try
		{
			while (rs.next())
			{
				BrgSpanForCardVO entity = new BrgSpanForCardVO();
				entity.setSpan_no(rs.getString("span_no"));
				entity.setSpan_length(rs.getString("span_length"));
				entity.setSpan_material(rs.getString("span_material"));
				entity.setBrg_type_name(rs.getString("brg_type_name"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	public List<BrgSpanForCardVO> getBrgSpanForCardVO(String brg_id){
		List<BrgSpanForCardVO> list = new ArrayList<BrgSpanForCardVO>();
		String sql = " SELECT DISTINCT a.span_no,b.brg_type_name,a.span_length,a.span_material  from brg_span_info  AS a LEFT JOIN dic_brg_struct_type_def AS b ON a.brg_type_id = b.brg_type_id WHERE a.bridge_id=? ORDER BY a.span_no ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ brg_id });
		try
		{
			while (rs.next())
			{
				BrgSpanForCardVO entity = new BrgSpanForCardVO();
				entity.setSpan_no(rs.getString("span_no"));
				entity.setSpan_length(rs.getString("span_length"));
				entity.setSpan_material(rs.getString("span_material"));
				entity.setBrg_type_name(rs.getString("brg_type_name"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	public List<BrgSpanInfo> getBrgSpan_direction(String brg_id){
		List<BrgSpanInfo> list = new ArrayList<BrgSpanInfo>();
		String sql = " SELECT  direction FROM brg_span_info WHERE bridge_id=? GROUP BY direction ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ brg_id });
		try
		{
			while (rs.next())
			{
				BrgSpanInfo entity = new BrgSpanInfo();
				entity.setDirection(rs.getString("direction"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	/**
	 * 查询下部结构
	 * @author sundj
	 * @param bridge_id
	 * @return ArrayList<BrgCardDownStruct>
	 */
	public ArrayList<BrgCardDownStruct> getBrgCardDownStructData(String bridge_id)
	{
		ArrayList<BrgCardDownStruct> brgCardDownStruct = new ArrayList<BrgCardDownStruct>();
		String sql = " SELECT * FROM brg_card_down_struct WHERE bridge_id=? order by down_struct_pier ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			while (rs.next())
			{
				BrgCardDownStruct entity  = new BrgCardDownStruct();
				entity.setDown_struct_id(Nullchange.NulltoString(rs.getString("down_struct_id")));
				entity.setDown_struct_pier(Nullchange.NulltoString(rs.getString("down_struct_pier")));
				entity.setDown_struct_type(Nullchange.NulltoString(rs.getString("down_struct_type")));
				entity.setDown_struct_stuff(Nullchange.NulltoString(rs.getString("down_struct_stuff")));
				entity.setDown_struct_base_type(Nullchange.NulltoString(rs.getString("down_struct_base_type")));
				entity.setIs_wade(Nullchange.NulltoString(rs.getString("is_wade")));
				brgCardDownStruct.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgCardDownStruct;
	}
	/**
	 *查询下部结构
	 * @author sundj
	 * @param bridge_id
	 * @return brgCardTopStruct
	 * @update by xianing
	 */
	public ArrayList<BrgCardTopStruct> getBrgCardTopStructData(String bridge_id)
	{
		ArrayList<BrgCardTopStruct> brgCardTopStruct = new ArrayList<BrgCardTopStruct>();
		String sql = " SELECT * FROM brg_card_top_struct WHERE bridge_id=?  ORDER BY "
			       + " CASE WHEN top_struct_hole_no LIKE '%上行%' THEN "
				   + " concat_ws('上行',substring(top_struct_hole_no, 3, 2))*1 WHEN "
				   + " top_struct_hole_no LIKE '%下行%' THEN	"
				   + " concat_ws('下行',substring(top_struct_hole_no, 3, 2))*1 ELSE top_struct_hole_no*1 END ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
				while (rs.next())
				{
					BrgCardTopStruct entity = new BrgCardTopStruct();
					entity.setTop_struct_hole_no(Nullchange.NulltoString(rs.getString("top_struct_hole_no")));
					entity.setTop_struct_type(Nullchange.NulltoString(rs.getString("top_struct_type")));
					entity.setTop_struct_span(Nullchange.NulltoString(rs.getString("top_struct_span")));
					entity.setTop_struct_stuff(Nullchange.NulltoString(rs.getString("top_struct_stuff")));
					entity.setTop_struct_id(Nullchange.NulltoString(rs.getString("top_struct_id")));
					brgCardTopStruct.add(entity);
				} 
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgCardTopStruct;
	}
	/**
	 * 获取桥梁卡片档案资料
	 * @author sundj
	 * @param bridge_id
	 * @return brgCardDocument
	 */
	public ArrayList<BrgCardDocument> getBrgCardDocumentData(String bridge_id){
		ArrayList<BrgCardDocument> brgCardDocument = new ArrayList<BrgCardDocument>();
		String sql = " SELECT * FROM brg_card_document WHERE bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			while (rs.next())
			{
				BrgCardDocument entity = new BrgCardDocument();
				entity.setBlueprint_state(Nullchange.NulltoString(rs.getString("blueprint_state")));
				entity.setDesign_file_state(Nullchange.NulltoString(rs.getString("design_file_state")));
				entity.setConstruct_file_state(Nullchange.NulltoString(rs.getString("construct_file_state")));
				entity.setComplete_file_state(Nullchange.NulltoString(rs.getString("complete_file_state")));
				entity.setAcceptance_file_state(Nullchange.NulltoString(rs.getString("acceptance_file_state")));
				entity.setAdministrate_file_state(Nullchange.NulltoString(rs.getString("administrate_file_state")));
				entity.setRegular_report_state(Nullchange.NulltoString(rs.getString("regular_report_state")));
				entity.setSpecial_report_state(Nullchange.NulltoString(rs.getString("special_report_state")));
				entity.setHistory_maintain_state(Nullchange.NulltoString(rs.getString("history_maintain_state")));
				entity.setDocument_no(Nullchange.NulltoString(rs.getString("document_no")));
				entity.setDocument(Nullchange.NulltoString(rs.getString("document")));
				entity.setDocument_time(Nullchange.NulltoString(rs.getString("document_time")));
				brgCardDocument.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgCardDocument;
	}
	
	/**
	 * 获取桥梁状态卡片_最近技术状况评定数据
	 * @author sundj
	 * @param bridge_id
	 * @return brgCardEvaluation
	 */
	public ArrayList<BrgCardEvaluation> getBrgCardEvaluationData(String bridge_id){
		ArrayList<BrgCardEvaluation> brgCardEvaluation = new ArrayList<BrgCardEvaluation>();
		String sql = " SELECT * FROM brg_card_evaluation WHERE bridge_id = ? ORDER BY check_ym  ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			while (rs.next())
			{
				BrgCardEvaluation entity = new BrgCardEvaluation();
				entity.setR_id(Nullchange.NulltoString(rs.getString("r_id")));
				entity.setCheck_ym(Nullchange.NulltoString(rs.getString("check_ym")));
				entity.setEva_type(Nullchange.NulltoString(rs.getString("eva_type")));
				entity.setEva_level(Nullchange.NulltoString(rs.getString("eva_level")));
				entity.setAbutment(Nullchange.NulltoString(rs.getString("abutment")));
				entity.setPier(Nullchange.NulltoString(rs.getString("pier")));
				entity.setErosion(Nullchange.NulltoString(rs.getString("erosion")));
				entity.setTop_structure(Nullchange.NulltoString(rs.getString("top_structure")));
				entity.setSupport(Nullchange.NulltoString(rs.getString("support")));
				entity.setIs_often_maintain(Nullchange.NulltoString(rs.getString("is_often_maintain")));
				entity.setTreatment(Nullchange.NulltoString(rs.getString("treatment")));
				entity.setNext_time_year(Nullchange.NulltoString(rs.getString("next_time_year")));
				brgCardEvaluation.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgCardEvaluation;
	}
	
	/**
	 * 获取桥梁BrgCardConstructPrj数据
	 * @param bridge_id
	 * @return BrgCardConstructPrj
	 */
	public ArrayList<BrgCardConstructPrj> getBrgCardConstructPrjData(String bridge_id){
		ArrayList<BrgCardConstructPrj> brgCardConstructPrj = new ArrayList<BrgCardConstructPrj>();
		String sql = " SELECT * FROM brg_card_construct_prj WHERE bridge_id = ? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			while (rs.next())
			{
				BrgCardConstructPrj entity = new BrgCardConstructPrj();
				entity.setR_id(Nullchange.NulltoString(rs.getString("r_id")));
				entity.setStart_date(Nullchange.NulltoString(rs.getString("start_date")));
				entity.setFinish_date(Nullchange.NulltoString(rs.getString("finish_date")));
				entity.setType(Nullchange.NulltoString(rs.getString("type")));
				entity.setReason(Nullchange.NulltoString(rs.getString("reason")));
				entity.setScope(Nullchange.NulltoString(rs.getString("scope")));
				entity.setCost(Nullchange.NulltoString(rs.getString("cost")));
				entity.setCost_source(Nullchange.NulltoString(rs.getString("cost_source")));
				entity.setEvaluate_level(Nullchange.NulltoString(rs.getString("evaluate_level")));
				entity.setBuild_org(Nullchange.NulltoString(rs.getString("build_org")));
				entity.setDesign_org(Nullchange.NulltoString(rs.getString("design_org")));
				entity.setConstruct_org(Nullchange.NulltoString(rs.getString("construct_org")));
				entity.setSupervise_org(Nullchange.NulltoString(rs.getString("supervise_org")));
				brgCardConstructPrj.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgCardConstructPrj;
	}
	
	public ArrayList<BrgCardConstructPrjMemo> getBrgCardConstructPrjMemoData(String bridge_id){
		ArrayList<BrgCardConstructPrjMemo>  brgCardConstructPrjMemo = new ArrayList<BrgCardConstructPrjMemo>();
		String sql = " SELECT * FROM brg_card_construct_prj_memo WHERE bridge_id = ? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			while (rs.next())
			{
				BrgCardConstructPrjMemo entity = new BrgCardConstructPrjMemo();
				entity.setMemo(Nullchange.NulltoString(rs.getString("memo")));
				brgCardConstructPrjMemo.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgCardConstructPrjMemo;
	}
	
	public ArrayList<BrgPrjPhoto> getBrgPrjPhotoData(String bridge_id)
	{
		ArrayList<BrgPrjPhoto> brgPrjPhoto = new ArrayList<BrgPrjPhoto>();
		String sql = " SELECT * FROM brg_prj_photo AS a LEFT JOIN chk_project_info AS b  ON a.prj_id = b.prj_id WHERE a.bridge_id = ? ORDER BY b.prj_establish_tm DESC LIMIT 2  ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			while (rs.next())
			{
				BrgPrjPhoto entity = new BrgPrjPhoto();
				entity.setPath(Nullchange.NulltoString(rs.getString("path")));
				entity.setPhoto_type(Nullchange.NulltoString(rs.getString("photo_type")));
				entity.setPrj_id(Nullchange.NulltoString(rs.getString("prj_id")));
				brgPrjPhoto.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgPrjPhoto; 
	}
	
	public ArrayList<BrgCardAdminId> getBrgCardAdminIdData(String bridge_id)
	{
		ArrayList<BrgCardAdminId> brgCardAdminId = new ArrayList<BrgCardAdminId>();
		String sql = " SELECT * FROM brg_card_admin_id WHERE bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_id });
		try
		{
			while (rs.next())
			{
				BrgCardAdminId entity = new BrgCardAdminId();
				entity.setBridge_no(Nullchange.NulltoString(rs.getString("bridge_no")));
				entity.setBridge_name(Nullchange.NulltoString(rs.getString("bridge_name")));
				entity.setCharge_man(Nullchange.NulltoString(rs.getString("charge_man")));
				entity.setFill_date(Nullchange.NulltoString(rs.getString("fill_date")));
				entity.setFill_man(Nullchange.NulltoString(rs.getString("fill_man")));
				entity.setZone_id(Nullchange.NulltoString(rs.getString("zone_id")));
				brgCardAdminId.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return brgCardAdminId;
	}
	
	public ArrayList<DicBrgCardDomain> initA()
	{
		ArrayList<DicBrgCardDomain> list = new ArrayList<DicBrgCardDomain>();
		String sql = " SELECT a.item_id,b.item_value FROM dic_brg_card_item AS a " + " LEFT JOIN dic_brg_card_domain AS b " + " ON a.item_id=b.item_id "
				+ " WHERE item_sort='A' ORDER BY a.item_id ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String[] arr = new String[]
		{};
		ResultSet rs = dataOperation.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				DicBrgCardDomain dbcd = new DicBrgCardDomain();
				dbcd.setItem_id(rs.getString("item_id"));
				String value = rs.getString("item_value");
				dbcd.setItem_value(value);
				list.add(dbcd);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	
	public String getManage_id(String name,String queryType){
		String Manage_id = "";
		String sql = "";
		if(queryType.equals("hw")){
			sql = " select highway_id from dic_hw_info where highway_name=? ";
		}else if(queryType.equals("org")){
			sql = " select manage_id from  dic_manage_org where manage_name=? ";
		}else if(queryType.equals("zone")){
			sql = " select zone_id from  dic_manage_zone where zone_name=? ";
		}else if(queryType.equals("section")){
			sql = " select section_id from  dic_manage_section where section_name=? ";
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ name});
		try
		{
			while (rs.next())
			{
				Manage_id = rs.getString(1);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return Manage_id;
	}
	
	public ArrayList<DicManageSection> getSectiondata(){
		ArrayList<DicManageSection> section = new ArrayList<DicManageSection>();
		String sql = " select * from sys_section_info where 1=1 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ });
		try
		{
			while (rs.next())
			{
				DicManageSection entity = new DicManageSection();
				entity.setSection_id(rs.getString("section_id"));
				entity.setSection_name(rs.getString("section_name"));
				section.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return section;
	}
	
	public ArrayList<DicManageZone> getZonedata(){
		ArrayList<DicManageZone> zone = new ArrayList<DicManageZone>();
		String sql = " select * from sys_zone_info where 1=1 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ });
		try
		{
			while (rs.next())
			{
				DicManageZone entity = new DicManageZone();
				entity.setZone_id(rs.getString("zone_id"));
				entity.setZone_name(rs.getString("zone_name"));
				zone.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return zone;
	}
	
	public int updateBrgCardAdminId(String highway_id,String manage_id,String seciton_id,String zone_id,
			String bridge_no,String bridge_name,String bridge_pile_no,String function_type,String span_build,
			String bridge_mode,String beneath_path_name,String beneath_path_pile_no,String design_load,String pass_load,
			String skew_slope,String deck_pavement,String build_year,String longitude,String latitude,String bridge_id
			){
		int i = 0;
		String sql =" UPDATE brg_card_admin_id SET highway_id=?,manage_id=?,section_id=?,zone_id=?," +
				" bridge_no=?,bridge_name=?,bridge_pile_no=?,function_type=?,span_build=?, " +
				" bridge_mode=?,beneath_path_name=?,beneath_path_pile_no=?,design_load=?, " +
				" pass_load=?,skew_slope=?,deck_pavement=?,build_year=?,longitude=?,latitude=? WHERE bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		i = dataOperation.executeUpdate(sql, new String[]{ 
				highway_id,manage_id,seciton_id,zone_id,bridge_no,bridge_name,bridge_pile_no,function_type,
				span_build,bridge_mode,beneath_path_name,beneath_path_pile_no,design_load,pass_load,skew_slope,
				deck_pavement,build_year,longitude,latitude,bridge_id
		});
		dataOperation.close();
		return i;
	}
	
	public int updateBrgCardAdminId2(String highway_id,String manage_id,String seciton_id,String zone_id,
			String bridge_no,String bridge_name,String bridge_pile_no,String function_type,String span_build,
			String bridge_mode,String beneath_path_name,String beneath_path_pile_no,String design_load,String pass_load,
			String skew_slope,String deck_pavement,String build_year,String longitude,String latitude,String bridge_id,String max_kuajing,String main_kuajiegou
			){
		int i = 0;
		String sql =" UPDATE brg_card_admin_id SET highway_id=?,manage_id=?,section_id=?,zone_id=?," +
				" bridge_no=?,bridge_name=?,bridge_pile_no=?,function_type=?,span_build=?, " +
				" bridge_mode=?,beneath_path_name=?,beneath_path_pile_no=?,design_load=?, " +
				" pass_load=?,skew_slope=?,deck_pavement=?,build_year=?,longitude=?,latitude=?,max_kuajing=?,main_kuajiegou=? WHERE bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		i = dataOperation.executeUpdate(sql, new String[]{ 
				highway_id,manage_id,seciton_id,zone_id,bridge_no,bridge_name,bridge_pile_no,function_type,
				span_build,bridge_mode,beneath_path_name,beneath_path_pile_no,design_load,pass_load,skew_slope,
				deck_pavement,build_year,longitude,latitude,max_kuajing,main_kuajiegou,bridge_id
		});
		dataOperation.close();
		return i;
	}
	
	public int Changebcd(String bridge_id,String blueprint_state, String design_file_state, String construct_file_state, String complete_file_state,
			String acceptance_file_state, String administrate_file_state, String regular_report_state, String special_report_state,
			String history_maintain_state, String document_no, String document, String document_time)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "update brg_card_document set blueprint_state=?,design_file_state=?,construct_file_state=?,complete_file_state=?,acceptance_file_state=?,administrate_file_state=?,regular_report_state=?,special_report_state=?,history_maintain_state=?,document_no=?,document=?,document_time=? where bridge_id=?";
		String[] arr = new String[]
		{ blueprint_state, design_file_state, construct_file_state, complete_file_state, acceptance_file_state, administrate_file_state, regular_report_state,
				special_report_state, history_maintain_state, document_no, document, document_time, bridge_id };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	/* 新建最近评定数据 */
	public int new_nearly(String[] obj)
	{
		int i = 0;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = " INSERT INTO brg_card_evaluation(r_id,bridge_id,check_ym,eva_type,eva_level,abutment,pier,erosion,top_structure,support,is_often_maintain,treatment,next_time_year)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		i = dataOperation.executeUpdate(sql, obj);
		dataOperation.close();
		return i;
	}
	
	/* 更新 */
	public int update_nearly(String[] obj)
	{
		int i = 0;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = " UPDATE brg_card_evaluation SET check_ym=?,eva_type=?,eva_level=?,abutment=?,pier=?,erosion=?,top_structure=?,support=?,is_often_maintain=?,treatment=?,next_time_year=? WHERE r_id=? ";
		i = dataOperation.executeUpdate(sql, obj);
		dataOperation.close();
		return i;

	}
	
	public int del_nearly(String r_id)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " DELETE FROM brg_card_evaluation WHERE r_id=? ";
		String[] arr =
		{ r_id };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public int NewBccp(String bridge_id, String start_date, String finish_date, String type, String reason, String scope, String cost, String cost_source,
			String evaluate_level, String build_org, String design_org, String construct_org, String supervise_org)
	{
		String r_id = UUID.randomUUID().toString();
		int i = 0;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = "insert into brg_card_construct_prj(r_id,bridge_id,start_date,finish_date,type,reason,scope,cost,cost_source,evaluate_level,build_org,design_org,construct_org,supervise_org) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		i = dataOperation.executeUpdate(sql, new Object[]
		{ r_id, bridge_id, start_date, finish_date, type, reason, scope, cost, cost_source, evaluate_level, build_org, design_org, construct_org,
				supervise_org });
		dataOperation.close();
		return i;
	}
	
	public int UpdateMemo(String memo, String bright_id)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql_up = " UPDATE brg_card_construct_prj_memo SET memo =? WHERE bridge_id = ? ";
		i = mdo.executeUpdate(sql_up, new Object[]
		{ memo, bright_id });
		mdo.close();
		return i;

	}
	
	public int insertMemo(String memo, String bright_id)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql_up = " insert into brg_card_construct_prj_memo(memo,bridge_id) values(?,?) ";
		i = mdo.executeUpdate(sql_up, new Object[]
		{ memo, bright_id });
		mdo.close();
		return i;

	}
	
	public int ChangeBccp(String r_id,  String start_date, String finish_date, String type1, String reason, String scope, String cost,
			String cost_source, String evaluate_level, String build_org, String design_org, String construct_org, String supervise_org)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "update brg_card_construct_prj set start_date=?, finish_date=?, type=?,reason=?, scope=?, cost=?,cost_source=?, evaluate_level=?, build_org=?,design_org=?, construct_org=?, supervise_org=? where r_id=?";
		String[] arr = new String[]
		{  start_date, finish_date, type1, reason, scope, cost, cost_source, evaluate_level, build_org, design_org, construct_org, supervise_org,
				 r_id };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public int del_bccp(String r_id)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " DELETE FROM brg_card_construct_prj WHERE r_id=? ";
		String[] arr =
		{ r_id };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public int ChangeMan(String bridge_id, String charge_man, String fill_man, String fill_date)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "update brg_card_admin_id set charge_man=?, fill_man=?, fill_date=? where bridge_id=?";
		String[] arr = new String[]
		{ charge_man, fill_man, fill_date, bridge_id };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public ArrayList<SysUsrUsrInfo> getFill_man(){
		ArrayList<SysUsrUsrInfo> sysUsrUsrInfo = new ArrayList<SysUsrUsrInfo>();
		String sql = " SELECT * FROM sys_usr_usr_info WHERE 1=1 ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, new String[]{});
		try
		{
			while (rs.next())
			{
				SysUsrUsrInfo entity = new SysUsrUsrInfo();
				entity.setUsr_name(rs.getString("usr_name"));
				sysUsrUsrInfo.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return sysUsrUsrInfo;
	}
	
	public ArrayList<DicBrgCardDomain> initB()
	{
		ArrayList<DicBrgCardDomain> list = new ArrayList<DicBrgCardDomain>();
		String sql = " SELECT a.item_id,b.item_value FROM dic_brg_card_item AS a " + " LEFT JOIN dic_brg_card_domain AS b " + " ON a.item_id=b.item_id "
				+ " WHERE item_sort='B' ORDER BY a.item_id ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String[] arr = new String[]
		{};
		ResultSet rs = dataOperation.executeQuery(sql, arr);
		try
		{
			while (rs.next())
			{
				DicBrgCardDomain dbcd = new DicBrgCardDomain();
				dbcd.setItem_id(rs.getString("item_id"));
				String value = rs.getString("item_value");
				dbcd.setItem_value(value);
				list.add(dbcd);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	public int addTop(String bridge_id,String top_struct_id){
		int i = 0;
		String sql = " INSERT INTO brg_card_top_struct(top_struct_id,bridge_id) VALUES(?,?) ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = dataOperation.executeUpdate(sql, new String[]{
				top_struct_id,	bridge_id
		});
		dataOperation.close();
		return i;
	}
	
	public int addFullTop(String bridge_id,String top_struct_id,String top_struct_hole_no,String top_struct_type,String top_struct_span,String top_struct_stuff){
		int i = 0;
		String sql = " INSERT INTO brg_card_top_struct(top_struct_id,top_struct_hole_no,top_struct_span,top_struct_type,top_struct_stuff,bridge_id) VALUES(?,?,?,?,?,?) ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = dataOperation.executeUpdate(sql, new String[]{
				top_struct_id,top_struct_hole_no,top_struct_span,top_struct_type,top_struct_stuff,bridge_id
		});
		dataOperation.close();
		return i;
	}
	
	
	public int delTop(String top_struct_id){
		int i = 0;
		String sql = " DELETE FROM brg_card_top_struct WHERE top_struct_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = dataOperation.executeUpdate(sql, new String[]{
				top_struct_id
		});
		dataOperation.close();
		return i;
	}
	
	public int delTopByBrg_id(String brg_id){
		int i = 0;
		String sql = " DELETE FROM brg_card_top_struct WHERE bridge_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = dataOperation.executeUpdate(sql, new String[]{
				brg_id
		});
		dataOperation.close();
		return i;
	}
	
	
	public int addDown(String bridge_id,String down_struct_id){
		int i = 0;
		String sql = " INSERT INTO brg_card_down_struct(down_struct_id,bridge_id) VALUES(?,?) ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = dataOperation.executeUpdate(sql, new String[]{
				down_struct_id,	bridge_id
		});
		dataOperation.close();
		return i;
		
	}
	public int delDown(String down_struct_id){
		int i = 0;
		String sql = " DELETE FROM brg_card_down_struct WHERE down_struct_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = dataOperation.executeUpdate(sql, new String[]{
				down_struct_id
		});
		dataOperation.close();
		return i;
	}
	public int getCount(String bridge_id,String type){
		int i = 0;
		String sql = "  ";
		if (type.equals("top"))
		{
			sql = " SELECT COUNT(*) FROM brg_card_top_struct WHERE bridge_id=? ";
		}else {
			sql = " SELECT COUNT(*) FROM brg_card_down_struct WHERE bridge_id=? ";
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{
				bridge_id
		});
		try
		{
			while (rs.next())
			{
					i = rs.getInt(1);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return i;
	}
	
	public int clearStruct(String id,String type){
		int i = 0;
		String sql = "  ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		if (type.equals("top"))
		{
			sql=" UPDATE brg_card_top_struct SET top_struct_hole_no='',top_struct_type='',top_struct_stuff='',top_struct_span=''  WHERE top_struct_id=? ";
		}else{
			sql = " UPDATE brg_card_down_struct SET down_struct_pier='',down_struct_type='',down_struct_stuff='',down_struct_base_type=''  WHERE down_struct_id=? ";
		}
		i = dataOperation.executeUpdate(sql, new String[]{id});
		dataOperation.close();
		return i;
	}
	
	public int Changebcst(String bridge_len1, String bridge_width1, String lane_width1, String bridge_t_s_height1, String bridge_b_height1,
			String bridge_t_height1, String approach_total_width1, String approach_width1, String approach_line_type, 
			 String expansion_joint_type, String support_type, String acceleration_factor1, String abutment_slope,
			String guard_pier_body, String treatment_struct, String water_level, String design_level, String his_flood_level,String bridge_id)
	{
		int i = 0;
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = "update brg_card_struct_tech set bridge_len=?,bridge_width=?,lane_width=?,bridge_t_s_height=?,bridge_b_height=?,bridge_t_height=?,approach_total_width=?,approach_width=?,approach_line_type=?," +
				" expansion_joint_type=?,support_type=?,acceleration_factor=?,abutment_slope=?,guard_pier_body=?,treatment_struct=?,water_level=?,design_level=?,his_flood_level=? where bridge_id=? ";
		Object[] arr = new Object[]
		{ bridge_len1, bridge_width1, lane_width1, bridge_t_s_height1, bridge_b_height1, bridge_t_height1, approach_total_width1, approach_width1,
				approach_line_type, expansion_joint_type,
				support_type, acceleration_factor1, abutment_slope, guard_pier_body, treatment_struct, water_level, design_level, his_flood_level, bridge_id };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public int isBrgCardStructTechExit(String bridge_id){
		int i = 0;
		String sql = " SELECT * FROM brg_card_struct_tech WHERE bridge_id=? ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, new String[]{
				bridge_id
		});
		try
		{
			if (rs.next())
			{
				i=1;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return i;
	}
	
	public int addBrgCardStructTech(String bridge_id){
		int i = 0;
		String sql = " INSERT INTO brg_card_struct_tech(bridge_id) VALUES(?) ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		i = mdo.executeUpdate(sql, new String[]{
				bridge_id	
		});
		mdo.close();
		return i;
	}
	
	public int addBrgCardDocument(String bridge_id){
		int i = 0;
		String sql = " INSERT INTO brg_card_document(bridge_id) VALUES(?) ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		i = mdo.executeUpdate(sql, new String[]{
				bridge_id	
		});
		mdo.close();
		return i;
	}
	
	
	public int isBrgCardDocumentExit(String bridge_id){
		int i = 0;
		String sql = " SELECT * FROM brg_card_document WHERE bridge_id=? ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, new String[]{
				bridge_id
		});
		try
		{
			if (rs.next())
			{
				i=1;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return i;
	}
	
	public int updateBrgCardTopStruct(BrgCardTopStruct entity){
		int i = 0;
		String sql = " UPDATE brg_card_top_struct SET top_struct_hole_no=?,top_struct_span=?,top_struct_stuff=?,top_struct_type=? WHERE top_struct_id=?  ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		i = mdo.executeUpdate(sql, new String[]{
				entity.getTop_struct_hole_no(),entity.getTop_struct_span(),entity.getTop_struct_stuff(),entity.getTop_struct_type(),entity.getTop_struct_id()
		});
		mdo.close();
		return i;
	}
	
	public int updateBrgCardDownStruct(BrgCardDownStruct entity){
		int i=0;
		String sql=" UPDATE brg_card_down_struct SET down_struct_pier=?,down_struct_stuff=?,down_struct_type=?,down_struct_base_type=? WHERE down_struct_id=? ";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		i = mdo.executeUpdate(sql, new String[]{
				entity.getDown_struct_pier(),entity.getDown_struct_stuff(),entity.getDown_struct_type(),entity.getDown_struct_base_type(),entity.getDown_struct_id()
		});
		mdo.close();
		return i;
	}
	
	public int storeCardPath(String brg_id, String card_path)
	{
		int i = 0;
		String sql = " UPDATE brg_card_admin_id SET card_path = ? WHERE bridge_id = ? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String[] arr = new String[]
		{ card_path, brg_id };
		i = dataOperation.executeUpdate(sql, arr);
		dataOperation.close();
		return i;
	}
	
	public ArrayList<DicBrgStructTypeDef> getDicBrgStructTypeDefData(){
		ArrayList<DicBrgStructTypeDef> dicBrgStructTypeDef = new ArrayList<DicBrgStructTypeDef>();
		String sql = " SELECT * FROM dic_brg_struct_type_def WHERE 1=1 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{});
		try
		{
			while (rs.next())
			{
				DicBrgStructTypeDef entity = new DicBrgStructTypeDef();
				entity.setBrg_type_id(rs.getString("brg_type_id"));
				entity.setBrg_base_type(rs.getString("brg_base_type"));
				entity.setBrg_type_name(rs.getString("brg_type_name"));
				dicBrgStructTypeDef.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return dicBrgStructTypeDef;
	}
	
	public ArrayList<BrgPrjPhoto> getPhotoPath(String bridge_id){
		ArrayList<BrgPrjPhoto> brgPrjPhoto = new ArrayList<BrgPrjPhoto>();
		String sql =" SELECT a.path,a.photo_type FROM brg_prj_photo AS a LEFT JOIN chk_project_info AS b ON a.prj_id= b.prj_id WHERE bridge_id = ? ORDER BY b.prj_establish_tm DESC LIMIT 2 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id});
		try
		{
			while (rs.next())
			{
				BrgPrjPhoto entity = new BrgPrjPhoto();
				entity.setPath(rs.getString("path"));
				entity.setPhoto_type(rs.getString("photo_type"));
				brgPrjPhoto.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();	
		return brgPrjPhoto;
	}
	private boolean ifEquals(BrgSpanForCardVO vo1,BrgSpanForCardVO vo2){
		boolean flag = false;
		if(Objects.equals(vo1.getSpan_no(), vo2.getSpan_no())&&
				Objects.equals(vo1.getSpan_material(), vo2.getSpan_material())&&
				Objects.equals(vo1.getSpan_length(), vo2.getSpan_length())&&
				Objects.equals(vo1.getBrg_type_name(), vo2.getBrg_type_name())){
			return true;
		}else{
			return false;
		}
	}
	
	private String getAnothorDirection(String direction){
		if("上行".equals(direction)){
			return "下行";
		}else if("下行".equals(direction)){
			return "上行";
		}else{
		return "无";
		}
	}
	
	public BrgCardAdminId getBrgCardAdminIdDataByNo(String bridge_no)
	{
		ArrayList<BrgCardAdminId> brgCardAdminId = new ArrayList<BrgCardAdminId>();
		String sql = " SELECT * FROM brg_card_admin_id WHERE bridge_no=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ bridge_no });
		try
		{
			while (rs.next())
			{
				BrgCardAdminId entity = new BrgCardAdminId();
				entity.setBridge_id(Nullchange.NulltoString(rs.getString("bridge_id")));
				entity.setBridge_no(Nullchange.NulltoString(rs.getString("bridge_no")));
				entity.setBridge_name(Nullchange.NulltoString(rs.getString("bridge_name")));
				entity.setCharge_man(Nullchange.NulltoString(rs.getString("charge_man")));
				entity.setFill_date(Nullchange.NulltoString(rs.getString("fill_date")));
				entity.setFill_man(Nullchange.NulltoString(rs.getString("fill_man")));
				entity.setZone_id(Nullchange.NulltoString(rs.getString("zone_id")));
				brgCardAdminId.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		if(brgCardAdminId.size()==1){
			return brgCardAdminId.get(0);
		}else{
			return null;
		}
		
	}
	
	
}
