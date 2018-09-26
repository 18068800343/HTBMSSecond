
package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hs.bm.bean.BrgWeightLoadRatio;
import hs.bm.bean.ProbOvlo;
import hs.bm.bean.ProbOvlo8;

public class ProbOvloDao {

	private static ProbOvloDao podao;
	public static ProbOvloDao getInstance(){
		if(podao==null){
			podao=new ProbOvloDao();
		}
		return podao;
	}
	
	public List<BrgWeightLoadRatio> getOneByID(String brg_id,String brg_mode,String time,String lastTime){
		List<BrgWeightLoadRatio>list=new ArrayList<>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_load_radio where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_load_radio where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		try {
			while (rs.next()) {
				BrgWeightLoadRatio entity = new BrgWeightLoadRatio();
				entity.setBridge_id(rs.getString("brg_id"));
				entity.setBrg_mode(rs.getString("brg_mode"));
				entity.setStart_time(rs.getString("brg_startime"));
				entity.setLoad_radio1(rs.getString("load_radio1"));
				entity.setLoad_radio2(rs.getString("load_radio2"));
				entity.setLoad_radio3(rs.getString("load_radio3"));
				entity.setLoad_radio4(rs.getString("load_radio4"));
				entity.setLoad_radio5(rs.getString("load_radio5"));
				entity.setLoad_radio6(rs.getString("load_radio6"));
				entity.setLoad_radio7(rs.getString("load_radio7"));
				entity.setLoad_radio8(rs.getString("load_radio8"));
				entity.setLoad_radio9(rs.getString("load_radio9"));
				entity.setLoad_radio10(rs.getString("load_radio10"));
				entity.setLoad_radio11(rs.getString("load_radio11"));
				entity.setLoad_radio12(rs.getString("load_radio12"));
				entity.setLoad_radio13(rs.getString("load_radio13"));
				entity.setLoad_radio14(rs.getString("load_radio14"));
				entity.setLoad_radio15(rs.getString("load_radio15"));
				entity.setLoad_radio16(rs.getString("load_radio16"));
				list.add(entity);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
		
	}
	
	
	public List<ProbOvlo>selectProbOvlo(String brg_id,String brg_mode,String time,String lastTime){
		List<ProbOvlo>list=new ArrayList<>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_prob_ovlo where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_prob_ovlo where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		if (rs == null) {
			list = null;
		}
		
		try {
			while (rs.next()) {
				ProbOvlo po=new ProbOvlo();
				po.setBrgId(rs.getString(1));
				po.setBrgMode(rs.getString(2));
				po.setBrgStartime(rs.getString(3));
				po.setProbOvlo1_1(rs.getString(4));
				po.setProbOvlo1_2(rs.getString(5));
				po.setProbOvlo1_3(rs.getString(6));
				po.setProbOvlo1_4(rs.getString(7));
				po.setProbOvlo1_5(rs.getString(8));
				po.setProbOvlo1_6(rs.getString(9));
				po.setProbOvloLane1(rs.getString(10));
				po.setProbOvlo2_1(rs.getString(11));
				po.setProbOvlo2_2(rs.getString(12));
				po.setProbOvlo2_3(rs.getString(13));
				po.setProbOvlo2_4(rs.getString(14));
				po.setProbOvlo2_5(rs.getString(15));
				po.setProbOvlo2_6(rs.getString(16));
				po.setProbOvloLane2(rs.getString(17));
				po.setProbOvlo3_1(rs.getString(18));
				po.setProbOvlo3_2(rs.getString(19));
				po.setProbOvlo3_3(rs.getString(20));
				po.setProbOvlo3_4(rs.getString(21));
				po.setProbOvlo3_5(rs.getString(22));
				po.setProbOvlo3_6(rs.getString(23));
				po.setProbOvloLane3(rs.getString(24));
				po.setProbOvloHax1_1(rs.getString(25));
				po.setProbOvloHax1_2(rs.getString(26));
				po.setProbOvloHax1_3(rs.getString(27));
				po.setProbOvloHax1_4(rs.getString(28));
				po.setProbOvloHax1_5(rs.getString(29));
				po.setProbOvloHax1_6(rs.getString(30));
				po.setProbOvloHalf1(rs.getString(31));
				po.setProbOvlo4_1(rs.getString(32));
				po.setProbOvlo4_2(rs.getString(33));
				po.setProbOvlo4_3(rs.getString(34));
				po.setProbOvlo4_4(rs.getString(35));
				po.setProbOvlo4_5(rs.getString(36));
				po.setProbOvlo4_6(rs.getString(37));
				po.setProbOvloLane4(rs.getString(38));
				po.setProbOvlo5_1(rs.getString(39));
				po.setProbOvlo5_2(rs.getString(40));
				po.setProbOvlo5_3(rs.getString(41));
				po.setProbOvlo5_4(rs.getString(42));
				po.setProbOvlo5_5(rs.getString(43));
				po.setProbOvlo5_6(rs.getString(44));
				po.setProbOvloLane5(rs.getString(45));
				po.setProbOvlo6_1(rs.getString(46));
				po.setProbOvlo6_2(rs.getString(47));
				po.setProbOvlo6_3(rs.getString(48));
				po.setProbOvlo6_4(rs.getString(49));
				po.setProbOvlo6_5(rs.getString(50));
				po.setProbOvlo6_6(rs.getString(51));
				po.setProbOvloLane6(rs.getString(52));
				po.setProbOvloHax2_1(rs.getString(53));
				po.setProbOvloHax2_2(rs.getString(54));
				po.setProbOvloHax2_3(rs.getString(55));
				po.setProbOvloHax2_4(rs.getString(56));
				po.setProbOvloHax2_5(rs.getString(57));
				po.setProbOvloHax2_6(rs.getString(58));
				po.setProbOvloHalf2(rs.getString(59));
				po.setProbOvloAxle1(rs.getString(60));
				po.setProbOvloAxle2(rs.getString(61));
				po.setProbOvloAxle3(rs.getString(62));
				po.setProbOvloAxle4(rs.getString(63));
				po.setProbOvloAxle5(rs.getString(64));
				po.setProbOvloAxle6(rs.getString(65));
				po.setProbOvloAll(rs.getString(66));
				list.add(po);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;		
	}
	
	public List<ProbOvlo8>selectProbOvlo8(String brg_id,String brg_mode,String time,String lastTime){
		List<ProbOvlo8>list=new ArrayList<>();
		String sql=null;
		ResultSet rs=null;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		if(lastTime==""||lastTime==null){
			sql="SELECT * from brg_weight_prob_ovlo_8 where brg_mode=? and brg_id=? and brg_startime like ? ORDER BY brg_startime desc  LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,time+"%"});
		}else{
			sql="SELECT * from brg_weight_prob_ovlo_8 where brg_mode=? and brg_id=? and brg_startime > ? and brg_startime < ? ORDER BY brg_startime desc LIMIT 1";
			rs =dataOperation.executeQuery(sql,new String[]{brg_mode,brg_id,lastTime,time});
		}
		
		if (rs == null) {
			list = null;
		}
		
		try {
			while (rs.next()) {
				ProbOvlo8 po=new ProbOvlo8();
				po.setBrgId(rs.getString(1));
				po.setBrgMode(rs.getString(2));
				po.setBrgStartime(rs.getString(3));
				po.setProbOvlo1_1(rs.getString(4));
				po.setProbOvlo1_2(rs.getString(5));
				po.setProbOvlo1_3(rs.getString(6));
				po.setProbOvlo1_4(rs.getString(7));
				po.setProbOvlo1_5(rs.getString(8));
				po.setProbOvlo1_6(rs.getString(9));
				po.setProbOvloLane1(rs.getString(10));
				po.setProbOvlo2_1(rs.getString(11));
				po.setProbOvlo2_2(rs.getString(12));
				po.setProbOvlo2_3(rs.getString(13));
				po.setProbOvlo2_4(rs.getString(14));
				po.setProbOvlo2_5(rs.getString(15));
				po.setProbOvlo2_6(rs.getString(16));
				po.setProbOvloLane2(rs.getString(17));
				po.setProbOvlo3_1(rs.getString(18));
				po.setProbOvlo3_2(rs.getString(19));
				po.setProbOvlo3_3(rs.getString(20));
				po.setProbOvlo3_4(rs.getString(21));
				po.setProbOvlo3_5(rs.getString(22));
				po.setProbOvlo3_6(rs.getString(23));
				po.setProbOvloLane3(rs.getString(24));
				po.setProbOvlo4_1(rs.getString(25));
				po.setProbOvlo4_2(rs.getString(26));
				po.setProbOvlo4_3(rs.getString(27));
				po.setProbOvlo4_4(rs.getString(28));
				po.setProbOvlo4_5(rs.getString(29));
				po.setProbOvlo4_6(rs.getString(30));
				po.setProbOvloLane4(rs.getString(31));
				po.setProbOvloHax1_1(rs.getString(32));
				po.setProbOvloHax1_2(rs.getString(33));
				po.setProbOvloHax1_3(rs.getString(34));
				po.setProbOvloHax1_4(rs.getString(35));
				po.setProbOvloHax1_5(rs.getString(36));
				po.setProbOvloHax1_6(rs.getString(37));
				po.setProbOvloHalf1(rs.getString(38));
				po.setProbOvlo5_1(rs.getString(39));
				po.setProbOvlo5_2(rs.getString(40));
				po.setProbOvlo5_3(rs.getString(41));
				po.setProbOvlo5_4(rs.getString(42));
				po.setProbOvlo5_5(rs.getString(43));
				po.setProbOvlo5_6(rs.getString(44));
				po.setProbOvloLane5(rs.getString(45));
				po.setProbOvlo6_1(rs.getString(46));
				po.setProbOvlo6_2(rs.getString(47));
				po.setProbOvlo6_3(rs.getString(48));
				po.setProbOvlo6_4(rs.getString(49));
				po.setProbOvlo6_5(rs.getString(50));
				po.setProbOvlo6_6(rs.getString(51));
				po.setProbOvloLane6(rs.getString(52));
				po.setProbOvlo7_1(rs.getString(53));
				po.setProbOvlo7_2(rs.getString(54));
				po.setProbOvlo7_3(rs.getString(55));
				po.setProbOvlo7_4(rs.getString(56));
				po.setProbOvlo7_5(rs.getString(57));
				po.setProbOvlo7_6(rs.getString(58));
				po.setProbOvloLane7(rs.getString(59));
				po.setProbOvlo8_1(rs.getString(60));
				po.setProbOvlo8_2(rs.getString(61));
				po.setProbOvlo8_3(rs.getString(62));
				po.setProbOvlo8_4(rs.getString(63));
				po.setProbOvlo8_5(rs.getString(64));
				po.setProbOvlo8_6(rs.getString(65));
				po.setProbOvloLane8(rs.getString(66));
				po.setProbOvloHax2_1(rs.getString(67));
				po.setProbOvloHax2_2(rs.getString(68));
				po.setProbOvloHax2_3(rs.getString(69));
				po.setProbOvloHax2_4(rs.getString(70));
				po.setProbOvloHax2_5(rs.getString(71));
				po.setProbOvloHax2_6(rs.getString(72));
				po.setProbOvloHalf2(rs.getString(73));
				po.setProbOvloAxle1(rs.getString(74));
				po.setProbOvloAxle2(rs.getString(75));
				po.setProbOvloAxle3(rs.getString(76));
				po.setProbOvloAxle4(rs.getString(77));
				po.setProbOvloAxle5(rs.getString(78));
				po.setProbOvloAxle6(rs.getString(79));
				po.setProbOvloAll(rs.getString(80));
				list.add(po);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;		
	}
	
	
}