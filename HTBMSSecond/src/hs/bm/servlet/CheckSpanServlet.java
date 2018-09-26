package hs.bm.servlet;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.alibaba.fastjson.JSON;
import com.aliyuncs.exceptions.ClientException;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkBrgPhoto;
import hs.bm.bean.DefectCount;
import hs.bm.bean.WaitSendMessage;
import hs.bm.dao.CheckSpanDao;
import hs.bm.dao.LogDao;
import hs.bm.dao.SendMessageDao;
import hs.bm.dao.UserDao;
import hs.bm.server.ShortMessageServiceV2;
import hs.bm.util.FileManageUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.util.ReadFileUtil;
import hs.bm.vo.BridgeMemAll;
import hs.bm.vo.DicDefect;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;
import hs.bm.vo.SpanMem;

public class CheckSpanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckSpanServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);

		if (type.equals("initComBox")) {
			String brgid = request.getParameter("bridge_id");
			String direction = request.getParameter("direction");
			String span_no = request.getParameter("span_no");
			List<BridgeMemAll> ll = CheckSpanDao.getInstance().initComBox(brgid, direction, span_no);
			if (ll == null) {
				ro.setError(2);
			} else if (ll.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("newMem")) {
			String tableData = request.getParameter("tableData");
			SpanMem bm = JSON.parseObject(tableData, SpanMem.class);
			bm.setMbr_chk_id(UUID.randomUUID().toString().replaceAll("-", ""));
			String username = (String) request.getSession().getAttribute("username");
			try {
				int i = CheckSpanDao.getInstance().newMem(bm, username);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CheckSpanServlet+newMem");
					ro.setObj(bm.getMbr_chk_id());
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CheckSpanServlet+newMem+bm:"+bm);
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initTable")) {
			String span_chk_id = request.getParameter("span_chk_id");
			List<SpanMem> ll = CheckSpanDao.getInstance().initTable(span_chk_id);
			if (ll == null) {
				ro.setError(2);
			} else if (ll.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("delMem")) {
			String mbr_chk_id = request.getParameter("mbr_chk_id");
			String ph = request.getParameter("ph");
			List<String> ll = JSON.parseArray(ph, String.class);
			try {
				int i = CheckSpanDao.getInstance().delMem(mbr_chk_id);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","CheckSpanServlet+delMem");
					if (ll != null) {
						for (String s : ll) {
							File file = new File(s);
							if (file.exists()) {
								file.delete();
							}
						}
					}
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"CheckSpanServlet+delMem+mbr_chk_id:"+mbr_chk_id);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("getDefect")) {
			String component_name = request.getParameter("component_name");
			String defect_name = request.getParameter("defect_name");
			String defect_name_f = request.getParameter("defect_name_f");
			List<DicDefect> ll;
			if (defect_name != null) {
				ll = CheckSpanDao.getInstance().getDefect(component_name, defect_name, defect_name_f);
			} else {
				ll = CheckSpanDao.getInstance().getDefect(component_name);
			}
			if (ll == null) {
				ro.setError(2);
			} else if (ll.size() > 0) {
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else {
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		
		if (type.equals("newDefect")) {
			String info = request.getParameter("info");
			String bridge_id = request.getParameter("bridge_id");
			String chk_type = request.getParameter("chk_type");
			String prj_id = request.getParameter("prj_id");
		//	String saveData = request.getParameter("saveData");
		//	List<DefectCount> ll = JSON.parseArray(saveData, DefectCount.class);
			ChkBrgDefect cbd = JSON.parseObject(info, ChkBrgDefect.class);
			cbd.setDefect_id(UUID.randomUUID().toString().replaceAll("-", ""));
			cbd.setDefect_serial(UUID.randomUUID().toString().replaceAll("-", ""));
			File baseDir = new File(PropertiesUtil.getPropertiesByName("rootDir"));
			// File f1 = new File(baseDir, cbd.getDefect_photo());
			String path = "";
			String photoListStr = request.getParameter("imgList");
			List<ChkBrgPhoto> photoList = JSON.parseArray(photoListStr, ChkBrgPhoto.class);
			for (ChkBrgPhoto chkBrgPhoto : photoList) {
				chkBrgPhoto.setDefect_serial(cbd.getDefect_serial());
				File f1 = new File(baseDir,"");
			    if(chkBrgPhoto!=null&&chkBrgPhoto.getPhoto_path()!=null){
			    	 f1 = new File(baseDir, chkBrgPhoto.getPhoto_path());
			    }
				if (!("").equals(chkBrgPhoto.getPhoto_path())&&chkBrgPhoto.getPhoto_path()!=null && f1.exists()) {
					// 上传图片路径
					File fileDir = new File(baseDir, bridge_id + File.separator + chk_type + File.separator + prj_id);
					if (!fileDir.exists()) {
						fileDir.mkdirs();
					}
					path = FileManageUtil.fileMove(f1, fileDir);
					path = path.replace(baseDir.getAbsolutePath() + File.separator, "");
					
				} else {
					path = "";
				
				}
				chkBrgPhoto.setPhoto_path(path);
				CheckSpanDao.getInstance().insertPhoto(chkBrgPhoto);

			}


			try {
				int i = CheckSpanDao.getInstance().newDefect(cbd, "1");
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
				//	CheckSpanDao.getInstance().saveDefectCount(ll, cbd.getDefect_serial());
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CheckSpanServlet+newDefect");
					Map<String, String> map = new HashMap<>();
					map.put("defect_id", cbd.getDefect_id());
					map.put("defect_serial", cbd.getDefect_serial());
					map.put("path", path);
					ro.setObj(map);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增",e.getMessage(),"CheckSpanServlet+newDefect+cbd:"+cbd);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("editDefect")) {
			String info = request.getParameter("info");
			String bridge_id = request.getParameter("bridge_id");
			String chk_type = request.getParameter("chk_type");
			String prj_id = request.getParameter("prj_id");
			String saveData = request.getParameter("saveData");
			List<DefectCount> ll = JSON.parseArray(saveData, DefectCount.class);
			ChkBrgDefect cbd = JSON.parseObject(info, ChkBrgDefect.class);
			File baseDir = new File(PropertiesUtil.getPropertiesByName("rootDir"));
			String path = "";

			String addImgListStr = request.getParameter("addImgList");// 获取添加图片json字符串
			List<ChkBrgPhoto> addImgList = JSON.parseArray(addImgListStr, ChkBrgPhoto.class);

			String updateImgListStr = request.getParameter("updateImgList");// 获取添加图片json字符串
			List<ChkBrgPhoto> updateImgList = JSON.parseArray(updateImgListStr, ChkBrgPhoto.class);
			for (ChkBrgPhoto updateImg : updateImgList) {
				// 更新图片名
				CheckSpanDao.getInstance().updatePhotoNameById(updateImg.getPhoto_id(), updateImg.getPhoto_name());
			}

			String delIdListStr = request.getParameter("delIdList");// 获取删除图片ID
																	// json字符串
			List<String> delIdList = JSON.parseArray(delIdListStr, String.class);

			String mbr_chk_id = request.getParameter("mbr_chk_id");
			for (String delId : delIdList) {
				CheckSpanDao.getInstance().deletePhotoById(delId);// 删除需要删除的图片
			}
			for (ChkBrgPhoto chkBrgPhoto : addImgList) {
				// 添加图片
				chkBrgPhoto.setDefect_serial(cbd.getDefect_serial());
				File f1 = new File(baseDir, chkBrgPhoto.getPhoto_path());
				if (!("").equals(chkBrgPhoto.getPhoto_path()) && f1.exists()) {
					// 上传图片路径
					File fileDir = new File(baseDir, bridge_id + File.separator + chk_type + File.separator + prj_id);
					if (!fileDir.exists()) {
						fileDir.mkdirs();
					}
					path = FileManageUtil.fileMove(f1, fileDir);
					path = path.replace(baseDir.getAbsolutePath() + File.separator, "");
					
				} else {
					path = "";
					
				}

				chkBrgPhoto.setPhoto_path(path);

				CheckSpanDao.getInstance().insertPhoto(chkBrgPhoto);

			}

			try {
				int i = CheckSpanDao.getInstance().editDefect(cbd, "1");
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
					CheckSpanDao.getInstance().editDefectCount(ll, cbd.getDefect_serial());
					List<ChkBrgDefect> getDefectList = CheckSpanDao.getInstance().getDefectList(mbr_chk_id);
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckSpanServlet+editDefect");
					ro.setObj(getDefectList);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckSpanServlet+editDefect+cbd:"+cbd);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("delDefect")) {
			String id = request.getParameter("id");
			String ph = request.getParameter("ph");
			try {
				int i = CheckSpanDao.getInstance().delDefect(id);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","CheckSpanServlet+delDefect");
					File file = new File(ph);
					if (file.exists()) {
						file.delete();
					}
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"CheckSpanServlet+delDefect+id:"+id);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("changeRepState")) {
			String id = request.getParameter("id");
			String state = request.getParameter("state");
			try {
				int i = CheckSpanDao.getInstance().changeRepState(id, state);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckSpanServlet+changeRepState");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckSpanServlet+changeRepState+id:"+id+"+state:"+state);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("changeDevState")) {
			String id = request.getParameter("id");
			String state = request.getParameter("state");
			try {
				int i = CheckSpanDao.getInstance().changeDevState(id, state);
				switch (i) {
				case 0:
					ro.setError(1);
					ro.setSuccess("fail");
					break;
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckSpanServlet+changeDevState");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckSpanServlet+changeDevState+id:"+id+"+state:"+state);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("overCheck")) {
			String span_chk_id = request.getParameter("span_chk_id");
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			int i = CheckSpanDao.getInstance().overCheck(span_chk_id, oc);
			switch (i) {
			case 0:
				ro.setError(1);
				ro.setSuccess("fail");
				break;
			case -1:
				ro.setError(2);
				ro.setSuccess("fail");
				break;
			case -3:
				ro.setError(3);
				ro.setSuccess("fail");
				break;
			default:
				ro.setError(0);
				ro.setSuccess("success");
				break;
			}
			ro.ToJsp(response);
			return;
		}

		// if(type.equals("buildPDF")){
		// String direction = request.getParameter("direction");
		// String span_no = request.getParameter("span_no");
		// String span_chk_id = request.getParameter("span_chk_id");
		// OperationConstruct oc =
		// (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
		// String path = CMDUtil.buildCheck(oc.getPrj_id(), oc.getId(),
		// oc.getChk_type(), direction, span_no);
		// String sql = "update chk_span_record set pdf=? where span_chk_id=?";
		// MyDataOperation dataOperation = new
		// MyDataOperation(MyDataSource.getInstance().getConnection());
		// dataOperation.executeUpdate(sql, new String[]{path, span_chk_id});
		// dataOperation.close();
		// return;
		// }

		if (type.equals("span_no_last")) {
			String span_no = request.getParameter("span_no");
			String direction = request.getParameter("direction");
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			boolean flag = CheckSpanDao.getInstance().span_no_last(oc.getId(), span_no, direction);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(flag);
			ro.ToJsp(response);
			return;
		}

		if (type.equals("changeChkState")) {
			String chk_id = request.getParameter("chk_id");
			String prj_id = request.getParameter("prj_id");
			String span_chk_id = request.getParameter("span_chk_id");
			String audit_state = request.getParameter("audit_state");
			int i = CheckSpanDao.getInstance().changeChkState(span_chk_id, chk_id, prj_id, audit_state);
			switch (i) {
			case 0:
				ro.setError(1);
				ro.setSuccess("fail");
				break;
			case -1:
				ro.setError(2);
				ro.setSuccess("fail");
				break;
			case -3:
				ro.setError(3);
				ro.setSuccess("fail");
				break;
			default:
				ro.setError(0);
				ro.setSuccess("success");
				break;
			}
			ro.ToJsp(response);
			return;
		}

		if("sendMan".equals(type)){
			/*HttpSession session = request.getSession();
			String orgid = (String) session.getAttribute("orgid");
			String zone_id;
			if(orgid==null){
				zone_id="0000";
			}else{
				zone_id=orgid.split("#")[0];
			}
			List list=CheckSpanDao.getInstance().getZoneMan(zone_id);*/
			List list=new ArrayList<>();
			HttpSession session = request.getSession();
			OperationConstruct oc =(OperationConstruct) session.getAttribute("OperationConstruct");
			String chk_id=oc.getChk_id();
			String orgId=CheckSpanDao.getInstance().getOrgId(chk_id);
			if(orgId!=null){
				String zone_id=orgId.split("#")[0];
				list=CheckSpanDao.getInstance().getZoneMan(zone_id);
			}
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		
		if("sendManOfPass".equals(type)){
			List list=new ArrayList<>();
			HttpSession session = request.getSession();
			OperationConstruct oc =(OperationConstruct) session.getAttribute("OperationConstruct");
			String chk_id=oc.getChk_id();
			String orgId=CheckSpanDao.getInstance().getOrgIdOfPass(chk_id);
			if(orgId!=null){
				String zone_id=orgId.split("#")[0];
				list=CheckSpanDao.getInstance().getZoneMan(zone_id);
			}
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		
		if("sendMsg".equals(type)){
			HttpSession session = request.getSession();
			OperationConstruct oc =(OperationConstruct) session.getAttribute("OperationConstruct");
			String defectName=request.getParameter("defectName");
			String span_chk_id=request.getParameter("span_chk_id");
			String location=request.getParameter("locations");
			String brgName=oc.getName();
			String project=oc.getPrj_desc();
			String section=oc.getSection_name();
			String stub=oc.getStub_no();
			String structMode=request.getParameter("structMode");
			String time="";
			if("brg".equals(structMode)){
				time=CheckSpanDao.getInstance().getChkTime(span_chk_id);
			}
			if("pass".equals(structMode)){
				time=CheckSpanDao.getInstance().getChkTimeOfPass(span_chk_id);
			}
			String userList=request.getParameter("userList");
			ShortMessageServiceV2 v2=new ShortMessageServiceV2();
			List list=new ArrayList<>();
			String msgType="SMS_105930124";
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String nowTime=sdf.format(new Date());
			SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
			String nowDay=sdf1.format(new Date());
			String starTime=nowDay+" 09:00:00";
			String endTime=nowDay+" 18:00:00";
			long millisecondStar=0;
			long millisecondEnd=0;
			long millisecondNow = 0;
			try {
				millisecondStar=sdf.parse(starTime).getTime();
				millisecondEnd=sdf.parse(endTime).getTime();
				millisecondNow=sdf.parse(nowTime).getTime();
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			if(userList.indexOf(",")<0){
				String phone=CheckSpanDao.getInstance().getPhone(userList);
				String variable="{date:'"+time+"',project:':"+project+"',highway:':"+section+"',bridge:':"+brgName+"',mileage:':"+stub+"',location:':"+location+"',state:':"+defectName+"'}";
				if(millisecondNow>millisecondStar&&millisecondNow<millisecondEnd){
					try {
						String msg=v2.SendMessage(phone,variable,msgType);
						list.add(msg);
					} catch (ClientException e) {
						e.printStackTrace();
					}
				}else{
					WaitSendMessage wsm=new WaitSendMessage();
					wsm.setCode(msgType);
					wsm.setIf_send("0");
					wsm.setMessage_variable(variable);
					wsm.setPhone_nums(phone);
					try {
						wsm.setWait_send_time(ReadFileUtil.getTomorrow(sdf.parse(nowTime)));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					SendMessageDao.getInstance().insertWaitSendMessage(wsm);
					String msg="非工作时间,明天自动发送";
					list.add(msg);
				}
			}else{
				for(int i=0;i<userList.split(",").length;i++){
					String uName=userList.split(",")[i];
					String phone=CheckSpanDao.getInstance().getPhone(uName);
					String variable="{date:'"+time+"',project:':"+project+"',highway:':"+section+"',bridge:':"+brgName+"',mileage:':"+stub+"',location:':"+location+"',state:':"+defectName+"'}";
					if(millisecondNow>millisecondStar&&millisecondNow<millisecondEnd){
						try {
							String msg=v2.SendMessage(phone,variable,msgType);
							list.add(msg);
						} catch (ClientException e) {
							e.printStackTrace();
						}
					}else{
						WaitSendMessage wsm=new WaitSendMessage();
						wsm.setCode(msgType);
						wsm.setIf_send("0");
						wsm.setMessage_variable(variable);
						wsm.setPhone_nums(phone);
						try {
							wsm.setWait_send_time(ReadFileUtil.getTomorrow(sdf.parse(nowTime)));
						} catch (ParseException e) {
							e.printStackTrace();
						}
						SendMessageDao.getInstance().insertWaitSendMessage(wsm);
						String msg="非工作时间,明天自动发送";
						list.add(msg);
					}
				}
			}
			ro.setObj(list);
			ro.ToJsp(response);
			return;
		}
		
		if ("lookImgBySerial".equals(type)) {
			// 查看病害照片
			String serial = request.getParameter("serial");
			List<ChkBrgPhoto> photos = CheckSpanDao.getInstance().selectPhotoBySerial(serial);
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(photos);
			ro.ToJsp(response);

			return;
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
