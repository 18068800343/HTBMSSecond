package hs.bm.server;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;
import hs.bm.vo.StructProgress;



public class AutoProgress implements Runnable{

	private MyDataOperation dataOperation;
	@Override
	public void run() {
		dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		List<String> prjs = getAllRunningProject();
		
		for(String prj_id : prjs){
			int member_all = 0;
			int member_chk = 0;
			int struct_all = 0;
			int struct_chk = 0;
			int struct_eva = 0;
			List<StructProgress> sps = getAllStruct(prj_id);
			for(StructProgress sp : sps){
				member_all +=sp.getMember_all();
				member_chk +=sp.getMember_chk();
				struct_all++;
				if(sp.isStruct_chk()){
					struct_chk++;
				}
				if(sp.isStruct_eva()){
					struct_eva++;
				}
			}
			String sql = "update chk_project_info set struct_no=?,member_no=?,member_chk_no=?,struct_checked=?,struct_eva=? where prj_id=?";
			dataOperation.executeUpdate(sql, new Object[]{
					struct_all,
					member_all,
					member_chk,
					struct_chk,
					struct_eva,
					prj_id
			});
		}
		dataOperation.close();
	}
	
	private List<StructProgress> getAllStruct( String prj_id ){
		List<StructProgress> ll = new ArrayList<StructProgress>();
		String sql = "select * from chk_brg_regular where prj_id=?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ prj_id });
		try {
			while(rs.next()){
				StructProgress sp = new StructProgress();
				sp.setStruct_id(rs.getString("bridge_id"));
				sp.setStruct_mode("bridge");
				int state = rs.getInt("audit_state");
				if(state>0){
					sp.setStruct_chk(true);
				}else{
					sp.setStruct_chk(false);
				}
				String chk_id = rs.getString("chk_id");
				int member_all = getStructMember(sp.getStruct_id(), sp.getStruct_mode());
				sp.setMember_all(member_all);
				if(sp.isStruct_chk()){
					sp.setMember_chk(member_all);
				}else{
					sp.setMember_chk(getStructChkMember(sp.getStruct_id(), sp.getStruct_mode(), chk_id));
				}
				sp.setStruct_eva(getBrgEva(sp.getStruct_id(), prj_id));
				ll.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select * from chk_culvert_regular where prj_id=?";
		rs = dataOperation.executeQuery(sql, new String[]{ prj_id });
		try {
			while(rs.next()){
				StructProgress sp = new StructProgress();
				sp.setStruct_id(rs.getString("culvert_id"));
				sp.setStruct_mode("culvert");
				int state = rs.getInt("audit_state");
				if(state>0){
					sp.setStruct_chk(true);
					sp.setStruct_eva(true);
				}else{
					sp.setStruct_chk(false);
					sp.setStruct_eva(false);
				}
				String chk_id = rs.getString("chk_id");
				int member_all = getStructMember(sp.getStruct_id(), sp.getStruct_mode());
				sp.setMember_all(member_all);
				if(sp.isStruct_chk()){
					sp.setMember_chk(member_all);
				}else{
					sp.setMember_chk(getStructChkMember(sp.getStruct_id(), sp.getStruct_mode(), chk_id));
				}
				ll.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select * from chk_pass_regular where prj_id=?";
		rs = dataOperation.executeQuery(sql, new String[]{ prj_id });
		try {
			while(rs.next()){
				StructProgress sp = new StructProgress();
				sp.setStruct_id(rs.getString("pass_id"));
				sp.setStruct_mode("pass");
				int state = rs.getInt("audit_state");
				if(state>0){
					sp.setStruct_chk(true);
					sp.setStruct_eva(true);
				}else{
					sp.setStruct_chk(false);
					sp.setStruct_eva(false);
				}
				String chk_id = rs.getString("chk_id");
				int member_all = getStructMember(sp.getStruct_id(), sp.getStruct_mode());
				sp.setMember_all(member_all);
				if(sp.isStruct_chk()){
					sp.setMember_chk(member_all);
				}else{
					sp.setMember_chk(getStructChkMember(sp.getStruct_id(), sp.getStruct_mode(), chk_id));
				}
				ll.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ll;
	}
	
	private int getStructMember(String struct_id, String struct_mode){
		int num = 0;
		String sql = "";
		if(struct_mode.equals("bridge")){
			sql = "select count(r_id) as num from brg_mbr_info where s_id in (select s_id from brg_span_info where bridge_id=?)";
		}
		if(struct_mode.equals("culvert")){
			sql = "select count(r_id) as num from cul_mbr_info where s_id in (select s_id from cul_span_info where culvert_id=?)";
		}
		if(struct_mode.equals("pass")){
			sql = "select count(r_id) as num from pass_mbr_info where s_id in (select s_id from pass_span_info where pass_id=?)";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ struct_id });
		try {
			while(rs.next()){
				num = rs.getInt("num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	private int getStructChkMember(String struct_id, String struct_mode, String chk_id){
		int num = 0;
		String sql = "";
		if(struct_mode.equals("bridge")){
			sql = "select count(s_id) as num from brg_mbr_info where s_id in (select a.s_id from brg_span_info a,chk_span_record b where a.bridge_id=? and b.chk_id=? and b.chk_state=1 and a.direction=b.direction and a.span_no=b.span_no)";
		}
		if(struct_mode.equals("culvert")){
			sql = "select count(s_id) as num from cul_mbr_info where s_id in (select a.s_id from cul_span_info a,chk_culvert_span_record b where a.culvert_id=? and b.chk_id=? and b.chk_state=1 and a.direction=b.direction and a.span_no=b.span_no)";
		}
		if(struct_mode.equals("pass")){
			sql = "select count(s_id) as num from pass_mbr_info where s_id in (select a.s_id from pass_span_info a,chk_pass_span_record b where a.pass_id=? and b.chk_id=? and b.chk_state=1 and a.direction=b.direction and a.span_no=b.span_no)";
		}
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{ struct_id, chk_id });
		try {
			while(rs.next()){
				num = rs.getInt("num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	
	private boolean getBrgEva(String bridge_id, String prj_id){
		boolean flag = true;
		String sql = "select * from eva_brg_rec where bridge_id=? and prj_id=?";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge_id, prj_id});
		try {
			while(rs.next()){
				int state = rs.getInt("audit_state");
				if(state==0){
					flag = false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	private List<String> getAllRunningProject(){
		List<String> ll = new ArrayList<String>();
		String sql = "select * from chk_project_info where prj_state=0";
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while(rs.next()){
				String prj_id = rs.getString("prj_id");
				ll.add(prj_id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ll;
	}
	
	public static void main(String[] args){
		new Thread(new AutoProgress()).start();
	}
}
