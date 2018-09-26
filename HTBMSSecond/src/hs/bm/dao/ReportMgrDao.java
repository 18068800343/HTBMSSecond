package hs.bm.dao;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import hs.bm.bean.ImgPackage;
import hs.bm.bean.ReportInfo;
import hs.bm.util.FileManageUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.util.ZipManageUtil;
import hs.bm.vo.StructInformation;

public class ReportMgrDao {

	private static ReportMgrDao reportMgrDao;

	public static ReportMgrDao getInstance() {
		if (reportMgrDao == null) {
			reportMgrDao = new ReportMgrDao();
		}
		return reportMgrDao;
	}

	public List<StructInformation> initStructTable(String prj_id) {

		List<StructInformation> ll = new ArrayList<StructInformation>();
		ll.addAll(getBridgeInfos(prj_id));
		ll.addAll(getPassInfos(prj_id));
		ll.addAll(getCulvertInfos(prj_id));
		return ll;
	}

	public List<StructInformation> getBridgeInfos(String prj_id) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT\n" + "	a.bridge_id,\n" + "	a.bridge_no,\n" + "	a.bridge_name,\n" + "	a.bridge_pile_no,\n"
				+ "	b.org_id as manage_id,\n" + "	b.org_name as manage_name,\n"
				+ "	b.org_name_short as manage_short_name,\n" + "	c.zone_id,\n" + "	c.zone_name,\n"
				+ "	d.section_id,\n" + "	d.section_name,\n" + "	e.highway_id,\n" + "	e.highway_name\n" + "FROM\n"
				+ "	brg_card_admin_id a,\n" + "	sys_org_info b,\n" + "	sys_zone_info c,\n" + "	sys_section_info d,\n"
				+ "	dic_hw_info e\n" + "WHERE\n" + "	a.manage_id = b.org_id\n" + "AND a.zone_id = c.zone_id\n"
				+ "AND a.section_id = d.section_id\n" + "AND a.highway_id = e.highway_id\n" + "AND a.bridge_id IN (\n"
				+ "	SELECT\n" + "		br.bridge_id\n" + "	FROM\n" + "		chk_brg_regular br\n" + "	WHERE\n"
				+ "		br.prj_id = ?\n" + ")";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("bridge_id"));
				sm.setStruct_no(rs.getString("bridge_no"));
				sm.setStruct_name(rs.getString("bridge_name"));
				sm.setStruct_mode("bridge");
				sm.setStub_no(rs.getString("bridge_pile_no"));
				sm.setManage_id(rs.getString("manage_id"));
				sm.setManage_name(rs.getString("manage_name"));
				sm.setManage_short_name(rs.getString("manage_short_name"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<StructInformation> getPassInfos(String prj_id) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT\n" + "	a.pass_id,\n" + "	a.pass_no,\n" + "	a.pass_name,\n" + "	a.stub_no,\n"
				+ "	b.org_id as manage_id,\n" + "	b.org_name as manage_name,\n"
				+ "	b.org_name_short as manage_short_name,\n" + "	c.zone_id,\n" + "	c.zone_name,\n"
				+ "	d.section_id,\n" + "	d.section_name,\n" + "	e.highway_id,\n" + "	e.highway_name\n" + "FROM\n"
				+ "	pass_info a,\n" + "	sys_org_info b,\n" + "	sys_zone_info c,\n" + "	sys_section_info d,\n"
				+ "	dic_hw_info e\n" + "WHERE\n" + "	a.manage_id = b.org_id\n" + "AND a.zone_id = c.zone_id\n"
				+ "AND a.section_id = d.section_id\n" + "AND a.highway_id = e.highway_id\n" + "AND a.pass_id IN (\n"
				+ "	SELECT\n" + "		br.pass_id\n" + "	FROM\n" + "		chk_pass_regular br\n" + "	WHERE\n"
				+ "		br.prj_id = ?\n" + ")";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("pass_id"));
				sm.setStruct_no(rs.getString("pass_no"));
				sm.setStruct_name(rs.getString("pass_name"));
				sm.setStruct_mode("pass");
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("manage_id"));
				sm.setManage_name(rs.getString("manage_name"));
				sm.setManage_short_name(rs.getString("manage_short_name"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<StructInformation> getCulvertInfos(String prj_id) {
		List<StructInformation> ll = new ArrayList<StructInformation>();
		String sql = "SELECT\n" + "	a.culvert_id,\n" + "	a.culvert_no,\n" + "	a.culvert_name,\n"
				+ "	a.stub_no,\n" + "	b.org_id AS manage_id,\n" + "	b.org_name AS manage_name,\n"
				+ "	b.org_name_short AS manage_short_name,\n" + "	c.zone_id,\n" + "	c.zone_name,\n"
				+ "	d.section_id,\n" + "	d.section_name,\n" + "	e.highway_id,\n" + "	e.highway_name\n" + "FROM\n"
				+ "	cul_info a,\n" + "	sys_org_info b,\n" + "	sys_zone_info c,\n" + "	sys_section_info d,\n"
				+ "	dic_hw_info e\n" + "WHERE\n" + "	a.manage_id = b.org_id\n" + "AND a.zone_id = c.zone_id\n"
				+ "AND a.section_id = d.section_id\n" + "AND a.highway_id = e.highway_id\n" + "AND a.culvert_id IN (\n"
				+ "	SELECT\n" + "		br.culvert_id\n" + "	FROM\n" + "		chk_culvert_regular br\n" + "	WHERE\n"
				+ "		br.prj_id = ?\n" + ")";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { prj_id });
		try {
			while (rs.next()) {
				StructInformation sm = new StructInformation();
				sm.setStruct_id(rs.getString("culvert_id"));
				sm.setStruct_no(rs.getString("culvert_no"));
				sm.setStruct_name(rs.getString("culvert_name"));
				sm.setStruct_mode("culvert");
				sm.setStub_no(rs.getString("stub_no"));
				sm.setManage_id(rs.getString("manage_id"));
				sm.setManage_name(rs.getString("manage_name"));
				sm.setManage_short_name(rs.getString("manage_short_name"));
				sm.setZone_id(rs.getString("zone_id"));
				sm.setZone_name(rs.getString("zone_name"));
				sm.setSection_id(rs.getString("section_id"));
				sm.setSection_name(rs.getString("section_name"));
				sm.setHighway_id(rs.getString("highway_id"));
				sm.setHighway_name(rs.getString("highway_name"));
				sm.setState(false);
				ll.add(sm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public List<ReportInfo> initTable(ReportInfo rf) {
		List<ReportInfo> lr = new ArrayList<ReportInfo>();
		String sql = "select * from report_info where struct_id=? and struct_mode=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { rf.getStruct_id(), rf.getStruct_mode() });
		try {
			while (rs.next()) {
				ReportInfo oc = new ReportInfo();
				oc.setPrj_id(rs.getString("prj_id"));
				oc.setPrj_name(rs.getString("prj_name"));
				oc.setReport_build(rs.getString("report_build"));
				oc.setReport_date(rs.getString("report_date"));
				oc.setReport_file_name(rs.getString("report_file_name"));
				oc.setReport_file_path(rs.getString("report_file_path"));
				oc.setReport_id(rs.getString("report_id"));
				oc.setReport_sp(rs.getString("report_sp"));
				oc.setStruct_id(rs.getString("struct_id"));
				oc.setStruct_mode(rs.getString("struct_mode"));
				oc.setChk_type(rs.getString("chk_type"));
				lr.add(oc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return lr;
	}

	public List<ReportInfo> initTableAll() {
		List<ReportInfo> lr = new ArrayList<ReportInfo>();
		String sql = "select distinct * from report_info ORDER BY report_date DESC";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				ReportInfo oc = new ReportInfo();
				oc.setPrj_id(rs.getString("prj_id"));
				oc.setPrj_name(rs.getString("prj_name"));
				oc.setReport_build(rs.getString("report_build"));
				oc.setReport_date(rs.getString("report_date"));
				oc.setReport_start_time(rs.getString("report_start_date"));
				oc.setReport_file_name(rs.getString("report_file_name"));
				oc.setReport_file_path(rs.getString("report_file_path"));
				oc.setReport_id(rs.getString("report_id"));
				oc.setReport_sp(rs.getString("report_sp"));
				oc.setStruct_id(rs.getString("struct_id"));
				oc.setStruct_mode(rs.getString("struct_mode"));
				oc.setChk_type(rs.getString("chk_type"));
				oc.setReport_status(rs.getString("report_status"));
				oc.setUser_name(rs.getString("user_name"));
				oc.setTask_id(rs.getString("task_id"));
				oc.setReport_count(rs.getInt("report_count"));
				getStructNameNo(oc, dataOperation);
				
				lr.add(oc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return lr;
	}
	
	public List<ReportInfo> initTableAll2(String orgid) {
		List<ReportInfo> lr = new ArrayList<ReportInfo>();
		String sql = "select distinct * from report_info where struct_mode = 'bridge' ORDER BY report_date DESC";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				ReportInfo oc = new ReportInfo();
				oc.setPrj_id(rs.getString("prj_id"));
				oc.setPrj_name(rs.getString("prj_name"));
				oc.setReport_build(rs.getString("report_build"));
				oc.setReport_date(rs.getString("report_date"));
				oc.setReport_start_time(rs.getString("report_start_date"));
				oc.setReport_file_name(rs.getString("report_file_name"));
				oc.setReport_file_path(rs.getString("report_file_path"));
				oc.setReport_id(rs.getString("report_id"));
				oc.setReport_sp(rs.getString("report_sp"));
				oc.setStruct_id(rs.getString("struct_id"));
				oc.setStruct_mode(rs.getString("struct_mode"));
				oc.setChk_type(rs.getString("chk_type"));
				oc.setReport_status(rs.getString("report_status"));
				oc.setUser_name(rs.getString("user_name"));
				oc.setTask_id(rs.getString("task_id"));
				oc.setReport_count(rs.getInt("report_count"));
				Boolean flag = getStructNameNo2(oc, dataOperation,orgid);
				if(flag==false){
					continue;
				}
				lr.add(oc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return lr;
	}

	public boolean getStructNameNo(ReportInfo oc, MyDataOperation dataOperation) {
		String sql = "";
		ResultSet rs=null;
		if (oc.getStruct_mode().equals("bridge")) {
			sql = "select bridge_name as name,bridge_no as no from brg_card_admin_id where bridge_id=?";
			rs = dataOperation.executeQuery(sql, new String[] { oc.getStruct_id()});
		}
		if (oc.getStruct_mode().equals("pass")) {
			sql = "select pass_name as name,pass_no as no from pass_info where pass_id=?";
			rs = dataOperation.executeQuery(sql, new String[] { oc.getStruct_id() });
		}
		if (oc.getStruct_mode().equals("culvert")) {
			sql = "select culvert_name as name,culvert_no as no from cul_info where culvert_id=?";
			rs = dataOperation.executeQuery(sql, new String[] { oc.getStruct_id() });
		}
		try {
			while (rs.next()) {

				oc.setStruct_name(rs.getString("name"));
				oc.setStruct_no(rs.getString("no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return true;
	}

	public boolean getStructNameNo2(ReportInfo oc, MyDataOperation dataOperation, String orgid) {
		String sql = "";
		boolean flag = false;
		if (oc.getStruct_mode().equals("bridge")) {
			sql = "select bridge_name as name,bridge_no as no from brg_card_admin_id where bridge_id=? and manage_id like ?";
		}

		ResultSet rs = dataOperation.executeQuery(sql, new String[] { oc.getStruct_id() , orgid });
		try {
			while (rs.next()) {

				oc.setStruct_name(rs.getString("name"));
				oc.setStruct_no(rs.getString("no"));
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public List<Map<String, String>> initPrj(String id, String mode) {
		List<Map<String, String>> ll = new ArrayList<Map<String, String>>();
		String sql = "";
		switch (mode) {
		case "bridge":
			sql = " select a.prj_id,b.prj_desc,b.chk_type,a.chk_id,a.check_date from chk_brg_regular as a,chk_project_info as b where a.prj_id=b.prj_id and a.bridge_id=? ORDER BY  b.prj_establish_tm DESC";
			break;
		case "culvert":
			sql = "select a.prj_id,b.prj_desc,b.chk_type,a.r_id as chk_id,a.check_date from chk_culvert_regular as a,chk_project_info as b where a.prj_id=b.prj_id and a.culvert_id=? ORDER BY  b.prj_establish_tm DESC";
			break;
		case "pass":
			sql = "select a.prj_id,b.prj_desc,b.chk_type,a.chk_id,a.check_date from chk_pass_regular as a,chk_project_info as b where a.prj_id=b.prj_id and a.pass_id=? ORDER BY  b.prj_establish_tm DESC";
			break;
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { id });
		try {
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("prj_id", rs.getString("prj_id"));
				map.put("prj_name", rs.getString("prj_desc"));
				ll.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}
	
	public int updateReport(String report_file_path,String report_date,String report_status,String report_id){
		String sql="UPDATE report_info SET report_file_path = ?, report_date =?, report_status =? WHERE	report_id =?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i=dataOperation.executeUpdate(sql, new String[]{report_file_path,report_date,report_status,report_id});
		dataOperation.close();
		return i;
	}
	
	public int updateReportStatus(String report_status,String report_id){
		String sql="UPDATE report_info SET report_status =? WHERE	report_id =?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i=dataOperation.executeUpdate(sql, new String[]{report_status,report_id});
		dataOperation.close();
		return i;
	}
	
	public int addReport(ReportInfo rt) {
		String sql = "insert into report_info(report_id,prj_id,prj_name,struct_id,struct_mode,report_file_name,report_file_path,report_date,report_start_date,report_sp,report_build,chk_type,report_status,user_name,report_count,task_id) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,
				new String[] { rt.getReport_id(), rt.getPrj_id(), rt.getPrj_name(), rt.getStruct_id(),
						rt.getStruct_mode(), rt.getReport_file_name(), rt.getReport_file_path(), rt.getReport_date(),rt.getReport_start_time(),
						rt.getReport_sp(), rt.getReport_build(), rt.getChk_type(),rt.getReport_status(),rt.getUser_name(),rt.getReport_count()+"",rt.getTask_id() });
		dataOperation.close();
		return i;
	}

	public int delReport(String report_id) {
		String sql = "delete from report_info where report_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[] { report_id });
		dataOperation.close();
		return i;
	}

	public String buildPackage(String id, String prj_id, String mode) {

		String rootDir = PropertiesUtil.getPropertiesByName("rootDir");
		File baseDir = new File(rootDir, "package");
		if (!baseDir.exists()) {
			baseDir.mkdirs();
		}
		File tmpDir = new File(baseDir, "tmp" + File.separator + System.currentTimeMillis());
		if (!tmpDir.exists()) {
			tmpDir.mkdirs();
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "";
		String sql1 = "";
		if (mode.equals("bridge")) {
			sql = "select * from chk_span_record where chk_id = (select chk_id from chk_brg_regular where bridge_id=? and prj_id=?)";
			sql1 = "select * from chk_brg_photo where defect_serial in ( select defect_serial from chk_brg_defect where mbr_chk_id in (select mbr_chk_id from chk_brg_record where span_chk_id=?))";
		} else if (mode.equals("pass")) {
			sql = "select * from chk_pass_span_record where chk_id = (select chk_id from chk_pass_regular where pass_id=? and prj_id=?)";
			sql1 = "select * from chk_pass_photo where defect_serial in (select defect_serial from chk_pass_defect where mbr_chk_id in (select mbr_chk_id from chk_pass_record where span_chk_id=?))";
		} else if (mode.equals("culvert")) {
			sql = "select * from chk_culvert_span_record where chk_id = (select chk_id from chk_culvert_regular where culvert_id=? and prj_id=?)";
			sql1 = "select * from chk_culvert_photo where defect_serial in (select defect_serial from chk_culvert_defect where mbr_chk_id in (select mbr_chk_id from chk_culvert_record where span_chk_id=?))";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { id, prj_id });
		try {
			while (rs.next()) {
				String span_chk_id = rs.getString("span_chk_id");
				String direction = rs.getString("direction");
				String span_no = rs.getString("span_no");
				File spanDir = new File(tmpDir, direction + File.separator + span_no);
				if (!spanDir.exists()) {
					spanDir.mkdirs();
				}
				ResultSet rt = dataOperation.executeQuery(sql1, new String[] { span_chk_id });
				System.out.println(sql1);
				while (rt.next()) {
					String defect_name = getDefectName(id,prj_id,mode);
					String photo_name = rt.getString("photo_name");
					String photo_path = rt.getString("photo_path");
					String photo_date = rt.getString("photo_date");
					if (photo_path != null && !photo_path.equals("")) {
						File oldFile = new File(rootDir, photo_path);
						if(photo_date == null) {
							FileManageUtil.fileCopyName(oldFile, spanDir, photo_name.concat(defect_name));
						}else {
							FileManageUtil.fileCopyName(oldFile, spanDir, photo_name);
						}
						
						
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		File file = new File(baseDir, UUID.randomUUID().toString().replaceAll("-", "") + ".zip");
		ZipManageUtil.createZipFile(tmpDir, file);
		dataOperation.close();
		return file.getAbsolutePath();
	}
	
	public String getDefectName(String id, String prj_id, String mode) {
		String name = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql="";
		String sql1 ="";
		if (mode.equals("bridge")) {
			sql = "select * from chk_span_record where chk_id = (select chk_id from chk_brg_regular where bridge_id=? and prj_id=?)";
			sql1 = "select defect_name from chk_brg_defect where mbr_chk_id in (select mbr_chk_id from chk_brg_record where span_chk_id=?)";
		} else if (mode.equals("pass")) {
			sql = "select * from chk_pass_span_record where chk_id = (select chk_id from chk_pass_regular where pass_id=? and prj_id=?)";
			sql1 = "select defect_name from chk_pass_defect where mbr_chk_id in (select mbr_chk_id from chk_pass_record where span_chk_id=?)";
		} else if (mode.equals("culvert")) {
			sql = "select * from chk_culvert_span_record where chk_id = (select chk_id from chk_culvert_regular where culvert_id=? and prj_id=?)";
			sql1 = "select defect_name from chk_culvert_defect where mbr_chk_id in (select mbr_chk_id from chk_culvert_record where span_chk_id=?)";
		}
		
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { id, prj_id });
		try {
			while (rs.next()) {
				String span_chk_id = rs.getString("span_chk_id");
				ResultSet rt = dataOperation.executeQuery(sql1, new String[] { span_chk_id });
				while (rt.next()) {
					name = rt.getString("defect_name");	
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		dataOperation.close();
		return name;
	}

	public int addPackage(ImgPackage pg) {
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "insert into img_package(package_id,package_name,package_path,struct_id,struct_mode,prj_id,build_date) values(?,?,?,?,?,?,?)";
		int i = dataOperation.executeUpdate(sql, new String[] { pg.getPackage_id(), pg.getPackage_name(),
				pg.getPackage_path(), pg.getStruct_id(), pg.getStruct_mode(), pg.getPrj_id(), pg.getBuild_date() });
		dataOperation.close();
		return i;
	}

	public static void main(String[] args) {
		System.out.println(ReportMgrDao.getInstance().buildPackage(null, null, null));
	}

	public List<ImgPackage> initPackage(String id) {
		List<ImgPackage> ll = new ArrayList<ImgPackage>();
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "select a.*,b.* from img_package a,chk_project_info b where a.struct_id=? and a.prj_id=b.prj_id";
		ResultSet rs = dataOperation.executeQuery(sql, new String[] { id });
		try {
			while (rs.next()) {
				ImgPackage pg = new ImgPackage();
				pg.setPackage_id(rs.getString("package_id"));
				pg.setPackage_name(rs.getString("package_name"));
				pg.setPackage_path(rs.getString("package_path"));
				pg.setStruct_id(rs.getString("struct_id"));
				pg.setStruct_mode(rs.getString("struct_mode"));
				pg.setBuild_date(rs.getString("build_date"));
				pg.setPrj_id(rs.getString("prj_id"));
				pg.setPrj_name(rs.getString("prj_desc"));
				ll.add(pg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return ll;
	}

	public int delPackage(String package_id) {
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "delete from img_package where package_id=?";
		int i = dataOperation.executeUpdate(sql, new String[] { package_id });
		dataOperation.close();
		return i;
	}

	public Map<String, String> getDircetionSpan(StructInformation sf) {
		Map<String, String> map = new HashMap<>();
		String sql1 = "";
		String sql2 = "";
		String sql3 = "";
		if(sf.getStruct_mode().equals("bridge")){
			sql1 = "select span_no from brg_span_info where bridge_id=? and direction='上行' ORDER BY span_no desc limit 1";
			sql2 = "select span_no from brg_span_info where bridge_id=? and direction='下行' ORDER BY span_no desc limit 1";
			sql3 = "select span_no from brg_span_info where bridge_id=? and direction='无' ORDER BY span_no desc limit 1";
		}
		if(sf.getStruct_mode().equals("pass")){
			sql1 = "select span_no from pass_span_info where pass_id=? and direction='上行' ORDER BY span_no desc limit 1";
			sql2 = "select span_no from pass_span_info where pass_id=? and direction='下行' ORDER BY span_no desc limit 1";
			sql3 = "select span_no from pass_span_info where pass_id=? and direction='无' ORDER BY span_no desc limit 1";
		}
		if(sf.getStruct_mode().equals("culvert")){
			sql1 = "select span_no from cul_span_info where culvert_id=? and direction='上行' ORDER BY span_no desc limit 1";
			sql2 = "select span_no from cul_span_info where culvert_id=? and direction='下行' ORDER BY span_no desc limit 1";
			sql3 = "select span_no from cul_span_info where culvert_id=? and direction='无' ORDER BY span_no desc limit 1";
		}
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		try {
			ResultSet rs = dataOperation.executeQuery(sql1, new String[]{sf.getStruct_id()});
			if(rs.next()){
				map.put("上行", rs.getString("span_no"));
			}
			rs = dataOperation.executeQuery(sql2, new String[]{sf.getStruct_id()});
			if(rs.next()){
				map.put("下行", rs.getString("span_no"));
			}
			rs = dataOperation.executeQuery(sql3, new String[]{sf.getStruct_id()});
			if(rs.next()){
				map.put("无", rs.getString("span_no"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return map;
	}
	
	public String getFileName(String struct_id,String struct_mode) {
		String filename = "";
		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if("bridge".equals(struct_mode)){
			sql = " SELECT a.bridge_name as name ,a.bridge_pile_no as stub_no ,b.highway_no FROM brg_card_admin_id AS a LEFT JOIN dic_hw_info AS b on a.highway_id = b.highway_id WHERE bridge_id=? ";
		}else if("pass".equals(struct_mode)){
			sql = " SELECT a.pass_name as name ,a.stub_no,b.highway_no FROM pass_info AS a LEFT JOIN dic_hw_info AS b on a.highway_id = b.highway_id WHERE a.pass_id=? ";
		}else if("culvert".equals(struct_mode)){
			sql = " SELECT a.culvert_name as name,a.stub_no,b.highway_no FROM cul_info AS a LEFT JOIN dic_hw_info AS b on a.highway_id = b.highway_id WHERE a.culvert_id=? ";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{struct_id});
		try
		{
			while (rs.next())
			{
				filename = rs.getString("highway_no")+"_"+rs.getString("stub_no")+"_"+rs.getString("name");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return filename;
		
	}

	public String getFilePath(String reportId){
		String report_path="";
		String sql="select report_file_path from report_info where report_id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{reportId});
		try {
			while (rs.next()){
				report_path=rs.getString("report_file_path");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return report_path;
	}
		
}
