
package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import hs.bm.bean.BrgMbrInfo;
import hs.bm.bean.BrgUpload;
import hs.bm.bean.NumVehi;
import hs.bm.vo.BrgSpanInfoVO;
import hs.bm.vo.BridgeMemAll;
import hs.bm.vo.OperationConstruct;

public class BrgUploadDao {

	private static BrgUploadDao Dao;
	
	public static BrgUploadDao getIntance(){
		if(Dao==null){
			Dao=new BrgUploadDao();
		}
		return Dao;
	}
	
	public int AddBrgUpload(BrgUpload upload){
		int i=0;
		String sql="insert into brg_weight_upload(brg_name,brg_uploadtime,brg_user,brg_uploadstatus,brg_url) values(?,?,?,?,?)";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	i=mdo.executeUpdate(sql, new String[]{
    			upload.getBrgName(),
    			upload.getBrgUploadTime(),
    			upload.getBrgUser(),
    			upload.getBrgUploadStatus(),
    			upload.getBrgUrl()
    	});
    	mdo.close();
		return i;
	}

	public List<BrgUpload>selectNameByBrgUpload(String name){
		List<BrgUpload>list=new ArrayList<>();
		String sql="select*from brg_weight_upload where brg_name=? order by brg_uploadtime desc limit 1";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String[] names={name};
		ResultSet rs =dataOperation.executeQuery(sql,names);
		try {
			while (rs.next()) {
				BrgUpload upload=new BrgUpload();
				upload.setBrgId(rs.getInt(1));
				upload.setBrgName(rs.getString(2));
				upload.setBrgUploadTime(rs.getString(3));
				upload.setBrgUser(rs.getString(4));
				upload.setBrgUploadStatus(rs.getString(5));
				upload.setBrgUrl(rs.getString(6));
				list.add(upload);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}

	public int countOf(OperationConstruct oc, BrgSpanInfoVO bsinfoVo) {
		int i=0;
		String sql = "select COUNT(s_id) FROM brg_span_info WHERE bridge_id=? and direction=? AND span_no=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{oc.getId(),bsinfoVo.getDirection(),bsinfoVo.getSpan_no()});
		try {
			while (rs.next()) {
				i= rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return i;
	}
	
	public String selectbrgTypeId(BrgSpanInfoVO bsinfoVo) {
		String sql = "select brg_type_id from dic_brg_struct_type_def where brg_type_name=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(), false);
		ResultSet rs = dataOperation.executeQuery(sql, new String[] {bsinfoVo.getBrg_type_name()});
		String value="";
		try {
			while (rs.next()) {
				value=rs.getString("brg_type_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return value;
	}

	public int addBsInfo(OperationConstruct oc, BrgSpanInfoVO bsinfoVo) {
		String sql = "insert INTO brg_span_info(s_id,bridge_id,direction,span_no,brg_type_id,consecutive_no,span_length,span_material,spanning_case,clearance) VALUES(?,?,?,?,?,?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,new String[] 
				{bsinfoVo.getS_id(),oc.getId(),bsinfoVo.getDirection(),bsinfoVo.getSpan_no(),
						bsinfoVo.getBrg_type_id(),bsinfoVo.getSpan_line_no(),bsinfoVo.getSpan_length(),
						bsinfoVo.getSpan_material(),bsinfoVo.getSpanning_case(),bsinfoVo.getClearance() });
		dataOperation.close();
		return i;
	}

	public int addBmInfo(BrgMbrInfo bminfo) {
		String sql = "INSERT INTO brg_mbr_info (r_id,s_id,member_type,member_no,member_model) VALUES(?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,new String[] 
				{bminfo.getR_id(),bminfo.getS_id(),bminfo.getMember_type(),bminfo.getMember_no(),bminfo.getMember_model()});
		dataOperation.close();
		return i;
	}

	
	
}
