package hs.bm.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.ChkBrgDefect;
import hs.bm.bean.ChkBrgPhoto;
import hs.bm.bean.ChkBrgRecord;
import hs.bm.bean.DicMbrDefectS;
import hs.bm.dao.CheckSpanDao;
import hs.bm.dao.CurrentControlDao;
import hs.bm.dao.LogDao;
import hs.bm.util.FileManageUtil;
import hs.bm.util.IDtool;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BridgeMemAll;
import hs.bm.vo.CheckBrgDefectPhoto;
import hs.bm.vo.CheckBrgDefectVo;
import hs.bm.vo.DicDefect;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.PhotoList;
import hs.bm.vo.ResObj;

/**
 * Servlet implementation class CurrentControlServlet
 */
public class CurrentControlServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public static final Log log = LogFactory.getLog(CurrentControlServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CurrentControlServlet()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
		String log_user=(String) request.getSession().getAttribute("username");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);

		if ("selectBrgPrj".equals(type))
		{
			// 查询桥面系部件类型

			List<String> prj = CurrentControlDao.getInstance().selectBrgPrj();

			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(prj);
			ro.ToJsp(response);

			return;
		}

		if ("initComBox".equals(type))
		{
			// 查询桥面系关联菜单
			String brgid = request.getParameter("bridge_id");
			String direction = request.getParameter("direction");
			String span_no = request.getParameter("span_no");
			List<BridgeMemAll> ll = CurrentControlDao.getInstance().initComBox(brgid, direction, span_no);

			if (ll == null)
			{
				ro.setError(2);
			} else if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initTable"))
		{
			String component_name = request.getParameter("component_name");
			log.info(component_name);
			List<DicDefect> ll = CurrentControlDao.getInstance().initTable(component_name);
			if (ll == null)
			{
				ro.setError(2);
			} else if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("getDefectSById"))
		{
			String defect_id = request.getParameter("defect_s_id");

			DicMbrDefectS deDicMbrDefectS = CurrentControlDao.getInstance().selectDicSById(defect_id);
			if (deDicMbrDefectS != null)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(deDicMbrDefectS);
			} else
			{
				ro.setError(1);
			}

			ro.ToJsp(response);
			return;
		}
		if ("save_defect".equals(type))
		{
			boolean flag = true;
			File baseDir = new File(PropertiesUtil.getPropertiesByName("rootDir"));
			String path = "";
			String defect_serial="";
			/*
			 * String data = request.getParameter("data");
			 * System.out.println(data); List<CheckBrgDefectVo> checkBrgDefects
			 * = JSON.parseArray(data, CheckBrgDefectVo.class);
			 * System.out.println(checkBrgDefects);
			 */
			String span_chk_id = request.getParameter("span_chk_id").replace("-", "");
			String bridge_id = request.getParameter("bridge_id");
			String direction = request.getParameter("direction");
			String span_no = request.getParameter("span_no");
			String mbr_type = request.getParameter("mbr_type");
			String mbr_no = request.getParameter("mbr_no");
			String mbr_name = request.getParameter("mbr_name");
			String defect_type = request.getParameter("defect_type");
			String defect_name_f = request.getParameter("defect_name_f");
			String defect_name = request.getParameter("defect_name");
			String defect_id = request.getParameter("defect_id");
			String defect_location_desc = request.getParameter("defect_location_desc");
			String defect_count = request.getParameter("defect_count");
			String defect_location_desc_val = request.getParameter("defect_location_desc_val");
			String defect_count_val = request.getParameter("defect_count_val");
			String chk_defect_memo = request.getParameter("chk_defect_memo");
			String photoList = request.getParameter("photoList");
			String chk_type = request.getParameter("chk_type");
			String prj_id = request.getParameter("prj_id");
			String develop_state = request.getParameter("develop_state");
			String defect_attr = request.getParameter("defect_attr");
			String user_defect_attr = request.getParameter("user_defect_attr");
			String chk_id = oc.getChk_id();
			String tem = request.getParameter("tem");
			String real_name = CurrentControlDao.getInstance().getRealName((String) request.getSession().getAttribute("username"));
			// 常见病害录入
			// 是否有跨检查记录
			try {
				String span_chk_id_history = CurrentControlDao.getInstance().chkStore_daily_span(chk_id, direction, span_no);
				if (span_chk_id_history.equals(""))
				{
					// 没有就插入一条
					int i = CurrentControlDao.getInstance().store_daily_span(span_chk_id, chk_id, direction, span_no, "27", "0", real_name,tem);
					if (!(i > 0))
					{
						flag = false;
					}
				} else
				{
					span_chk_id = span_chk_id_history;
				}
				String mbr_chk_id_history = CurrentControlDao.getInstance().chkStore_daily_mbr(span_chk_id, mbr_no);
				if ("".equals(mbr_chk_id_history))
				{
					mbr_chk_id_history = IDtool.getUUID().replace("-", "");
					int i = CurrentControlDao.getInstance().store_daily_member(mbr_chk_id_history, span_chk_id, bridge_id, direction, span_no, mbr_type,
							mbr_no, real_name);
					if (!(i > 0))
					{
						flag = false;
					}
				}
				if (flag)
				{
					defect_serial = IDtool.getUUID().replace("-", "");
					if ("normal".equals(defect_type))
					{
						//常见病害录入
						int i =  CurrentControlDao.getInstance().store_daily_normal_defect(defect_serial, defect_id, mbr_chk_id_history, mbr_no, defect_name_f,
								 defect_name, defect_location_desc, defect_count, defect_location_desc_val, defect_count_val, chk_defect_memo,develop_state,defect_attr);
						if (!(i > 0)){
							flag = false;
						}
					} else
					{
						// 自定义病害录入
						
						int i = CurrentControlDao.getInstance().store_daily_defined_defect(defect_serial,mbr_chk_id_history, mbr_no,user_defect_attr, chk_defect_memo);
						if (!(i > 0)){
							flag = false;
						}
					}
				}
				if (flag){
					List<PhotoList> photo_list =  JSON.parseArray(photoList,PhotoList.class);
					System.out.println(photo_list.size());
					for (int i = 0; i < photo_list.size(); i++)
					{
						PhotoList photo = photo_list.get(i);
						String photo_path = photo.getPhoto_path();
						String photo_name = photo.getPhoto_name();
						ChkBrgPhoto chkBrgPhoto = new ChkBrgPhoto();
						chkBrgPhoto.setPhoto_name(photo_name);
						chkBrgPhoto.setPhoto_path(photo_path);

						String time = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss").format(new Date());
						chkBrgPhoto.setPhoto_date(time);
						chkBrgPhoto.setDefect_serial(defect_serial);
						File f1 = new File(baseDir, chkBrgPhoto.getPhoto_path());
						if (!("").equals(chkBrgPhoto.getPhoto_path()) && f1.exists())
						{
							// 上传图片路径
							File fileDir = new File(baseDir, bridge_id + File.separator + chk_type + File.separator
									+ prj_id);
							if (!fileDir.exists())
							{
								fileDir.mkdirs();
							}
							path = FileManageUtil.fileMove(f1, fileDir);
							path = path.replace(baseDir.getAbsolutePath() + File.separator, "");

						} else
						{
							path = "";

						}
						chkBrgPhoto.setPhoto_path(path);

						CheckSpanDao.getInstance().insertPhoto(chkBrgPhoto);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CurrentControlServlet+save_defect+span_chk_id:"+span_chk_id+"+bridge_id:"+bridge_id+"+direction:"+direction+"+span_no:"+span_no);
			}
			if(flag){
				ro.setError(0);
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CurrentControlServlet+save_defect");
				ro.ToJsp(response);
			}

		}
		if (type.equals("newDefect"))
		{
			File baseDir = new File(PropertiesUtil.getPropertiesByName("rootDir"));
			String path = "";
			String info = request.getParameter("info");
			List<CheckBrgDefectVo> checkBrgDefects = JSON.parseArray(info, CheckBrgDefectVo.class);
			try {
				for (CheckBrgDefectVo checkBrgDefectVo : checkBrgDefects)
				{
					String span_chk_id = checkBrgDefectVo.getSpan_chk_id();
					String mbr_no = checkBrgDefectVo.getMbr_no();
					ChkBrgDefect chkBrgDefect = new ChkBrgDefect();
					chkBrgDefect.setDefect_serial(UUID.randomUUID().toString().replaceAll("-", ""));
					chkBrgDefect.setDefect_id(UUID.randomUUID().toString().replaceAll("-", ""));
					ChkBrgRecord chkBrgRecord = CurrentControlDao.getInstance().selectDicBySpanAndMbr(span_chk_id, mbr_no);

					if (chkBrgRecord.getMbr_chk_id() == null || chkBrgRecord.getMbr_chk_id() == "")
					{
						ChkBrgRecord chkBrgRecord2 = new ChkBrgRecord();
						chkBrgRecord2.setMbr_chk_id(UUID.randomUUID().toString().replaceAll("-", ""));
						chkBrgRecord2.setSpan_chk_id(checkBrgDefectVo.getSpan_chk_id());
						chkBrgRecord2.setBridge_id(checkBrgDefectVo.getBridge_id());
						chkBrgRecord2.setDirection(checkBrgDefectVo.getDirection());
						chkBrgRecord2.setSpan_no(checkBrgDefectVo.getSpan_no());
						chkBrgRecord2.setMbr_type(checkBrgDefectVo.getMbr_type());
						chkBrgRecord2.setMbr_no(checkBrgDefectVo.getMbr_no());
						Date date = new Date();
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
						chkBrgRecord2.setMbr_chk_date(simpleDateFormat.format(date));
						String username = (String) request.getSession().getAttribute("username");
						chkBrgRecord2.setMbr_chk_person(username);
						CurrentControlDao.getInstance().newDefect(chkBrgRecord2);
						chkBrgDefect.setMbr_chk_id(chkBrgRecord2.getMbr_chk_id());
					} else
					{
						chkBrgDefect.setMbr_chk_id(chkBrgRecord.getMbr_chk_id());
					}
					chkBrgDefect.setMbr_no(checkBrgDefectVo.getMbr_no());
					chkBrgDefect.setDefect_name(checkBrgDefectVo.getDefect_name());
					chkBrgDefect.setChk_defect_memo(checkBrgDefectVo.getChk_defect_memo());
					String defectType = checkBrgDefectVo.getDefect_type();
					if ("check".equals(defectType))
					{
						String defectId = checkBrgDefectVo.getDefect_id();
						String defect_name_f = CurrentControlDao.getInstance().selectDefectfByDefectS(defectId);
						chkBrgDefect.setDefect_name_f(defect_name_f);
						chkBrgDefect.setDefect_location_desc(checkBrgDefectVo.getDefect_location_desc());
						chkBrgDefect.setDefect_location_desc_val(checkBrgDefectVo.getDefect_location_desc_val());
						chkBrgDefect.setDefect_count(checkBrgDefectVo.getDefect_count());
						chkBrgDefect.setDefect_count_val(checkBrgDefectVo.getDefect_count_val());

					} else if ("user".equals(defectType))
					{
						chkBrgDefect.setDefect_name_f("自定义");
						chkBrgDefect.setDefect_location_desc("");
						chkBrgDefect.setDefect_location_desc_val("");
						chkBrgDefect.setDefect_count("");
						chkBrgDefect.setDefect_count_val("");

					}
					CurrentControlDao.getInstance().newDefect2(chkBrgDefect);
					List<CheckBrgDefectPhoto> photoList = checkBrgDefectVo.getPhotoList();
					for (CheckBrgDefectPhoto checkBrgDefectPhoto : photoList)
					{
						String photo_path = checkBrgDefectPhoto.getPhoto_path();
						String photo_name = checkBrgDefectPhoto.getPhoto_name();
						ChkBrgPhoto chkBrgPhoto = new ChkBrgPhoto();
						chkBrgPhoto.setPhoto_name(photo_name);
						chkBrgPhoto.setPhoto_path(photo_path);

						String time = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss").format(new Date());
						chkBrgPhoto.setPhoto_date(time);
						chkBrgPhoto.setDefect_serial(chkBrgDefect.getDefect_serial());
						File f1 = new File(baseDir, chkBrgPhoto.getPhoto_path());
						if (!("").equals(chkBrgPhoto.getPhoto_path()) && f1.exists())
						{
							// 上传图片路径
							File fileDir = new File(baseDir, checkBrgDefectVo.getBridge_id() + File.separator + checkBrgDefectVo.getChk_type() + File.separator
									+ checkBrgDefectVo.getPrj_id());
							if (!fileDir.exists())
							{
								fileDir.mkdirs();
							}
							path = FileManageUtil.fileMove(f1, fileDir);
							path = path.replace(baseDir.getAbsolutePath() + File.separator, "");

						} else
						{
							path = "";

						}

						chkBrgPhoto.setPhoto_path(path);

						CheckSpanDao.getInstance().insertPhoto(chkBrgPhoto);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"新增", e.getMessage(),"CurrentControlServlet+newDefect+checkBrgDefects："+checkBrgDefects);
			}
			ro.setError(0);
			ro.setSuccess("success");
			LogDao.getInstance().addLogInfo(log_user,"新增", "操作成功","CurrentControlServlet+newDefect");
			ro.ToJsp(response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
