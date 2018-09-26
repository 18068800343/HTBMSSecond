package hs.bm.dao;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkPassPhoto;
import hs.bm.bean.ChkSpanRecord;
import hs.bm.bean.DefectCount;
import hs.bm.bean.EvaMbr;
import hs.bm.bean.EvaUbr2004;
import hs.bm.util.FileManageUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.SpanMem;

public class CopyDao {

private static CopyDao copyDao;
	private MyDataOperation dataOperation;

	public static CopyDao getInstance(){
		if(copyDao==null){
			copyDao=new CopyDao();
		}
		return copyDao;
	}
	
	
	public void startCopy(String prj_id, String chk_type){
		
		String sql = "select * from chk_brg_regular where prj_id=?";
		dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{prj_id});
		try {
			while(rs.next()){
				String chk_id = rs.getString("chk_id");
				String bridge_id = rs.getString("bridge_id");
				System.out.println(bridge_id);
				bridgeCopy(chk_type, chk_id, bridge_id, prj_id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
	}
	 
	
	public void startCopyOne(String prj_id, String chk_type, String bridge_id){
//		System.out.println("开始复制"+bridge_id);
		String sql = "select * from chk_brg_regular where prj_id=? and bridge_id=?";
//		System.out.println("获取数据");
		dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ prj_id, bridge_id });
		try {
			while(rs.next()){
				String chk_id = rs.getString("chk_id");
				bridgeCopy(chk_type, chk_id, bridge_id, prj_id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
	}
	
	
	public List<EvaMbr> getEval11(String prj_id, String bridge_id, String mbr_chk_id){
		List<EvaMbr> ll = new ArrayList<EvaMbr>();
		String sql = "select * from eva_mbr where bridge_id=? and prj_id=? and mbr_chk_id=?";
//		System.out.println("获取数据");
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id, prj_id, mbr_chk_id});
		try {
			while(rs.next()){
				EvaMbr em=new EvaMbr();
				em.setBridge_direction(rs.getString("bridge_direction"));
				em.setBridge_id(rs.getString("bridge_id"));
				em.setBridge_part(rs.getString("bridge_part"));
				em.setComponent_name(rs.getString("component_name"));
				em.setIndex_id(rs.getString("index_id"));
				em.setMbr_no_code(rs.getString("mbr_no_code"));
				em.setMember_name(rs.getString("member_name"));
				em.setMember_no(rs.getString("member_no"));
				em.setPrj_id(rs.getString("prj_id"));
				em.setSpan_no(rs.getString("span_no"));
				em.setValue(rs.getInt("value"));
				em.setMbr_chk_id(rs.getString("mbr_chk_id"));
				ll.add(em);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ll;
	}
	
	public List<EvaUbr2004> getEval04(String prj_id, String bridge_id){
		List<EvaUbr2004> ll = new ArrayList<EvaUbr2004>();
		String sql = "select * from eva_ubr_2004 where bridge_id=? and prj_id=?";
//		System.out.println("获取数据");
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id, prj_id});
		try {
			while(rs.next()){
				EvaUbr2004 eu=new EvaUbr2004();
				eu.setBridge_id(rs.getString("bridge_id"));
				eu.setDic_component_id(rs.getString("dic_component_id"));
				eu.setEva_ubr_code(rs.getString("eva_ubr_code"));
				eu.setEva_ubr_direct(rs.getString("eva_ubr_direct"));;
				eu.setEva_ubr_grade1(rs.getInt("eva_ubr_grade1"));
				eu.setEva_ubr_grade2(rs.getInt("eva_ubr_grade2"));
				eu.setEva_ubr_grade3(rs.getInt("eva_ubr_grade3"));
				eu.setEva_ubr_part(rs.getString("eva_ubr_part"));
				eu.setPrj_no(rs.getString("prj_id"));
				ll.add(eu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ll;
	}
	
	public void setEval11(EvaMbr em){
		String sql = "insert into eva_mbr(mbr_no_code,prj_id,bridge_id,span_no,component_name,member_name,index_id,bridge_direction,bridge_part,value,member_no,mbr_chk_id) values(?,?,?,?,?,?,?,?,?,?,?,?)";
//		System.out.println("插入数据");
		dataOperation.executeUpdate(sql, new Object[]{em.getMbr_no_code(),em.getPrj_id(),em.getBridge_id(),em.getSpan_no(),em.getComponent_name(),em.getMember_name(),em.getIndex_id(),em.getBridge_direction(),em.getBridge_part(),em.getValue(),em.getMember_no(),em.getMbr_chk_id()});
	}
	
	public void setsval04(EvaUbr2004 eu){
		String sql = "insert into eva_ubr_2004(eva_ubr_code,prj_id,bridge_id,eva_ubr_direct,eva_ubr_part,dic_component_id,eva_ubr_grade1,eva_ubr_grade2,eva_ubr_grade3) values(?,?,?,?,?,?,?,?,?)";
//		System.out.println("插入数据");
		dataOperation.executeUpdate(sql, new Object[]{eu.getEva_ubr_code(),eu.getPrj_no(),eu.getBridge_id(),eu.getEva_ubr_direct(),eu.getEva_ubr_part(),eu.getDic_component_id(),eu.getEva_ubr_grade1(),eu.getEva_ubr_grade2(),eu.getEva_ubr_grade3()});
	}
	
	public void bridgeCopy(String chk_type, String chk_id, String bridge_id, String prj_id){
		String sql = "select b.chk_id,b.prj_id from chk_project_info as a,chk_brg_regular as b where b.bridge_id=? and a.prj_id=b.prj_id and a.chk_type=? and a.prj_state='1' ORDER BY prj_complete_tm desc LIMIT 0,1";
//		System.out.println("获取数据");
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id, chk_type});
		String chk_id_old = null;
		String prj_id_old = null;
		try {
			if(rs.next()){
				chk_id_old = rs.getString("chk_id");
				prj_id_old = rs.getString("prj_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(chk_id_old!=null&&prj_id_old!=null){
			List<ChkSpanRecord> ll = CheckBridgeDao.getInstance().getAllSpans(chk_id_old);
			for(int i=0;i<ll.size();i++){
				ChkSpanRecord cs = ll.get(i);
				cs.setChk_id(chk_id);
				cs.setChk_state("0");
				String span_chk_id = UUID.randomUUID().toString().replaceAll("-", "");
				String span_chk_id_old = cs.getSpan_chk_id();
				cs.setSpan_chk_id(span_chk_id);
//				System.out.println("插入数据");
				CheckBridgeDao.getInstance().addSpan(cs);
				spanCopy(span_chk_id, span_chk_id_old, bridge_id, chk_type, prj_id, chk_id, prj_id_old);
			}
			
			List<EvaUbr2004> list = getEval04(prj_id_old, bridge_id);
			for(int i=0;i<list.size();i++){
				EvaUbr2004 em = list.get(i);
				em.setPrj_no(prj_id);
				em.setEva_ubr_code(UUID.randomUUID().toString().replaceAll("-", ""));
				setsval04(em);
			}
		}
	}
	
	public void spanCopy(String span_chk_id, String span_chk_id_old, String bridge_id, String chk_type, String prj_id, String chk_id, String prj_id_old){
		File fileDir = new File(PropertiesUtil.getPropertiesByName("rootDir"),bridge_id+File.separator+chk_type+File.separator+prj_id);
		if(!fileDir.exists()){
			fileDir.mkdirs();
		}
//		System.out.println("获取数据");
		List<SpanMem> ll = CheckSpanDao.getInstance().initTable(span_chk_id_old);
		for(int j=0;j<ll.size();j++){
			SpanMem sm = ll.get(j);
			sm.setSpan_chk_id(span_chk_id);
			String mbr_chk_id_old = sm.getMbr_chk_id();
			sm.setMbr_chk_id(UUID.randomUUID().toString().replaceAll("-", ""));
//			System.out.println("插入数据");
			CheckSpanDao.getInstance().newMem(sm, sm.getMbr_chk_person());
			Eval11Copy(prj_id, prj_id_old, sm.getMbr_chk_id(), mbr_chk_id_old, bridge_id);
			List<ChkBrgDefect> defects = sm.getDefects();
			for(int k=0;k<defects.size();k++){
				ChkBrgDefect cbd = defects.get(k);
				cbd.setMbr_chk_id(sm.getMbr_chk_id());
				String defect_serial = cbd.getDefect_serial();
				List<ChkPassPhoto> photoList = CheckPassSpanDao.getInstance().selectPhotoBySerial(defect_serial);
				cbd.setDefect_serial(UUID.randomUUID().toString().replaceAll("-", ""));
				File baseDir = new File(PropertiesUtil.getPropertiesByName("rootDir"));
			
				for (ChkPassPhoto chkPassPhoto : photoList) {
					chkPassPhoto.setDefect_serial(cbd.getDefect_serial());
					File f1 = new File(baseDir, chkPassPhoto.getPhoto_path());
					String path;
					if (!("").equals(chkPassPhoto.getPhoto_path()) && f1.exists()) {
						// 上传图片路径
						if (!fileDir.exists()) {
							fileDir.mkdirs();
						}
						path = FileManageUtil.fileCopy(f1, fileDir);
						path = path.replace(baseDir.getAbsolutePath() + File.separator, "");
			
					} else {
						path = "";
						
					}
					chkPassPhoto.setPhoto_path(path);

					CheckPassSpanDao.getInstance().insertPhoto(chkPassPhoto);

				}
				
				cbd.setDevelop_state("0");
//				System.out.println("插入数据");
				CheckSpanDao.getInstance().newDefect(cbd, "0");
//				System.out.println("获取数据");
				List<DefectCount> lll = CheckBridgeDao.getInstance().getDefectCount(defect_serial);
//				System.out.println("插入数据");
				CheckBridgeDao.getInstance().saveDefectCount(lll, cbd.getDefect_serial(), chk_id);
			}
		}
	}
	
	public void Eval11Copy(String prj_id, String prj_id_old, String mbr_chk_id, String mbr_chk_id_old, String bridge_id){
		List<EvaMbr> ll = getEval11(prj_id_old, bridge_id, mbr_chk_id_old);
		for(int i=0;i<ll.size();i++){
			EvaMbr em = ll.get(i);
			em.setPrj_id(prj_id);
			em.setMbr_no_code(UUID.randomUUID().toString().replaceAll("-", ""));
			em.setMbr_chk_id(mbr_chk_id);
			setEval11(em);
		}
	}
	
}
