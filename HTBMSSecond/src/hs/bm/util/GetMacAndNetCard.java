package hs.bm.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.net.util.Base64;




public class GetMacAndNetCard
{
	/* 定义key */
	// private static String key = "hsxx";

	/**
	 * 测试
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception
	{
		System.out.println(readLicense());
		/* 获取mac地址 */
	 InetAddress ia = InetAddress.getLocalHost();
	 String mac = getLocalMac(ia);
		 System.out.println(mac);

		/* 需要加密的字符串:mac+times(项目桥梁限定次数)+limitDate(限定使用的时限)+reportTimes(报告生成次数) */
	 String sss = mac + "\t" + "11111" + "\t" + "2017-09-09!#" + "\t" + "100";
		// String encode = getBase64Encodec(sss);
	 String encode =new String(Base64.encodeBase64(sss.getBytes("UTF-8")));
		 System.out.println("encode: " + encode);

		/* 读取license文件 */
		 String code = readLicense();
		System.out.println(code);

		/* 解码 */
		 String codec = getBase64Decodec(code);
		 System.out.println(codec);
		System.out.println("mac: " + getMac(codec, "mac"));
		 System.out.println("times: " + getMac(codec, "times"));
		 System.out.println("limitDate: " + getMac(codec, "limitDate"));
		 System.out.println("reportTimes: " + getMac(codec, "reportTimes"));

		/* 输出时间 */
		 String webUrl2 = "http://www.baidu.com";// 百度
		 String webUrl3 = "http://www.taobao.com";// 淘宝
		 String webUrl4 = "http://www.ntsc.ac.cn";// 中国科学院国家授时中心
		 String webUrl5 = "http://www.360.cn";// 360
		 String webUrl6 = "http://www.beijing-time.org";// beijing-time
		
		 System.out.println(getWebsiteDatetime(webUrl2));
		
		addReportCount();
		System.out.println(getReportCount());
	}

	/**
	 * 拆解解码后的密码串
	 * 
	 * @param Str
	 * @param model
	 *            mac/times/limitDate/reportTimes
	 * @return
	 */
	public static String getMac(String Str, String model)
	{
		String ss = "";
		if (model.equals("mac"))
		{
			ss = Str.split("\t")[0];
		} else if (model.equals("times"))
		{
			ss = Str.split("\t")[1];
		} else if (model.equals("limitDate"))
		{
			ss = Str.split("\t")[2];
		} else if (model.equals("reportTimes"))
		{
			ss = Str.split("\t")[3];
		}
		return ss;
	}

	/**
	 * 获取mac地址
	 * 
	 * @param ia
	 * @return mac地址
	 * @throws SocketException
	 */
	public static String getLocalMac(InetAddress ia) throws SocketException
	{
		// 获取网卡，获取地址
		String mac_add;
		byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
		StringBuffer sb = new StringBuffer("");
		for (int i = 0; i < mac.length; i++)
		{
			if (i != 0)
			{
				sb.append("-");
			}
			// 字节转换为整数
			int temp = mac[i] & 0xff;
			String str = Integer.toHexString(temp);
			if (str.length() == 1)
			{
				sb.append("0" + str);
			} else
			{
				sb.append(str);
			}
		}
		mac_add = sb.toString().toUpperCase();
		// System.out.println("本机MAC地址:"+getBase64Encodec(getBase64Encodec(sb.toString().toUpperCase()+"\t200")+"hsxx"));
		return mac_add;
	}

	/**
	 * 加密
	 * 
	 * @param str
	 * @return
	 */
	public static String getBase64Encodec(String str)
	{
		byte[] encodeBase64;
		FileOutputStream out = null;
		try
		{
			out = new FileOutputStream(new File("C:\\Users\\hp\\Desktop\\License"));
			encodeBase64 = Base64.encodeBase64(str.getBytes("UTF-8"));
			str = new String(encodeBase64);
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		try
		{
			out.write(str.getBytes());
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return str;
	}

	/**
	 * 解密
	 * 
	 * @param str
	 * @return
	 */
	public static String getBase64Decodec(String str)
	{
		byte[] encodeBase64;
		try
		{
			encodeBase64 = Base64.decodeBase64(str.getBytes("UTF-8"));
			str = new String(encodeBase64);
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}

		return str;
	}

	/**
	 * md5加密
	 * 
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public static String getMD5(String str) throws Exception
	{
		try
		{
			// 生成一个MD5加密计算摘要
			MessageDigest md = MessageDigest.getInstance("MD5");
			// 计算md5函数
			md.update(str.getBytes());
			// digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
			// BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
			return new BigInteger(1, md.digest()).toString(16);
		} catch (Exception e)
		{
			throw new Exception("MD5加密出现错误");
		}
	}

	/**
	 * 读取license文件
	 * 
	 * @return 密码
	 */
	public static String readLicense()
	{
		String path = new GetMacAndNetCard().getClass().getResource("/").toString().substring(6);
		try
		{
			path = URLDecoder.decode(path, "UTF-8");
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		File file = new File(path, "License");
		String code = "";
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(file));
			code = reader.readLine();

		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return code;
	}

	public static String getReportCount()
	{
		String code = "";
		String path = new GetMacAndNetCard().getClass().getResource("/").toString().substring(6);
		try
		{
			path = URLDecoder.decode(path, "UTF-8");
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		File file = new File(path, "report_count");
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(file));
			code = reader.readLine();
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return code;
	}
	
	public static void addReportCount()
	{
		String times = "";
		String path = new GetMacAndNetCard().getClass().getResource("/").toString().substring(6);
		try
		{
			path = URLDecoder.decode(path, "UTF-8");
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		File file = new File(path, "report_count");
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(file));
			times = reader.readLine();
			times = (Integer.parseInt(times)+1)+"";
			FileOutputStream out = new FileOutputStream(file);
			out.write(times.getBytes());
			out.flush();
			reader=null;
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取网络时间
	 * 
	 * @param webUrl
	 * @return
	 */
	public static String getWebsiteDatetime(String webUrl)
	{
		try
		{
			URL url = new URL(webUrl);// 取得资源对象
			URLConnection uc = url.openConnection();// 生成连接对象
			uc.connect();// 发出连接
			long ld = uc.getDate();// 读取网站日期时间
			Date date = new Date(ld);// 转换为标准时间对象
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINA);// 输出北京时间
			return sdf.format(date);
		} catch (MalformedURLException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 
	 * @param date 当前日期
	 * @param date_limit 限定日期
	 * @return
	 */
	public static boolean date_compare(String date,String date_limit){
		boolean flag= false;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		 try
		{
			Date dt1 = df.parse(date);
			Date dt2 = df.parse(date_limit);
			if(!(dt1.getTime()>dt2.getTime())){
				flag=true;
			}else{
				flag=false;
			}
		} catch (ParseException e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	
}
