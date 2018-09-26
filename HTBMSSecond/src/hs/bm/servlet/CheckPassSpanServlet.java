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

import com.alibaba.fastjson.JSON;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkPassPhoto;
import hs.bm.bean.DefectCount;
import hs.bm.dao.CheckPassSpanDao;
import hs.bm.dao.LogDao;
import hs.bm.util.FileManageUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BridgeMemAll;
import hs.bm.vo.DicDefect;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;
import hs.bm.vo.SpanMem;

public class CheckPassSpanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckPassSpanServlet() {
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
			String pass_id = request.getParameter("pass_id");
			String direction = request.getParameter("direction");
			String span_no = request.getParameter("span_no");
			List<BridgeMemAll> ll = CheckPassSpanDao.getInstance().initComBox(pass_id, direction, span_no);
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
				int i = CheckPassSpanDao.getInstance().newMem(bm, username);
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
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CheckPassSpanServlet+newMem");
					ro.setObj(bm.getMbr_chk_id());
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CheckPassSpanServlet+newMem+bm:"+bm);
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initTable")) {
			String span_chk_id = request.getParameter("span_chk_id");
			List<SpanMem> ll = CheckPassSpanDao.getInstance().initTable(span_chk_id);
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
				int i = CheckPassSpanDao.getInstance().delMem(mbr_chk_id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","CheckPassSpanServlet+delMem");
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
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"CheckPassSpanServlet+delMem+mbr_chk_id:"+mbr_chk_id);
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
				ll = CheckPassSpanDao.getInstance().getDefect(component_name, defect_name, defect_name_f);
			} else {
				ll = CheckPassSpanDao.getInstance().getDefect(component_name);
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
			String saveData = request.getParameter("saveData");
			List<DefectCount> ll = JSON.parseArray(saveData, DefectCount.class);
			ChkBrgDefect cbd = JSON.parseObject(info, ChkBrgDefect.class);
			cbd.setDefect_id(UUID.randomUUID().toString().replaceAll("-", ""));
			cbd.setDefect_serial(UUID.randomUUID().toString().replaceAll("-", ""));
			File baseDir = new File(PropertiesUtil.getPropertiesByName("rootDir"));

			String path = "";
			String photoListStr = request.getParameter("imgList");
			List<ChkPassPhoto> photoList = JSON.parseArray(photoListStr, ChkPassPhoto.class);

			for (ChkPassPhoto chkPassPhoto : photoList) {

				chkPassPhoto.setDefect_serial(cbd.getDefect_serial());
				File f1 = new File(baseDir, chkPassPhoto.getPhoto_path());
				if (!("").equals(chkPassPhoto.getPhoto_path()) && f1.exists()) {
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

				chkPassPhoto.setPhoto_path(path);

				CheckPassSpanDao.getInstance().insertPhoto(chkPassPhoto);

			}
			/*
			 * if(!cbd.getDefect_photo().equals("") && f1.exists()){ File
			 * fileDir = new
			 * File(baseDir,bridge_id+File.separator+chk_type+File.separator+
			 * prj_id); if(!fileDir.exists()){ fileDir.mkdirs(); } path =
			 * FileManageUtil.fileMove(f1, fileDir); path =
			 * path.replace(baseDir.getAbsolutePath()+File.separator, "");
			 * cbd.setDefect_photo(path); }else{ path="";
			 * cbd.setDefect_photo(""); }
			 */

			try {
				int i = CheckPassSpanDao.getInstance().newDefect(cbd, "1");
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
					CheckPassSpanDao.getInstance().saveDefectCount(ll, cbd.getDefect_serial());
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CheckPassSpanServlet+newDefect");
					Map<String, String> map = new HashMap<>();
					map.put("defect_id", cbd.getDefect_id());
					map.put("defect_serial", cbd.getDefect_serial());
					map.put("path", path);
					ro.setObj(map);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CheckPassSpanServlet+newDefect+cbd:"+cbd);
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
			List<ChkPassPhoto> addImgList = JSON.parseArray(addImgListStr, ChkPassPhoto.class);
			String updateImgListStr = request.getParameter("updateImgList");//获取添加图片json字符串
			List<ChkPassPhoto> updateImgList = JSON.parseArray(updateImgListStr, ChkPassPhoto.class);
			for (ChkPassPhoto updateImg : updateImgList) {
				//更新图片名
				CheckPassSpanDao.getInstance().updatePhotoNameById(updateImg.getPhoto_id(), updateImg.getPhoto_name());
			}
			String delIdListStr = request.getParameter("delIdList");//获取删除图片ID json字符串
			List<String> delIdList = JSON.parseArray(delIdListStr, String.class);
			
			String mbr_chk_id = request.getParameter("mbr_chk_id");
			for (String delId : delIdList) {
				CheckPassSpanDao.getInstance().deletePhotoById(delId);//删除需要删除的图片
			}
			for (ChkPassPhoto chkPassPhoto : addImgList) {
				//添加图片
				chkPassPhoto.setDefect_serial(cbd.getDefect_serial());
				File f1 = new File(baseDir, chkPassPhoto.getPhoto_path());
				if (!("").equals(chkPassPhoto.getPhoto_path()) && f1.exists()) {
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

				chkPassPhoto.setPhoto_path(path);

				CheckPassSpanDao.getInstance().insertPhoto(chkPassPhoto);

			}
			try {
				int i = CheckPassSpanDao.getInstance().editDefect(cbd, "1");
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
					CheckPassSpanDao.getInstance().editDefectCount(ll, cbd.getDefect_serial());
					List<ChkBrgDefect> getDefectList = CheckPassSpanDao.getInstance().getDefectList(mbr_chk_id);
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckPassSpanServlet+editDefect");
					ro.setObj(getDefectList);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckPassSpanServlet+editDefect+cbd:"+cbd);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("delDefect")) {
			String id = request.getParameter("id");
			String ph = request.getParameter("ph");
			try {
				int i = CheckPassSpanDao.getInstance().delDefect(id);
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
					LogDao.getInstance().addLogInfo(log_user,"删除", "操作成功","CheckPassSpanServlet+delDefect");
					File file = new File(ph);
					if (file.exists()) {
						file.delete();
					}
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除", e.getMessage(),"CheckPassSpanServlet+delDefect+id:"+id);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("changeRepState")) {
			String id = request.getParameter("id");
			String state = request.getParameter("state");
			try {
				int i = CheckPassSpanDao.getInstance().changeRepState(id, state);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckPassSpanServlet+changeRepState");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckPassSpanServlet+changeRepState+id:"+id+"+state:"+state);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("changeDevState")) {
			String id = request.getParameter("id");
			String state = request.getParameter("state");
			try {
				int i = CheckPassSpanDao.getInstance().changeDevState(id, state);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckPassSpanServlet+changeDevState");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckPassSpanServlet+changeDevState+id:"+id+"+state:"+state);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("overCheck")) {
			String span_chk_id = request.getParameter("span_chk_id");
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			int i = CheckPassSpanDao.getInstance().overCheck(span_chk_id, oc);
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
			boolean flag = CheckPassSpanDao.getInstance().span_no_last(oc.getId(), span_no, direction);
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
				int i = CheckPassSpanDao.getInstance().changeChkState(span_chk_id, chk_id, prj_id, audit_state);
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","CheckPassSpanServlet+changeChkState");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"CheckPassSpanServlet+changeChkState+chk_id:"+chk_id+"+prj_id:"+prj_id);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("reference")) {
			String span_no = request.getParameter("span_no");
			String direction = request.getParameter("direction");
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			List<String> ll = CheckPassSpanDao.getInstance().reference(oc.getId(), span_no, direction);

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
		
		if ("lookImgBySerial".equals(type)) {
			//查看病害照片
			String serial = request.getParameter("serial");
			
			List<ChkPassPhoto> photos= CheckPassSpanDao.getInstance().selectPhotoBySerial(serial);
			
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
