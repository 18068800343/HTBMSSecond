package hs.bm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.alibaba.druid.sql.visitor.functions.If;

import hs.bm.vo.CalendarVO;

public class GetDayBetweenStartAndEnd {
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public static Map<String, Integer> getBetweenDates(String startTime) {

		Date begin = null;
		try {
			begin = getDate(startTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date end = new Date();
		Map<String, Integer> map = new HashMap<String, Integer>();
		Calendar tempStart = Calendar.getInstance();
		tempStart.setTime(begin);
		while (begin.getTime() <= end.getTime()) {
			map.put(sdf.format(tempStart.getTime()), 0);
			tempStart.add(Calendar.DAY_OF_YEAR, 1);
			begin = tempStart.getTime();
		}
		return map;
	}

	private static Date getDate(String data) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 小写的mm表示的是分钟
		return sdf.parse(data);
	}
	
	public static ArrayList<CalendarVO> getMapAfterCounting(Map<String, Integer> map) {
		ArrayList<CalendarVO> ll = new ArrayList<>();
		for (Map.Entry<String, Integer> entry : map.entrySet()) {  
			CalendarVO c = new CalendarVO();
			String key = entry.getKey();
			if (map.get(key)<48) {
				c.setDate(entry.getKey());
				c.setValue("数据不完整:共计"+entry.getValue()+"个数据");
				ll.add(c);
			}
		}  
		return ll;
	}
}
