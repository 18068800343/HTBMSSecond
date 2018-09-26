package hs.bm.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import hs.bm.dao.BrgCardDao;
import hs.bm.dao.BrgMbrDao;
import hs.bm.vo.BrgSpanForCardVO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.QuickDownSpanVo;

public class Nullchange {
	public static String NulltoString(String str) {
		if (str == null) {
			str = "";
		}
		return str;
	}

	public static String formatSpan_no(String value) {
		String[] ll = value.split("\t");
		ArrayList list = new ArrayList();
		List<String> a = new ArrayList<String>();
		String result = "";
		Integer store = 0;
		for (int i = 0; i < ll.length; i++) {
			if (store == 0) {
				a.add(ll[i]);
				store = Integer.parseInt(ll[i].trim());
			    if(store==0){
			    	store=1;
			    }
				if (i == ll.length - 1) {
					list.add(a);
				}
			} else {
				if ((store + 1) == Integer.parseInt(ll[i])) {
					a.add(ll[i]);
					store = Integer.parseInt(ll[i]);
					if (i == ll.length - 1) {
						list.add(a);
					}
				} else {
					list.add(a);
					a = new ArrayList<String>();
					a.add(ll[i]);
					store = Integer.parseInt(ll[i]);
					if (i == ll.length - 1) {
						list.add(a);
					}
				}
			}
		}
		for (int i = 0; i < list.size(); i++) {
			ArrayList list1 = (ArrayList) list.get(i);
			if (i == 0) {
				result += getSS(list1);
			} else {
				result += "," + getSS(list1);
			}
		}
		return result;
	}

	public static String getSS(ArrayList list) {
		String s = "";
		for (int i = 0; i < list.size(); i++) {
			if (list.size() > 1) {
				if (i == 0) {
					s += list.get(i);
				} else if (i == list.size() - 1) {
					s += "~" + list.get(i);
				}
			} else {
				s += list.get(i);
			}
		}
		return s;
	}

	public static void mergeList(List<QuickDownSpanVo> list, String direction, OperationConstruct oc) {
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			QuickDownSpanVo entity = list.get(i);
			String key = entity.getQuick_down_struct_base_type() + "\t" + entity.getQuick_down_struct_stuff() + "\t"
					+ entity.getQuick_down_struct_type();
			if (map.containsKey(key)) {
				String value = map.get(key) + "\t" + entity.getQuickSpan_duntai_no();
				map.put(key, value);
			} else {
				map.put(key, entity.getQuickSpan_duntai_no());
			}
		}
		
		Iterator entries = map.entrySet().iterator();
		BrgMbrDao brgMbrDao = new BrgMbrDao();
		while (entries.hasNext()) {
			Map.Entry entry = (Map.Entry) entries.next();
			String key = (String) entry.getKey();
			String value = (String) entry.getValue();
			String[] num = value.split("\t");
			boolean bool = Nullchange.judgeWade(list, num);
			value = direction + Nullchange.formatSpan_no(value);
			String[] params = key.split("\t");
			QuickDownSpanVo quickDownSpanVo = new QuickDownSpanVo();
			quickDownSpanVo.setBridge_id(oc.getId());
			quickDownSpanVo.setDirection(direction);
			quickDownSpanVo.setIfWadeOrNo(bool+"");
			quickDownSpanVo.setQuick_down_struct_base_type(params[0]);
			quickDownSpanVo.setQuick_down_struct_stuff(params[1]);
			quickDownSpanVo.setQuick_down_struct_type(params[2]);
			quickDownSpanVo.setQuickSpan_duntai_no(value);
			brgMbrDao.insertDownSpan(quickDownSpanVo);
			// BrgCardDao.getInstance().addFullTop(op.getId(),
			// IDtool.getUUID().replace("-", ""), value, params[0], params[1],
			// params[2]);
			System.out.println("Key = " + key + ", Value = " + value);
		}
	}
	public static boolean judgeWade(List<QuickDownSpanVo> list,String[] num){
		boolean flag = false;
		int count = 0;
		ArrayList<QuickDownSpanVo> newList = new ArrayList<>();
		for(QuickDownSpanVo quickDownSpanVo:list){
			for(String str:num){
				if(quickDownSpanVo.getQuickSpan_duntai_no().equals(str)){
					newList.add(quickDownSpanVo);
				}
			}
		}
		int listSize = newList.size();
		for(QuickDownSpanVo obj:newList){
			if("true".equals(obj.getIfWadeOrNo())){
				count++;
			}
		}
		if(count==listSize){
			return true;
		}else{
			return false;
		}
	}
}
