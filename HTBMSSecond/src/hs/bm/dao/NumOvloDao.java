
package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.NumOvlo;
import hs.bm.bean.NumOvlo8;

public class NumOvloDao {

	private static NumOvloDao nodao;
	public static NumOvloDao getInstance(){
		if(nodao==null){
			nodao=new NumOvloDao();
		}
		return nodao;
	}
	
	public List<NumOvlo>selectNumOvlo(String brg_id,String brg_mode,String time,String lastTime){
		List<NumOvlo>list=new ArrayList<>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_num_ovlo where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_num_ovlo where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		if (rs == null) {
			list = null;
		}
		
		try {
			while (rs.next()) {
				NumOvlo no=new NumOvlo();
				no.setBrgId(rs.getString(1));
				no.setBrgMode(rs.getString(2));
				no.setBrgStartime(rs.getString(3));
				no.setNumOvlo1_1(rs.getString(4));
				no.setNumOvlo1_2(rs.getString(5));
				no.setNumOvlo1_3(rs.getString(6));
				no.setNumOvlo1_4(rs.getString(7));
				no.setNumOvlo1_5(rs.getString(8));
				no.setNumOvlo1_6(rs.getString(9));
				no.setNumOvloLane1(rs.getString(10));
				no.setNumOvlo2_1(rs.getString(11));
				no.setNumOvlo2_2(rs.getString(12));
				no.setNumOvlo2_3(rs.getString(13));
				no.setNumOvlo2_4(rs.getString(14));
				no.setNumOvlo2_5(rs.getString(15));
				no.setNumOvlo2_6(rs.getString(16));
				no.setNumOvloLane2(rs.getString(17));
				no.setNumOvlo3_1(rs.getString(18));
				no.setNumOvlo3_2(rs.getString(19));
				no.setNumOvlo3_3(rs.getString(20));
				no.setNumOvlo3_4(rs.getString(21));
				no.setNumOvlo3_5(rs.getString(22));
				no.setNumOvlo3_6(rs.getString(23));
				no.setNumOvloLane3(rs.getString(24));
				no.setNumOvloHax1_1(rs.getString(25));
				no.setNumOvloHax1_2(rs.getString(26));
				no.setNumOvloHax1_3(rs.getString(27));
				no.setNumOvloHax1_4(rs.getString(28));
				no.setNumOvloHax1_5(rs.getString(29));
				no.setNumOvloHax1_6(rs.getString(30));
				no.setNumOvloHalf1(rs.getString(31));
				no.setNumOvlo4_1(rs.getString(32));
				no.setNumOvlo4_2(rs.getString(33));
				no.setNumOvlo4_3(rs.getString(34));
				no.setNumOvlo4_4(rs.getString(35));
				no.setNumOvlo4_5(rs.getString(36));
				no.setNumOvlo4_6(rs.getString(37));
				no.setNumOvloLane4(rs.getString(38));
				no.setNumOvlo5_1(rs.getString(39));
				no.setNumOvlo5_2(rs.getString(40));
				no.setNumOvlo5_3(rs.getString(41));
				no.setNumOvlo5_4(rs.getString(42));
				no.setNumOvlo5_5(rs.getString(43));
				no.setNumOvlo5_6(rs.getString(44));
				no.setNumOvloLane5(rs.getString(45));
				no.setNumOvlo6_1(rs.getString(46));
				no.setNumOvlo6_2(rs.getString(47));
				no.setNumOvlo6_3(rs.getString(48));
				no.setNumOvlo6_4(rs.getString(49));
				no.setNumOvlo6_5(rs.getString(50));
				no.setNumOvlo6_6(rs.getString(51));
				no.setNumOvloLane6(rs.getString(52));
				no.setNumOvloHax2_1(rs.getString(53));
				no.setNumOvloHax2_2(rs.getString(54));
				no.setNumOvloHax2_3(rs.getString(55));
				no.setNumOvloHax2_4(rs.getString(56));
				no.setNumOvloHax2_5(rs.getString(57));
				no.setNumOvloHax2_6(rs.getString(58));
				no.setNumOvloHalf2(rs.getString(59));
				no.setNumOvloAxle1(rs.getString(60));
				no.setNumOvloAxle2(rs.getString(61));
				no.setNumOvloAxle3(rs.getString(62));
				no.setNumOvloAxle4(rs.getString(63));
				no.setNumOvloAxle5(rs.getString(64));
				no.setNumOvloAxle6(rs.getString(65));
				no.setNumOvloAll(rs.getString(66));
				list.add(no);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;		
	}

	public List<NumOvlo8>selectNumOvlo8(String brg_id,String brg_mode,String time,String lastTime){
		List<NumOvlo8>list=new ArrayList<NumOvlo8>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_num_ovlo_8 where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_num_ovlo_8 where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		try {
			while (rs.next()) {
				NumOvlo8 no=new NumOvlo8();
				no.setBrgId(rs.getString(1));
				no.setBrgMode(rs.getString(2));
				no.setBrgStartime(rs.getString(3));
				no.setNumOvlo1_1(rs.getString(4));
				no.setNumOvlo1_2(rs.getString(5));
				no.setNumOvlo1_3(rs.getString(6));
				no.setNumOvlo1_4(rs.getString(7));
				no.setNumOvlo1_5(rs.getString(8));
				no.setNumOvlo1_6(rs.getString(9));
				no.setNumOvloLane1(rs.getString(10));
				no.setNumOvlo2_1(rs.getString(11));
				no.setNumOvlo2_2(rs.getString(12));
				no.setNumOvlo2_3(rs.getString(13));
				no.setNumOvlo2_4(rs.getString(14));
				no.setNumOvlo2_5(rs.getString(15));
				no.setNumOvlo2_6(rs.getString(16));
				no.setNumOvloLane2(rs.getString(17));
				no.setNumOvlo3_1(rs.getString(18));
				no.setNumOvlo3_2(rs.getString(19));
				no.setNumOvlo3_3(rs.getString(20));
				no.setNumOvlo3_4(rs.getString(21));
				no.setNumOvlo3_5(rs.getString(22));
				no.setNumOvlo3_6(rs.getString(23));
				no.setNumOvloLane3(rs.getString(24));
				no.setNumOvlo4_1(rs.getString(25));
				no.setNumOvlo4_2(rs.getString(26));
				no.setNumOvlo4_3(rs.getString(27));
				no.setNumOvlo4_4(rs.getString(28));
				no.setNumOvlo4_5(rs.getString(29));
				no.setNumOvlo4_6(rs.getString(30));
				no.setNumOvloLane4(rs.getString(31));
				no.setNumOvloHax1_1(rs.getString(32));
				no.setNumOvloHax1_2(rs.getString(33));
				no.setNumOvloHax1_3(rs.getString(34));
				no.setNumOvloHax1_4(rs.getString(35));
				no.setNumOvloHax1_5(rs.getString(36));
				no.setNumOvloHax1_6(rs.getString(37));
				no.setNumOvloHalf1(rs.getString(38));
				no.setNumOvlo5_1(rs.getString(39));
				no.setNumOvlo5_2(rs.getString(40));
				no.setNumOvlo5_3(rs.getString(41));
				no.setNumOvlo5_4(rs.getString(42));
				no.setNumOvlo5_5(rs.getString(43));
				no.setNumOvlo5_6(rs.getString(44));
				no.setNumOvloLane5(rs.getString(45));
				no.setNumOvlo6_1(rs.getString(46));
				no.setNumOvlo6_2(rs.getString(47));
				no.setNumOvlo6_3(rs.getString(48));
				no.setNumOvlo6_4(rs.getString(49));
				no.setNumOvlo6_5(rs.getString(50));
				no.setNumOvlo6_6(rs.getString(51));
				no.setNumOvloLane6(rs.getString(52));
				no.setNumOvlo7_1(rs.getString(53));
				no.setNumOvlo7_2(rs.getString(54));
				no.setNumOvlo7_3(rs.getString(55));
				no.setNumOvlo7_4(rs.getString(56));
				no.setNumOvlo7_5(rs.getString(57));
				no.setNumOvlo7_6(rs.getString(58));
				no.setNumOvloLane7(rs.getString(59));
				no.setNumOvlo8_1(rs.getString(60));
				no.setNumOvlo8_2(rs.getString(61));
				no.setNumOvlo8_3(rs.getString(62));
				no.setNumOvlo8_4(rs.getString(63));
				no.setNumOvlo8_5(rs.getString(64));
				no.setNumOvlo8_6(rs.getString(65));
				no.setNumOvloLane8(rs.getString(66));
				no.setNumOvloHax2_1(rs.getString(67));
				no.setNumOvloHax2_2(rs.getString(68));
				no.setNumOvloHax2_3(rs.getString(69));
				no.setNumOvloHax2_4(rs.getString(70));
				no.setNumOvloHax2_5(rs.getString(71));
				no.setNumOvloHax2_6(rs.getString(72));
				no.setNumOvloHalf2(rs.getString(73));
				no.setNumOvloAxle1(rs.getString(74));
				no.setNumOvloAxle2(rs.getString(75));
				no.setNumOvloAxle3(rs.getString(76));
				no.setNumOvloAxle4(rs.getString(77));
				no.setNumOvloAxle5(rs.getString(78));
				no.setNumOvloAxle6(rs.getString(79));
				no.setNumOvloAll(rs.getString(80));
				list.add(no);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;		
	}
	
}
