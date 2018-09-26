package hs.bm.fixData;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.DefectCount;
import hs.bm.dao.CheckPassSpanDao;
import hs.bm.dao.CheckSpanDao;
import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;


public class RebuildDefectCount {

	
	public static DefectTemplate searchTemp(List<DefectTemplate> defectTemplates, String vab){
		DefectTemplate flag = null;
		for(DefectTemplate template : defectTemplates){
			if(template.getVariable().equals(vab)){
//				System.out.println(JSON.toJSONString(template));
				flag = template;
			}
		}
		return flag;
	}
	
	public static String getDate(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		return format.format(new Date());
	}
	
	public static void main(String[] args) throws Exception{
//		String sql = "select a.*,d.chk_id,d.bridge_id,e.defect_f_name,f.defect_name,f.defect_def,f.defect_loc_def,f.defect_template,f.defect_id as did from "
//				+ "chk_brg_defect a,chk_brg_record b,chk_span_record c, chk_brg_regular d ,dic_mbr_defect_f e,dic_mbr_defect_s f "
//				+ "where a.mbr_chk_id=b.mbr_chk_id and b.span_chk_id=c.span_chk_id and c.chk_id=d.chk_id "
//				+ "and a.defect_name_f=e.defect_f_name and a.defect_name=f.defect_name and e.defect_f_id=f.defect_f_id;";
		String sql = "select a.*,d.chk_id,d.pass_id,e.defect_f_name,f.defect_name,f.defect_def,f.defect_loc_def,f.defect_template,f.defect_id as did from "
				+ "chk_pass_defect a,chk_pass_record b,chk_pass_span_record c, chk_pass_regular d ,dic_mbr_defect_f e,dic_mbr_defect_s f "
				+ "where a.defect_serial in ('01d7731f7e0340ccb1eda4157fe215b1','0ab39d31f3c146ca91776ae7f0441179','2143de42471b45e595c9a327956cb491','411df18a741e4898b18d47601c227cc9','476cc93006ff4abe97d4f67daa4f6fe0','67638a70dfab449ba505a9b80ad7afdc','cbe34cf47aeb4e2c89584b92b42574c4','d19aeefec41a4eaaa1cf32d5292cf25d','d26f2deeafb44481a55fa29b4f6dac3b','d5603bcf1f2d4805ad6e52b07f9d22fa','fa2dbb77641742cb81f2321a9f69d580','fdd28c3a42be4bc5aa49256ad7303f73') and a.mbr_chk_id=b.mbr_chk_id and b.span_chk_id=c.span_chk_id and c.chk_id=d.chk_id "
				+ "and a.defect_name_f=e.defect_f_name and a.defect_name=f.defect_name and e.defect_f_id=f.defect_f_id;";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		
		ResultSet rs = dataOperation.executeQuery(sql, null);
		int defectNum = 0;
		int count = 0;
		BufferedWriter writer = new BufferedWriter(new FileWriter(new File("D:\\result")));
		while(rs.next()){
			System.out.println(defectNum);
			defectNum++;
			String defect_serial = rs.getString("defect_serial");
			String defect_id = rs.getString("did");
			String chk_id = rs.getString("chk_id");
//			String struct_id = rs.getString("bridge_id");
			String struct_id = rs.getString("pass_id");
			String member_no = rs.getString("mbr_no");
			String defect_location_desc_val = rs.getString("defect_location_desc_val");
			String defect_loc_def = rs.getString("defect_loc_def");
			String defect_count_val = rs.getString("defect_count_val");
			String defect_def = rs.getString("defect_def");
			String defect_template = rs.getString("defect_template");
			String defect_name_f = rs.getString("defect_name_f");
			String defect_name = rs.getString("defect_name");
			String defect_count = rs.getString("defect_count");
			if(defect_name_f.equals("破损") && defect_name.equals("破损") && defect_count.equals("破损")){
				System.out.println(defect_serial+"\t"+defect_name_f+"\t"+defect_name+"\t"+defect_count);
				continue;
			}
			if(defect_name_f.equals("结构渗水、积水") && defect_name.equals("渗水") && defect_count_val.equals("[\"1\"]")){
				System.out.println(defect_serial+"\t"+defect_name_f+"\t"+defect_name+"\t"+defect_count);
				continue;
			}
			if(defect_name_f.equals("结构渗水、积水") && defect_name.equals("渗水") && defect_count_val.equals("[\"2\"]")){
				System.out.println(defect_serial+"\t"+defect_name_f+"\t"+defect_name+"\t"+defect_count);
				continue;
			}
			Pattern pattern = Pattern.compile("\\{[^\\{\\}]*\\}");
			List<DefectTemplate> defectTemplates = JSON.parseArray(defect_template, DefectTemplate.class);
			List<String> defect_location_desc_val_list = JSON.parseArray(defect_location_desc_val, String.class);
			List<String> defect_count_val_list = JSON.parseArray(defect_count_val, String.class);
			Matcher locMatcher = pattern.matcher(defect_loc_def);
			Matcher countMatcher = pattern.matcher(defect_def);
			List<DefectCount> defectCounts = new ArrayList<>();
			int i = 0;
			while(locMatcher.find()){
				String vab = locMatcher.group(0).replace("{", "").replace("}", "");
//				System.out.println(vab);
				if (vab.equals("构件") || vab.equals("参照")) {
					continue;
				}
				DefectTemplate defectTemplate = searchTemp(defectTemplates, vab);
				if(defectTemplate.getSave()==1){
//					System.out.println(defect_template);
//					System.out.println(defect_location_desc_val);
					count++;
					DefectCount dCount = new DefectCount();
					dCount.setChk_id(chk_id);
					dCount.setDefect_id(defect_id);
					dCount.setStruct_id(struct_id);
					dCount.setDefect_serial(defect_serial);
					dCount.setMember_no(member_no);
					dCount.setDefect_record(defectTemplate.getDescribe());
					dCount.setDefect_record_val(defect_location_desc_val_list.get(i));
					dCount.setDefect_record_type(defectTemplate.getType());
					defectCounts.add(dCount);
				}
				i++;
			}
			i=0;
			while(countMatcher.find()){
				String vab = countMatcher.group(0).replace("{", "").replace("}", "");
				if (vab.equals("构件") || vab.equals("参照")) {
					continue;
				}
				DefectTemplate defectTemplate = searchTemp(defectTemplates, vab);
				if(defectTemplate.getSave()==1){
//					System.out.println(defect_template);
//					System.out.println(defect_count_val);
					System.out.println(defect_serial);
					count++;
					DefectCount dCount = new DefectCount();
					dCount.setChk_id(chk_id);
					dCount.setDefect_id(defect_id);
					dCount.setStruct_id(struct_id);
					dCount.setDefect_serial(defect_serial);
					dCount.setMember_no(member_no);
					dCount.setDefect_record(defectTemplate.getDescribe());
					dCount.setDefect_record_val(defect_count_val_list.get(i));
					dCount.setDefect_record_type(defectTemplate.getType());
					defectCounts.add(dCount);
				}
				i++;
			}
			if(defectCounts.size()>0){
//				CheckSpanDao.getInstance().saveDefectCount(defectCounts, defect_serial);
				CheckPassSpanDao.getInstance().saveDefectCount(defectCounts, defect_serial);
				writer.write(JSON.toJSONString(defectCounts));
				writer.newLine();
			}
		}
		System.out.println("病害总数："+defectNum);
		System.out.println("病害统计总数："+count);
		writer.close();
		dataOperation.close();
	}
}
