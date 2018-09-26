package hs.bm.dao;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkPassPhoto;
import hs.bm.bean.ChkSpanRecord;
import hs.bm.bean.DefectCount;
import hs.bm.util.FileManageUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.SpanMem;

public class CopyPassDao {

	private static CopyPassDao copyPassDao;

	public static CopyPassDao getInstance() {
		if (copyPassDao == null) {
			copyPassDao = new CopyPassDao();
		}
		return copyPassDao;
	}

	public void startCopy(String prj_id, String chk_type) {

		String sql = "select * from chk_pass_regular where prj_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				String chk_id = rs.getString("chk_id");
				String pass_id = rs.getString("pass_id");
				culvertCopy(chk_type, chk_id, pass_id, prj_id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
	}

	public void startCopyOne(String prj_id, String chk_type, String pass_id) {

		String sql = "select * from chk_pass_regular where prj_id=? and pass_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { prj_id, pass_id });
		try {
			while (rs.next()) {
				String chk_id = rs.getString("chk_id");
				culvertCopy(chk_type, chk_id, pass_id, prj_id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
	}

	public void culvertCopy(String chk_type, String chk_id, String pass_id, String prj_id) {
		String sql = "select b.chk_id,b.prj_id from chk_project_info as a,chk_pass_regular as b where b.pass_id=? and a.prj_id=b.prj_id and a.chk_type=? and a.prj_state='1' ORDER BY prj_complete_tm desc LIMIT 0,1";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { pass_id, chk_type });
		String chk_id_old = null;
		String prj_id_old = null;
		try {
			if (rs.next()) {
				chk_id_old = rs.getString("chk_id");
				prj_id_old = rs.getString("prj_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		if (chk_id_old != null && prj_id_old != null) {
			List<ChkSpanRecord> ll = CheckPassDao.getInstance().getAllSpans(chk_id_old);
			for (int i = 0; i < ll.size(); i++) {
				ChkSpanRecord cs = ll.get(i);
				cs.setChk_id(chk_id);
				cs.setChk_state("0");
				String span_chk_id = UUID.randomUUID().toString().replaceAll("-", "");
				String span_chk_id_old = cs.getSpan_chk_id();
				cs.setSpan_chk_id(span_chk_id);
				CheckPassDao.getInstance().addSpan(cs);
				spanCopy(span_chk_id, span_chk_id_old, pass_id, chk_type, prj_id, chk_id, prj_id_old);
			}

		}
		dataOperation.close();
	}

	public void spanCopy(String span_chk_id, String span_chk_id_old, String culvert_id, String chk_type, String prj_id,
			String chk_id, String prj_id_old) {
		File fileDir = new File(PropertiesUtil.getPropertiesByName("rootDir"),
				culvert_id + File.separator + chk_type + File.separator + prj_id);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		List<SpanMem> ll = CheckPassSpanDao.getInstance().initTable(span_chk_id_old);
		for (int j = 0; j < ll.size(); j++) {
			SpanMem sm = ll.get(j);
			sm.setSpan_chk_id(span_chk_id);
			sm.setMbr_chk_id(UUID.randomUUID().toString().replaceAll("-", ""));
			CheckPassSpanDao.getInstance().newMem(sm, sm.getMbr_chk_person());
			List<ChkBrgDefect> defects = sm.getDefects();
			for (int k = 0; k < defects.size(); k++) {
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
				CheckPassSpanDao.getInstance().newDefect(cbd, "0");
				List<DefectCount> lll = CheckPassDao.getInstance().getDefectCount(defect_serial);
				CheckPassSpanDao.getInstance().saveDefectCount(lll, cbd.getDefect_serial(), chk_id);
			}
		}
	}

}
