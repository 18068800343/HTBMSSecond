package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import hs.bm.bean.DicManageOrg;
import hs.bm.vo.HistoryProject;



public class HistoryProJectDao {
private static HistoryProJectDao historyProJectDao;
	
	public static HistoryProJectDao getInstance(){
		if(historyProJectDao==null){
			historyProJectDao=new HistoryProJectDao();
		}
		return historyProJectDao;
	}
	
	public List<HistoryProject> getHistoryProjectName(String modeTable,String id,String id2){
		
		String sql = "SELECT prj_desc,prj_id from chk_project_info where prj_id in(SELECT prj_id from "+ modeTable+" where "+ id2+"=?) order by prj_establish_tm desc ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{id});
	
		List<HistoryProject> hpn = new ArrayList<HistoryProject>();
		try {
			while (rs.next()) {
				
				
				HistoryProject hsp = new HistoryProject();
				hsp.setPrj_desc(rs.getString("prj_desc"));
				hsp.setPrj_id(rs.getString("prj_id"));
				
				hpn.add(hsp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return hpn;
	}
	
	
	/*
	 * @author xianing 
	 */
public List<HistoryProject> getHistoryProjectNameByCheckType1(String modeTable,String id,String id2,String chkType){
		
		String sql = "SELECT prj_desc,prj_id from chk_project_info where prj_id in(SELECT prj_id from "+ modeTable+" where "+ id2+"=?) and chk_type like ? order by prj_establish_tm desc ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{id,chkType});
	
		List<HistoryProject> hpn = new ArrayList<HistoryProject>();
		try {
			while (rs.next()) {
				
				
				HistoryProject hsp = new HistoryProject();
				hsp.setPrj_desc(rs.getString("prj_desc"));
				hsp.setPrj_id(rs.getString("prj_id"));
				
				hpn.add(hsp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return hpn;
	}
	
/*
 * @author xianing 
 */
public List<HistoryProject> getHistoryProjectNameByChkType2(String modeTable,String id,String id2,String zone_id,String chkType){
	
	String sql = "SELECT prj_desc,prj_id from chk_project_info where prj_id in(SELECT prj_id from "+ modeTable+" where "+ id2+"=?) and zone_id like ? and chk_type like ? order by prj_establish_tm desc";
	MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
	ResultSet rs = dataOperation.executeQuery(sql, new String[]{id,zone_id,chkType});

	List<HistoryProject> hpn = new ArrayList<HistoryProject>();
	try {
		while (rs.next()) {
			
			
			HistoryProject hsp = new HistoryProject();
			hsp.setPrj_desc(rs.getString("prj_desc"));
			hsp.setPrj_id(rs.getString("prj_id"));
			
			hpn.add(hsp);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	dataOperation.close();
	return hpn;
}



public List<HistoryProject> getHistoryProjectName2(String modeTable,String id,String id2,String zone_id){
		
		String sql = "SELECT prj_desc,prj_id from chk_project_info where prj_id in(SELECT prj_id from "+ modeTable+" where "+ id2+"=?) and zone_id like ? order by prj_establish_tm desc";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{id,zone_id});
	
		List<HistoryProject> hpn = new ArrayList<HistoryProject>();
		try {
			while (rs.next()) {
				
				
				HistoryProject hsp = new HistoryProject();
				hsp.setPrj_desc(rs.getString("prj_desc"));
				hsp.setPrj_id(rs.getString("prj_id"));
				
				hpn.add(hsp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return hpn;
	}
}
