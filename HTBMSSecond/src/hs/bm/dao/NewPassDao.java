package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hs.bm.bean.CulInfo;
import hs.bm.bean.CulPrjPhoto;
import hs.bm.bean.DicHwInfo;
import hs.bm.bean.PassInfo;
import hs.bm.bean.PassPrjPhoto;
import hs.bm.util.Nullchange;
import hs.bm.vo.Pass_InfoVO;

public class NewPassDao
{
	private static NewPassDao newPassDao;
	
	public static NewPassDao getInstance()
	{
		if (newPassDao == null)
		{
			newPassDao = new NewPassDao();
		}
		return newPassDao;
	}
	
	
	/**
	 * 新建通道
	 * @author sundj
	 * @param PassInfo
	 * @return
	 */
	public int insertCul_Info(PassInfo passInfo){
		int i = 0 ;
		String sql = " INSERT INTO pass_info(pass_id,highway_id,manage_id," +
				"section_id,zone_id,pass_no,pass_name,stub_no,longitude,latitude)" +
				" VALUES(?,?,?,?,?,?,?,?,?,?) ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = mdo.executeUpdate(sql, new String[]{
				passInfo.getPass_id(),passInfo.getHighway_id(),passInfo.getManage_id(),
				passInfo.getSection_id(),passInfo.getZone_id(),passInfo.getPass_no(),passInfo.getPass_name(),
				passInfo.getStub_no(),passInfo.getLongitude(),passInfo.getLatitude()
		});
		mdo.close();
		return i;
	}
	
	public ArrayList<Pass_InfoVO> getPass_InfoVOData(String pass_id){
		ArrayList<Pass_InfoVO> pass_InfoVO  = new ArrayList<Pass_InfoVO>();
		String sql = " SELECT *,d.section_name as s_name FROM pass_info AS a LEFT JOIN dic_hw_info AS b" +
				" ON a.highway_id = b.highway_id LEFT JOIN sys_org_info AS c " +
				"ON a.manage_id = c.org_id LEFT JOIN sys_section_info AS d " +
				"ON a.section_id = d.section_id LEFT JOIN sys_zone_info AS e " +
				"ON a.zone_id = e.zone_id WHERE a.pass_id = ? ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = mdo.executeQuery(sql, new String[]{pass_id});
		try
		{
			while (rs.next())
			{
				Pass_InfoVO entity = new Pass_InfoVO();
				entity.setPass_id(pass_id);
				entity.setHighway_id(Nullchange.NulltoString(rs.getString("highway_id")));
				entity.setHighway_name(Nullchange.NulltoString(rs.getString("highway_name")));
				entity.setManage_id(Nullchange.NulltoString(rs.getString("manage_id")));
				entity.setManage_name(Nullchange.NulltoString(rs.getString("org_name")));
				entity.setSection_id(Nullchange.NulltoString(rs.getString("section_id")));
				entity.setSection_name(Nullchange.NulltoString(rs.getString("s_name")));
				entity.setZone_id(Nullchange.NulltoString(rs.getString("zone_id")));
				entity.setZone_name(Nullchange.NulltoString(rs.getString("zone_name")));
				entity.setPass_no(Nullchange.NulltoString(rs.getString("pass_no")));
				entity.setPass_name(Nullchange.NulltoString(rs.getString("pass_name")));
				entity.setStub_no(Nullchange.NulltoString(rs.getString("stub_no")));
				entity.setPass_type(Nullchange.NulltoString(rs.getString("pass_type")));
				entity.setSpan_build(Nullchange.NulltoString(rs.getString("span_build")));
				entity.setUse_type(Nullchange.NulltoString(rs.getString("use_type")));
				entity.setLongitude(Nullchange.NulltoString(rs.getString("longitude")));
				entity.setLatitude(Nullchange.NulltoString(rs.getString("latitude")));
				entity.setSkew_angle(Nullchange.NulltoString(rs.getString("skew_angle")));
				entity.setConstruct_ym(Nullchange.NulltoString(rs.getString("construct_ym")));
				pass_InfoVO.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return pass_InfoVO;
	}
	public int upDatePassInfo(PassInfo passInfo){
		int i = 0;
		String sql = " UPDATE pass_info SET highway_id=?,pass_no=?,pass_name=?,stub_no=?,pass_type=?,skew_angle=?,use_type=?,span_build=?,construct_ym=?,longitude=?,latitude=?,manage_id=?,section_id=?,zone_id=?  where pass_id=?  ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = mdo.executeUpdate(sql, new String[]{
				passInfo.getHighway_id(),passInfo.getPass_no(),passInfo.getPass_name(),
				passInfo.getStub_no(),passInfo.getPass_type(),passInfo.getSkew_angle(),
				passInfo.getUse_type(),passInfo.getSpan_build(),passInfo.getConstruct_ym(),
				passInfo.getLongitude(),passInfo.getLatitude(),passInfo.getManage_id(),
				passInfo.getSection_id(),passInfo.getZone_id(),passInfo.getPass_id()
		});
		mdo.close();
		return i;
	}
	
	public int storePath_pass(String path, String pass_type, String pass_id,String prj_id)
	{
		int i = 0;
		String pic = "";
		if (pass_type.equals("立面照"))
		{
			pic = "facade";
		} else
		{
			pic = "face";
		}
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " UPDATE pass_prj_photo SET prj_id=?,path=?,photo_type=? WHERE pass_id = ? ";
		String[] arr =
		{ prj_id,path,pic, pass_id };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public ArrayList<PassPrjPhoto> getPhotoPath(String pass_id){
		ArrayList<PassPrjPhoto> passPrjPhoto = new ArrayList<PassPrjPhoto>();
		String sql =" SELECT a.path,a.photo_type FROM pass_prj_photo AS a LEFT JOIN chk_project_info AS b ON a.prj_id= b.prj_id WHERE pass_id = ? ORDER BY b.prj_establish_tm DESC LIMIT 2 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{pass_id});
		try
		{
			while (rs.next())
			{
				PassPrjPhoto entity = new PassPrjPhoto();
				entity.setPath(rs.getString("path"));
				entity.setPhoto_type(rs.getString("photo_type"));
				passPrjPhoto.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();	
		return passPrjPhoto;
	}
	
	
}
