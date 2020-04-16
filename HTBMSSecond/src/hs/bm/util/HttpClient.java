package hs.bm.util;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class HttpClient {

	public static void main(String[] args) {
		String url = "http://139.198.176.206:1914/audrate/weight/add";
		
		//Post方式提交Json字符串，按照指定币种，指定时间点查询
		String json1 = "{\"query\":{\"bool\":{\"must\":[{\"match_phrase\":{\"imtype\":\"LTCUS\"}},{\"match_phrase\":{\"rtdatetime\":1521164922000}}]}}}";
		//Post方式提交json字符串，按照指定的币种和时间正序的方式获取前N条数据
		String json2 = "{\"query\":{\"match\":{\"imtype\":\"LTCUS\"}},\"sort\":[{\"rtdatetime\":{\"order\":\"desc\"}}],\"size\":3}";
		//Post方式提交Json字符串，按照指定币种，指定时间段查询	
		String json3 = "{\"query\":{\"bool\":{\"must\":[{\"match_phrase\":{\"imtype\":\"LTCUS\"}},{\"range\":{\"rtdatetime\":{\"gte\":1521164922000,\"lte\":1521164932000}}}]}}}";
		
		String json = json2;
		
		JSONArray array = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id","1");jsonObject.put("idLocal","1");
		jsonObject.put("stationId","1");jsonObject.put("evtTime","2019-20-20 15:22:22");
		jsonObject.put("msgTime","2019-20-20 15:22:22");jsonObject.put("laneNo","1");
		jsonObject.put("plate","1");jsonObject.put("plateColor","1");
		jsonObject.put("classLndex","1");jsonObject.put("length","1");
		jsonObject.put("speed","1");jsonObject.put("direcation","1");
		jsonObject.put("axlesCount","1");jsonObject.put("totalWeight","1");
		jsonObject.put("axle1","1");jsonObject.put("axle2","1");
		jsonObject.put("axle3","1");jsonObject.put("axle4","1");
		jsonObject.put("axle3","1");jsonObject.put("axle4","1");
		jsonObject.put("axle5","1");jsonObject.put("axle6","1");
		jsonObject.put("axle7","1");jsonObject.put("axle8","1");
		jsonObject.put("axle9","1");jsonObject.put("axle10","1");
		jsonObject.put("axleSpace1","1");jsonObject.put("axleSpace2","1");
		jsonObject.put("axleSpace3","1");jsonObject.put("axleSpace4","1");
		jsonObject.put("axleSpace5","1");jsonObject.put("axleSpace6","1");
		jsonObject.put("axleSpace7","1");jsonObject.put("axleSpace8","1");
		jsonObject.put("axleSpace9","1");jsonObject.put("isStraddle","1");
		jsonObject.put("temperature","1");jsonObject.put("overWeight","1");
		jsonObject.put("overWeightRatio","1");jsonObject.put("wimId","1");
		jsonObject.put("lprId","1");jsonObject.put("stationIp","1");
		jsonObject.put("imgData",null);
		array.add(jsonObject);
		 System.out.println(HttpClient.HttpPostWithJson(url, array.toString())); 
		
	}
	
	public static String HttpPostWithJson(String url, String json) {
		
		String returnValue = "这是默认返回值，接口调用失败";
		CloseableHttpClient httpClient = HttpClients.createDefault();
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		try{
			//第一步：创建HttpClient对象
		 httpClient = HttpClients.createDefault();
		 	
		 	//第二步：创建httpPost对象
	        HttpPost httpPost = new HttpPost(url);
	        
	        //第三步：给httpPost设置JSON格式的参数
	        StringEntity requestEntity = new StringEntity(json,"utf-8");
	        requestEntity.setContentEncoding("UTF-8");    	        
	        httpPost.setHeader("Content-type", "application/json");
	        httpPost.setEntity(requestEntity);
	       
	       //第四步：发送HttpPost请求，获取返回值
	       returnValue = httpClient.execute(httpPost,responseHandler); //调接口获取返回值时，必须用此方法
	      
		}
		 catch(Exception e)
		{
			 e.printStackTrace();
		}
		
		finally {
	       try {
			httpClient.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    }
		 //第五步：处理返回值
	     return returnValue;
	}
	
    public String fmtJsonArrStrByObject(Object object) {
		JSONArray array = new JSONArray();
		StringBuilder sbValue = new StringBuilder();
		String[] fieldNames = getFiledName(object);
		JSONObject jsonObject = new JSONObject();
		for(int j=0 ; j<fieldNames.length ; j++){ 
			    //遍历所有属性
               String name = fieldNames[j];    //获取属性的名字
               Object value = getFieldValueByName(name,object);
               jsonObject.put(name, value);
  		}
		array.add(jsonObject);
		return array.toString();
	}
    

    /**  
     * 获取属性名数组  
     * */  
    private static String[] getFiledName(Object o){  
        Field[] fields=o.getClass().getDeclaredFields();  
        String[] fieldNames=new String[fields.length];  
        for(int i=0;i<fields.length;i++){  
//            System.out.println(fields[i].getType());  
            fieldNames[i]=fields[i].getName();  
        }  
        return fieldNames;  
    }

    /* 根据属性名获取属性值  
        * */  
   private static Object getFieldValueByName(String fieldName, Object o) {  
       try {    
           String firstLetter = fieldName.substring(0, 1).toUpperCase();    
           String getter = "get" + firstLetter + fieldName.substring(1);    
           Method method = o.getClass().getMethod(getter, new Class[] {});    
           Object value = method.invoke(o, new Object[] {});    
           return value;    
       } catch (Exception e) {    
         
           return null;    
       }    
   } 
}
