package hs.bm.server;


import hs.bm.constant.SmsErrMessage;

import com.alibaba.fastjson.JSONObject;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

public class ShortMessageService
{
	private static ShortMessageService sms;

	public static ShortMessageService getInstance()
	{
		if (sms == null)
		{
			sms = new ShortMessageService();
		}
		return sms;
	}

	// 淘宝api调用url
	private static String url = "http://gw.api.taobao.com/router/rest";
	// 淘宝application的注册key
	//private static String appkey = "24496970";
	private static String appkey = "LTAIsKn6Aq59h2iY";
			
	// 淘宝application的密文
	private static String secret = "3SnSA8mJkgalPRt9tB3lNpbhYaBuvX";
			
	//private static String secret = "6a0a017b19ec137b33627235cecf0eea";
	// 定义返回值
	private static String extend = "success";
	// 短信通知形式，一般为normal
	private static String SmsType = "normal";
	// 短信签名
	private static String SmsFreeSignName = "华通桥涵";
	// 短信模版
	private static String SmsTemplateCode = "SMS_105095002";

	public String sendSms(String Tel_number, String params)
	{
		String rs = "";
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend(extend);
		req.setSmsType(SmsType);
		req.setSmsFreeSignName(SmsFreeSignName);
		req.setSmsParamString(params);
		req.setRecNum(Tel_number);
		req.setSmsTemplateCode(SmsTemplateCode);
		AlibabaAliqinFcSmsNumSendResponse rsp = null;
		try
		{
			rsp = client.execute(req);
		} catch (ApiException e)
		{
			e.printStackTrace();
		}
		rs = rsp.getBody();
		/*
		System.out.println(rsp.getBody());
		JSONObject json = JSONObject.parseObject(rs);
		System.out.println(json);
		*/
		System.out.println(rs);
		if(rs.contains("error_response")){
			if(rs.contains(SmsErrMessage.MOBILE_NUMBER_ILLEGAL)){
				rs="MOBILE_NUMBER_ILLEGAL";
			}else if(rs.contains(SmsErrMessage.BUSINESS_LIMIT_CONTROL)){
				rs = "BUSINESS_LIMIT_CONTROL";
			}else if(rs.contains(SmsErrMessage.AMOUNT_NOT_ENOUGH)){
				rs = "AMOUNT_NOT_ENOUGH";
			}else if(rs.contains(SmsErrMessage.MOBILE_COUNT_OVER_LIMIT)){
				rs = "MOBILE_COUNT_OVER_LIMIT";
			}
			
		}else{
			rs="success";
		}
		return rs;
	}
	
	public static void main(String[] args)
	{
		String Tel_number = "13776699229";
		String params = "{bridge_name:'(测试)淮海高速苏通大桥动态称重',time:'15小时'}";
		ShortMessageService.getInstance().sendSms(Tel_number, params);
	}
}
