package hs.bm.fixData;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.sql.ResultSet;

import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;

public class DataFix {

	public static void main(String[] args) throws Exception{
		BufferedReader reader = new BufferedReader(new FileReader(new File("E:\\2016.txt")));
		BufferedWriter writer1 = new BufferedWriter(new FileWriter(new File("E:\\cl\\2016-s-b.txt")));
		BufferedWriter writer2 = new BufferedWriter(new FileWriter(new File("E:\\cl\\2016-f-b.txt")));
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String line=null;
		while((line=reader.readLine())!=null){
			String[] rows = line.split("\t");
			String struct_name = rows[0];
			String struct_no = rows[1];
			String highway_no = rows[2];
			String manage_name = rows[3];
			String section_name = rows[4];
			String zone_name = rows[5];
			String struct_id = null;
			String highway_id=null;
			String manage_id=null;
			String section_id=null;
			String zone_id=null;
			String sql = "select * from brg_card_admin_id where bridge_no=?";
			ResultSet rs = dataOperation.executeQuery(sql, new String[]{ struct_no });
			while(rs.next()){
				struct_id = rs.getString("bridge_id");
			}
			if(struct_id==null){
				System.out.println(struct_name+"\t"+"桥梁编号无匹配项");
				System.out.println(struct_no);
				writer2.write(struct_name+"\t"+struct_no+"\t"+highway_no+"\t"+manage_name+"\t"+section_name+"\t"+zone_name+"\t"+"桥梁编号无匹配项");
				writer2.newLine();
				continue;
			}
			
			sql = "select * from dic_hw_info where highway_no=?";
			rs = dataOperation.executeQuery(sql, new String[]{ highway_no });
			while(rs.next()){
				highway_id = rs.getString("highway_id");
			}
			if(highway_id==null){
				System.out.println(struct_name+"\t"+"路线编号无匹配项");
				System.out.println(highway_no);
				writer2.write(struct_name+"\t"+struct_no+"\t"+highway_no+"\t"+manage_name+"\t"+section_name+"\t"+zone_name+"\t"+"路线编号无匹配项");
				writer2.newLine();
				continue;
			}
			
			sql = "select * from dic_manage_org where manage_name=?";
			rs = dataOperation.executeQuery(sql, new String[]{ manage_name });
			while(rs.next()){
				manage_id = rs.getString("manage_id");
			}
			if(manage_id==null){
				System.out.println(struct_name+"\t"+"单位编号无匹配项");
				System.out.println(manage_name);
				writer2.write(struct_name+"\t"+struct_no+"\t"+highway_no+"\t"+manage_name+"\t"+section_name+"\t"+zone_name+"\t"+"单位编号无匹配项");
				writer2.newLine();
				continue;
			}
			
			sql = "select * from dic_manage_section where section_name=?";
			rs = dataOperation.executeQuery(sql, new String[]{ section_name });
			while(rs.next()){
				section_id = rs.getString("section_id");
			}
			if(section_id==null){
				System.out.println(struct_name+"\t"+"路段编号无匹配项");
				System.out.println(section_name);
				writer2.write(struct_name+"\t"+struct_no+"\t"+highway_no+"\t"+manage_name+"\t"+section_name+"\t"+zone_name+"\t"+"路段编号无匹配项");
				writer2.newLine();
				continue;
			}
			
			sql = "select * from dic_manage_zone where zone_name=?";
			rs = dataOperation.executeQuery(sql, new String[]{ zone_name });
			while(rs.next()){
				zone_id = rs.getString("zone_id");
			}
			if(zone_id==null){
				System.out.println(struct_name+"\t"+"分区编号无匹配项");
				System.out.println(zone_name);
				writer2.write(struct_name+"\t"+struct_no+"\t"+highway_no+"\t"+manage_name+"\t"+section_name+"\t"+zone_name+"\t"+"分区编号无匹配项");
				writer2.newLine();
				continue;
			}
			writer1.write(struct_name+"\t"+struct_no+"\t"+struct_id+"\t"+highway_id+"\t"+highway_no+"\t"+manage_id+"\t"+manage_name+"\t"+section_id+"\t"+section_name+"\t"+zone_id+"\t"+zone_name);
			writer1.newLine();
			System.out.println(struct_name+"\t"+struct_no+"\t"+struct_id+"\t"+highway_id+"\t"+highway_no+"\t"+manage_id+"\t"+manage_name+"\t"+section_id+"\t"+section_name+"\t"+zone_id+"\t"+zone_name);
			new DataFix().update(struct_id, highway_id, manage_id, section_id, zone_id);
		}
		dataOperation.close();
		reader.close();
		writer1.close();
		writer2.close();
	}
	
	public void update(String struct_id, String highway_id, String manage_id, String section_id, String zone_id){
		String sql = "update brg_card_admin_id set highway_id=?,manage_id=?,section_id=?,zone_id=? where bridge_id=?";
		
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		dataOperation.executeUpdate(sql, new String[]{
				highway_id,
				manage_id,
				section_id,
				zone_id,
				struct_id
		});
		dataOperation.close();
		
	}

}
