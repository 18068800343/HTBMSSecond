
package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.RatioOvlo;
import hs.bm.bean.RatioOvlo8;


public class RatioOvloDao {

	private static RatioOvloDao rodao;
	public static RatioOvloDao getInstance(){
		if(rodao==null){
			rodao=new RatioOvloDao();
		}
		return rodao;
	}
	
	public List<RatioOvlo>selectRatioOvlo(String brg_id,String brg_mode,String time,String lastTime){
		List<RatioOvlo>list=new ArrayList<>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_ratio_ovlo where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_ratio_ovlo where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		if (rs == null) {
			list = null;
		}
		
		try {
			while (rs.next()) {
				RatioOvlo ro=new RatioOvlo();
				ro.setBrgId(rs.getString(1));
				ro.setBrgMode(rs.getString(2));
				ro.setBrgStartime(rs.getString(3));
				ro.setRatioOvlo1_1(rs.getString(4));
				ro.setRatioOvlo1_2(rs.getString(5));
				ro.setRatioOvlo1_3(rs.getString(6));
				ro.setRatioOvlo1_4(rs.getString(7));
				ro.setRatioOvlo1_5(rs.getString(8));
				ro.setRatioOvlo1_6(rs.getString(9));
				ro.setRatioOvloLane1(rs.getString(10));
				ro.setRatioOvlo2_1(rs.getString(11));
				ro.setRatioOvlo2_2(rs.getString(12));
				ro.setRatioOvlo2_3(rs.getString(13));
				ro.setRatioOvlo2_4(rs.getString(14));
				ro.setRatioOvlo2_5(rs.getString(15));
				ro.setRatioOvlo2_6(rs.getString(16));
				ro.setRatioOvloLane2(rs.getString(17));
				ro.setRatioOvlo3_1(rs.getString(18));
				ro.setRatioOvlo3_2(rs.getString(19));
				ro.setRatioOvlo3_3(rs.getString(20));
				ro.setRatioOvlo3_4(rs.getString(21));
				ro.setRatioOvlo3_5(rs.getString(22));
				ro.setRatioOvlo3_6(rs.getString(23));
				ro.setRatioOvloLane3(rs.getString(24));
				ro.setRatioOvloHax1_1(rs.getString(25));
				ro.setRatioOvloHax1_2(rs.getString(26));
				ro.setRatioOvloHax1_3(rs.getString(27));
				ro.setRatioOvloHax1_4(rs.getString(28));
				ro.setRatioOvloHax1_5(rs.getString(29));
				ro.setRatioOvloHax1_6(rs.getString(30));
				ro.setRatioOvloHalf1(rs.getString(31));
				ro.setRatioOvlo4_1(rs.getString(32));
				ro.setRatioOvlo4_2(rs.getString(33));
				ro.setRatioOvlo4_3(rs.getString(34));
				ro.setRatioOvlo4_4(rs.getString(35));
				ro.setRatioOvlo4_5(rs.getString(36));
				ro.setRatioOvlo4_6(rs.getString(37));
				ro.setRatioOvloLane4(rs.getString(38));
				ro.setRatioOvlo5_1(rs.getString(39));
				ro.setRatioOvlo5_2(rs.getString(40));
				ro.setRatioOvlo5_3(rs.getString(41));
				ro.setRatioOvlo5_4(rs.getString(42));
				ro.setRatioOvlo5_5(rs.getString(43));
				ro.setRatioOvlo5_6(rs.getString(44));
				ro.setRatioOvloLane5(rs.getString(45));
				ro.setRatioOvlo6_1(rs.getString(46));
				ro.setRatioOvlo6_2(rs.getString(47));
				ro.setRatioOvlo6_3(rs.getString(48));
				ro.setRatioOvlo6_4(rs.getString(49));
				ro.setRatioOvlo6_5(rs.getString(50));
				ro.setRatioOvlo6_6(rs.getString(51));
				ro.setRatioOvloLane6(rs.getString(52));
				ro.setRatioOvloHax2_1(rs.getString(53));
				ro.setRatioOvloHax2_2(rs.getString(54));
				ro.setRatioOvloHax2_3(rs.getString(55));
				ro.setRatioOvloHax2_4(rs.getString(56));
				ro.setRatioOvloHax2_5(rs.getString(57));
				ro.setRatioOvloHax2_6(rs.getString(58));
				ro.setRatioOvloHalf2(rs.getString(59));
				ro.setRatioOvloAxle1(rs.getString(60));
				ro.setRatioOvloAxle2(rs.getString(61));
				ro.setRatioOvloAxle3(rs.getString(62));
				ro.setRatioOvloAxle4(rs.getString(63));
				ro.setRatioOvloAxle5(rs.getString(64));
				ro.setRatioOvloAxle6(rs.getString(65));
				ro.setRatioOvloAll(rs.getString(66));
				list.add(ro);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
		
	}	
	
	public List<RatioOvlo8>selectRatioOvlo8(String brg_id,String brg_mode,String time,String lastTime){
		List<RatioOvlo8>list=new ArrayList<>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_ratio_ovlo_8 where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_ratio_ovlo_8 where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		if (rs == null) {
			list = null;
		}
		
		try {
			while (rs.next()) {
				RatioOvlo8 ro=new RatioOvlo8();
				ro.setBrgId(rs.getString(1));
				ro.setBrgMode(rs.getString(2));
				ro.setBrgStartime(rs.getString(3));
				ro.setRatioOvlo1_1(rs.getString(4));
				ro.setRatioOvlo1_2(rs.getString(5));
				ro.setRatioOvlo1_3(rs.getString(6));
				ro.setRatioOvlo1_4(rs.getString(7));
				ro.setRatioOvlo1_5(rs.getString(8));
				ro.setRatioOvlo1_6(rs.getString(9));
				ro.setRatioOvloLane1(rs.getString(10));
				ro.setRatioOvlo2_1(rs.getString(11));
				ro.setRatioOvlo2_2(rs.getString(12));
				ro.setRatioOvlo2_3(rs.getString(13));
				ro.setRatioOvlo2_4(rs.getString(14));
				ro.setRatioOvlo2_5(rs.getString(15));
				ro.setRatioOvlo2_6(rs.getString(16));
				ro.setRatioOvloLane2(rs.getString(17));
				ro.setRatioOvlo3_1(rs.getString(18));
				ro.setRatioOvlo3_2(rs.getString(19));
				ro.setRatioOvlo3_3(rs.getString(20));
				ro.setRatioOvlo3_4(rs.getString(21));
				ro.setRatioOvlo3_5(rs.getString(22));
				ro.setRatioOvlo3_6(rs.getString(23));
				ro.setRatioOvloLane3(rs.getString(24));
				ro.setRatioOvlo4_1(rs.getString(25));
				ro.setRatioOvlo4_2(rs.getString(26));
				ro.setRatioOvlo4_3(rs.getString(27));
				ro.setRatioOvlo4_4(rs.getString(28));
				ro.setRatioOvlo4_5(rs.getString(29));
				ro.setRatioOvlo4_6(rs.getString(30));
				ro.setRatioOvloLane4(rs.getString(31));
				ro.setRatioOvloHax1_1(rs.getString(32));
				ro.setRatioOvloHax1_2(rs.getString(33));
				ro.setRatioOvloHax1_3(rs.getString(34));
				ro.setRatioOvloHax1_4(rs.getString(35));
				ro.setRatioOvloHax1_5(rs.getString(36));
				ro.setRatioOvloHax1_6(rs.getString(37));
				ro.setRatioOvloHalf1(rs.getString(38));
				ro.setRatioOvlo5_1(rs.getString(39));
				ro.setRatioOvlo5_2(rs.getString(40));
				ro.setRatioOvlo5_3(rs.getString(41));
				ro.setRatioOvlo5_4(rs.getString(42));
				ro.setRatioOvlo5_5(rs.getString(43));
				ro.setRatioOvlo5_6(rs.getString(44));
				ro.setRatioOvloLane5(rs.getString(45));
				ro.setRatioOvlo6_1(rs.getString(46));
				ro.setRatioOvlo6_2(rs.getString(47));
				ro.setRatioOvlo6_3(rs.getString(48));
				ro.setRatioOvlo6_4(rs.getString(49));
				ro.setRatioOvlo6_5(rs.getString(50));
				ro.setRatioOvlo6_6(rs.getString(51));
				ro.setRatioOvloLane6(rs.getString(52));
				ro.setRatioOvlo7_1(rs.getString(53));
				ro.setRatioOvlo7_2(rs.getString(54));
				ro.setRatioOvlo7_3(rs.getString(55));
				ro.setRatioOvlo7_4(rs.getString(56));
				ro.setRatioOvlo7_5(rs.getString(57));
				ro.setRatioOvlo7_6(rs.getString(58));
				ro.setRatioOvloLane7(rs.getString(59));
				ro.setRatioOvlo8_1(rs.getString(60));
				ro.setRatioOvlo8_2(rs.getString(61));
				ro.setRatioOvlo8_3(rs.getString(62));
				ro.setRatioOvlo8_4(rs.getString(63));
				ro.setRatioOvlo8_5(rs.getString(64));
				ro.setRatioOvlo8_6(rs.getString(65));
				ro.setRatioOvloLane8(rs.getString(66));
				ro.setRatioOvloHax2_1(rs.getString(67));
				ro.setRatioOvloHax2_2(rs.getString(68));
				ro.setRatioOvloHax2_3(rs.getString(69));
				ro.setRatioOvloHax2_4(rs.getString(70));
				ro.setRatioOvloHax2_5(rs.getString(71));
				ro.setRatioOvloHax2_6(rs.getString(72));
				ro.setRatioOvloHalf2(rs.getString(73));
				ro.setRatioOvloAxle1(rs.getString(74));
				ro.setRatioOvloAxle2(rs.getString(75));
				ro.setRatioOvloAxle3(rs.getString(76));
				ro.setRatioOvloAxle4(rs.getString(77));
				ro.setRatioOvloAxle5(rs.getString(78));
				ro.setRatioOvloAxle6(rs.getString(79));
				ro.setRatioOvloAll(rs.getString(80));
				list.add(ro);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
		
	}	
}