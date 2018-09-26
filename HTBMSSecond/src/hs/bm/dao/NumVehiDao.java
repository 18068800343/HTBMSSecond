
package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.DicManageZone;
import hs.bm.bean.NumVehi;
import hs.bm.bean.NumVehi8;

public class NumVehiDao {

	private static NumVehiDao numvehidao;
	public static NumVehiDao getInstance(){
		if(numvehidao==null){
			numvehidao=new NumVehiDao();
		}
		return numvehidao;
	}
	
	public List<NumVehi>selectNumVehi(String brg_id,String brg_mode,String time,String lastTime){
		List<NumVehi>list=new ArrayList<>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_num_vehi where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_num_vehi where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		if (rs == null) {
			list = null;
		}
		try {
			while (rs.next()) {
				NumVehi nv=new NumVehi();
				nv.setBrgId(rs.getString(1));
				nv.setBrgMode(rs.getString(2));
				nv.setBrgStartime(rs.getString(3));
				nv.setNumVehi1_1(rs.getString(4));
				nv.setNumVehi1_2(rs.getString(5));
				nv.setNumVehi1_3(rs.getString(6));
				nv.setNumVehi1_4(rs.getString(7));
				nv.setNumVehi1_5(rs.getString(8));
				nv.setNumVehi1_6(rs.getString(9));
				nv.setNumVehiLane1(rs.getString(10));
				nv.setNumVehi2_1(rs.getString(11));
				nv.setNumVehi2_2(rs.getString(12));
				nv.setNumVehi2_3(rs.getString(13));
				nv.setNumVehi2_4(rs.getString(14));
				nv.setNumVehi2_5(rs.getString(15));
				nv.setNumVehi2_6(rs.getString(16));
				nv.setNumVehiLane2(rs.getString(17));
				nv.setNumVehi3_1(rs.getString(18));
				nv.setNumVehi3_2(rs.getString(19));
				nv.setNumVehi3_3(rs.getString(20));
				nv.setNumVehi3_4(rs.getString(21));
				nv.setNumVehi3_5(rs.getString(22));
				nv.setNumVehi3_6(rs.getString(23));
				nv.setNumVehiLane3(rs.getString(24));
				nv.setNumVehiHax1_1(rs.getString(25));
				nv.setNumVehiHax1_2(rs.getString(26));
				nv.setNumVehiHax1_3(rs.getString(27));
				nv.setNumVehiHax1_4(rs.getString(28));
				nv.setNumVehiHax1_5(rs.getString(29));
				nv.setNumVehiHax1_6(rs.getString(30));
				nv.setNumVehiHalf1(rs.getString(31));
				nv.setNumVehi4_1(rs.getString(32));
				nv.setNumVehi4_2(rs.getString(33));
				nv.setNumVehi4_3(rs.getString(34));
				nv.setNumVehi4_4(rs.getString(35));
				nv.setNumVehi4_5(rs.getString(36));
				nv.setNumVehi4_6(rs.getString(37));
				nv.setNumVehiLane4(rs.getString(38));
				nv.setNumVehi5_1(rs.getString(39));
				nv.setNumVehi5_2(rs.getString(40));
				nv.setNumVehi5_3(rs.getString(41));
				nv.setNumVehi5_4(rs.getString(42));
				nv.setNumVehi5_5(rs.getString(43));
				nv.setNumVehi5_6(rs.getString(44));
				nv.setNumVehiLane5(rs.getString(45));
				nv.setNumVehi6_1(rs.getString(46));
				nv.setNumVehi6_2(rs.getString(47));
				nv.setNumVehi6_3(rs.getString(48));
				nv.setNumVehi6_4(rs.getString(49));
				nv.setNumVehi6_5(rs.getString(50));
				nv.setNumVehi6_6(rs.getString(51));
				nv.setNumVehiLane6(rs.getString(52));
				nv.setNumVehiHax2_1(rs.getString(53));
				nv.setNumVehiHax2_2(rs.getString(54));
				nv.setNumVehiHax2_3(rs.getString(55));
				nv.setNumVehiHax2_4(rs.getString(56));
				nv.setNumVehiHax2_5(rs.getString(57));
				nv.setNumVehiHax2_6(rs.getString(58));
				nv.setNumVehiHalf2(rs.getString(59));
				nv.setNumVehiAxle1(rs.getString(60));
				nv.setNumVehiAxle2(rs.getString(61));
				nv.setNumVehiAxle3(rs.getString(62));
				nv.setNumVehiAxle4(rs.getString(63));
				nv.setNumVehiAxle5(rs.getString(64));
				nv.setNumVehiAxle6(rs.getString(65));
				nv.setNumVehiAll(rs.getString(66));
				list.add(nv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
	public List<NumVehi8>selectNumVehi8(String brg_id,String brg_mode,String time,String lastTime){
		List<NumVehi8>list=new ArrayList<>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_num_vehi_8 where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_num_vehi_8 where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		if (rs == null) {
			list = null;
		}
		try {
			while (rs.next()) {
				NumVehi8 nv=new NumVehi8();
				nv.setBrgId(rs.getString(1));
				nv.setBrgMode(rs.getString(2));
				nv.setBrgStartime(rs.getString(3));
				nv.setNumVehi1_1(rs.getString(4));
				nv.setNumVehi1_2(rs.getString(5));
				nv.setNumVehi1_3(rs.getString(6));
				nv.setNumVehi1_4(rs.getString(7));
				nv.setNumVehi1_5(rs.getString(8));
				nv.setNumVehi1_6(rs.getString(9));
				nv.setNumVehiLane1(rs.getString(10));
				nv.setNumVehi2_1(rs.getString(11));
				nv.setNumVehi2_2(rs.getString(12));
				nv.setNumVehi2_3(rs.getString(13));
				nv.setNumVehi2_4(rs.getString(14));
				nv.setNumVehi2_5(rs.getString(15));
				nv.setNumVehi2_6(rs.getString(16));
				nv.setNumVehiLane2(rs.getString(17));
				nv.setNumVehi3_1(rs.getString(18));
				nv.setNumVehi3_2(rs.getString(19));
				nv.setNumVehi3_3(rs.getString(20));
				nv.setNumVehi3_4(rs.getString(21));
				nv.setNumVehi3_5(rs.getString(22));
				nv.setNumVehi3_6(rs.getString(23));
				nv.setNumVehiLane3(rs.getString(24));
				nv.setNumVehi4_1(rs.getString(25));
				nv.setNumVehi4_2(rs.getString(26));
				nv.setNumVehi4_3(rs.getString(27));
				nv.setNumVehi4_4(rs.getString(28));
				nv.setNumVehi4_5(rs.getString(29));
				nv.setNumVehi4_6(rs.getString(30));
				nv.setNumVehiLane4(rs.getString(31));
				nv.setNumVehiHax1_1(rs.getString(32));
				nv.setNumVehiHax1_2(rs.getString(33));
				nv.setNumVehiHax1_3(rs.getString(34));
				nv.setNumVehiHax1_4(rs.getString(35));
				nv.setNumVehiHax1_5(rs.getString(36));
				nv.setNumVehiHax1_6(rs.getString(37));
				nv.setNumVehiHalf1(rs.getString(38));
				nv.setNumVehi5_1(rs.getString(39));
				nv.setNumVehi5_2(rs.getString(40));
				nv.setNumVehi5_3(rs.getString(41));
				nv.setNumVehi5_4(rs.getString(42));
				nv.setNumVehi5_5(rs.getString(43));
				nv.setNumVehi5_6(rs.getString(44));
				nv.setNumVehiLane5(rs.getString(45));
				nv.setNumVehi6_1(rs.getString(46));
				nv.setNumVehi6_2(rs.getString(47));
				nv.setNumVehi6_3(rs.getString(48));
				nv.setNumVehi6_4(rs.getString(49));
				nv.setNumVehi6_5(rs.getString(50));
				nv.setNumVehi6_6(rs.getString(51));
				nv.setNumVehiLane6(rs.getString(52));
				nv.setNumVehi7_1(rs.getString(53));
				nv.setNumVehi7_2(rs.getString(54));
				nv.setNumVehi7_3(rs.getString(55));
				nv.setNumVehi7_4(rs.getString(56));
				nv.setNumVehi7_5(rs.getString(57));
				nv.setNumVehi7_6(rs.getString(58));
				nv.setNumVehiLane7(rs.getString(59));
				nv.setNumVehi8_1(rs.getString(60));
				nv.setNumVehi8_2(rs.getString(61));
				nv.setNumVehi8_3(rs.getString(62));
				nv.setNumVehi8_4(rs.getString(63));
				nv.setNumVehi8_5(rs.getString(64));
				nv.setNumVehi8_6(rs.getString(65));
				nv.setNumVehiLane8(rs.getString(66));
				nv.setNumVehiHax2_1(rs.getString(67));
				nv.setNumVehiHax2_2(rs.getString(68));
				nv.setNumVehiHax2_3(rs.getString(69));
				nv.setNumVehiHax2_4(rs.getString(70));
				nv.setNumVehiHax2_5(rs.getString(71));
				nv.setNumVehiHax2_6(rs.getString(72));
				nv.setNumVehiHalf2(rs.getString(73));
				nv.setNumVehiAxle1(rs.getString(74));
				nv.setNumVehiAxle2(rs.getString(75));
				nv.setNumVehiAxle3(rs.getString(76));
				nv.setNumVehiAxle4(rs.getString(77));
				nv.setNumVehiAxle5(rs.getString(80));
				nv.setNumVehiAxle6(rs.getString(79));
				nv.setNumVehiAll(rs.getString(80));
				list.add(nv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	
}
