package hs.bm.fixData;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.Field;

import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;

public class CheckMbrDefect {
	
	public static void check() throws IOException{
		System.out.println("开始运行");
		String sql ="select a.*,b.member_no from chk_brg_defect a,brg_mbr_info b where a.mbr_no=b.r_id";
		String repireSql = "update chk_brg_defect set defect_location_desc=?,defect_location_desc_val=? where defect_serial=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rSet = dataOperation.executeQuery(sql, null);
		File file = new File("E:\\resOK.txt");
		BufferedWriter writer = new BufferedWriter(new FileWriter(file));
		try {
			while(rSet.next()){
				String defect_serial = rSet.getString("defect_serial");
				String member_no = rSet.getString("member_no");
				String local = rSet.getString("defect_location_desc");
				String local_val = rSet.getString("defect_location_desc_val");
				List<String> ll = JSON.parseArray(local_val, String.class);
				if(ll.size()>0){
					if(!member_no.equals(ll.get(0))){
						System.out.println(member_no+"，"+local_val);
				/*		local=local.replaceAll(ll.get(0), member_no);
						local_val=local_val.replaceAll(ll.get(0), member_no);
						dataOperation.executeUpdate(repireSql, new String[]{local,local_val,defect_serial});*/
						writer.write(defect_serial+"\t"+member_no+"\t"+local+"\t"+local_val);
						writer.newLine();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		writer.close();
		dataOperation.close();
	}
	
	public static void repire() throws IOException{
		
	}
	
	public static void main(String[] args) throws IOException{
//		check();
		System.out.println(new Date());
	}

}
