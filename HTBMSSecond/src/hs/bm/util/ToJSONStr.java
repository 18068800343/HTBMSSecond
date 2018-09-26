package hs.bm.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

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
}
