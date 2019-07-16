package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkBrgPhoto;
import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.ChkSpanRecord;
import hs.bm.bean.DefectCount;
import hs.bm.bean.PassSpanInfo;
import hs.bm.util.IDtool;
import hs.bm.vo.BridgeChk;
import hs.bm.vo.BridgeChkVo;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.PassChkVo;
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
					dmd.setRecord_person(rs.getString("record_person"));
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
	 
	 
	 public ChkSpanRecord getChkSpanRecordByChkIdDirection(String chk_id,String direction,String span_no){
		 String sql = "select * from chk_pass_span_record where chk_id=? and direction=? and span_no=?";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
			ResultSet rs = dataOperation.executeQuery(sql, new String[]{chk_id,direction,span_no});
			ChkSpanRecord dmd = null;
			try {
				if (rs.next()) {
				    dmd = new ChkSpanRecord();
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
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dataOperation.close();
		 return dmd;
		 
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
	
	public static List<PassChkVo> getChkIdByPrjId(String prj_id){
		String sql = " select chk_id,pass_id from chk_pass_regular where prj_id =? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id});
		List<PassChkVo> passChkVos = new ArrayList<>();
		try {
			while (rs.next()) {
				PassChkVo passChkVo = new PassChkVo();
				String chkId  = rs.getString("chk_id");
				passChkVo.setChkId(chkId);
				passChkVo.setPassId(rs.getString("pass_id"));
				passChkVos.add(passChkVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return passChkVos;
	}
	
	public List<ChkBrgRecord> getChkPassRecordBySpanChkId(String span_chk_id)
	{
		//
		String sql = "select * from chk_pass_record where span_chk_id =? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ span_chk_id});
		List<ChkBrgRecord> list = new ArrayList<>();
		try
		{
			while (rs.next())
			{
				ChkBrgRecord chkBrgRecord = new ChkBrgRecord();
				chkBrgRecord.setMbr_chk_id(rs.getString("mbr_chk_id"));
				chkBrgRecord.setSpan_chk_id(rs.getString("span_chk_id"));
				chkBrgRecord.setBridge_id(rs.getString("pass_id"));
				chkBrgRecord.setDirection(rs.getString("direction"));
				chkBrgRecord.setSpan_no(rs.getString("span_no"));
				chkBrgRecord.setMbr_type(rs.getString("mbr_type"));
				chkBrgRecord.setMbr_no(rs.getString("mbr_no"));
				chkBrgRecord.setMbr_chk_date(rs.getString("mbr_chk_date"));
				chkBrgRecord.setMbr_chk_person(rs.getString("mbr_chk_person"));
				chkBrgRecord.setIs_evaluate(rs.getString("Is_evaluate"));
				list.add(chkBrgRecord);
			}
		} catch (SQLException e)
		{

		}
		dataOperation.close();
		return list;
	}
	
	public static String getNewChkIdByBrgIdAndPrjId(String prj_id,String passId){
		String sql = " select chk_id from chk_pass_regular where prj_id =? and pass_id=? ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id,passId});
		String chkId ="";
		try {
			if (rs.next()) {
			  chkId  = rs.getString("chk_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return chkId;
	}
	public static void main(String[] args) {
/*		BridgeChk old_bc = new BridgeChk();
		//2017年沿海高速公路桥梁定期检查  prj_id 6e0f036d7b3e44fd89915562e9bf02be
		//2019年沿海高速定期检查  prj_id 8ba63281013842febc705a30ec0d2460
		//
		//2017 chk_id fa98ec5392b745bd91aef540e5399363
		//2018 chk_id 3d451fd9e2b843bea13b2dd7ed06b146
		
		old_bc.setChk_id("1ccfd83694ab4dcebb82f36c1e900982");
		//根据chk_id查出跨检查记录集合
		List<ChkSpanRecord> old_list = new CheckBridgeDao().getAllSpansData(old_bc).getSpans();
		for(ChkSpanRecord csr_old:old_list){
			String oldDirection = csr_old.getDirection();
			String oldSpanNo = csr_old.getSpan_no();
			String newChkId = "824b185044d643baa1281ed453210a6e";
			ChkSpanRecord newChkSpanRecord = new CheckBridgeDao().getChkSpanRecordByChkIdDirection(newChkId, oldDirection, oldSpanNo);
			//根据跨检查记录每条的 span_chk_id查出对应的构件检查记录 获取记录中的 mbr_chk_id
			 List<ChkBrgRecord> oldChkBrgRecords = new CheckBridgeDao().getChkBrgRecordBySpanChkId(csr_old.getSpan_chk_id());
			 //如果跨下面的构件检查记录集合不为空,查出对应该跨的18年项目构件检查记录集合.
			 if(oldChkBrgRecords.size()>0){
				 if(null==newChkSpanRecord){
					 newChkSpanRecord = new ChkSpanRecord();
					 String uuid = IDtool.getUUID();
					 newChkSpanRecord.setSpan_chk_id(uuid);
					 csr_old.setSpan_chk_id(uuid);
					 csr_old.setChk_id(newChkId);
					 CheckBridgeDao.getInstance().addSpan(csr_old);
				 }
				 //18年项目构件检查记录集合 chk_brg_record集合
				 List<ChkBrgRecord> newChkBrgRecords = new CheckBridgeDao().getChkBrgRecordBySpanChkId(newChkSpanRecord.getSpan_chk_id());	 
				 //如果老项目的构件检查记录有数据,而新项目里的构建检查记录无数据,将老项目的构件检查记录复制
				 if(newChkBrgRecords==null||newChkBrgRecords.size()==0){
					 //根据老项目的构件检查主键mbr_chk_id查出对应构件的所有病害以及病害中的图片photo
					 for(ChkBrgRecord old_chkBrgRecord:oldChkBrgRecords){
						 //新项目在chkBrgRecord中插入新纪录,生成一个新的
						 List<ChkBrgDefect> oldchkBrgDefects =  new CheckSpanDao().getDefectList(old_chkBrgRecord.getMbr_chk_id());
						 String newMbrChkId =IDtool.getUUID(); 
						 old_chkBrgRecord.setMbr_chk_id(newMbrChkId);
						 old_chkBrgRecord.setSpan_chk_id(newChkSpanRecord.getSpan_chk_id());
						 new CheckSpanDao().insertIntoChkBrgRecord(old_chkBrgRecord);
						 for(ChkBrgDefect oldChkBrgDefect:oldchkBrgDefects){
							 String newDefectSerial=IDtool.getUUID();
							 oldChkBrgDefect.setDefect_serial(newDefectSerial);
							 oldChkBrgDefect.setMbr_chk_id(newMbrChkId);
							 new CurrentControlDao().insertChkBrgDefect(oldChkBrgDefect);
							 List<ChkBrgPhoto> oldPhotoList = oldChkBrgDefect.getPhotos();
							 for(ChkBrgPhoto oldChkBrgPhoto:oldPhotoList){
								 oldChkBrgPhoto.setDefect_serial(newDefectSerial);
								 oldChkBrgPhoto.setPhoto_path("");
								 new CheckSpanDao().insertPhoto(oldChkBrgPhoto);
							 }
						 }
					 }
				 }
			 }
		}*/
		//deletePhotoPath();
		//根据新老项目进行缺少的检查记录恢复
		List<PassChkVo> passChkVos = getChkIdByPrjId("e3e453fb3ef14d57979bc5c5eee7271b");
		int i=1;
		for(PassChkVo passChkVo:passChkVos){
			System.out.println("第"+i+"座桥正在copy");
			String oldChkId = passChkVo.getChkId();
			String passId = passChkVo.getPassId();
			String newChkId = getNewChkIdByBrgIdAndPrjId("99c4158664a14605a34b87a839f6e4bf", passId);
			if(null!=newChkId&&!"".equals(newChkId)){
				copyByPrj(oldChkId, newChkId);
				i++;
			}
		}
		/*copyByPrj("fab1acf597a84b81a4dbf789524b674b", "fd0a959466054ef897521fd04aa3a982");*/
	}
	
	public static void copyByPrj(String oldChkId,String newChkId){
		BridgeChk old_bc = new BridgeChk();
		//2017年沿海高速公路桥梁定期检查  prj_id 6e0f036d7b3e44fd89915562e9bf02be
		//2019年沿海高速定期检查  prj_id 8ba63281013842febc705a30ec0d2460
		//
		//2017 chk_id fa98ec5392b745bd91aef540e5399363
		//2018 chk_id 3d451fd9e2b843bea13b2dd7ed06b146
		
		old_bc.setChk_id(oldChkId);
		//根据chk_id查出跨检查记录集合
		List<ChkSpanRecord> old_list = new CheckPassDao().getAllSpansData(old_bc).getSpans();
		for(ChkSpanRecord csr_old:old_list){
			String oldDirection = csr_old.getDirection();
			String oldSpanNo = csr_old.getSpan_no();
			//String newChkId = "824b185044d643baa1281ed453210a6e";
			ChkSpanRecord newChkSpanRecord = new CheckPassDao().getChkSpanRecordByChkIdDirection(newChkId, oldDirection, oldSpanNo);
			//根据跨检查记录每条的 span_chk_id查出对应的构件检查记录 获取记录中的 mbr_chk_id
			 List<ChkBrgRecord> oldChkBrgRecords = new CheckPassDao().getChkPassRecordBySpanChkId(csr_old.getSpan_chk_id());
			 //如果跨下面的构件检查记录集合不为空,查出对应该跨的18年项目构件检查记录集合.
			 if(oldChkBrgRecords.size()>=0){
				 if(null==newChkSpanRecord){
					 newChkSpanRecord = new ChkSpanRecord();
					 String uuid = IDtool.getUUID();
					 newChkSpanRecord.setSpan_chk_id(uuid);
					 csr_old.setSpan_chk_id(uuid);
					 csr_old.setChk_id(newChkId);
					 csr_old.setChk_state("0");
					 CheckPassDao.getInstance().addSpan(csr_old);
				 }
				 //18年项目构件检查记录集合 chk_brg_record集合
				 List<ChkBrgRecord> newChkBrgRecords = new CheckPassDao().getChkPassRecordBySpanChkId(newChkSpanRecord.getSpan_chk_id());	 
				 //如果老项目的构件检查记录有数据,而新项目里的构建检查记录无数据,将老项目的构件检查记录复制
				 if(newChkBrgRecords==null||newChkBrgRecords.size()==0){
					 //根据老项目的构件检查主键mbr_chk_id查出对应构件的所有病害以及病害中的图片photo
					 for(ChkBrgRecord old_chkBrgRecord:oldChkBrgRecords){
						 //新项目在chkBrgRecord中插入新纪录,生成一个新的
						 List<ChkBrgDefect> oldchkBrgDefects =  new CheckPassSpanDao().getDefectList(old_chkBrgRecord.getMbr_chk_id());
						 String newMbrChkId =IDtool.getUUID(); 
						 old_chkBrgRecord.setMbr_chk_id(newMbrChkId);
						 old_chkBrgRecord.setSpan_chk_id(newChkSpanRecord.getSpan_chk_id());
						 new CheckPassSpanDao().insertIntoChkPassRecord(old_chkBrgRecord);
						 for(ChkBrgDefect oldChkBrgDefect:oldchkBrgDefects){
							 String newDefectSerial=IDtool.getUUID();
							 oldChkBrgDefect.setDefect_serial(newDefectSerial);
							 oldChkBrgDefect.setMbr_chk_id(newMbrChkId);
							 new CheckPassSpanDao().insertChkPassDefect(oldChkBrgDefect);
							 List<ChkBrgPhoto> oldPhotoList = oldChkBrgDefect.getPhotos();
							 for(ChkBrgPhoto oldChkBrgPhoto:oldPhotoList){
								 oldChkBrgPhoto.setDefect_serial(newDefectSerial);
								 oldChkBrgPhoto.setPhoto_path("");
								 new CheckPassSpanDao().insertChkPassPhoto(oldChkBrgPhoto);
							 }
						 }
					 }
				 }
			 }
		}
	}
	
	
	
	public static void deletePhotoPath(){
		BridgeChk old_bc = new BridgeChk();
		//2017年太仓港北疏港高速定期检测  prj_id fb784207b83e41c88469209429f4f0b3
		//2018年太仓港北疏港高速定期检测  prj_id c9e391e4a65a4296a491c05e9f3f7df1
		//fa98ec5392b745bd91aef540e5399363
		//2017 chk_id fa98ec5392b745bd91aef540e5399363
		//2018 chk_id 3d451fd9e2b843bea13b2dd7ed06b146
		old_bc.setChk_id("824b185044d643baa1281ed453210a6e");
		//根据chk_id查出跨检查记录集合
		List<ChkSpanRecord> old_list = new CheckBridgeDao().getAllSpansData(old_bc).getSpans();
		for(ChkSpanRecord csr_old:old_list){
			String oldDirection = csr_old.getDirection();
			String oldSpanNo = csr_old.getSpan_no();
			String newChkId = "824b185044d643baa1281ed453210a6e";
			ChkSpanRecord newChkSpanRecord = new CheckBridgeDao().getChkSpanRecordByChkIdDirection(newChkId, oldDirection, oldSpanNo);
			//根据跨检查记录每条的 span_chk_id查出对应的构件检查记录 获取记录中的 mbr_chk_id
			 List<ChkBrgRecord> oldChkBrgRecords = new CheckBridgeDao().getChkBrgRecordBySpanChkId(csr_old.getSpan_chk_id());
			 //如果跨下面的构件检查记录集合不为空,查出对应该跨的18年项目构件检查记录集合.
			 if(oldChkBrgRecords.size()>0){
				 //18年项目构件检查记录集合 chk_brg_record集合
				 List<ChkBrgRecord> newChkBrgRecords = new CheckBridgeDao().getChkBrgRecordBySpanChkId(newChkSpanRecord.getSpan_chk_id());	 
				 //如果老项目的构件检查记录有数据,而新项目里的构建检查记录无数据,将老项目的构件检查记录复制
				 if(newChkBrgRecords!=null&&newChkBrgRecords.size()!=0){
					 //根据老项目的构件检查主键mbr_chk_id查出对应构件的所有病害以及病害中的图片photo
					 for(ChkBrgRecord old_chkBrgRecord:oldChkBrgRecords){
						 //新项目在chkBrgRecord中插入新纪录,生成一个新的
						 List<ChkBrgDefect> oldchkBrgDefects =  new CheckSpanDao().getDefectList(old_chkBrgRecord.getMbr_chk_id());
						 for(ChkBrgDefect oldChkBrgDefect:oldchkBrgDefects){
							 String newDefectSerial=IDtool.getUUID();
							 oldChkBrgDefect.setDefect_serial(newDefectSerial);
							 List<ChkBrgPhoto> oldPhotoList = oldChkBrgDefect.getPhotos();
							 for(ChkBrgPhoto oldChkBrgPhoto:oldPhotoList){
								 oldChkBrgPhoto.setDefect_serial(newDefectSerial);
								 oldChkBrgPhoto.setPhoto_path("");
								 new CheckSpanDao().updatePhotoPath("",oldChkBrgPhoto.getPhoto_id());
							 }
						 }
					 }
				 }
			 }
		}
	}
}
