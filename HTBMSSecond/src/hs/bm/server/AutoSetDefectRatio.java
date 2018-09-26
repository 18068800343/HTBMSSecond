package hs.bm.server;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;

public class AutoSetDefectRatio implements Runnable{

	private MyDataOperation dataOperation;
	
	@Override
	public void run() {
		try {
			System.out.println("开始调整病害");
			dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
			//桥梁部件-病害
			String sql1 = "select * from dic_brg_struct_component_def where specification='桥梁检查记录'";
			String sql2 = "select q.*,IFNULL(w.ct,0) ct from (select a.*,b.defect_f_name from dic_mbr_defect_def a,dic_mbr_defect_f b where a.component_id=? and a.defect_f_id=b.defect_f_id) q LEFT JOIN "
					+ "(select defect_name_f,count(defect_name_f) as ct from chk_brg_defect where mbr_chk_id in "
					+ "(SELECT mbr_chk_id FROM chk_brg_record where mbr_no in (select r_id from brg_mbr_info where member_type in"
					+ " (select member_name from dic_brg_struct_member_def where component8=?))) GROUP BY defect_name_f) w on q.defect_f_name=w.defect_name_f "
					+ "ORDER BY ct desc,ratio asc";
			String sql3 = "update dic_mbr_defect_def set ratio=? where component_id=? and defect_f_id=?";
			ResultSet rs = dataOperation.executeQuery(sql1, null);
			while(rs.next()){
				String component_id = rs.getString("component_id");
				String component_name = rs.getString("component_name");
				System.out.println(component_id+"\t"+component_name);
				
				ResultSet rt = dataOperation.executeQuery(sql2, new String[]{component_id, component_name});
				int i=1;
				while(rt.next()){
					String defect_f_id = rt.getString("defect_f_id");
					String ratio = rt.getString("ratio");
					String ct = rt.getString("ct");
					dataOperation.executeUpdate(sql3, new Object[]{ i, component_id, defect_f_id });
					i++;
				}
			}
			
			//通道部件-病害
			sql1 = "select * from dic_brg_struct_component_def where specification='通道检查记录'";
			sql2 = "select q.*,IFNULL(w.ct,0) ct from (select a.*,b.defect_f_name from dic_mbr_defect_def a,dic_mbr_defect_f b where a.component_id=? and a.defect_f_id=b.defect_f_id) q LEFT JOIN "
					+ "(select defect_name_f,count(defect_name_f) as ct from chk_pass_defect where mbr_chk_id in "
					+ "(SELECT mbr_chk_id FROM chk_pass_record where mbr_no in (select r_id from pass_mbr_info where member_type in "
					+ "(select member_name from dic_brg_struct_member_def where component9=?))) GROUP BY defect_name_f) w on q.defect_f_name=w.defect_name_f"
					+ " ORDER BY ct desc,ratio asc";
			sql3 = "update dic_mbr_defect_def set ratio=? where component_id=? and defect_f_id=?";
			rs = dataOperation.executeQuery(sql1, null);
			while(rs.next()){
				String component_id = rs.getString("component_id");
				String component_name = rs.getString("component_name");
				System.out.println(component_id+"\t"+component_name);
				
				ResultSet rt = dataOperation.executeQuery(sql2, new String[]{component_id, component_name});
				int i=1;
				while(rt.next()){
					String defect_f_id = rt.getString("defect_f_id");
					String ratio = rt.getString("ratio");
					String ct = rt.getString("ct");
					dataOperation.executeUpdate(sql3, new Object[]{ i, component_id, defect_f_id });
					i++;
				}
			}
			
			//涵洞部件-病害
			sql1 = "select * from dic_brg_struct_component_def where specification='涵洞检查记录'";
			sql2 = "select q.*,IFNULL(w.ct,0) ct from (select a.*,b.defect_f_name from dic_mbr_defect_def a,dic_mbr_defect_f b where a.component_id=? and a.defect_f_id=b.defect_f_id) q LEFT JOIN "
					+ "(select defect_name_f,count(defect_name_f) as ct from chk_culvert_defect where mbr_chk_id in "
					+ "(SELECT mbr_chk_id FROM chk_culvert_record where mbr_no in (select r_id from cul_mbr_info where member_type in"
					+ " (select member_name from dic_brg_struct_member_def where component10=?))) GROUP BY defect_name_f) w on q.defect_f_name=w.defect_name_f "
					+ "ORDER BY ct desc,ratio asc";
			sql3 = "update dic_mbr_defect_def set ratio=? where component_id=? and defect_f_id=?";
			rs = dataOperation.executeQuery(sql1, null);
			while(rs.next()){
				String component_id = rs.getString("component_id");
				String component_name = rs.getString("component_name");
				System.out.println(component_id+"\t"+component_name);
				
				ResultSet rt = dataOperation.executeQuery(sql2, new String[]{component_id, component_name});
				int i=1;
				while(rt.next()){
					String defect_f_id = rt.getString("defect_f_id");
					String ratio = rt.getString("ratio");
					String ct = rt.getString("ct");
					dataOperation.executeUpdate(sql3, new Object[]{ i, component_id, defect_f_id });
					i++;
				}
			}
			
			//二级病害
			String sql = "select b.*,a.defect_f_name from dic_mbr_defect_f a,dic_mbr_defect_s b where a.defect_f_id=b.defect_f_id";
			String sqlb = "select defect_name_f,defect_name,IFNULL(count(defect_name),0) ct from chk_brg_defect where defect_name_f=? and defect_name=?";
			String sqlp = "select defect_name_f,defect_name,IFNULL(count(defect_name),0) ct from chk_pass_defect where defect_name_f=? and defect_name=?";
			String sqlc = "select defect_name_f,defect_name,IFNULL(count(defect_name),0) ct from chk_culvert_defect where defect_name_f=? and defect_name=?";
			String sqls = "update dic_mbr_defect_s set defect_use =? where  defect_id=?";
			rs = dataOperation.executeQuery(sql, null);
			while(rs.next()){
				String defect_id = rs.getString("defect_id");
				String defect_name = rs.getString("defect_name");
				String defect_f_name = rs.getString("defect_f_name");
				int count=0;
				ResultSet rt = dataOperation.executeQuery(sqlb, new String[]{ defect_f_name, defect_name });
				while(rt.next()){
					count = count+rt.getInt("ct");
				}
				rt = dataOperation.executeQuery(sqlp, new String[]{ defect_f_name, defect_name });
				while(rt.next()){
					count = count+rt.getInt("ct");
				}
				rt = dataOperation.executeQuery(sqlc, new String[]{ defect_f_name, defect_name });
				while(rt.next()){
					count = count+rt.getInt("ct");
				}
				dataOperation.executeUpdate(sqls, new Object[]{ count, defect_id });
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		System.out.println("结束调整病害："+new Date());
	}
	

}
