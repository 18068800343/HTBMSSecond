
package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.MaxGw;
import hs.bm.bean.MaxGw8;


public class MaxGwDao {
	private static MaxGwDao mgdao;
	public static MaxGwDao getInstance(){
		if(mgdao==null){
			mgdao=new MaxGwDao();
		}
		return mgdao;
	}
	
	public List<MaxGw>selectMaxGw(String brg_id,String brg_mode,String time,String lastTime){
		List<MaxGw>list=new ArrayList<>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_max_gw where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_max_gw where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		if (rs == null) {
			list = null;
		}
		try {
			while (rs.next()) {
				MaxGw mg=new MaxGw();
				mg.setBrgId(rs.getString(1));
				mg.setBrgMode(rs.getString(2));
				mg.setBrgStartime(rs.getString(3));
				mg.setMaxGw1_1(rs.getString(4));
				mg.setMaxGw1_2(rs.getString(5));
				mg.setMaxGw1_3(rs.getString(6));
				mg.setMaxGw1_4(rs.getString(7));
				mg.setMaxGw1_5(rs.getString(8));
				mg.setMaxGw1_6(rs.getString(9));
				mg.setMaxGwLane1(rs.getString(10));
				mg.setMaxGw2_1(rs.getString(11));
				mg.setMaxGw2_2(rs.getString(12));
				mg.setMaxGw2_3(rs.getString(13));
				mg.setMaxGw2_4(rs.getString(14));
				mg.setMaxGw2_5(rs.getString(15));
				mg.setMaxGw2_6(rs.getString(16));
				mg.setMaxGwLane2(rs.getString(17));
				mg.setMaxGw3_1(rs.getString(18));
				mg.setMaxGw3_2(rs.getString(19));
				mg.setMaxGw3_3(rs.getString(20));
				mg.setMaxGw3_4(rs.getString(21));
				mg.setMaxGw3_5(rs.getString(22));
				mg.setMaxGw3_6(rs.getString(23));
				mg.setMaxGwLane3(rs.getString(24));
				mg.setMaxGwHax1_1(rs.getString(25));
				mg.setMaxGwHax1_2(rs.getString(26));
				mg.setMaxGwHax1_3(rs.getString(27));
				mg.setMaxGwHax1_4(rs.getString(28));
				mg.setMaxGwHax1_5(rs.getString(29));
				mg.setMaxGwHax1_6(rs.getString(30));
				mg.setMaxGwHalf1(rs.getString(31));
				mg.setMaxGw4_1(rs.getString(32));
				mg.setMaxGw4_2(rs.getString(33));
				mg.setMaxGw4_3(rs.getString(34));
				mg.setMaxGw4_4(rs.getString(35));
				mg.setMaxGw4_5(rs.getString(36));
				mg.setMaxGw4_6(rs.getString(37));
				mg.setMaxGwLane4(rs.getString(38));
				mg.setMaxGw5_1(rs.getString(39));
				mg.setMaxGw5_2(rs.getString(40));
				mg.setMaxGw5_3(rs.getString(41));
				mg.setMaxGw5_4(rs.getString(42));
				mg.setMaxGw5_5(rs.getString(43));
				mg.setMaxGw5_6(rs.getString(44));
				mg.setMaxGwLane5(rs.getString(45));
				mg.setMaxGw6_1(rs.getString(46));
				mg.setMaxGw6_2(rs.getString(47));
				mg.setMaxGw6_3(rs.getString(48));
				mg.setMaxGw6_4(rs.getString(49));
				mg.setMaxGw6_5(rs.getString(50));
				mg.setMaxGw6_6(rs.getString(51));
				mg.setMaxGwLane6(rs.getString(52));
				mg.setMaxGwHax2_1(rs.getString(53));
				mg.setMaxGwHax2_2(rs.getString(54));
				mg.setMaxGwHax2_3(rs.getString(55));
				mg.setMaxGwHax2_4(rs.getString(56));
				mg.setMaxGwHax2_5(rs.getString(57));
				mg.setMaxGwHax2_6(rs.getString(58));
				mg.setMaxGwHalf2(rs.getString(59));
				mg.setMaxGwAxle1(rs.getString(60));
				mg.setMaxGwAxle2(rs.getString(61));
				mg.setMaxGwAxle3(rs.getString(62));
				mg.setMaxGwAxle4(rs.getString(63));
				mg.setMaxGwAxle5(rs.getString(64));
				mg.setMaxGwAxle6(rs.getString(65));
				mg.setMaxGwAll(rs.getString(66));
				list.add(mg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}

	public List<MaxGw8>selectMaxGw8(String brg_id,String brg_mode,String time,String lastTime){
		List<MaxGw8>list=new ArrayList<MaxGw8>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_max_gw_8 where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_max_gw_8 where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		if (rs == null) {
			list = null;
		}
		try {
			while (rs.next()) {
				MaxGw8 mg=new MaxGw8();
				mg.setBrgId(rs.getString(1));
				mg.setBrgMode(rs.getString(2));
				mg.setBrgStartime(rs.getString(3));
				mg.setMaxGw1_1(rs.getString(4));
				mg.setMaxGw1_2(rs.getString(5));
				mg.setMaxGw1_3(rs.getString(6));
				mg.setMaxGw1_4(rs.getString(7));
				mg.setMaxGw1_5(rs.getString(8));
				mg.setMaxGw1_6(rs.getString(9));
				mg.setMaxGwLane1(rs.getString(10));
				mg.setMaxGw2_1(rs.getString(11));
				mg.setMaxGw2_2(rs.getString(12));
				mg.setMaxGw2_3(rs.getString(13));
				mg.setMaxGw2_4(rs.getString(14));
				mg.setMaxGw2_5(rs.getString(15));
				mg.setMaxGw2_6(rs.getString(16));
				mg.setMaxGwLane2(rs.getString(17));
				mg.setMaxGw3_1(rs.getString(18));
				mg.setMaxGw3_2(rs.getString(19));
				mg.setMaxGw3_3(rs.getString(20));
				mg.setMaxGw3_4(rs.getString(21));
				mg.setMaxGw3_5(rs.getString(22));
				mg.setMaxGw3_6(rs.getString(23));
				mg.setMaxGwLane3(rs.getString(24));
				mg.setMaxGw4_1(rs.getString(25));
				mg.setMaxGw4_2(rs.getString(26));
				mg.setMaxGw4_3(rs.getString(27));
				mg.setMaxGw4_4(rs.getString(28));
				mg.setMaxGw4_5(rs.getString(29));
				mg.setMaxGw4_6(rs.getString(30));
				mg.setMaxGwLane4(rs.getString(31));
				mg.setMaxGwHax1_1(rs.getString(32));
				mg.setMaxGwHax1_2(rs.getString(33));
				mg.setMaxGwHax1_3(rs.getString(34));
				mg.setMaxGwHax1_4(rs.getString(35));
				mg.setMaxGwHax1_5(rs.getString(36));
				mg.setMaxGwHax1_6(rs.getString(37));
				mg.setMaxGwHalf1(rs.getString(38));
				mg.setMaxGw5_1(rs.getString(39));
				mg.setMaxGw5_2(rs.getString(40));
				mg.setMaxGw5_3(rs.getString(41));
				mg.setMaxGw5_4(rs.getString(42));
				mg.setMaxGw5_5(rs.getString(43));
				mg.setMaxGw5_6(rs.getString(44));
				mg.setMaxGwLane5(rs.getString(45));
				mg.setMaxGw6_1(rs.getString(46));
				mg.setMaxGw6_2(rs.getString(47));
				mg.setMaxGw6_3(rs.getString(48));
				mg.setMaxGw6_4(rs.getString(49));
				mg.setMaxGw6_5(rs.getString(50));
				mg.setMaxGw6_6(rs.getString(51));
				mg.setMaxGwLane6(rs.getString(52));
				mg.setMaxGw7_1(rs.getString(53));
				mg.setMaxGw7_2(rs.getString(54));
				mg.setMaxGw7_3(rs.getString(55));
				mg.setMaxGw7_4(rs.getString(56));
				mg.setMaxGw7_5(rs.getString(57));
				mg.setMaxGw7_6(rs.getString(58));
				mg.setMaxGwLane7(rs.getString(59));
				mg.setMaxGw8_1(rs.getString(60));
				mg.setMaxGw8_2(rs.getString(61));
				mg.setMaxGw8_3(rs.getString(62));
				mg.setMaxGw8_4(rs.getString(63));
				mg.setMaxGw8_5(rs.getString(64));
				mg.setMaxGw8_6(rs.getString(65));
				mg.setMaxGwLane8(rs.getString(66));
				mg.setMaxGwHax2_1(rs.getString(67));
				mg.setMaxGwHax2_2(rs.getString(68));
				mg.setMaxGwHax2_3(rs.getString(69));
				mg.setMaxGwHax2_4(rs.getString(70));
				mg.setMaxGwHax2_5(rs.getString(71));
				mg.setMaxGwHax2_6(rs.getString(72));
				mg.setMaxGwHalf2(rs.getString(73));
				mg.setMaxGwAxle1(rs.getString(74));
				mg.setMaxGwAxle2(rs.getString(75));
				mg.setMaxGwAxle3(rs.getString(76));
				mg.setMaxGwAxle4(rs.getString(77));
				mg.setMaxGwAxle5(rs.getString(78));
				mg.setMaxGwAxle6(rs.getString(79));
				mg.setMaxGwAll(rs.getString(80));
				list.add(mg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
}
