/**
 * <p>Title: StatisFileNumVo.java</p>
 * <p>Description: 华通桥涵管理系统</p>
 * <p>Company: 环水信息技术有限公司</p>
 * @author 马潇霄
 * @version 1.0 创建时间：2017年7月6日 下午3:59:30
 */

package hs.bm.vo;

public class StatisFileNumVo {
	
	// @Fields bridge_name : 桥梁名称  
	private String bridge_name;
	// @Fields countFilesNum : 文件数
	private int countFilesNum;
	
	public String getBridge_name() {
		return bridge_name;
	}
	public void setBridge_name(String bridge_name) {
		this.bridge_name = bridge_name;
	}
	public int getCountFilesNum() {
		return countFilesNum;
	}
	public void setCountFilesNum(int countFilesNum) {
		this.countFilesNum = countFilesNum;
	}
	@Override
	public String toString() {
		return "StatisFileNumVo [bridge_name=" + bridge_name + ", countFilesNum=" + countFilesNum + "]";
	}
	
	

}
