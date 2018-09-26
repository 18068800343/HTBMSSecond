package hs.bm.fixData;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;

public class SearchSpan{

	public static void main(String[] args) throws Exception{
/*		String sql = "";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		sql = "select * from chk_brg_regular where prj_id='61863572-edd9-41f1-b84c-b8fb0d7d9167'";
		ResultSet rs = dataOperation.executeQuery(sql, null);
		while(rs.next()){
			String bridge_id = rs.getString("bridge_id");
			String chk_id = rs.getString("chk_id");
			sql = "select * from brg_span_info where bridge_id=?";
			ResultSet rs2 = dataOperation.executeQuery(sql, new String[]{ bridge_id });
			while(rs2.next()){
				String direction = rs2.getString("direction");
				String span_no = rs2.getString("span_no");
				sql = "select * from chk_span_record where chk_id=? and direction=? and span_no=?";
				ResultSet rs3 = dataOperation.executeQuery(sql, new String[]{ chk_id, direction, span_no });
				boolean flag = false;
				while(rs3.next()){
					flag = true;
				}
				if(!flag){
					System.out.println(bridge_id+"\t"+direction+"\t"+span_no);
				}
			}
		}
		dataOperation.close();*/
		
//		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
//		String sql = "select * from chk_pass_defect where defect_photo!=''";
//		ResultSet rs = dataOperation.executeQuery(sql, null);
//		String basePath ="D:\\repository";
//		File err = new File("D:\\err.txt");
//		File suc = new File("D:\\success.txt");
//		BufferedWriter writer = new BufferedWriter(new FileWriter(err));
//		BufferedWriter writer2 = new BufferedWriter(new FileWriter(suc));
//		SearchSpan searchSpan = new SearchSpan();
//		while(rs.next()){
//			String defect_photo = rs.getString("defect_photo");
//			String defect_serial = rs.getString("defect_serial");
//			
//			File file = new File(basePath, defect_photo);
//			if(file.exists()){
//				System.out.println(defect_serial+"\t"+defect_photo+"\t"+"存在");
//				writer2.write(file.getAbsolutePath());
//				writer2.newLine();
//			}else{
//				System.out.println(defect_serial+"\t"+file.getAbsolutePath()+"\t"+"不存在");
////				searchSpan.editDefect(defect_serial);
//				writer.write(file.getAbsolutePath());
//				writer.newLine();
//			}
//		}
//		dataOperation.close();
//		writer2.close();
//		writer.close();
/*		File file = new File("D:\\123.txt");
		BufferedReader reader = new BufferedReader(new FileReader(file));
		StringBuffer buffer = new StringBuffer();
		String line = "";
		while((line=reader.readLine())!=null){
			buffer.append(line);
		}
		System.out.println(URLDecoder.decode(buffer.toString(),"UTF-8"));
		System.out.println(JSON.parseObject(buffer.toString()));
		*/
		
	}
		
	public int editDefect(String defect_serial){
		String sql = "update  chk_brg_defect set defect_photo='',defect_photo_memo='' where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql, new String[]{
				defect_serial
		});
		dataOperation.close();
		return i;
	}

}
