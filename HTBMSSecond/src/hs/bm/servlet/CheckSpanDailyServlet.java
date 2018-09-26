package hs.bm.servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkBrgPhoto;
import hs.bm.bean.DefectCount;
import hs.bm.dao.CheckSpanDao;
import hs.bm.dao.LogDao;
import hs.bm.util.FileManageUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BridgeMemAll;
import hs.bm.vo.DicDefect;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;
import hs.bm.vo.SpanMem;

public class CheckSpanDailyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckSpanDailyServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		OperationConstruct op = (OperationConstruct)session.getAttribute("OperationConstruct");
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
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CheckSpanDailyServlet+newMem");
					ro.setObj(bm.getMbr_chk_id());
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CheckSpanDailyServlet+newMem+bm:"+bm);
			}
			ro.ToJsp(response);
			return;
		}
		if("initDailyTable".equals(type)){
			String distr_name = request.getParameter("distr_name");
			List<SpanMem> ll = CheckSpanDao.getInstance().initDailyTable(op.getChk_id(),distr_name);
			ro.setObj(ll);
			ro.setError(0);
			ro.setSuccess("success");
			ro.ToJsp(response);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","CheckSpanDailyServlet+delMem");
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
				LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","CheckSpanDailyServlet+delMem+mbr_chk_id："+mbr_chk_id);
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
			//String saveData = request.getParameter("saveData");
			//List<DefectCount> ll = JSON.parseArray(saveData, DefectCount.class);
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
					//CheckSpanDao.getInstance().saveDefectCount(ll, cbd.getDefect_serial());
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CheckSpanDailyServlet+newDefect");
					Map<String, String> map = new HashMap<>();
					map.put("defect_id", cbd.getDefect_id());
					map.put("defect_serial", cbd.getDefect_serial());
					map.put("path", path);
					ro.setObj(map);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CheckSpanDailyServlet+newDefect+cbd:"+cbd);
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("edit_Defect")) {
			String info = request.getParameter("info");
			String bridge_id = request.getParameter("bridge_id");
			String chk_type = request.getParameter("chk_type");
			String prj_id = request.getParameter("prj_id");
			//String saveData = request.getParameter("saveData");
			//List<DefectCount> ll = JSON.parseArray(saveData, DefectCount.class);
			ChkBrgDefect cbd = JSON.parseObject(info, ChkBrgDefect.class);
			File baseDir = new File(PropertiesUtil.getPropertiesByName("rootDir"));
			String path = "";

			String addImgListStr = request.getParameter("addImgList");// 获取添加图片json字符串
			List<ChkBrgPhoto> addImgList = JSON.parseArray(addImgListStr, ChkBrgPhoto.class);

			/*String updateImgListStr = request.getParameter("updateImgList");// 获取添加图片json字符串
			List<ChkBrgPhoto> updateImgList = JSON.parseArray(updateImgListStr, ChkBrgPhoto.class);
			for (ChkBrgPhoto updateImg : updateImgList) {
				// 更新图片名
				CheckSpanDao.getInstance().updatePhotoNameById(updateImg.getPhoto_id(), updateImg.getPhoto_name());
			} */

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
			
			int i = 0;
			if("normal".equals(chk_type)){
				i =  CheckSpanDao.getInstance().editDefect1(cbd, "1");
			}
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
				//CheckSpanDao.getInstance().editDefectCount(ll, cbd.getDefect_serial());
				List<ChkBrgDefect> getDefectList = CheckSpanDao.getInstance().getDefectList(mbr_chk_id);
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(getDefectList);
				break;
			}
			ro.ToJsp(response);
			return;
		}
		
		
		if (type.equals("editDefect")) {
			String info = request.getParameter("info");
			String bridge_id = request.getParameter("bridge_id");
			String chk_type = request.getParameter("chk_type");
			String prj_id = request.getParameter("prj_id");
			//String saveData = request.getParameter("saveData");
			//List<DefectCount> ll = JSON.parseArray(saveData, DefectCount.class);
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
					//CheckSpanDao.getInstance().editDefectCount(ll, cbd.getDefect_serial());
					List<ChkBrgDefect> getDefectList = CheckSpanDao.getInstance().getDefectList(mbr_chk_id);
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckSpanDailyServlet+editDefect");
					ro.setObj(getDefectList);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckSpanDailyServlet+editDefect+cbd:"+cbd);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","CheckSpanDailyServlet+delDefect");
					File file = new File(ph);
					if (file.exists()) {
						file.delete();
					}
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"CheckSpanDailyServlet+delDefect+id:"+id);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckSpanDailyServlet+changeRepState");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckSpanDailyServlet+changeRepState+id:"+id+"+state:"+state);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckSpanDailyServlet+changeDevState");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckSpanDailyServlet+changeDevState+id:"+id+"+state:"+state);
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
			try {
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckSpanDailyServlet+changeChkState");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckSpanDailyServlet+changeChkState+chk_id:"+chk_id+"+prj_id:"+prj_id+"+span_chk_id:"+span_chk_id+"+audit_state:"+audit_state);
			}
			ro.ToJsp(response);
			return;
		}
		
		if (type.equals("changeChkState_daily")) {
			String chk_id = request.getParameter("chk_id");
			String prj_id = request.getParameter("prj_id");
			String audit_state = request.getParameter("audit_state");
			try {
				int i = CheckSpanDao.getInstance().changeChkState_daily(chk_id, prj_id, audit_state);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckSpanDailyServlet+changeChkState_daily");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckSpanDailyServlet+changeChkState_daily+chk_id:"+chk_id+"+prj_id:"+prj_id+"+audit_state:"+audit_state);
			}
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
