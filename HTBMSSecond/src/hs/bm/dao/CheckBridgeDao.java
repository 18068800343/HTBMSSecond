package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.BrgSpanInfo;
import hs.bm.bean.ChkBrgRegular;
import hs.bm.bean.ChkProjectInfo;
import hs.bm.bean.ChkSpanRecord;
import hs.bm.bean.DefectCount;
import hs.bm.vo.BridgeChk;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;

public class CheckBridgeDao {
	
	private static CheckBridgeDao checkBridgeDao;
	
	public static CheckBridgeDao getInstance(){
		if(checkBridgeDao==null){
			checkBridgeDao=new CheckBridgeDao();
		}
		return checkBridgeDao;
	}
	
	public String getPerson(String prj_id){
		String sql = "select prj_member from chk_project_info where prj_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id});
		String names = "";
		try {
			while (rs.next()) {
				names= rs.getString("prj_member");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return names;
	}
	
	
	//@author xianing 
	public String getPrjDesc(String prj_id){
		String sql = "select prj_desc from chk_project_info where prj_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id});
		String info = "";
		try {
			while (rs.next()) {
				info= rs.getString("prj_desc");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return info;
	}
	
	public List<BrgSpanInfo> getSpan(String bridge_id){
		String sql = "select * from brg_span_info where bridge_id=? ORDER BY span_no";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id});
		List<BrgSpanInfo> lb=new ArrayList<BrgSpanInfo>();
		try {
			while (rs.next()) {
				BrgSpanInfo dmd = new BrgSpanInfo();
				dmd.setS_id(rs.getString("s_id"));
				dmd.setBridge_id(rs.getString("bridge_id"));
				dmd.setDirection(rs.getString("direction"));
				dmd.setSpan_no(rs.getString("span_no"));
				dmd.setBrg_type_id(rs.getString("brg_type_id"));
				lb.add(dmd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return lb;
	}
	
	
	 public ResObj CheckState(String username,OperationConstruct oc){
	    	ResObj ro = new ResObj();
	    	ro.setError(1);
	    	ro.setSuccess("fail");
	    	String sql="select a.*,b.* from (select * from chk_project_info where prj_id=? and (prj_charge_man like '%$%' or prj_member like '%$%')) as a RIGHT JOIN "
	    			+ "(select * from chk_brg_regular where chk_id=?) as b on 1=1;";
	    	sql=sql.replaceAll("\\$", username);
	    	MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
			ResultSet rs=dataOperation.executeQuery(sql,new String[]{oc.getPrj_id(),oc.getChk_id()});
			BridgeChk bc = new BridgeChk();
			bc.setChk_id(oc.getChk_id());
			bc.setChk_type(oc.getChk_type());
			bc.setPrj_desc(oc.getPrj_desc());
			bc.setPrj_id(oc.getPrj_id());
			try {
				if(rs.next()){
					ro.setSuccess("success");
					bc.setCheck_date(rs.getString("check_date"));
					bc.setAudit_state(rs.getString("audit_state"));
					ro.setObj(bc);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dataOperation.close();
			return ro;
	    }
	 
	 public BridgeChk getAllSpansData(BridgeChk bc){
		 String sql = "select * from chk_span_record where chk_id=?";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
			ResultSet rs = dataOperation.executeQuery(sql, new String[]{bc.getChk_id()});
			List<ChkSpanRecord> lb=new ArrayList<ChkSpanRecord>();
			try {
				while (rs.next()) {
					ChkSpanRecord dmd = new ChkSpanRecord();
					dmd.setSpan_chk_id(rs.getString("span_chk_id"));
					dmd.setChk_id(rs.getString("chk_id"));
					dmd.setDirection(rs.getString("direction"));
					dmd.setSpan_no(rs.getString("span_no"));
					dmd.setSpan_build(rs.getString("span_build"));
					dmd.setSpan_top_struct(rs.getString("span_top_struct"));
					dmd.setSpan_down_struct(rs.getString("span_down_struct"));
					dmd.setSpan_memo(rs.getString("span_memo"));
					dmd.setSpan_suggestion(rs.getString("span_suggestion"));
					dmd.setChk_time(rs.getString("chk_time"));
					dmd.setChk_weather(rs.getString("chk_weather"));
					dmd.setTemp(rs.getString("temp"));
					dmd.setChk_state(rs.getString("chk_state"));
					dmd.setRecheck_person(rs.getString("recheck_person"));
					dmd.setRecord_person(rs.getString("record_person"));
					lb.add(dmd);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dataOperation.close();
		 bc.setSpans(lb);
		 return bc;
		 
	 }
	 
	 public List<ChkSpanRecord> getAllSpans(String chk_id){
		 String sql = "select * from chk_span_record where chk_id=?";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
			ResultSet rs = dataOperation.executeQuery(sql, new String[]{chk_id});
			List<ChkSpanRecord> lb=new ArrayList<ChkSpanRecord>();
			try {
				while (rs.next()) {
					ChkSpanRecord dmd = new ChkSpanRecord();
					dmd.setSpan_chk_id(rs.getString("span_chk_id"));
					dmd.setChk_id(rs.getString("chk_id"));
					dmd.setDirection(rs.getString("direction"));
					dmd.setSpan_no(rs.getString("span_no"));
					dmd.setSpan_build(rs.getString("span_build"));
					dmd.setSpan_top_struct(rs.getString("span_top_struct"));
					dmd.setSpan_down_struct(rs.getString("span_down_struct"));
					dmd.setSpan_memo(rs.getString("span_memo"));
					dmd.setSpan_suggestion(rs.getString("span_suggestion"));
					dmd.setChk_time(rs.getString("chk_time"));
					dmd.setChk_weather(rs.getString("chk_weather"));
					dmd.setTemp(rs.getString("temp"));
					dmd.setChk_state(rs.getString("chk_state"));
					dmd.setRecheck_person(rs.getString("recheck_person"));
					dmd.setRecord_person(rs.getString("record_person"));
					lb.add(dmd);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dataOperation.close();
		 return lb;
		 
	 }
	 
	 public int addSpan(ChkSpanRecord cs){
		 String sql = "insert into chk_span_record(span_chk_id,chk_id,direction,span_no,span_build,span_top_struct,span_down_struct,span_memo,span_suggestion,chk_time,chk_weather,temp,chk_state,record_person,recheck_person) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
			//String uuid=UUID.randomUUID().toString().replaceAll("-", "");
			int i = dataOperation.executeUpdate(sql, new String[]{
					cs.getSpan_chk_id(),
					cs.getChk_id(),
					cs.getDirection(),
					cs.getSpan_no(),
					cs.getSpan_build(),
					cs.getSpan_top_struct(),
					cs.getSpan_down_struct(),
					cs.getSpan_memo(),
					cs.getSpan_suggestion(),
					cs.getChk_time(),
					cs.getChk_weather(),
					cs.getTemp(),
					cs.getChk_state(),
					cs.getRecord_person(),
					cs.getRecheck_person()
			});
			dataOperation.close();
			return i;
	 }
	 public int editSpan(ChkSpanRecord cs){
		 String sql = "update chk_span_record set span_build=?,span_top_struct=?,span_down_struct=?,span_memo=?,span_suggestion=?,chk_time=?,chk_weather=?,temp=?,chk_state=?,recheck_person=?,pdf=? where span_chk_id=?";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
			//String uuid=UUID.randomUUID().toString().replaceAll("-", "");
			int i = dataOperation.executeUpdate(sql, new String[]{
					cs.getSpan_build(),
					cs.getSpan_top_struct(),
					cs.getSpan_down_struct(),
					cs.getSpan_memo(),
					cs.getSpan_suggestion(),
					cs.getChk_time(),
					cs.getChk_weather(),
					cs.getTemp(),
					cs.getChk_state(),
					cs.getRecheck_person(),
					null,
					cs.getSpan_chk_id()
			});
			dataOperation.close();
			return i;
	 }
	 public int delSpan(String span_chk_id){
		 String sql = "delete from chk_span_record where span_chk_id=?";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
			int i = dataOperation.executeUpdate(sql, new String[]{
					span_chk_id
			});
			dataOperation.close();
			return i;
	 }
	 
	 public String listToStr( List<String> ll ){
		 int size = ll.size();
			String res = "";
			for(int i=0;i<size;i++){
				if(i==(size-1)){
					res += ll.get(i);
				}else{
					res += ll.get(i)+",";
				}
			}
			return res;
	 }
	 
	 public int overCheck(OperationConstruct oc,String chk_id){
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
			String sql = "select d1.bridge_pile_no,d1.bridge_id,d1.bridge_name,d1.beneath_path_name,d2.bridge_len,d1.build_year "
					+"from brg_card_admin_id d1,brg_card_struct_tech d2 where d1.bridge_id=d2.bridge_id and d1.bridge_id=?";
			ResultSet rs = dataOperation.executeQuery(sql, new String[]{oc.getId()});
			String bridge_pile_no= "";
			String beneath_path_name= "";
			String bridge_len= "";
			String build_year= "";
			String down_struct = "";
			String top_struct = "";
			try {
				while(rs.next()){
					bridge_pile_no = rs.getString("bridge_pile_no");
					beneath_path_name = rs.getString("beneath_path_name");
					bridge_len = rs.getString("bridge_len");
					build_year = rs.getString("build_year");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			down_struct = listToStr(getDownConstruct(oc.getId())); 
			
			sql = "select * from brg_card_top_struct where bridge_id=?";
			List<String> ll = new ArrayList<String>();
			Set<String> set = new HashSet<String>();
			rs = dataOperation.executeQuery(sql, new String[]{oc.getId()});
			try {
				while(rs.next()){
					String top_struct_type = rs.getString("top_struct_type");
					if(top_struct_type!=null && !top_struct_type.equals("")){
						set.add(top_struct_type);
					}
				 }
			} catch (SQLException e) {
				e.printStackTrace();
			}
			ll.addAll(set);
			top_struct = listToStr(ll);
			sql = "UPDATE chk_brg_regular set stub_no=?,down_lane_name=?,bridge_len=?,construct_ym=?,line_no=?,line_name=?,top_struct_type=?,down_struct_type=?,"
					+ "check_date=CURDATE(),audit_state='1' where chk_id=?";
			int i = dataOperation.executeUpdate(sql, new String[]{
					bridge_pile_no,
					beneath_path_name,
					bridge_len,
					build_year,
					oc.getLine_no(),
					oc.getLine_name(),
					top_struct,
					down_struct,
					chk_id
			});
			dataOperation.close();
			return i;
		}
	 
//	 public List<SpanMem> spanCopy(String chk_type,String bridge_id,String direction,String span_no){
//		 String sql="select span_chk_id from chk_span_record where chk_id="
//		 		+ "(select b.chk_id from chk_project_info as a,chk_brg_regular as b "
//		 		+ "where b.bridge_id=? and a.prj_id=b.prj_id and a.chk_type=? and a.prj_state='1'"
//		 		+ "ORDER BY prj_complete_tm desc LIMIT 0,1) and direction=? and span_no=?";
//		 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
//		 ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id,chk_type,direction,span_no});
//		 List<SpanMem> ls=new ArrayList<SpanMem>();
//		 try {
//				if (rs.next()) {
//					String span_chk_id=rs.getString("span_chk_id");
//					ls=CheckSpanDao.getInstance().initTable(span_chk_id);
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			dataOperation.close();
//			return ls;
//	 }
	 public List<String> getDefectPhoto(String span_chk_id){
		 String sql="select defect_photo from chk_brg_defect where mbr_chk_id in (select mbr_chk_id from chk_brg_record where span_chk_id=?)";
		 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		 ResultSet rs = dataOperation.executeQuery(sql, new String[]{span_chk_id});
		 List<String> ls=new ArrayList<String>();
		 try {
				while (rs.next()) {
					ls.add(rs.getString("defect_photo"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dataOperation.close();
			return ls;
		 
	 }
	 
	 public List<DefectCount> getDefectCount(String defect_serial){
		 String sql = "select * from defect_count where defect_serial=?";
		 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		 ResultSet rs = dataOperation.executeQuery(sql, new String[]{defect_serial});
		 List<DefectCount> ll=new ArrayList<DefectCount>();
		 try {
				while (rs.next()) {
					DefectCount dCount = new DefectCount();
					dCount.setStruct_id(rs.getString("struct_id"));
					dCount.setChk_id(rs.getString("chk_id"));
					dCount.setMember_no(rs.getString("member_no"));
					dCount.setDefect_id(rs.getString("defect_id"));
					dCount.setDefect_record(rs.getString("defect_record"));
					dCount.setDefect_record_val(rs.getString("defect_record_val"));
					dCount.setDefect_record_type(rs.getString("defect_record_type"));
					dCount.setSave_date(rs.getString("save_date"));
					ll.add(dCount);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dataOperation.close();
			return ll;
	 }
	 
	 public int saveDefectCount(List<DefectCount> ll, String defect_serial, String chk_id){
			String sql = "insert into defect_count (defect_serial,struct_id,chk_id,member_no,defect_id,defect_record,defect_record_val,defect_record_type,save_date) values (?,?,?,?,?,?,?,?,?)";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
			int i=0;
			for(DefectCount dc: ll){
				i = dataOperation.executeUpdate(sql, new Object[]{
						defect_serial,
						dc.getStruct_id(),
						chk_id,
						dc.getMember_no(),
						dc.getDefect_id(),
						dc.getDefect_record(),
						dc.getDefect_record_val(),
						dc.getDefect_record_type(),
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())
				});
				if(i<0){
					break;
				}
			}
			dataOperation.close();
			return i;
		}
	 
	 public String getTopConstruct(String id, String direction, String span_no){
		 String sql = "select brg_type_name from dic_brg_struct_type_def where brg_type_id=(select brg_type_id from brg_span_info where bridge_id=? and direction=? and span_no=?)";
		 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		 ResultSet rs = dataOperation.executeQuery(sql, new String[]{id, direction, span_no});
		 String type = "";
		 try {
			while(rs.next()){
				 type = rs.getString("brg_type_name");
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 dataOperation.close();
		 return type;
	 }
	 

	public List<String> getDownConstruct(String id) {
		String sql = "select * from brg_card_down_struct where bridge_id=?";
		List<String> ll = new ArrayList<String>();
		Set<String> set = new HashSet<String>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		 ResultSet rs = dataOperation.executeQuery(sql, new String[]{id});
		 try {
			while(rs.next()){
				String down_struct_type = rs.getString("down_struct_type");
				set.add(down_struct_type);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 ll.addAll(set);
		 dataOperation.close();
		 return ll;
	}
	
	public Map<String, String> initPhoto(String id, String prj_id){
		System.out.println(id);
		System.out.println(prj_id);
		Map<String, String> map= new HashMap<String, String>();
		String sql = "select * from brg_prj_photo where bridge_id=? and prj_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ id, prj_id });
		try {
			while(rs.next()){
				map.put(rs.getString("photo_type"), rs.getString("path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		System.out.println(JSON.toJSONString(map));
		return map;
	}

	public void updatePhoto(String id, String prj_id, String path, String photo_type) {
		String sql = "update brg_prj_photo set path=? where bridge_id=? and prj_id=? and photo_type=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{path, id, prj_id, photo_type});
		if(i<=0){
			sql = "insert into brg_prj_photo(bridge_id, prj_id, path, photo_type) values(?,?,?,?)";
			i = dataOperation.executeUpdate(sql, new String[]{ id, prj_id, path, photo_type});
		}
		dataOperation.close();
	}
	
	public int changeState(String chk_id, String prj_id) {
		String sql = "update chk_brg_regular set audit_state='0' where chk_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		int i = dataOperation.executeUpdate(sql, new String[]{
				chk_id
		});
		dataOperation.close();
		return i;
	}
	
	
	public int updateChkBrgRegular(ChkBrgRegular chkBrgRegular, String prj_id,String bridge_id,String chk_id) {
	// chk_id, prj_id, line_no, line_name, bridge_id, bridge_name, maintain_org, response_person, audit_state
		String sql = "update chk_brg_regular set "
				+ " stub_no=?,down_lane_name=?,"
				+ " bridge_len=?,main_span_struct=?,"
				+ " span_len=?,construct_ym=?,"
				+ " struct_span=?,top_struct_type=?,"
				+ " down_struct_type=?,last_maintain_date=?,"
				+ " last_check_date=?,check_date=?,"
				+ " climate=?,total_level=?,"
				+ " total_cleanliness_score=?,maintain_score=?,"
				+ " regular_maintain_rec=?,record_person=?,"
				+ " next_check_date=?,defect_desc=?,"
				+ " eval_level=?,pdf=?"
				+ " where chk_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		int i = dataOperation.executeUpdate(sql, new Object[]{
				chkBrgRegular.getStub_no(),chkBrgRegular.getDown_lane_name(),
				chkBrgRegular.getBridge_len(),chkBrgRegular.getMain_span_struct(),
				chkBrgRegular.getSpan_len(),chkBrgRegular.getConstruct_ym(),
				chkBrgRegular.getStruct_span(),chkBrgRegular.getTop_struct_type(),
				chkBrgRegular.getDown_struct_type(),chkBrgRegular.getLast_maintain_date(),
				chkBrgRegular.getLast_check_date(),chkBrgRegular.getCheck_date(),
				chkBrgRegular.getClimate(),chkBrgRegular.getTotal_level(),
				chkBrgRegular.getTotal_cleanliness_score(),chkBrgRegular.getMaintain_score(),
				chkBrgRegular.getRegular_maintain_rec(),chkBrgRegular.getRecord_person(),
				chkBrgRegular.getNext_check_date(),chkBrgRegular.getDefect_desc(),
				chkBrgRegular.getEval_level(),"",
				chk_id
		});
		dataOperation.close();
		return i;
	}
	
	public List<ChkProjectInfo> getPrj_desc(String chk_type){
		List<ChkProjectInfo> list=new ArrayList<ChkProjectInfo>();
		String prj_state="0";
		String sql="SELECT * FROM chk_project_info where prj_state=? and chk_type=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ prj_state, chk_type });
		try {
			while(rs.next()){
				ChkProjectInfo chkProjectInfo = new ChkProjectInfo();
				chkProjectInfo.setPrj_desc(rs.getString("prj_desc"));
				chkProjectInfo.setPrj_establish_tm(rs.getString("prj_establish_tm"));
				chkProjectInfo.setPrj_charge_man(rs.getString("prj_charge_man"));
				chkProjectInfo.setPrj_member(rs.getString("prj_member"));
				list.add(chkProjectInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	public String getPhone(String charge_man){
		List<String>list=new ArrayList<>();
		String sql="SELECT phone_no FROM sys_usr_usr_info a left join sys_org_usr_info b on a.org_usr_id = b.org_usr_id where a.usr_name=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{charge_man});
		try {
			while(rs.next()){
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
        if(list.size()>0){
        	return list.get(0);
        }else{
        	return "";
        }
		
	}
	
}
