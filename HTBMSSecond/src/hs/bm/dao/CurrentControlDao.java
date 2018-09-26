/**
 * <p>Title: CurrentControlDao.java</p>
 * <p>Description: 华通桥涵管理系统</p>
 * <p>Company: 环水信息技术有限公司</p>
 * @author 马潇霄
 * @version 1.0 创建时间：2017年7月18日 下午2:18:42
 */

package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import hs.bm.bean.BrgMbrInfo;
import hs.bm.bean.BrgSpanInfo;
import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.DicMbrDefectS;
import hs.bm.vo.BridgeMemAll;
import hs.bm.vo.DicDefect;

/**
 * @ClassName: CurrentControlDao
 * @Description: 日常检查
 * @author 马潇霄
 * @date 2017年7月18日 下午2:18:42
 * 
 */
public class CurrentControlDao
{

	private static CurrentControlDao currentControlDao;
	private static final Log log = LogFactory.getLog(CurrentControlDao.class);

	public static CurrentControlDao getInstance()
	{
		if (currentControlDao == null)
		{
			currentControlDao = new CurrentControlDao();
		}
		return currentControlDao;
	}

	public List<String> selectBrgPrj()
	{
		String sql = "SELECT DISTINCT component8 FROM dic_brg_struct_member_def where distr_name = '桥面系' AND component8!='' AND component8 IS NOT NULL;";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{});
		List<String> prjList = new ArrayList<>();
		try
		{
			while (rs.next())
			{
				prjList.add(rs.getString("component8"));
			}
		} catch (SQLException e)
		{

			log.info(e);
		}
		dataOperation.close();
		return prjList;
	}

	public List<BridgeMemAll> initComBox(String brgid, String direction, String span_no)
	{
		// 桥面系菜单
		String sql = "select b2.r_id,b2.member_no,b2.member_type,b2.direction,b2.span_no,d2.component8,d2.member_id,d2.distr_name from dic_brg_struct_member_def as d2 INNER JOIN "
				+ "(select b1.r_id,b1.s_id,b1.member_type,b1.member_no,d1.direction,d1.span_no from brg_mbr_info as b1,"
				+ "(SELECT s_id,bridge_id,direction,span_no,brg_type_id from brg_span_info where bridge_id=? and direction=? and span_no=?) as d1 "
				+ "where b1.s_id=d1.s_id) as b2 on d2.member_name=b2.member_type  and  d2.distr_name='桥面系' ORDER BY b2.member_no";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ brgid, direction, span_no });
		List<BridgeMemAll> lb = new ArrayList<BridgeMemAll>();
		try
		{
			while (rs.next())
			{
				BridgeMemAll ba = new BridgeMemAll();
				ba.setR_id(rs.getString("r_id"));
				ba.setMember_no(rs.getString("member_no"));
				ba.setMember_type(rs.getString("member_type"));
				ba.setDirection(rs.getString("direction"));
				ba.setSpan_no(rs.getString("span_no"));
				ba.setMember_id(rs.getString("member_id"));
				ba.setComponent8(rs.getString("component8"));
				ba.setDistr_name(rs.getString("distr_name"));
				lb.add(ba);
			}
		} catch (SQLException e)
		{
			log.info(e);
		}
		dataOperation.close();
		return lb;
	}

	public List<BridgeMemAll> getMember_typeByBrg_id(String brgid)
	{
		// 桥面系菜单
		String sql = "select d2.component11 from dic_brg_struct_member_def as d2 INNER JOIN "
				+ "(select b1.r_id,b1.s_id,b1.member_type,b1.member_no,d1.direction,d1.span_no from brg_mbr_info as b1,"
				+ "(SELECT s_id,bridge_id,direction,span_no,brg_type_id from brg_span_info where bridge_id=?) as d1 "
				+ "where b1.s_id=d1.s_id) as b2 on d2.member_name=b2.member_type  and  d2.distr_name='桥面系' GROUP BY d2.component11 ORDER BY d2.component11";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ brgid });
		List<BridgeMemAll> lb = new ArrayList<BridgeMemAll>();
		try
		{
			while (rs.next())
			{
				BridgeMemAll ba = new BridgeMemAll();
				ba.setMember_type(rs.getString("component11"));
				lb.add(ba);
			}
		} catch (SQLException e)
		{
			log.info(e);
		}
		dataOperation.close();
		return lb;
	}

	public List<DicDefect> initTable(String component_name)
	{
		List<DicDefect> ld = new ArrayList<DicDefect>();
		Map<String, DicDefect> map = new HashMap<String, DicDefect>();
		String sql = "SELECT DISTINCT IFNULL(a.defect_id, '') AS defect_id, IFNULL(a.defect_name, '') AS defect_name, IFNULL(a.defect_loc_def, '') AS defect_loc_def, IFNULL(a.defect_def, '') AS defect_def, IFNULL(a.defect_template, '') AS defect_template, IFNULL(a.defect_attr, '') AS defect_attr, IFNULL(a.defect_statistics, '') AS defect_statistics, IFNULL(a.defect_summary, '') AS defect_summary, b.*, c.*, d.* FROM dic_mbr_defect_s AS a RIGHT JOIN dic_mbr_defect_f AS b ON a.defect_f_id = b.defect_f_id RIGHT JOIN dic_mbr_defect_def AS c ON a.defect_f_id = c.defect_f_id RIGHT JOIN dic_brg_struct_component_def AS d ON c.component_id = d.component_id WHERE d.component_name = ? AND d.specification = '桥梁检查记录' ORDER BY c.ratio";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ component_name });
		try
		{
			while (rs.next())
			{
				if (map.containsKey(rs.getString("defect_f_id")))
				{
					DicDefect d1 = map.get(rs.getString("defect_f_id"));
					List<DicMbrDefectS> lt = d1.getDefects();
					DicMbrDefectS ddt = new DicMbrDefectS();
					ddt.setDefect_def(rs.getString("defect_def"));
					ddt.setDefect_id(rs.getString("defect_id"));
					ddt.setDefect_loc_def(rs.getString("defect_loc_def"));
					ddt.setDefect_template(rs.getString("defect_template"));
					ddt.setDefect_name(rs.getString("defect_name"));
					ddt.setDefect_attr(rs.getString("defect_attr"));
					ddt.setDefect_statistics(rs.getString("defect_statistics"));
					ddt.setDefect_summary(rs.getString("defect_summary"));
					if (!rs.getString("defect_id").equals(""))
					{
						lt.add(ddt);
					}
					d1.setDefects(lt);
					map.put(rs.getString("defect_f_id"), d1);
				} else
				{
					DicDefect d1 = new DicDefect();
					List<DicMbrDefectS> lt = d1.getDefects();
					DicMbrDefectS ddt = new DicMbrDefectS();
					ddt.setDefect_def(rs.getString("defect_def"));
					ddt.setDefect_id(rs.getString("defect_id"));
					ddt.setDefect_loc_def(rs.getString("defect_loc_def"));
					ddt.setDefect_template(rs.getString("defect_template"));
					ddt.setDefect_name(rs.getString("defect_name"));
					ddt.setDefect_attr(rs.getString("defect_attr"));
					ddt.setDefect_statistics(rs.getString("defect_statistics"));
					ddt.setDefect_summary(rs.getString("defect_summary"));
					if (!rs.getString("defect_id").equals(""))
					{
						lt.add(ddt);
					}
					d1.setDefect_f_id(rs.getString("defect_f_id"));
					d1.setDefect_f_name(rs.getString("defect_f_name"));
					d1.setDefects(lt);
					map.put(rs.getString("defect_f_id"), d1);
				}

			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		for (String s : map.keySet())
		{
			ld.add(map.get(s));
		}
		return ld;
	}

	public DicMbrDefectS selectDicSById(String defect_s_id)
	{
		// 根据id获取次级病害信息
		String sql = "SELECT * from dic_mbr_defect_s WHERE defect_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ defect_s_id });
		DicMbrDefectS defectS = new DicMbrDefectS();
		try
		{
			while (rs.next())
			{
				defectS.setDefect_id(rs.getString("defect_id"));
				defectS.setDefect_name(rs.getString("defect_name"));
				defectS.setDefect_loc_def(rs.getString("defect_loc_def"));
				defectS.setDefect_def(rs.getString("defect_def"));
				defectS.setDefect_template(rs.getString("defect_template"));
				defectS.setDefect_f_id(rs.getString("defect_f_id"));
				defectS.setDefect_attr(rs.getString("defect_attr"));
				defectS.setDefect_statistics(rs.getString("defect_statistics"));
				defectS.setDefect_summary(rs.getString("defect_summary"));
			}
		} catch (SQLException e)
		{

			log.info(e);
		}
		dataOperation.close();
		return defectS;
	}

	public ChkBrgRecord selectDicBySpanAndMbr(String span_chk_id, String mbr_no)
	{
		//
		String sql = "select * from chk_brg_record where span_chk_id =? AND mbr_no = ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ span_chk_id, mbr_no });
		ChkBrgRecord chkBrgRecord = new ChkBrgRecord();
		try
		{
			while (rs.next())
			{
				chkBrgRecord.setMbr_chk_id(rs.getString("mbr_chk_id"));
				chkBrgRecord.setSpan_chk_id(rs.getString("span_chk_id"));
				chkBrgRecord.setBridge_id(rs.getString("bridge_id"));
				chkBrgRecord.setDirection(rs.getString("direction"));
				chkBrgRecord.setSpan_no(rs.getString("span_no"));
			}
		} catch (SQLException e)
		{

			log.info(e);
		}
		dataOperation.close();
		return chkBrgRecord;
	}
	
	public List<ChkBrgRecord> selectDicsBySpan_chk_id(String span_chk_id)
	{
		//
		String sql = "select * from chk_brg_record where span_chk_id =?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ span_chk_id});
		List<ChkBrgRecord> list = new ArrayList<ChkBrgRecord>();
		try
		{
			while (rs.next())
			{   
				ChkBrgRecord chkBrgRecord = new ChkBrgRecord();
				chkBrgRecord.setMbr_chk_id(rs.getString("mbr_chk_id"));
				chkBrgRecord.setSpan_chk_id(rs.getString("span_chk_id"));
				chkBrgRecord.setBridge_id(rs.getString("bridge_id"));
				chkBrgRecord.setDirection(rs.getString("direction"));
				chkBrgRecord.setSpan_no(rs.getString("span_no"));
				chkBrgRecord.setBridge_id(rs.getString("bridge_id"));
				chkBrgRecord.setDefect_desc_id("defect_desc_id");
				chkBrgRecord.setEvaluate_time(rs.getString("evaluate_time"));
				chkBrgRecord.setIs_evaluate(rs.getString("Is_evaluate"));
				chkBrgRecord.setIs_uploaded(rs.getString("is_uploaded"));
				chkBrgRecord.setMbr_chk_date(rs.getString("mbr_chk_date"));
				chkBrgRecord.setMbr_chk_person(rs.getString("mbr_chk_person"));
				chkBrgRecord.setMbr_desc(rs.getString("mbr_desc"));
				chkBrgRecord.setMbr_location(rs.getString("mbr_location"));
				chkBrgRecord.setMbr_model(rs.getString("mbr_model"));
				chkBrgRecord.setMbr_no(rs.getString("mbr_no"));
				chkBrgRecord.setMbr_type(rs.getString("mbr_type"));
				chkBrgRecord.setUpload_time(rs.getString("upload_time"));
				list.add(chkBrgRecord);
			}
		} catch (SQLException e)
		{

			log.info(e);
		}
		dataOperation.close();
		return list;
	}

	public int newDefect(ChkBrgRecord chkBrgRecord)
	{
		String sql = "INSERT INTO chk_brg_record(mbr_chk_id,span_chk_id,bridge_id,direction,span_no,mbr_type,mbr_no,mbr_chk_date,mbr_chk_person,Is_evaluate ) VALUES(?,?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ chkBrgRecord.getMbr_chk_id(), chkBrgRecord.getSpan_chk_id(), chkBrgRecord.getBridge_id(), chkBrgRecord.getDirection(), chkBrgRecord.getSpan_no(),
				chkBrgRecord.getMbr_type(), chkBrgRecord.getMbr_no(), chkBrgRecord.getMbr_chk_date(), chkBrgRecord.getMbr_chk_person(), "0" });
		dataOperation.close();
		return i;
	}
	
	public int addDefect(ChkBrgRecord chkBrgRecord)
	{
		String sql = "INSERT INTO chk_brg_record(mbr_chk_id,"
				+ " span_chk_id,bridge_id,"
				+ " direction,span_no,"
				+ " mbr_type,mbr_no,"
				+ " mbr_chk_date,mbr_chk_person,"
				+ " Is_evaluate,evaluate_time,"
				+ " upload_time,is_uploaded,"
				+ " defect_desc_id,mbr_model,"
				+ " mbr_desc,mbr_location) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ chkBrgRecord.getMbr_chk_id(), chkBrgRecord.getSpan_chk_id(), chkBrgRecord.getBridge_id(),
				chkBrgRecord.getDirection(), chkBrgRecord.getSpan_no(),
				chkBrgRecord.getMbr_type(), chkBrgRecord.getMbr_no(), 
				chkBrgRecord.getMbr_chk_date(), chkBrgRecord.getMbr_chk_person(), 
				chkBrgRecord.getIs_evaluate(),chkBrgRecord.getEvaluate_time(),
				chkBrgRecord.getUpload_time(), chkBrgRecord.getIs_uploaded(),
				chkBrgRecord.getDefect_desc_id(),chkBrgRecord.getMbr_model(),
				chkBrgRecord.getMbr_desc(),chkBrgRecord.getMbr_location()});
		dataOperation.close();
		return i;
	}

	public String selectDefectfByDefectS(String defectid)
	{
		String sql = "select  f.defect_f_name from dic_mbr_defect_s as s LEFT JOIN dic_mbr_defect_f as f on s.defect_f_id = f.defect_f_id where s.defect_id=? LIMIT 0,1";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ defectid });
		String defect_f_name = "";
		try
		{
			while (rs.next())
			{
				defect_f_name = rs.getString("defect_f_name");
			}
		} catch (SQLException e)
		{

			log.info(e);
		}
		dataOperation.close();
		return defect_f_name;
	}

	public int newDefect2(ChkBrgDefect chkBrgDefect)
	{
		String sql = "INSERT INTO chk_brg_defect(defect_serial,defect_id,mbr_chk_id,mbr_no,defect_name_f,defect_name,defect_location_desc,defect_count,defect_location_desc_val,defect_count_val,chk_defect_memo,repair_state,develop_state,current,defect_attr) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ chkBrgDefect.getDefect_serial(), chkBrgDefect.getDefect_id(), chkBrgDefect.getMbr_chk_id(), chkBrgDefect.getMbr_no(),
				chkBrgDefect.getDefect_name_f(), chkBrgDefect.getDefect_name(), chkBrgDefect.getDefect_location_desc(), chkBrgDefect.getDefect_count(),
				chkBrgDefect.getDefect_location_desc_val(), chkBrgDefect.getDefect_count_val(), chkBrgDefect.getChk_defect_memo(), "0", "0", "0", ""

		});
		dataOperation.close();
		return i;
	}
	
	public int insertChkBrgDefect(ChkBrgDefect chkBrgDefect)
	{
		String sql = "INSERT INTO chk_brg_defect(defect_serial,defect_id,"
				+ " mbr_chk_id,mbr_no,"
				+ " defect_name_f,defect_name,"
				+ " defect_location_desc,defect_count,"
				+ " defect_location_desc_val,defect_count_val,"
				+ " chk_defect_memo,repair_state,"
				+ " develop_state,current,"
				+ " defect_attr,defect_photo,"
				+ " defect_photo_memo,is_uploaded) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]
		{ chkBrgDefect.getDefect_serial(), chkBrgDefect.getDefect_id(), 
				chkBrgDefect.getMbr_chk_id(), chkBrgDefect.getMbr_no(),
				chkBrgDefect.getDefect_name_f(), chkBrgDefect.getDefect_name(), 
				chkBrgDefect.getDefect_location_desc(), chkBrgDefect.getDefect_count(),
				chkBrgDefect.getDefect_location_desc_val(), chkBrgDefect.getDefect_count_val(), 
				chkBrgDefect.getChk_defect_memo(), chkBrgDefect.getRepair_state(),
				chkBrgDefect.getDevelop_state(), chkBrgDefect.getCurrent(), 
				chkBrgDefect.getDefect_attr(),chkBrgDefect.getDefect_photo(),
				chkBrgDefect.getDefect_photo_memo(),chkBrgDefect.getIs_uploaded()
		});
		dataOperation.close();
		return i;
	}

	public String getDailyChk_date(String prj_id)
	{
		String date = "";
		String sql = " SELECT prj_establish_tm from chk_project_info WHERE prj_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ prj_id });
		try
		{
			while (rs.next())
			{
				date = rs.getString("prj_establish_tm");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return date;
	}

	public ArrayList<BrgSpanInfo> get_Span_no_by_brgID_direction_memType(String brg_id, String direction, String member_type)
	{
		ArrayList<BrgSpanInfo> list = new ArrayList<BrgSpanInfo>();
		String sql = " SELECT a.span_no FROM brg_span_info AS a LEFT JOIN brg_mbr_info AS b on a.s_id = b.s_id WHERE a.bridge_id=? AND a.direction=? AND b.member_type in (SELECT member_name FROM dic_brg_struct_member_def WHERE  component11=? and distr_name = '桥面系') GROUP BY span_no ORDER BY span_no ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ brg_id, direction, member_type });
		try
		{
			while (rs.next())
			{
				BrgSpanInfo entity = new BrgSpanInfo();
				entity.setSpan_no(rs.getString("span_no"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}

	public ArrayList<BrgMbrInfo> getDailyChk_MemberType(String brg_id, String direction, String member_type, String span_no)
	{
		ArrayList<BrgMbrInfo> list = new ArrayList<BrgMbrInfo>();
		String sql = " SELECT b.member_type,b.r_id,b.member_type FROM brg_span_info AS a LEFT JOIN brg_mbr_info AS b ON a.s_id = b.s_id WHERE a.bridge_id=? AND a.direction=? AND b.member_type in (SELECT member_name FROM dic_brg_struct_member_def WHERE  component11=? and distr_name = '桥面系') AND a.span_no =? GROUP BY b.member_type ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ brg_id, direction, member_type, span_no });
		try
		{
			while (rs.next())
			{
				BrgMbrInfo entity = new BrgMbrInfo();
				entity.setMember_type(rs.getString("member_type"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}

	public ArrayList<BrgMbrInfo> getDailyChk_MemberName(String brg_id, String direction, String member_type, String span_no)
	{
		ArrayList<BrgMbrInfo> list = new ArrayList<BrgMbrInfo>();
		String sql = " SELECT a.member_no,a.r_id FROM brg_mbr_info AS a LEFT JOIN  brg_span_info AS b on a.s_id = b.s_id WHERE b.span_no=? and b.direction=? AND a.member_type=? AND b.bridge_id=? ORDER BY member_no ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ span_no, direction, member_type, brg_id });
		try
		{
			while (rs.next())
			{
				BrgMbrInfo entity = new BrgMbrInfo();
				entity.setMember_no(rs.getString("member_no"));
				entity.setR_id(rs.getString("r_id"));
				list.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}

	public int store_daily_normal_defect(String defect_serial, String defect_id, String mbr_chk_id, String mbr_no, String defect_name_f, String defect_name,
			String defect_location_desc, String defect_count, String defect_location_desc_val, String defect_count_val, String chk_defect_memo,String develop_state,String defect_attr)
	{
		int i = 0;
		String sql = " INSERT INTO chk_brg_defect(defect_serial,defect_id,mbr_chk_id,mbr_no,defect_name_f,defect_name,defect_location_desc,defect_count,defect_location_desc_val,defect_count_val,chk_defect_memo,repair_state,develop_state,current,defect_attr) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		i = dataOperation.executeUpdate(sql, new String[]
		{ defect_serial, defect_id, mbr_chk_id, mbr_no, defect_name_f, defect_name, defect_location_desc, defect_count, defect_location_desc_val,
				defect_count_val, chk_defect_memo, "0", develop_state , "0", defect_attr });
		dataOperation.close();
		return i;
	}

	public int store_daily_defined_defect(String defect_serial,  String mbr_chk_id,String mbr_no, String defect_name,String chk_defect_memo)
	{
		int i = 0;
		String sql = " INSERT INTO chk_brg_defect(defect_serial,mbr_chk_id,defect_name_f,defect_name,mbr_no,chk_defect_memo,repair_state,develop_state,current,defect_attr) VALUES(?,?,?,?,?,?,?,?,?,?) ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		i = dataOperation.executeUpdate(sql, new String[]
		{ defect_serial, mbr_chk_id,"自定义",defect_name,mbr_no,chk_defect_memo, "0", "0", "0", "" });
		dataOperation.close();
		return i;
	}

	public int store_daily_span(String span_chk_id, String chk_id, String direction, String span_no, String temp, String chk_state, String record_person,String tem)
	{
		int i = 0;
		String sql = "insert into chk_span_record(span_chk_id,chk_id,direction,span_no,chk_time,chk_state,record_person,temp) values(?,?,?,?,DATE(NOW()),?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		i = dataOperation.executeUpdate(sql, new String[]
		{ span_chk_id, chk_id, direction, span_no, chk_state, record_person,tem });
		dataOperation.close();
		return i;
	}

	public int store_daily_member(String mbr_chk_id, String span_chk_id, String bridge_id, String direction, String span_no, String mbr_type, String mbr_no,
			String mbr_chk_person)
	{
		int i = 0;
		String sql = " INSERT INTO chk_brg_record(mbr_chk_id,span_chk_id,bridge_id,direction,span_no,mbr_type,mbr_no,mbr_chk_date,mbr_chk_person) VALUES(?,?,?,?,?,?,?,DATE(NOW()),?) ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		i = dataOperation.executeUpdate(sql, new String[]
		{ mbr_chk_id, span_chk_id, bridge_id, direction, span_no, mbr_type, mbr_no, mbr_chk_person });
		dataOperation.close();
		return i;
	}

	public String chkStore_daily_span(String chk_id, String direction, String span_no)
	{
		String span_chk_id = "";
		String sql = "select * from chk_span_record where chk_id=? and direction=? and span_no=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ chk_id, direction, span_no });
		try
		{
			while (rs.next())
			{
				span_chk_id = rs.getString("span_chk_id");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return span_chk_id;
	}

	public String chkStore_daily_mbr(String span_chk_id, String mbr_no)
	{
		String mbr_chk_id = "";
		String sql = " SELECT * FROM chk_brg_record WHERE span_chk_id=? AND mbr_no=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ span_chk_id, mbr_no });
		try
		{
			while (rs.next())
			{
				mbr_chk_id = rs.getString("mbr_chk_id");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return mbr_chk_id;

	}

	public String getRealName(String usr_id)
	{
		String real_name = "";
		String sql = " SELECT * FROM sys_usr_usr_info AS a LEFT JOIN sys_org_usr_info AS b on a.org_usr_id = b.org_usr_id WHERE a.usr_id = ? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ usr_id });
		try
		{
			while (rs.next())
			{
				real_name = rs.getString("org_usr_name");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		if ("".equals(real_name) || real_name == null)
		{
			real_name = usr_id;
		}
		dataOperation.close();
		return real_name;
	}

}
