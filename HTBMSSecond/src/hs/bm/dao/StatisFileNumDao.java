/**
 * <p>Title: StatisFileNum.java</p>
 * <p>Description: 华通桥涵管理系统</p>
 * <p>Company: 环水信息技术有限公司</p>
 * @author 马潇霄
 * @version 1.0 创建时间：2017年7月6日 下午3:51:24
 */

package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import hs.bm.vo.StatisFileNumVo;

/**
 * @ClassName: StatisFileNumDao
 * @Description:统计每座桥梁的文件数，用于首页
 * @author 马潇霄
 * @date 2017年7月6日 下午4:05:59
 * 
 */
public class StatisFileNumDao {

	private static final Log log = LogFactory.getLog(StatisFileNumDao.class);

	private static StatisFileNumDao statisFileNumDao;

	public static StatisFileNumDao getInstance() {
		if (statisFileNumDao == null) {
			statisFileNumDao = new StatisFileNumDao();
		}
		return statisFileNumDao;
	}

	public List<StatisFileNumVo> statisWeightFiles() {

		ArrayList<StatisFileNumVo> list = new ArrayList<>();
		String sql = "SELECT bridge_name ,COUNT(0) FROM brg_system AS b1 LEFT JOIN brg_weight_statistic AS b2 ON b1.bridge_id=b2.bridge_id LEFT JOIN brg_card_admin_id AS b3 ON b1.bridge_id=b3.bridge_id WHERE `mode` = 'w'  GROUP BY b1.bridge_id";
		// 查询动态称重的桥梁与其文件数
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				StatisFileNumVo sf = new StatisFileNumVo();
				sf.setBridge_name(rs.getString("bridge_Name"));
				sf.setCountFilesNum(Integer.parseInt(rs.getString("COUNT(0)")));
				list.add(sf);
			}
		} catch (SQLException e) {
			log.info(e);
		}
		dataOperation.close();
		return list;
	}

	public List<StatisFileNumVo> statisHealthFiles() {

		ArrayList<StatisFileNumVo> list = new ArrayList<>();
		String sql = "SELECT bridge_name ,COUNT(0) FROM brg_system AS b1 LEFT JOIN brg_health_statistic AS b2 ON b1.bridge_id=b2.bridge_id LEFT JOIN brg_card_admin_id AS b3 ON b1.bridge_id=b3.bridge_id WHERE `mode` = 'w'  GROUP BY b1.bridge_id";
		// 查询健康监测的桥梁与其文件数
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, null);
		try {
			while (rs.next()) {
				StatisFileNumVo sf = new StatisFileNumVo();
				sf.setBridge_name(rs.getString("bridge_Name"));
				sf.setCountFilesNum(Integer.parseInt(rs.getString("COUNT(0)")));
				list.add(sf);
			}
		} catch (SQLException e) {
			log.info(e);
		}
		dataOperation.close();
		return list;
	}

}