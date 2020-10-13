package hs.bm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.TimeUtil;

/**
 * 获取json字串
 * @author mao
 *
 */
public class ToJSONStr {

	/**key==null时直接返回对象json串，否则返回key-value模式的json传*/
	public static String getJSON(Object obj,String key){
		if(key==null){
			return JSON.toJSONString(obj);
		}else{
			JSONObject jo = new JSONObject();
			jo.put(key, obj);
			return jo.toString();
		}
	}
	
	
	public static void main(String[] args) {
		Date end = new Date();
		Long endTime = end.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date start;
		try {
			start = sdf.parse("2020-08-26 05:10:00");
			Long startTime = start.getTime();
			System.out.println(endTime);
			System.out.println(startTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
