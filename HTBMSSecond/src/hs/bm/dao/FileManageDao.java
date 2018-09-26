package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import hs.bm.bean.Filemanage;
import hs.bm.bean.Report;
import hs.bm.vo.ReportStruct;
import hs.bm.vo.ReportStructs;
import hs.bm.vo.ReportVO;
import hs.bm.vo.StructInformation;

public class FileManageDao {
	private static FileManageDao fileManageDao;

	public static FileManageDao getInstance() {
		if (fileManageDao == null) {
			fileManageDao = new FileManageDao();
		}
		return fileManageDao;
	}

	/**
	 * 添加文件信息
	 */
	public int addFileData(Filemanage fm) {
		String sql = "insert into filemanage(file_id,user_name,file_name,file_nickname,file_date,file_size,file_type,file_note,file_extension) values(?,?,?,?,?,?,?,?,?)";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		int i = mdo.executeUpdate(sql,
				new Object[] { fm.getFile_id(), fm.getUser_name(), fm.getFile_name(), fm.getFile_nickname(),
						fm.getFile_date(), fm.getFile_size(), fm.getFile_type(), fm.getFile_note(),
						fm.getFile_extension() });
		mdo.close();
		return i;
	}

	/**
	 * 获取所有文件信息
	 */
	public List<Filemanage> getAllFile() {
		List<Filemanage> lfm = new ArrayList<Filemanage>();

		String sql = "select * from filemanage where is_delete=0";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, null);
		try {
			while (rs.next()) {
				Filemanage fm = new Filemanage();
				fm.setFile_date(rs.getString("file_date"));
				fm.setFile_extension(rs.getString("file_extension"));
				fm.setFile_id(rs.getString("file_id"));
				fm.setFile_name(rs.getString("file_name"));
				fm.setFile_nickname(rs.getString("file_nickname"));
				fm.setFile_note(rs.getString("file_note"));
				fm.setFile_size(rs.getInt("file_size"));
				fm.setFile_type(rs.getString("file_type"));
				fm.setUser_name(rs.getString("user_name"));
				lfm.add(fm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mdo.close();
		return lfm;
	}

	/**
	 * 获取我的文件信息
	 */
	public List<Filemanage> getMineFile(String user_name) {
		List<Filemanage> lfm = new ArrayList<Filemanage>();

		String sql = "select * from filemanage where user_name=? and is_delete=0";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, new String[] { user_name });
		try {
			while (rs.next()) {
				Filemanage fm = new Filemanage();
				fm.setFile_date(rs.getString("file_date"));
				fm.setFile_extension(rs.getString("file_extension"));
				fm.setFile_id(rs.getString("file_id"));
				fm.setFile_name(rs.getString("file_name"));
				fm.setFile_nickname(rs.getString("file_nickname"));
				fm.setFile_note(rs.getString("file_note"));
				fm.setFile_size(rs.getInt("file_size"));
				fm.setFile_type(rs.getString("file_type"));
				fm.setUser_name(rs.getString("user_name"));
				lfm.add(fm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mdo.close();
		return lfm;
	}

	public int editFileData(Filemanage fm) {
		String sql = "update filemanage set file_nickname=?,file_type=?,file_note=? where file_id=?";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		int i = mdo.executeUpdate(sql,
				new Object[] { fm.getFile_nickname(), fm.getFile_type(), fm.getFile_note(), fm.getFile_id() });
		mdo.close();
		return i;
	}

	public int deleteFileData(String file_id) {
		String sql = "update filemanage set is_delete=1 where file_id=?";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		int i = mdo.executeUpdate(sql, new Object[] { file_id });
		mdo.close();
		return i;
	}

	public List<String> initUser() {
		List<String> ls = new ArrayList<String>();
		String sql = "select * from sys_usr_usr_info";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, null);
		try {
			while (rs.next()) {
				ls.add(rs.getString("usr_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mdo.close();
		return ls;
	}

	public int addReport(Report report, List<StructInformation> ll) {
		String structs = "";
		for (int i = 0; i < ll.size(); i++) {
			StructInformation si = ll.get(i);
			structs += "," + si.getStruct_mode() + "/" + si.getStruct_name() + "/" + si.getManage_name() + "/"
					+ si.getSection_name();
		}
		structs = structs.replaceFirst(",", "");
		if(report.getPublish_date().equals("")){
			report.setPublish_date(null);
		}
		if(report.getFiling_date().equals("")){
			report.setFiling_date(null);
		}
		String sql = "insert into report values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		int i = mdo.executeUpdate(sql,
				new Object[] { report.getId(),report.getReport_id(), report.getReport_type(), report.getReport_name(),
						report.getMission_no(), report.getProject_name(), report.getCharge_man(),
						report.getPublish_date(), report.getCopies(), report.getFiling_date(), report.getRecord_no(),
						structs, report.getIs_public(),report.getContract_filing(), report.getNote(), report.getReport_dir(),
						report.getReport_size(), report.getReport_extension() });
		mdo.close();
		return i;
	}
	public int updateReport(Report report, List<StructInformation> ll,String id) {
		String structs = "";
		for (int i = 0; i < ll.size(); i++) {
			StructInformation si = ll.get(i);
			structs += "," + si.getStruct_mode() + "/" + si.getStruct_name() + "/" + si.getManage_name() + "/"
					+ si.getSection_name();
		}
		structs = structs.replaceFirst(",", "");
		if(report.getPublish_date().equals("")){
			report.setPublish_date(null);
		}
		if(report.getFiling_date().equals("")){
			report.setFiling_date(null);
		}
		String sql = "update report set report_id=?,report_type=?,report_name=?,mission_no=?,project_name=?,"
				+ "charge_man=?,publish_date=?,copies=?,filing_date=?,record_no=?,structs=?,is_public=?,"
				+ "contract_filing=?,note=?,report_dir=?,report_size=?,report_extension=? where id=?";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		int i = mdo.executeUpdate(sql,
				new Object[] { report.getReport_id(), report.getReport_type(), report.getReport_name(),
						report.getMission_no(), report.getProject_name(), report.getCharge_man(),
						report.getPublish_date(), report.getCopies(), report.getFiling_date(), report.getRecord_no(),
						structs, report.getIs_public(),report.getContract_filing(), report.getNote(), report.getReport_dir(),
						report.getReport_size(), report.getReport_extension(),id });
		mdo.close();
		return i;
	}

	public ReportStructs initStructs() {
		ReportStructs rst = new ReportStructs();
		Set<String> manage = new HashSet<String>();
		Set<String> section = new HashSet<String>();
		Set<String> structname = new HashSet<String>();
		String sql = "select * from report where structs is not null and structs!=''";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, null);
		try {
			while (rs.next()) {
				String s = rs.getString("structs");
				String[] arr = s.split(",");
				for (String struct : arr) {
					String[] st = struct.split("/");
					structname.add(st[1]);
					manage.add(st[2]);
					section.add(st[3]);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mdo.close();
		rst.setManage(manage);
		rst.setSection(section);
		rst.setStructname(structname);
		return rst;
	}
	
	public boolean checkReportID(String report_id){
		boolean bl=false;
		String sql="select * from report where report_id=?";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, new String[]{report_id});
		try {
			if(rs.next()){
				bl=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mdo.close();
		return bl;
	}

	public List<Report> initSearch() {
		List<Report> lr = new ArrayList<Report>();
		String sql = "select * from report";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, null);
		try {
			while (rs.next()) {
				Report re = new Report();
				re.setId(rs.getString("id"));
				re.setCharge_man(rs.getString("charge_man"));
				String fgdate = rs.getString("filing_date");
				re.setFiling_date(fgdate);
				re.setMission_no(rs.getString("mission_no"));
				re.setNote(rs.getString("note"));
				re.setProject_name(rs.getString("project_name"));
				String phdate = rs.getString("publish_date");
				re.setPublish_date(phdate);
				re.setRecord_no(rs.getString("record_no"));
				re.setReport_id(rs.getString("report_id"));
				re.setReport_name(rs.getString("report_name"));
				re.setReport_type(rs.getString("report_type"));
				lr.add(re);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mdo.close();
		return lr;
	}
    public String changeSql(String sql,String attr,String value){
    	if(value.replaceAll("%", "").equals("")){
    		return sql.replace(attr+" like ?", "("+attr+" like ? or "+attr+" is null)");
    	}else{
    		return sql;
    	}
    }
    public String changeSqlDate(String sql,String attr,String value){
    	String[] arr=value.split("\t");
    	if(!arr[0].equals("%%")&&!arr[1].equals("%%")){
    		return sql.replace(attr+" like ?", "("+attr+" between '"+arr[0]+"' and '"+arr[1]+"')");
    	}else if(arr[0].equals("%%")&&!arr[1].equals("%%")){
    		return sql.replace(attr+" like ?", attr+"<='"+arr[1]+"'");
    	}else if(!arr[0].equals("%%")&&arr[1].equals("%%")){
    		return sql.replace(attr+" like ?", attr+">='"+arr[0]+"'");
    	}else{
    		return sql.replace("and "+attr+" like ?", "");
    	}
    }
	public List<ReportVO> search(Report rp,String manage_name,String section_name,String struct_name) {
		List<ReportVO> lr = new ArrayList<ReportVO>();
		String sql = "select * from report where charge_man like ? and filing_date like ? and mission_no like ?"
				+ " and project_name like ? and publish_date like ? and record_no like ? and report_id like ?"
				+ " and report_name like ? and report_type like ? and note like ? and structs like ? and structs like ? and structs like ?";
		sql=changeSqlDate(sql, "publish_date", rp.getPublish_date()).replaceAll("%", "");
		sql=changeSqlDate(sql, "filing_date", rp.getFiling_date()).replaceAll("%", "");
		sql=changeSql(sql, "charge_man", rp.getCharge_man());
		sql=changeSql(sql, "mission_no", rp.getMission_no());
		sql=changeSql(sql, "project_name", rp.getProject_name());
		sql=changeSql(sql, "record_no", rp.getRecord_no());
		sql=changeSql(sql, "report_id", rp.getReport_id());
		sql=changeSql(sql, "report_name", rp.getReport_name());
		sql=changeSql(sql, "report_type", rp.getReport_type());
		sql=changeSql(sql, "note", rp.getNote());
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, new String[]{rp.getCharge_man(),rp.getMission_no()
				,rp.getProject_name(),rp.getRecord_no(),rp.getReport_id(),rp.getReport_name()
				,rp.getReport_type(),rp.getNote(),manage_name,section_name,struct_name});
		try {
			while (rs.next()) {
				ReportVO re = new ReportVO();
				re.setId(rs.getString("id"));
				re.setCharge_man(rs.getString("charge_man"));
				String fgdate = rs.getString("filing_date");
				if(fgdate==null){
					fgdate="";
				}
				re.setFiling_date(fgdate);
				re.setMission_no(rs.getString("mission_no"));
				re.setNote(rs.getString("note"));
				re.setProject_name(rs.getString("project_name"));
				String phdate = rs.getString("publish_date");
				if(phdate==null){
					phdate="";
				}
				re.setPublish_date(phdate);
				re.setRecord_no(rs.getString("record_no"));
				re.setCopies(rs.getString("copies"));
				re.setIs_public(rs.getString("is_public"));
				re.setContract_filing(rs.getString("contract_filing"));
				re.setReport_id(rs.getString("report_id"));
				re.setReport_name(rs.getString("report_name"));
				re.setReport_type(rs.getString("report_type"));
				re.setReport_dir(rs.getString("report_dir"));
				re.setReport_extension(rs.getString("report_extension"));
				re.setReport_size(rs.getString("report_size"));
				if(rs.getString("structs")!=null){
				if(rs.getString("structs").trim()!=""){
					List<ReportStruct> lrst=new ArrayList<ReportStruct>();
					String s=rs.getString("structs");
					String[] arr = s.split(",");
					for (String struct : arr) {
						ReportStruct rst=new ReportStruct();
						String[] st = struct.split("/");
						rst.setManage_name(st[2]);
						rst.setSection_name(st[3]);
						rst.setStruct_name(st[1]);
						lrst.add(rst);
					} 
					re.setReportstruct(lrst);
				}
				}
				lr.add(re);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mdo.close();
		return lr;
	}
	
	public ReportVO initEditReport(String id) {
		ReportVO re = new ReportVO();
		String sql = "select * from report where id=?";
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		ResultSet rs = mdo.executeQuery(sql, new String[]{id});
		try {
			if (rs.next()) {
				re.setId(id);
				re.setCharge_man(rs.getString("charge_man"));
				String fgdate = rs.getString("filing_date");
				re.setFiling_date(fgdate);
				re.setMission_no(rs.getString("mission_no"));
				re.setNote(rs.getString("note"));
				re.setProject_name(rs.getString("project_name"));
				String phdate = rs.getString("publish_date");
				re.setPublish_date(phdate);
				re.setRecord_no(rs.getString("record_no"));
				re.setCopies(rs.getString("copies"));
				re.setIs_public(rs.getString("is_public"));
				re.setContract_filing(rs.getString("contract_filing"));
				re.setReport_id(rs.getString("report_id"));
				re.setReport_name(rs.getString("report_name"));
				re.setReport_type(rs.getString("report_type"));
				re.setReport_dir(rs.getString("report_dir"));
				re.setReport_extension(rs.getString("report_extension"));
				re.setReport_size(rs.getString("report_size"));
				if(rs.getString("structs")!=null){
				if(rs.getString("structs")!=""){
					List<ReportStruct> lrst=new ArrayList<ReportStruct>();
					String s=rs.getString("structs");
					String[] arr = s.split(",");
					for (String struct : arr) {
						ReportStruct rst=new ReportStruct();
						String[] st = struct.split("/");
						rst.setManage_name(st[2]);
						rst.setSection_name(st[3]);
						rst.setStruct_name(st[1]);
						lrst.add(rst);
					} 
					re.setReportstruct(lrst);
				}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mdo.close();
		return re;
	}
}
