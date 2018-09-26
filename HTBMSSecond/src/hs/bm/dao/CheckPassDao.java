package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.ChkSpanRecord;
import hs.bm.bean.DefectCount;
import hs.bm.bean.PassSpanInfo;
import hs.bm.vo.BridgeChk;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;

public class CheckPassDao {

private static CheckPassDao checkPassDao;
	
	public static CheckPassDao getInstance(){
		if(checkPassDao==null){
			checkPassDao=new CheckPassDao();
		}
		return checkPassDao;
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
	
	public List<PassSpanInfo> getSpan(String pass_id){
		String sql = "select * from pass_span_info where pass_id=? ORDER BY span_no";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{pass_id});
		List<PassSpanInfo> lb=new ArrayList<PassSpanInfo>();
		try {
			while (rs.next()) {
				PassSpanInfo dmd = new PassSpanInfo();
				dmd.setS_id(rs.getString("s_id"));
				dmd.setPass_id(rs.getString("pass_id"));
				dmd.setDirection(rs.getString("direction"));
				dmd.setSpan_no(rs.getInt("span_no"));
				dmd.setPass_type_id(rs.getString("pass_type_id"));
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
	    			+ "(select * from chk_pass_regular where chk_id=?) as b on 1=1;";
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
					bc.setEval_level(rs.getString("eval_level"));
					ro.setObj(bc);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dataOperation.close();
			return ro;
	    }
	 
	 public BridgeChk getAllSpansData(BridgeChk bc){
		 String sql = "select * from chk_pass_span_record where chk_id=?";
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
					dmd.setSpan_memo(rs.getString("span_memo"));
					dmd.setSpan_suggestion(rs.getString("span_suggestion"));
					dmd.setChk_time(rs.getString("chk_time"));
					dmd.setChk_weather(rs.getString("chk_weather"));
					dmd.setTemp(rs.getString("temp"));
					dmd.setChk_state(rs.getString("chk_state"));
					dmd.setRecheck_person(rs.getString("recheck_person"));
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
		 String sql = "select * from chk_pass_span_record where chk_id=?";
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
		 String sql = "insert into chk_pass_span_record(span_chk_id,chk_id,direction,span_no,span_memo,span_suggestion,chk_time,chk_weather,temp,chk_state,record_person,recheck_person) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
			//String uuid=UUID.randomUUID().toString().replaceAll("-", "");
			int i = dataOperation.executeUpdate(sql, new String[]{
					cs.getSpan_chk_id(),
					cs.getChk_id(),
					cs.getDirection(),
					cs.getSpan_no(),
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
		 String sql = "update chk_pass_span_record set span_memo=?,span_suggestion=?,chk_time=?,chk_weather=?,temp=?,chk_state=?,recheck_person=?,pdf=? where span_chk_id=?";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
			//String uuid=UUID.randomUUID().toString().replaceAll("-", "");
			int i = dataOperation.executeUpdate(sql, new String[]{
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
		 String sql = "delete from chk_pass_span_record where span_chk_id=?";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
			//String uuid=UUID.randomUUID().toString().replaceAll("-", "");
			int i = dataOperation.executeUpdate(sql, new String[]{
					span_chk_id
			});
			dataOperation.close();
			return i;
	 }
	 
	 public int overCheck(OperationConstruct oc,String chk_id, String eval_level, String inspection_person){
			
		
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
			String sql = "UPDATE chk_pass_regular set check_date=CURDATE(),audit_state='1',eval_level=?,inspection_person=? where chk_id=?";
			int i = dataOperation.executeUpdate(sql, new String[]{
					eval_level,
					inspection_person,
					chk_id
			});
			dataOperation.close();
			return i;
		}
	 

	 
	 public List<DefectCount> getDefectCount(String defect_serial){
		 String sql = "select * from defect_count_pass where defect_serial=?";
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
	 
	 
	
	public int changeState(String chk_id, String prj_id) {
		String sql = "update chk_pass_regular set audit_state='0' where chk_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
		int i = dataOperation.executeUpdate(sql, new String[]{
				chk_id
		});
		dataOperation.close();
		return i;
	}
	
	
	public Map<String, String> initPhoto(String id, String prj_id){
		System.out.println(id);
		System.out.println(prj_id);
		Map<String, String> map= new HashMap<String, String>();
		String sql = "select * from pass_prj_photo where pass_id=? and prj_id=?";
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
		String sql = "update pass_prj_photo set path=? where pass_id=? and prj_id=? and photo_type=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{path, id, prj_id, photo_type});
		if(i<=0){
			sql = "insert into pass_prj_photo(pass_id, prj_id, path, photo_type) values(?,?,?,?)";
			i = dataOperation.executeUpdate(sql, new String[]{ id, prj_id, path, photo_type});
		}
		dataOperation.close();
	}
	
}
