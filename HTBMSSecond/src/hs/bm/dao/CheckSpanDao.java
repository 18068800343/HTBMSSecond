package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import hs.bm.vo.SpanMem;
import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkBrgPhoto;
import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.ChkPassPhoto;
import hs.bm.bean.DefectCount;
import hs.bm.bean.DicMbrDefectS;
import hs.bm.vo.BridgeMemAll;
import hs.bm.vo.DicDefect;
import hs.bm.vo.OperationConstruct;

public class CheckSpanDao {

	private static CheckSpanDao checkSpanDao;
	private static final Log log = LogFactory.getLog(CheckSpanDao.class);

	public static CheckSpanDao getInstance() {
		if (checkSpanDao == null) {
			checkSpanDao = new CheckSpanDao();
		}
		return checkSpanDao;
	}

	public List<BridgeMemAll> initComBox(String brgid, String direction, String span_no) {
		String sql = "select b2.r_id,b2.member_no,b2.member_type,b2.direction,b2.span_no,d2.component8,d2.member_id,d2.distr_name from dic_brg_struct_member_def as d2 INNER JOIN "
				+ "(select b1.r_id,b1.s_id,b1.member_type,b1.member_no,d1.direction,d1.span_no from brg_mbr_info as b1,"
				+ "(SELECT s_id,bridge_id,direction,span_no,brg_type_id from brg_span_info where bridge_id=? and direction=? and span_no=?) as d1 "
				+ "where b1.s_id=d1.s_id) as b2 on d2.member_name=b2.member_type ORDER BY b2.member_no";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { brgid, direction, span_no });
		List<BridgeMemAll> lb = new ArrayList<BridgeMemAll>();
		try {
			while (rs.next()) {
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
		} catch (SQLException e) {
			log.info(e);
		}
		dataOperation.close();
		return lb;
	}

