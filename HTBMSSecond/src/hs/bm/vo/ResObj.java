package hs.bm.vo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

/**
 * 用于向前台传送json数据
 * @author mao
 */
public class ResObj {
	
	/**
	 * 成功 success
	 * 失败 fail
	 */
	private String success;
	/**
	 * 没有错误0
	 */
	private int error;
	
	/**
	 * 输出到前台的对象
	 */
	private Object obj;

	
	public void ToJsp(HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		JSONObject jo = new JSONObject();
		jo.put("success", success);
		jo.put("error", error);
		jo.put("obj", obj);
		out.write(jo.toString());
		out.flush();
		out.close();
	}
	
	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public int getError() {
		return error;
	}

	public void setError(int error) {
		this.error = error;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}
	
	
	
	

}
