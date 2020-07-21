package hs.bm.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/**
 * 确保系统中只有一个程序实例
 * 1.如果客户端启动前，操作系统中有残留进程，则杀死进程，然后启动
 * 2.如果客户端启动前，操作系统中没有残留进程，则直接启动
 * 时间：2018-04-13
 * @author Jason
 *
 */
public class SingleProcess {
    /**
     * 确认进程,获取进程,杀死进程
     * @param prefix 进程名前缀
     */
    public static void comfirmSingleProcess(String prefix) {

        if(prefix == null) {

            throw new NullPointerException("The prefix is null,please check it!!");
        }

        // 声明文件读取流
        BufferedReader out = null;
        BufferedReader br = null;
         try {

              // 创建系统进程
              ProcessBuilder pb = new ProcessBuilder("tasklist");
              Process p = pb.start();
              // 读取进程信息
              out = new BufferedReader(new InputStreamReader(new BufferedInputStream(p.getInputStream()), Charset.forName("GB2312")));
              br = new BufferedReader(new InputStreamReader(new BufferedInputStream(p.getErrorStream())));

              // 创建集合 存放 进程+pid
              List<String> list = new ArrayList<>();
              // 读取
              String ostr;
              while ((ostr = out.readLine()) != null){
                   // 将读取的进程信息存入集合
                   list.add(ostr);
              }

              // 遍历所有进程
              for (int i = 3; i < list.size(); i++) {
                  // 必须写死,截取长度,因为是固定的
                  String process = list.get(i).substring(0, 25).trim(); // 进程名
                  String pid = list.get(i).substring(25, 35).trim();    // 进程号
                  // 匹配指定的进程名,若匹配到,则立即杀死
                  if(process.startsWith(prefix)){
                      Runtime.getRuntime().exec("taskkill /F /PID "+pid); 
                  }
              }

              // 若有错误信息 即打印日志
              String estr = br.readLine();
              if (estr != null) {
                  System.out.println(estr);
              }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            // 关流
            try {
                if(out != null) { out.close(); }
            } catch (IOException e) {
                e.printStackTrace();
            }

            try {
                if(br != null) { br.close(); }
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }
    
    public static void main(String[] args) {
		SingleProcess.comfirmSingleProcess("BridgeCheckAutoCalculateS");
		SingleProcess.comfirmSingleProcess("WINWORD");
	}
}