	public int newMem(SpanMem bm, String username) {
		String sql = "insert into chk_brg_record(mbr_chk_id,span_chk_id,bridge_id,direction,span_no,mbr_type,mbr_no,mbr_chk_date,mbr_chk_person) values(?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] { bm.getMbr_chk_id(), bm.getSpan_chk_id(), bm.getBridge_id(), bm.getDirection(),
						bm.getSpan_no(), bm.getMember_name(), bm.getMbr_no(),
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()), username });
		dataOperation.close();
		return i;
	}
	public int insertIntoChkBrgRecord(ChkBrgRecord bm) {
		String sql = "insert into chk_brg_record(mbr_chk_id,span_chk_id,bridge_id,direction,span_no,mbr_type,mbr_no,mbr_chk_date,mbr_chk_person) values(?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] { bm.getMbr_chk_id(), bm.getSpan_chk_id(), bm.getBridge_id(), bm.getDirection(),
						bm.getSpan_no(), bm.getMbr_type(), bm.getMbr_no(),
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()),bm.getMbr_chk_person() });
		dataOperation.close();
		return i;
	}
	public List<SpanMem> initTable(String span_chk_id) {
		String sql = "select a.*,b.component8,b.distr_name,c.* from chk_brg_record as a,dic_brg_struct_member_def as b,brg_mbr_info as c where span_chk_id=? and a.mbr_type=b.member_name and c.r_id = a.mbr_no";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { span_chk_id });
		List<SpanMem> lb = new ArrayList<SpanMem>();
		try {
			while (rs.next()) {
				SpanMem sm = new SpanMem();
				String mbr_chk_id = rs.getString("mbr_chk_id");
				sm.setMbr_chk_id(mbr_chk_id);
				sm.setSpan_chk_id(span_chk_id);
				sm.setBridge_id(rs.getString("bridge_id"));
				sm.setDirection(rs.getString("direction"));
				sm.setSpan_no(rs.getString("span_no"));
				sm.setMbr_no(rs.getString("mbr_no"));
				sm.setMember_no(rs.getString("member_no"));
				sm.setMember_name(rs.getString("mbr_type"));
				sm.setComponent_name(rs.getString("component8"));
				sm.setDistr_name(rs.getString("distr_name"));
				sm.setMbr_chk_person(rs.getString("mbr_chk_person"));
				List<ChkBrgDefect> ll = getDefectList(mbr_chk_id);
				sm.setDefects(ll);
				lb.add(sm);

			}
		} catch (SQLException e) {
			log.info(e);
		}
		dataOperation.close();
		return lb;
	}
	
	
	public List<SpanMem> initDailyTable(String chk_id,String component8) {
		String sql = " SELECT * FROM chk_span_record AS a LEFT JOIN chk_brg_record AS b ON a.span_chk_id = b.span_chk_id LEFT JOIN brg_mbr_info AS c ON c.r_id = b.mbr_no WHERE a.chk_id =? AND b.mbr_type in (SELECT member_name FROM dic_brg_struct_member_def WHERE  component8=? and distr_name = '桥面系') ORDER BY a.direction,a.span_no";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { chk_id , component8});
		List<SpanMem> lb = new ArrayList<SpanMem>();
		try {
			while (rs.next()) {
				SpanMem sm = new SpanMem();
				String mbr_chk_id = rs.getString("mbr_chk_id");
				sm.setMbr_chk_id(mbr_chk_id);
				sm.setSpan_chk_id(rs.getString("span_chk_id"));
				sm.setBridge_id(rs.getString("bridge_id"));
				sm.setDirection(rs.getString("direction"));
				sm.setSpan_no(rs.getString("span_no"));
				sm.setMbr_no(rs.getString("mbr_no"));
				sm.setMember_no(rs.getString("member_no"));
				sm.setMember_name(rs.getString("mbr_type"));
				sm.setComponent_name(component8);
				sm.setDistr_name("桥面系");
				sm.setMbr_chk_person(rs.getString("mbr_chk_person"));
				List<ChkBrgDefect> ll = getDefectList(mbr_chk_id);
				sm.setDefects(ll);
				lb.add(sm);

			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		dataOperation.close();
		return lb;
	}
	
	

	public List<ChkBrgDefect> getDefectList(String mbr_chk_id) {
		String sql = "select * from chk_brg_defect where mbr_chk_id=?";

		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { mbr_chk_id });
		List<ChkBrgDefect> lb = new ArrayList<ChkBrgDefect>();
		try {
			while (rs.next()) {
				ChkBrgDefect dmd = new ChkBrgDefect();
				dmd.setDefect_serial(rs.getString("defect_serial"));
				dmd.setDefect_id(rs.getString("defect_id"));
				dmd.setMbr_chk_id(rs.getString("mbr_chk_id"));
				dmd.setMbr_no(rs.getString("mbr_no"));
				dmd.setDefect_name(rs.getString("defect_name"));
				dmd.setDefect_location_desc(rs.getString("defect_location_desc"));
				dmd.setDefect_count(rs.getString("defect_count"));
				dmd.setRepair_state(rs.getString("repair_state"));
				dmd.setDevelop_state(rs.getString("develop_state"));
				dmd.setDefect_attr(rs.getString("defect_attr"));
				dmd.setIs_uploaded(rs.getString("is_uploaded"));
				dmd.setDefect_location_desc_val(rs.getString("defect_location_desc_val"));
				dmd.setDefect_count_val(rs.getString("defect_count_val"));
				dmd.setChk_defect_memo(rs.getString("chk_defect_memo"));
				dmd.setDefect_name_f(rs.getString("defect_name_f"));
				dmd.setCurrent(rs.getString("current"));
				dmd.setDefect_photo(rs.getString("defect_photo"));

				String sql2 = "select * from chk_brg_photo where defect_serial=?";
				MyDataOperation dataOperation2 = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
				ResultSet rs2 = dataOperation2.executeQuery(sql2, new String[] { dmd.getDefect_serial() });
				
				List<ChkBrgPhoto> photoList = new ArrayList<ChkBrgPhoto>();
				while (rs2.next()) {

					ChkBrgPhoto cbp = new ChkBrgPhoto();
					String photo_path = rs2.getString("photo_path");
					cbp.setPhoto_id(rs2.getString("photo_id"));
					cbp.setPhoto_name(rs2.getString("photo_name"));
					cbp.setPhoto_date(rs2.getString("photo_date"));
					cbp.setPhoto_path(rs2.getString("photo_path"));
					cbp.setDefect_serial(rs2.getString("defect_serial"));
					if (photo_path!=null){
						if (!photo_path.equals("")){
							photoList.add(cbp);
						}
					}
				}
				
				dmd.setPhotos(photoList);
				lb.add(dmd);
				dataOperation2.close();
			}
		} catch (SQLException e) {
			log.info(e);
		}
		dataOperation.close();
		return lb;
	}

	public int delMem(String mbr_chk_id) {
		String sql = "delete from chk_brg_record where mbr_chk_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] { mbr_chk_id });
		dataOperation.close();
		return i;
	}

	public List<DicDefect> getDefect(String component_name) {
		List<DicDefect> ld = new ArrayList<DicDefect>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "select defect_f_id from dic_mbr_defect_def where component_id = (select component_id from dic_brg_struct_component_def where component_name=? and specification='桥梁检查记录') order by ratio";
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { component_name });
		sql = "select IFNULL(a.defect_id,'') as defect_id,IFNULL(a.defect_name,'') as defect_name,IFNULL(a.defect_loc_def,'') as defect_loc_def,IFNULL(a.defect_def,'') as defect_def,IFNULL(a.defect_template,'') as defect_template,IFNULL(a.defect_attr,'') as defect_attr,b.* from dic_mbr_defect_s as a,dic_mbr_defect_f as b where a.defect_f_id=b.defect_f_id and a.defect_f_id=? order by a.defect_use desc,a.defect_id asc";
		try {
			while (rs.next()) {
				DicDefect dd = new DicDefect();
				dd.setDefect_f_id(rs.getString("defect_f_id"));
				ResultSet rt = dataOperation.executeQuery(sql, new String[] { dd.getDefect_f_id() });
				List<DicMbrDefectS> defects = new ArrayList<DicMbrDefectS>();
				;
				while (rt.next()) {
					DicMbrDefectS ddt = new DicMbrDefectS();
					ddt.setDefect_def(rt.getString("defect_def"));
					ddt.setDefect_id(rt.getString("defect_id"));
					ddt.setDefect_loc_def(rt.getString("defect_loc_def"));
					ddt.setDefect_template(rt.getString("defect_template"));
					ddt.setDefect_name(rt.getString("defect_name"));
					ddt.setDefect_attr(rt.getString("defect_attr"));
					defects.add(ddt);
					dd.setDefect_f_name(rt.getString("defect_f_name"));
				}
				dd.setDefects(defects);
				ld.add(dd);
			}
		} catch (SQLException e) {
			log.info(e);
		}
		dataOperation.close();
		return ld;
	}

	public List<DicDefect> getDefect(String component_name, String defect_name, String defect_name_f) {
		List<DicDefect> ld = new ArrayList<DicDefect>();
		Map<String, DicDefect> map = new HashMap<String, DicDefect>();
		String sql = "select IFNULL(a.defect_id,'') as defect_id,IFNULL(a.defect_name,'') as defect_name,IFNULL(a.defect_loc_def,'') as defect_loc_def,IFNULL(a.defect_def,'') as defect_def,IFNULL(a.defect_template,'') as defect_template,IFNULL(a.defect_attr,'') as defect_attr,b.* from dic_mbr_defect_s as a,dic_mbr_defect_f as b where a.defect_f_id=b.defect_f_id and a.defect_name=? and b.defect_f_name=? and a.defect_f_id in (select defect_f_id from dic_mbr_defect_def where component_id = (select component_id from dic_brg_struct_component_def where component_name=? and specification='桥梁检查记录'))";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { defect_name, defect_name_f, component_name });
		try {
			while (rs.next()) {
				if (map.containsKey(rs.getString("defect_f_id"))) {
					DicDefect d1 = map.get(rs.getString("defect_f_id"));
					List<DicMbrDefectS> lt = d1.getDefects();
					DicMbrDefectS ddt = new DicMbrDefectS();
					ddt.setDefect_def(rs.getString("defect_def"));
					ddt.setDefect_id(rs.getString("defect_id"));
					ddt.setDefect_loc_def(rs.getString("defect_loc_def"));
					ddt.setDefect_template(rs.getString("defect_template"));
					ddt.setDefect_name(rs.getString("defect_name"));
					ddt.setDefect_attr(rs.getString("defect_attr"));
					if (!rs.getString("defect_id").equals("")) {
						lt.add(ddt);
					}
					d1.setDefects(lt);
					map.put(rs.getString("defect_f_id"), d1);
				} else {
					DicDefect d1 = new DicDefect();
					List<DicMbrDefectS> lt = d1.getDefects();
					DicMbrDefectS ddt = new DicMbrDefectS();
					ddt.setDefect_def(rs.getString("defect_def"));
					ddt.setDefect_id(rs.getString("defect_id"));
					ddt.setDefect_loc_def(rs.getString("defect_loc_def"));
					ddt.setDefect_template(rs.getString("defect_template"));
					ddt.setDefect_name(rs.getString("defect_name"));
					ddt.setDefect_attr(rs.getString("defect_attr"));
					if (!rs.getString("defect_id").equals("")) {
						lt.add(ddt);
					}
					d1.setDefect_f_id(rs.getString("defect_f_id"));
					d1.setDefect_f_name(rs.getString("defect_f_name"));
					d1.setDefects(lt);
					map.put(rs.getString("defect_f_id"), d1);
				}

			}
		} catch (SQLException e) {
			log.info(e);
		}
		dataOperation.close();
		for (String s : map.keySet()) {
			ld.add(map.get(s));
		}
		return ld;
	}

	public int newDefect(ChkBrgDefect cbd, String current) {
		String sql = "insert into chk_brg_defect(defect_serial,defect_id,defect_name,defect_location_desc,defect_count,mbr_chk_id,mbr_no,repair_state,develop_state,defect_attr,defect_location_desc_val,defect_count_val,chk_defect_memo,current,defect_name_f) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] { cbd.getDefect_serial(), cbd.getDefect_id(), cbd.getDefect_name(),
						cbd.getDefect_location_desc(), cbd.getDefect_count(), 
						cbd.getMbr_chk_id(), cbd.getMbr_no(), cbd.getRepair_state(), cbd.getDevelop_state(),
						 cbd.getDefect_attr(), cbd.getDefect_location_desc_val(),
						cbd.getDefect_count_val(), cbd.getChk_defect_memo(), current, cbd.getDefect_name_f() });
		dataOperation.close();
		return i;
	}

	public int editDefect(ChkBrgDefect cbd, String current) {
		String sql = "update  chk_brg_defect set defect_location_desc=?,defect_count=?,defect_attr=?,defect_location_desc_val=?,defect_count_val=?,chk_defect_memo=?,current=?,develop_state=? where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] { cbd.getDefect_location_desc(), cbd.getDefect_count(), 
						 cbd.getDefect_attr(), cbd.getDefect_location_desc_val(),
						cbd.getDefect_count_val(), cbd.getChk_defect_memo(), current, cbd.getDevelop_state(),
						cbd.getDefect_serial() });
		dataOperation.close();
		return i;
	}
	
	public int editDefect1(ChkBrgDefect cbd, String current) {
		String sql = "update  chk_brg_defect set defect_id=?,defect_name_f=?,defect_name=?,defect_location_desc=?,defect_count=?,defect_attr=?,defect_location_desc_val=?,defect_count_val=?,chk_defect_memo=?,current=?,develop_state=? where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] {cbd.getDefect_id(),cbd.getDefect_name_f(),cbd.getDefect_name(), cbd.getDefect_location_desc(), cbd.getDefect_count(), 
						 cbd.getDefect_attr(), cbd.getDefect_location_desc_val(),
						cbd.getDefect_count_val(), cbd.getChk_defect_memo(), current, cbd.getDevelop_state(),
						cbd.getDefect_serial() });
		dataOperation.close();
		return i;
	}
	
	public int editDefect2(ChkBrgDefect cbd,String user_defect_attr,String current) {
		String sql = "update chk_brg_defect set defect_name_f='自定义',defect_name=?,defect_location_desc='',defect_count='',defect_attr='',defect_location_desc_val='',defect_count_val='',chk_defect_memo=?,current=?,develop_state='' where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] { user_defect_attr, cbd.getChk_defect_memo(), current, 
						cbd.getDefect_serial() });
		dataOperation.close();
		return i;
	}

	public int delDefect(String id) {
		String sql = "delete from chk_brg_defect where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] { id });
		dataOperation.close();
		return i;
	}

	public int changeRepState(String id, String state) {
		String sql = "update  chk_brg_defect set repair_state=?,current=? where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] { state, "1", id });
		dataOperation.close();
		return i;
	}

	public int changeDevState(String id, String state) {
		String sql = "update  chk_brg_defect set develop_state=?,current=? where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] { state, "1", id });
		dataOperation.close();
		return i;
	}

	public int overCheck(String span_chk_id, OperationConstruct oc) {

		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "update  chk_span_record set chk_state='1' where span_chk_id=?";
		int i = dataOperation.executeUpdate(sql, new String[] { span_chk_id });
		dataOperation.close();
		return i;
	}

	public int saveDefectCount(List<DefectCount> ll, String defect_serial) {
		String sql = "insert into defect_count (defect_serial,struct_id,chk_id,member_no,defect_id,defect_record,defect_record_val,defect_record_type,save_date) values (?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = 0;
		for (DefectCount dc : ll) {
			i = dataOperation.executeUpdate(sql, new Object[] { defect_serial, dc.getStruct_id(), dc.getChk_id(),
					dc.getMember_no(), dc.getDefect_id(), dc.getDefect_record(), dc.getDefect_record_val(),
					dc.getDefect_record_type(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) });
			if (i < 0) {
				break;
			}
		}
		dataOperation.close();
		return i;
	}

	public int editDefectCount(List<DefectCount> ll, String defect_serial) {
		String sql = "delete from defect_count where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = 0;

		i = dataOperation.executeUpdate(sql, new String[] { defect_serial });
		if (i > 0) {
			sql = "insert into defect_count (defect_serial,struct_id,chk_id,member_no,defect_id,defect_record,defect_record_val,defect_record_type,save_date) values (?,?,?,?,?,?,?,?,?)";
			for (DefectCount dc : ll) {
				i = dataOperation.executeUpdate(sql, new Object[] { defect_serial, dc.getStruct_id(), dc.getChk_id(),
						dc.getMember_no(), dc.getDefect_id(), dc.getDefect_record(), dc.getDefect_record_val(),
						dc.getDefect_record_type(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) });
				if (i < 0) {
					break;
				}
			}
		}
		dataOperation.close();
		return i;
	}

	public boolean span_no_last(String id, String span_no, String direction) {
		boolean flag = false;
		String sql = "select * from brg_span_info where bridge_id=? and direction=? ORDER BY span_no DESC LIMIT 0,1";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { id, direction });
		try {
			if (rs.next()) {
				String spa = rs.getString("span_no");
				if (spa.equals(span_no)) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			log.info(e);
		}
		dataOperation.close();
		return flag;
	}

	public int changeChkState(String span_chk_id, String chk_id, String prj_id, String audit_state) {
		String sql = "update chk_brg_regular set audit_state='0' where chk_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = dataOperation.executeUpdate(sql, new String[] { chk_id });
		sql = "update chk_span_record set chk_state='0',pdf=? where span_chk_id=?";
		i = dataOperation.executeUpdate(sql, new String[] { null, span_chk_id });
		dataOperation.close();
		return i;
	}
	
	public int changeChkState_daily( String chk_id, String prj_id, String audit_state) {
		String sql = "update chk_brg_regular set audit_state='0' where chk_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		int i = dataOperation.executeUpdate(sql, new String[] { chk_id });
		dataOperation.close();
		return i;
	}
	

	public int insertPhoto(ChkBrgPhoto chkBrgPhoto) {
		int i = 0;
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = " INSERT INTO chk_brg_photo(photo_name,photo_path,photo_date,defect_serial) VALUES(?,?,?,?) ";
		String[] params = new String[] { chkBrgPhoto.getPhoto_name(), chkBrgPhoto.getPhoto_path(),
				chkBrgPhoto.getPhoto_date(), chkBrgPhoto.getDefect_serial() };
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
	}

	public int updatePhotoPath(String photoPath,String photo_id) {
		int i = 0;
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = " update chk_brg_photo set photo_path=? where photo_id=? ";
		String[] params = new String[] {photoPath,photo_id};
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
	}
	public int deletePhotoById(String photo_id) {
		int i = 0;
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = " delete from chk_brg_photo where photo_id=?";
		String[] params = new String[] { photo_id };
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
	}

	public int updatePhotoNameById(String photo_id, String photo_name) {
		int i = 0;
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		String sql = " UPDATE chk_brg_photo SET photo_name=? WHERE photo_id=?";
		String[] params = new String[] { photo_name, photo_id };
		i = mdo.executeUpdate(sql, params);
		mdo.close();
		return i;
	}

	public List<ChkBrgPhoto> selectPhotoBySerial(String photo_serial) {
		String sql = "select * from chk_brg_photo where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { photo_serial });

		List<ChkBrgPhoto> photoList = new ArrayList<>();
		try {
			while (rs.next()) {

				ChkBrgPhoto cbp = new ChkBrgPhoto();
				cbp.setPhoto_id(rs.getString("photo_id"));
				cbp.setPhoto_name(rs.getString("photo_name"));
				cbp.setPhoto_date(rs.getString("photo_date"));
				cbp.setPhoto_path(rs.getString("photo_path"));
				cbp.setDefect_serial(rs.getString("defect_serial"));
				String phtoto_path = rs.getString("photo_path");
				if (phtoto_path!=null) {
					if(!phtoto_path.equals("")) {
					photoList.add(cbp);
					}
				}
			}
		} catch (SQLException e) {

			log.info(e);
		}
		dataOperation.close();
		return photoList;
	}
	
	public String selectComponent8(String component11) {
		String sql = "select * from dic_brg_struct_member_def where component11=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { component11 });
        String component8="";
		try {
			while (rs.next()) {
				component8="";
				component8=rs.getString("component8");
			}
		} catch (SQLException e) {

			log.info(e);
		}
		dataOperation.close();
		return component8;
	}
	public List<ChkPassPhoto> selectPassPhotoBySerial(String photo_serial) {
		String sql = "select * from chk_pass_photo where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { photo_serial });

		List<ChkPassPhoto> photoList = new ArrayList<>();
		try {
			while (rs.next()) {

				ChkPassPhoto cbp = new ChkPassPhoto();
				cbp.setPhoto_id(rs.getString("photo_id"));
				cbp.setPhoto_name(rs.getString("photo_name"));
				cbp.setPhoto_date(rs.getString("photo_date"));
				cbp.setPhoto_path(rs.getString("photo_path"));
				cbp.setDefect_serial(rs.getString("defect_serial"));
				String phtoto_path = rs.getString("photo_path");
				if (phtoto_path!=null) {
					if(!phtoto_path.equals("")) {
					photoList.add(cbp);
					}
				}
			}
		} catch (SQLException e) {

			log.info(e);
		}
		dataOperation.close();
		return photoList;
	}
	
	public int setTemp(String chk_id,String tem) {
		int i = 0;
		String sql = " UPDATE chk_span_record SET temp=? WHERE chk_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = dataOperation.executeUpdate(sql, new String[]{tem,chk_id});
		dataOperation.close();
		return i;
	}
	
	public String getTemp(String chk_id) {
		String temp = "";
		String sql = " SELECT temp FROM chk_span_record WHERE chk_id=? GROUP BY temp ORDER BY temp DESC LIMIT 1 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{chk_id});
		try
		{
			while (rs.next())
			{
				temp = rs.getString("temp");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return temp;
		
	}
	
	public List<String>getZoneMan(String zoneId){
		List<String>list=new ArrayList<>();
		String zoneIds=zoneId+"%";
		String name;
		String sql="SELECT org_usr_name FROM sys_org_usr_info where department_id like ? and phone_no is not null and phone_no<>''";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{zoneIds});
		try {
			while(rs.next()){
				name=rs.getString(1);
				list.add(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}

	public String getChkTime(String chk_id){
		String chkTime=null;
		String sql="SELECT chk_time FROM chk_span_record where span_chk_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{chk_id});
		try {
			while(rs.next()){
				chkTime=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return chkTime;
	}
	
	public String getChkTimeOfPass(String chk_id){
		String chkTime=null;
		String sql="SELECT chk_time FROM chk_pass_span_record where span_chk_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{chk_id});
		try {
			while(rs.next()){
				chkTime=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return chkTime;
	}
	
	public String getPhone(String uName){
		String phone=null;
		String sql="SELECT phone_no FROM sys_org_usr_info where org_usr_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{uName});
		try {
			while(rs.next()){
				phone=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return phone;
	}
	
	public String getOrgId(String chk_id){
		String orgId=null;
		String sql="SELECT org_id FROM sys_org_info where org_name=(select maintain_org from chk_brg_regular where chk_id=?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{chk_id});
		try {
			while(rs.next()){
				orgId=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return orgId;
	}
	
	public String getOrgIdOfPass(String chk_id){
		String orgId=null;
		String sql="SELECT org_id FROM sys_org_info where org_name=(select maintain_org from chk_pass_regular where chk_id=?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{chk_id});
		try {
			while(rs.next()){
				orgId=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return orgId;
	}
	
}
