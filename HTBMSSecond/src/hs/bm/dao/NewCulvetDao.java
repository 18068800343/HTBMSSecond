package hs.bm.dao;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hs.bm.bean.BrgPrjPhoto;
import hs.bm.bean.CulInfo;
import hs.bm.bean.CulPrjPhoto;
import hs.bm.bean.PassInfo;
import hs.bm.util.IDtool;
import hs.bm.util.Nullchange;
import hs.bm.vo.Culvert_infoVO;

/**
 * 新建涵洞
 * @author sundj
 *
 */
public class NewCulvetDao
{
	private static NewCulvetDao newCulvetDao;
	
	public static NewCulvetDao getInstance()
	{
		if (newCulvetDao == null)
		{
			newCulvetDao = new NewCulvetDao();
		}
		return newCulvetDao;
	}
	
	/**
	 * 新建涵洞
	 * @author sundj
	 * @param culInfo
	 * @return
	 */
	public int insertCul_Info(CulInfo culInfo){
		int i = 0 ;
		String sql = " INSERT INTO cul_info(culvert_id,highway_id,manage_id," +
				"section_id,zone_id,culvert_no,culvert_name,stub_no,longitude,latitude)" +
				" VALUES(?,?,?,?,?,?,?,?,?,?) ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = mdo.executeUpdate(sql, new String[]{
			culInfo.getCulvert_id(),culInfo.getHighway_id(),culInfo.getManage_id(),
			culInfo.getSection_id(),culInfo.getZone_id(),culInfo.getCulvert_no(),culInfo.getCulvert_name(),
			culInfo.getStub_no(),culInfo.getLongitude(),culInfo.getLatitude()
		});
		mdo.close();
		return i;
	}
	/**
	 * @author sundj
	 * 获取涵洞数据
	 * @param culvert_id
	 * @returnArrayList<Culvert_infoVO>
	 */
	public ArrayList<Culvert_infoVO> getCulInfoData(String culvert_id){
		ArrayList<Culvert_infoVO> culvert = new ArrayList<Culvert_infoVO>();
		String sql = " SELECT *,d.section_name as s_name FROM cul_info AS a LEFT JOIN dic_hw_info AS b" +
				" ON a.highway_id = b.highway_id LEFT JOIN sys_org_info AS c " +
				"ON a.manage_id = c.org_id LEFT JOIN sys_section_info AS d " +
				"ON a.section_id = d.section_id LEFT JOIN sys_zone_info AS e " +
				"ON a.zone_id = e.zone_id WHERE a.culvert_id = ? ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = mdo.executeQuery(sql, new String[]{culvert_id});
		try
		{
			while (rs.next())
			{
				Culvert_infoVO entity = new Culvert_infoVO();
				entity.setCulvert_id(culvert_id);
				entity.setHighway_id(Nullchange.NulltoString(rs.getString("highway_id")));
				entity.setHighway_name(Nullchange.NulltoString(rs.getString("highway_name")));
				entity.setManage_id(Nullchange.NulltoString(rs.getString("org_id")));
				entity.setManage_name(Nullchange.NulltoString(rs.getString("org_name")));
				entity.setSection_id(Nullchange.NulltoString(rs.getString("section_id")));
				entity.setSection_name(Nullchange.NulltoString(rs.getString("s_name")));
				entity.setZone_id(Nullchange.NulltoString(rs.getString("zone_id")));
				entity.setZone_name(Nullchange.NulltoString(rs.getString("zone_name")));
				entity.setCulvert_no(Nullchange.NulltoString(rs.getString("culvert_no")));
				entity.setCulvert_name(Nullchange.NulltoString(rs.getString("culvert_name")));
				entity.setStub_no(Nullchange.NulltoString(rs.getString("stub_no")));
				entity.setCulvert_type(Nullchange.NulltoString(rs.getString("culvert_type")));
				entity.setSpan_build(Nullchange.NulltoString(rs.getString("span_build")));
				entity.setChk_person(Nullchange.NulltoString(rs.getString("chk_person")));
				entity.setRecord_person(Nullchange.NulltoString(rs.getString("record_person")));
				entity.setReview_person(Nullchange.NulltoString(rs.getString("review_person")));
				entity.setResponse_person(Nullchange.NulltoString(rs.getString("response_person")));
				entity.setLongitude(Nullchange.NulltoString(rs.getString("longitude")));
				entity.setLatitude(Nullchange.NulltoString(rs.getString("latitude")));
				entity.setPic1(Nullchange.NulltoString(rs.getString("pic1")));
				entity.setPic2(Nullchange.NulltoString(rs.getString("pic2")));
				culvert.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		mdo.close();
		return culvert;
	}
	
	public int updateCulvert_Info(CulInfo culInfo){
		int i = 0;
		String sql = " update cul_info set highway_id=?,culvert_no=?,culvert_name=?,stub_no=?," +
				"culvert_type=?,span_build=?,latitude=?,longitude=?,zone_id=?,section_id=?,manage_id=?  where culvert_id=? ";
		MyDataOperation mdo = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		i = mdo.executeUpdate(sql, new String[]{
				culInfo.getHighway_id(),culInfo.getCulvert_no(),culInfo.getCulvert_name(),
				culInfo.getStub_no(),culInfo.getCulvert_type(),culInfo.getSpan_build(),
				culInfo.getLatitude(),culInfo.getLongitude(),culInfo.getZone_id(),culInfo.getSection_id(),
				culInfo.getManage_id(),culInfo.getCulvert_id()
		});
		mdo.close();
		return i;
		
	}
	
	/**
	 * 储存图片地址
	 * 
	 * @param path
	 * @param culvert_type
	 * @param culvert_id
	 * @return
	 */
	public int storePath_culvert(String path, String culvert_type, String culvert_id,String prj_id)
	{
		int i = 0;
		String pic = "";
		if (culvert_type.equals("立面照"))
		{
			pic = "facade";
		} else
		{
			pic = "face";
		}
		Connection conn = MyDataSource.getInstance().getConnection();
		MyDataOperation mdo = new MyDataOperation(conn, false);
		String sql = " UPDATE cul_prj_photo SET prj_id=?,path=?,photo_type=? WHERE culvert_id = ? ";
		String[] arr =
		{ prj_id,path,pic, culvert_id };
		i = mdo.executeUpdate(sql, arr);
		mdo.close();
		return i;
	}
	
	public ArrayList<CulPrjPhoto> getPhotoPath(String culvert_id){
		ArrayList<CulPrjPhoto> culPrjPhoto = new ArrayList<CulPrjPhoto>();
		String sql =" SELECT a.path,a.photo_type FROM cul_prj_photo AS a LEFT JOIN chk_project_info AS b ON a.prj_id= b.prj_id WHERE culvert_id = ? ORDER BY b.prj_establish_tm DESC LIMIT 2 ";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{culvert_id});
		try
		{
			while (rs.next())
			{
				CulPrjPhoto entity = new CulPrjPhoto();
				entity.setPath(rs.getString("path"));
				entity.setPhoto_type(rs.getString("photo_type"));
				culPrjPhoto.add(entity);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();	
		return culPrjPhoto;
	}
	
}
