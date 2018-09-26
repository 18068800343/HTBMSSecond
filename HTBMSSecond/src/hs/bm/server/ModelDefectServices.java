package hs.bm.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.mchange.v3.decode.Decoder;

import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;



public class ModelDefectServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModelDefectServices() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; charset=utf-8");
		int code = 1000;
		Map<String, Object> map = new HashMap<>();
		String bridge = request.getParameter("bridge");
		System.out.println(bridge);
		bridge = "6f78200f27d54b5394ba8200162cb917";
		String direction = request.getParameter("direction");//
		direction= URLDecoder.decode(direction,"UTF-8");
		System.out.println(direction);
		String span = request.getParameter("span");//
		span= URLDecoder.decode(span,"UTF-8");
		System.out.println(span);
		String member = request.getParameter("member");
		member= URLDecoder.decode(member,"UTF-8");
		
		System.out.println(member);
		String style = request.getParameter("style");
		System.out.println(direction);
		System.out.println(member);
		if(style!=null){
			if(!("json".equals(style)||"jsonp".equals(style))){
				code=1002;//参数无效
				style=null;
				outWrite(response, code, map, style);
				return;
			}
		}
		if(bridge==null){
			bridge="G15320723L0420";
		}else{
			if(!checkBridgeExits(bridge)){
				code=1004;//不存在结构物
				outWrite(response, code, map, style);
				return;
			}
		}
		
		if(direction==null || span==null || member==null){
			code=1001;//缺少参数
			outWrite(response, code, map, style);
			return;
		}
		
		Map<String, String> prjInfo = getPrjInfo(bridge);
		if(prjInfo==null){
			code=1003;//未参加项目
			outWrite(response, code, map, style);
			return;
		}
		System.out.println(prjInfo);
		String member_id = getMemberID(bridge, direction, span, member);
		if(member_id==null){
			code=1005;//构件不存在
			outWrite(response, code, map, style);
			return;
		}
		System.out.println(member_id);
		List<Map<String, String>> list = getDefects(prjInfo.get("chk_id"), direction, span, member_id);
		map.put("project_desc", prjInfo.get("prj_desc"));
		map.put("defects", list);
		System.out.println(JSON.toJSONString(map));
		System.out.println(code);
		outWrite(response, code, map, style);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	
	private String getJsonStr(int code, Object object) {
		JSONObject jo = new JSONObject();
		jo.put("code", code);
		jo.put("data", object);
		return jo.toString();
	}

	private String getJsonpStr(int code, Object object) {
		JSONObject jo = new JSONObject();
		jo.put("code", code);
		jo.put("data", object);
		String json = "callback(" + jo.toString() + ")";
		return json;
	}
	
	private void outWrite(HttpServletResponse response, int code, Object object, String style) {
		if(style==null || "json".equals(style)){
			JsonOutWrite(response, code, object);
		}else{
			JsonpOutWrite(response, code, object);
		}
	}
	
	private void JsonOutWrite(HttpServletResponse response, int code, Object object) {
		try {
			String result = getJsonStr(code,object);
			PrintWriter out = response.getWriter();
			out.write(result);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void JsonpOutWrite(HttpServletResponse response, int code, Object object) {
		try {
			String result = getJsonpStr(code,object);
			PrintWriter out = response.getWriter();
			out.write(result);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private boolean checkBridgeExits(String bridge){
		boolean exits = false;
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		String sql = "select * from brg_card_admin_id where bridge_id=? limit 1";
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge});
		try {
			while(rs.next()){
				exits = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return exits;
	}
	
	private Map<String, String> getPrjInfo(String bridge){
		Map<String, String> map = null;
		String sql = "select a.prj_id,b.prj_desc,b.chk_type,a.chk_id,a.check_date from chk_brg_regular as a,chk_project_info as b "
				+ "where a.prj_id=b.prj_id and a.bridge_id=? ORDER BY b.prj_establish_tm desc limit 1";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{bridge});
		try {
			while(rs.next()){
				map = new HashMap<>();
				map.put("prj_id", rs.getString("prj_id"));
				map.put("prj_desc", rs.getString("prj_desc"));
				map.put("chk_id", rs.getString("chk_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return map;
	}
	
	private String getMemberID(String bridge, String direction, String span, String member){
		String member_id=null;
		String sql = " SELECT * FROM brg_mbr_info WHERE member_no=? AND s_id=(SELECT s_id FROM brg_span_info WHERE bridge_id=? AND direction=? AND span_no=?) ";
		/*
		String sql = " select b.* from brg_span_info a,brg_mbr_info b "
				+ " where a.bridge_id=? "
				+ " and a.direction=? and a.span_no=? and b.s_id=a.s_id and b.member_no=? ";*/
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{
				member,
				bridge,
				direction,
				span
		});
		try {
			while(rs.next()){
				member_id = rs.getString("r_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return member_id;
	}
	
	private List<Map<String, String>> getDefects(String chk_id, String direction, String span, String member_id){
		List<Map<String, String>> llList = new ArrayList<>();
		String sql ="select * from chk_brg_defect where mbr_chk_id=(select mbr_chk_id from chk_brg_record "
				+ "where span_chk_id=(select span_chk_id from chk_span_record "
				+ "where chk_id=? and direction=? and span_no=?) "
				+ "and mbr_no=?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{
				chk_id,
				direction,
				span,
				member_id
		});
		try {
			while(rs.next()){
				Map<String, String> map = new HashMap<>();
				map.put("defect_name", rs.getString("defect_name"));
				map.put("defect_location_desc", rs.getString("defect_location_desc"));
				map.put("defect_count", rs.getString("defect_count"));
				llList.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return llList;
	}

}
