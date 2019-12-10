package hs.bm.servlet;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgCardConstructPrj;
import hs.bm.bean.BrgCardDocument;
import hs.bm.bean.BrgCardDocumentIndex;
import hs.bm.bean.BrgCardDownStruct;
import hs.bm.bean.BrgCardEvaluation;
import hs.bm.bean.BrgCardStructTech;
import hs.bm.bean.BrgCardTopStruct;
import hs.bm.bean.BrgPrjPhoto;
import hs.bm.bean.BrgSpanInfo;
import hs.bm.bean.DicBrgCardDomain;
import hs.bm.bean.DicBrgStructTypeDef;
import hs.bm.bean.DicManageSection;
import hs.bm.bean.DicManageZone;
import hs.bm.bean.PassInfo;
import hs.bm.bean.SysUsrUsrInfo;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.ChkAuditDao;
import hs.bm.dao.CurrentControlDao;
import hs.bm.dao.DicCardDao;
import hs.bm.dao.EvalAuditDao;
import hs.bm.dao.LogDao;
import hs.bm.util.CMDUtil;
import hs.bm.util.IDtool;
import hs.bm.util.Nullchange;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BrgCardConstructPrjVO;
import hs.bm.vo.BrgCardInfoVO;
import hs.bm.vo.BrgCardPictureVO;
import hs.bm.vo.BrgCardStructTechVO;
import hs.bm.vo.BrgMemberVO;
import hs.bm.vo.BrgSpanForCardVO;
import hs.bm.vo.BridgeMemAll;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.PDF;
import hs.bm.vo.Photo_path;
import hs.bm.vo.ResObj;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.apache.catalina.tribes.util.StringManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class BrgCardServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BrgCardServlet()
	{
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		HttpSession session = request.getSession();
		// 构建类型
		OperationConstruct op = (OperationConstruct) session.getAttribute("OperationConstruct");
		String user_name = (String) session.getAttribute("username");
		if (op == null)
		{
			ro.setError(1);
			ro.setSuccess("empty");
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initA"))
		{
			ArrayList<DicBrgCardDomain> list = BrgCardDao.getInstance().initA();
			if (list.size() != 0)
			{
				ro.setError(0);
				ro.setObj(list);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		//来自结构数据
		if ("topFromSpanInfo".equals(type))
		{
			List<BrgSpanInfo> direction = BrgCardDao.getInstance().getBrgSpan_direction(op.getId());
			BrgCardDao.getInstance().delTopByBrg_id(op.getId());
			for (int n = 0; n < direction.size(); n++)
			{
				Map<String, List<BrgSpanForCardVO>> listMap = BrgCardDao.getInstance().getBrgSpanForCardVO_ByDirection(op.getId(),direction.get(n).getDirection(),direction);
				List<BrgSpanForCardVO> list = listMap.get("list");
				List<BrgSpanForCardVO> listRest = listMap.get("listRest");
				
				System.out.println(op.getId());
				Map map = new HashMap();	
				for (int i = 0; i < list.size(); i++)
				{
					BrgSpanForCardVO entity = list.get(i);
					String key = entity.getBrg_type_name() + "\t" + entity.getSpan_length() + "\t" + entity.getSpan_material();
					if (map.containsKey(key))
					{
						String value = map.get(key) + "\t" + entity.getSpan_no();
						map.put(key, value);
					} else
					{
						map.put(key, entity.getSpan_no());
					}
				}
				/*int size;
				if("无".equals(direction.get(n).getDirection().trim())){
					size = listRest.size();
				}else{
					size = listRest.size()/2;
				}*/
				if(n<1){
					for (int i = 0; i < listRest.size(); i++)
					{
						BrgSpanForCardVO entity = listRest.get(i);
						String key = entity.getBrg_type_name() + "\t" + entity.getSpan_length() + "\t" + entity.getSpan_material();
						if (map.containsKey(key))
						{
							String value = map.get(key) + "\t" + entity.getSpan_no();
							map.put(key, value+"flag");
						} else
						{
							map.put(key, entity.getSpan_no()+"flag");
						}
					}
			    }
				Iterator entries = map.entrySet().iterator();
				while (entries.hasNext())
				{
					Map.Entry entry = (Map.Entry) entries.next();
					String key = (String) entry.getKey();
					String value = (String) entry.getValue();
					if(value.contains("flag")){
						if("无".equals(direction.get(n).getDirection().trim())){
							value =  "无方向"+Nullchange.formatSpan_no(value.replace("flag",""));
						}else{
							value =  Nullchange.formatSpan_no(value.replace("flag",""));
						}
					}else{
					value = direction.get(n).getDirection()+ Nullchange.formatSpan_no(value);
					}
					String[] params = key.split("\t");
					BrgCardDao.getInstance().addFullTop(op.getId(), IDtool.getUUID().replace("-", ""), value, params[0], params[1], params[2]);
					System.out.println("Key = " + key + ", Value = " + value);
				}
			}
			ro.ToJsp(response);
		}

		if ("checkFromSpanInfo".equals(type))
		{
			boolean flag = true;
			List<BrgSpanForCardVO> list = BrgCardDao.getInstance().getBrgSpanForCardVO(op.getId());
			if (list.size() > 0)
			{
				for (int i = 0; i < list.size(); i++)
				{
					BrgSpanForCardVO entity = list.get(i);
					ArrayList<String> ll = new ArrayList<String>();
					ll.add(entity.getBrg_type_name());
					ll.add(entity.getSpan_no());
					ll.add(entity.getSpan_length());
					ll.add(entity.getSpan_material());
					for (int j = 0; j < ll.size(); j++)
					{
						if (ll.get(j) == null ||  ll.get(j).equals("") )
						{
							flag = false;
							break;
						}
					}
					if (!flag)
					{
						break;
					}
				}
			} else
			{
				flag = false;
			}
			if (flag)
			{
				ro.setError(0);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initB"))
		{
			ArrayList<DicBrgCardDomain> list = BrgCardDao.getInstance().initB();
			if (list.size() != 0)
			{
				ro.setError(0);
				ro.setObj(list);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if (type.equals("getManage_id"))
		{
			String name = request.getParameter("name");
			String queryType = request.getParameter("queryType");
			String id = BrgCardDao.getInstance().getManage_id(name, queryType);
			if (!id.equals(""))
			{
				ro.setObj(id);
				ro.setError(0);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("getSectiondata"))
		{
			ArrayList<DicManageSection> section = BrgCardDao.getInstance().getSectiondata();
			if (section.size() > 0)
			{
				ro.setObj(section);
				ro.setError(0);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("getZonedata"))
		{
			ArrayList<DicManageZone> zone = BrgCardDao.getInstance().getZonedata();
			if (zone.size() > 0)
			{
				ro.setObj(zone);
				ro.setError(0);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("delete_nearly"))
		{
			try {
				String r_id = request.getParameter("r_id");
				int i = BrgCardDao.getInstance().del_nearly(r_id);
				if (i == 1)
				{
					ro.setError(0);
					ro.setSuccess("success");
				} else
				{
					ro.setError(1);
					ro.setSuccess("fail");
				}
				ro.ToJsp(response);
				LogDao.getInstance().addLogInfo(user_name, "delete-brg_card_evaluation", "成功",r_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (type.equals("initTopStructType"))
		{
			ArrayList<DicBrgStructTypeDef> entity = BrgCardDao.getInstance().getDicBrgStructTypeDefData();
			if (entity.size() > 0)
			{
				ro.setError(0);
				ro.setObj(entity);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if (type.equals("initPicture"))
		{
			ArrayList<SysUsrUsrInfo> list = BrgCardDao.getInstance().getFill_man();
			if (list.size() != 0)
			{
				ro.setError(0);
				ro.setObj(list);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if (type.equals("img"))
		{
			String britype = (String) session.getAttribute("britype");
			String hhhbs = (String) session.getAttribute("hhhbs");
			// System.out.println(britype+" null");
			session.removeAttribute("britype");
			String result = null;
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			String card = "card";
			// String qiaobao = "qiaobao";
			String uploadurl = PropertiesUtil.getPropertiesByName("rootDir");
			uploadurl = uploadurl + File.separator + hhhbs + File.separator + card;
			File uploadPath = new File(uploadurl);
			if (!uploadPath.exists())
			{
				uploadPath.mkdirs();
			}
			try
			{
				List<FileItem> items = upload.parseRequest(request);
				for (FileItem fileItem : items)
				{
					if (!fileItem.isFormField())
					{
						File saveFile = null;
						if (britype.equals("立面照"))
						{
							String fileName = hhhbs + "_lmz.jpg";
							saveFile = new File(uploadPath, fileName);
							result = saveFile.getAbsolutePath();
						} else
						{
							String fileName = hhhbs + "_zmz.jpg";
							saveFile = new File(uploadPath, fileName);
							result = saveFile.getAbsolutePath();
						}
						InputStream in = fileItem.getInputStream();
						OutputStream out = new FileOutputStream(saveFile);
						byte[] bs = new byte[1024];
						int i = -1;
						while ((i = in.read(bs)) != -1)
						{
							out.write(bs, 0, i);
						}
						out.flush();
						out.close();
						in.close();
					}
				}
			} catch (Exception e)
			{
				e.printStackTrace();
			}
			if (result == null)
			{
				ro.setSuccess("fail");
			} else
			{
				BrgCardDocumentIndex bcdi = new BrgCardDocumentIndex();
				System.out.println(result);
				bcdi.setR_id(IDtool.getUUID());
				bcdi.setBridge_id(hhhbs);
				bcdi.setPath(result);
				bcdi.setType(britype);
				int i = 0;
				ro.setError(0);
				ro.setSuccess("success");
			}
			ro.ToJsp(response);
			return;
		}
		/* 重新生成PDF */
		if (type.equals("rePDF"))
		{
			String root = PropertiesUtil.getPropertiesByName("rootDir");
			String path = "";
			String bid = op.getId();
			System.out.println(bid);
			CMDUtil pdfUtil = new CMDUtil();
			PDF pdf = new PDF();
			List<PDF> list = new ArrayList<PDF>();
			path = pdfUtil.buildCard(bid);
			if (path != null)
			{
				path = path.replace(root + File.separator, "");
				System.out.println(path);
				BrgCardDao.getInstance().storeCardPath(bid, path);
				pdf.setStruct_id(bid);
				pdf.setPath(path);
				list.add(pdf);
				ro.setError(0);
				ro.setObj(list);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if (type.equals("initPhoto"))
		{
			ArrayList<BrgPrjPhoto> entity = new ArrayList<BrgPrjPhoto>();
			entity = BrgCardDao.getInstance().getPhotoPath(op.getId());
			Photo_path pp = new Photo_path();
			for (int i = 0; i < entity.size(); i++)
			{
				if (entity.get(i).getPhoto_type().equals("face"))
				{
					pp.setFace_path(entity.get(i).getPath());
				} else
				{
					pp.setFacade_path(entity.get(i).getPath());
				}
			}
			if (entity.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(pp);
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if (type.equals("select"))
		{
			String britype = request.getParameter("britype");
			String hhhbs = request.getParameter("hhhbs");
			session.setAttribute("britype", britype);
			session.setAttribute("hhhbs", hhhbs);
			ro.setError(0);
			ro.setSuccess("success");
			ro.ToJsp(response);
		}
		if (type.equals("bt"))
		{
			List<DicBrgStructTypeDef> ll = new ArrayList<DicBrgStructTypeDef>();
			// ll = hssd.showBTN();
			if (ll.size() == 0 || ll == null)
			{
				ro.setSuccess("fail");
			} else
			{
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
		}
		if (type.equals("delbccp"))
		{
			String r_id = request.getParameter("r_id");
			try {
				int i = BrgCardDao.getInstance().del_bccp(r_id);
				if (i == 1)
				{
					ro.setSuccess("success");
					ro.setError(0);
					LogDao.getInstance().addLogInfo(user_name,"删除", "操作成功","BrgCardServlet+delbccp");
				} else
				{
					ro.setSuccess("fail");
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(user_name,"删除", e.getMessage(),"BrgCardServlet+delbccp");
			}
			ro.ToJsp(response);
		}
		if (type.equals("changebccp"))
		{
			String r_id = request.getParameter("id");
			String start_date = request.getParameter("start_date");
			String finish_date = request.getParameter("finish_date");
			String type1 = request.getParameter("type1");
			String reason = request.getParameter("reason");
			String scope = request.getParameter("scope");
			String cost = request.getParameter("cost");
			String cost_source = request.getParameter("cost_source");
			String evaluate_level = request.getParameter("evaluate_level");
			String build_org = request.getParameter("build_org");
			String design_org = request.getParameter("design_org");
			String construct_org = request.getParameter("construct_org");
			String supervise_org = request.getParameter("supervise_org");
			String memo = request.getParameter("memo");
			int i = BrgCardDao.getInstance().ChangeBccp(r_id, start_date, finish_date, type1, reason, scope, cost, cost_source, evaluate_level, build_org,
					design_org, construct_org, supervise_org);
			// hssd.ChangeBccp(r_id, op.getId(), start_date, finish_date, type1,
			// reason, scope, cost, cost_source, evaluate_level, build_org,
			// design_org,
			// construct_org, supervise_org, memo);
			boolean flag = false;
			if (i > 0)
			{
				i = BrgCardDao.getInstance().UpdateMemo(memo, op.getId());
				// hssd.UpdateMemo(memo, op.getId());
				if (i < 1)
				{
					i = BrgCardDao.getInstance().insertMemo(memo, op.getId());
				}
				if (i > 0)
				{
					flag = true;
				}
			}
			if (flag)
			{
				ChkAuditDao.getInstance().clearChkAuditPDF_Path(op.getId());
				EvalAuditDao.getInstance().clearEvaPath(op.getId());
				ro.setError(0);
				ro.setSuccess("success");
			}
			ro.ToJsp(response);
			return;
		}
		// 最近评定数据
		if (type.equals("new_nearly"))
		{
			String r_id = IDtool.getUUID();
			String bridge_id = op.getId();
			String chk_date = request.getParameter("chk_date");
			String chk_type = request.getParameter("chk_type");
			String brg_level = request.getParameter("brg_level");
			String abutment_base = request.getParameter("abutment_base");
			String foundation_erosion = request.getParameter("foundation_erosion");
			String top_struts = request.getParameter("top_struts");
			String support = request.getParameter("support");
			String always_repairs = request.getParameter("always_repairs");
			String disposal_strategy = request.getParameter("disposal_strategy");
			String next_date = request.getParameter("next_date");
			String pier_base = request.getParameter("pier_base");
			int i = 0;
			String[] obj = new String[]
			{ r_id, bridge_id, chk_date, chk_type, brg_level, abutment_base, pier_base, foundation_erosion, top_struts, support, always_repairs,
					disposal_strategy, next_date };
			i = BrgCardDao.getInstance().new_nearly(obj);
			if (i > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}

		/* 修改最近评定数据 */
		if (type.equals("change_nearly"))
		{
			String r_id = request.getParameter("id");
			String bridge_id = op.getId();
			String chk_date = request.getParameter("chk_date");
			String chk_type = request.getParameter("chk_type");
			String brg_level = request.getParameter("brg_level");
			String abutment_base = request.getParameter("abutment_base");
			String foundation_erosion = request.getParameter("foundation_erosion");
			String top_struts = request.getParameter("top_struts");
			String support = request.getParameter("support");
			String always_repairs = request.getParameter("always_repairs");
			String disposal_strategy = request.getParameter("disposal_strategy");
			String next_date = request.getParameter("next_date");
			String pier_base = request.getParameter("pier_base");
			int i = 0;
			String[] obj = new String[]
			{ chk_date, chk_type, brg_level, abutment_base, pier_base, foundation_erosion, top_struts, support, always_repairs, disposal_strategy, next_date,
					r_id };
			try {
				i = BrgCardDao.getInstance().update_nearly(obj);
				// hssd.update_nearly(obj);
				if (i > 0)
				{
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(user_name,"修改", "操作成功","BrgCardServlet+change_nearly");
				} else
				{
					ro.setError(1);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(user_name,"修改",e.getMessage(),"BrgCardServlet+change_nearly+obj:"+obj);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("newbccp"))
		{
			boolean flag = false;
			String start_date = request.getParameter("start_date");
			String finish_date = request.getParameter("finish_date");
			String type1 = request.getParameter("type1");
			String reason = request.getParameter("reason");
			String scope = request.getParameter("scope");
			String cost = request.getParameter("cost");
			String cost_source = request.getParameter("cost_source");
			String evaluate_level = request.getParameter("evaluate_level");
			String build_org = request.getParameter("build_org");
			String design_org = request.getParameter("design_org");
			String construct_org = request.getParameter("construct_org");
			String supervise_org = request.getParameter("supervise_org");
			String memo = request.getParameter("memo");
			try {
				int i = BrgCardDao.getInstance().NewBccp(op.getId(), start_date, finish_date, type1, reason, scope, cost, cost_source, evaluate_level, build_org,
						design_org, construct_org, supervise_org);
				// hssd.NewBccp(op.getId(), start_date, finish_date, type1, reason,
				// scope, cost, cost_source, evaluate_level, build_org, design_org,
				// construct_org,
				// supervise_org, memo);

				if (i > 0)
				{
					i = BrgCardDao.getInstance().UpdateMemo(memo, op.getId());
				}
				if (i < 1)
				{
					i = BrgCardDao.getInstance().insertMemo(memo, op.getId());
				}
				if (i > 0)
				{
					flag = true;
				}
				if (flag)
				{
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(user_name,"新增", "操作成功","BrgCardServlet+newbccp");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(user_name,"新增", e.getMessage(),"BrgCardServlet+newbccp");
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("changeMan"))
		{
			String bridge_no = request.getParameter("bridge_no");
			String charge_man = request.getParameter("charge_man");
			String fill_man = request.getParameter("fill_man");
			String fill_date = request.getParameter("fill_date");
			try {
				int i = BrgCardDao.getInstance().ChangeMan(op.getId(), charge_man, fill_man, fill_date);
				// hssd.ChangeMan(op.getId(), charge_man, fill_man, fill_date);
				boolean flag = false;
				if (i > 0)
				{
					flag = true;
				}
				if (flag)
				{
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(user_name,"修改", "操作成功","BrgCardServlet+changeMan");
					ChkAuditDao.getInstance().clearChkAuditPDF_Path(op.getId());
					EvalAuditDao.getInstance().clearEvaPath(op.getId());
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(user_name,"修改", e.getMessage(),"BrgCardServlet+changeMan");
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("changebcd"))
		{
			String bridge_no = request.getParameter("bridge_no");
			String blueprint_state = request.getParameter("blueprint_state");
			String design_file_state = request.getParameter("design_file_state");
			String construct_file_state = request.getParameter("construct_file_state");
			String complete_file_state = request.getParameter("complete_file_state");
			String acceptance_file_state = request.getParameter("acceptance_file_state");
			String administrate_file_state = request.getParameter("administrate_file_state");
			String regular_report_state = request.getParameter("regular_report_state");
			String special_report_state = request.getParameter("special_report_state");
			String history_maintain_state = request.getParameter("history_maintain_state");
			String document_no = request.getParameter("document_no");
			String document = request.getParameter("document");
			String document_time = request.getParameter("document_time");
			try {
				int i = BrgCardDao.getInstance().Changebcd(op.getId(), blueprint_state, design_file_state, construct_file_state, complete_file_state,
						acceptance_file_state, administrate_file_state, regular_report_state, special_report_state, history_maintain_state, document_no, document,
						document_time);
				;
				// hssd.Changebcd(op.getId(), blueprint_state, design_file_state,
				// construct_file_state, complete_file_state, acceptance_file_state,
				// administrate_file_state, regular_report_state,
				// special_report_state, history_maintain_state, document_no,
				// document, document_time);
				boolean flag = false;
				if (i > 0)
				{
					flag = true;
				}
				if (flag)
				{
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(user_name,"修改", "操作成功","BrgCardServlet+changebcd");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(user_name,"修改", e.getMessage(),"BrgCardServlet+changebcd");
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("changebcst"))
		{
			String bridge_len = request.getParameter("bridge_len");
			String bridge_width = request.getParameter("bridge_width");
			String lane_width = request.getParameter("lane_width");
			String bridge_t_s_height = request.getParameter("bridge_t_s_height");
			String bridge_b_height = request.getParameter("bridge_b_height");
			String bridge_t_height = request.getParameter("bridge_t_height");
			String approach_total_width = request.getParameter("approach_total_width");
			String approach_width = request.getParameter("approach_width");
			String approach_line_type = request.getParameter("approach_line_type");
			String expansion_joint_type = request.getParameter("expansion_joint_type");
			String support_type = request.getParameter("support_type");
			String acceleration_factor = request.getParameter("acceleration_factor");
			String abutment_slope = request.getParameter("abutment_slope");
			String guard_pier_body = request.getParameter("guard_pier_body");
			String treatment_struct = request.getParameter("treatment_struct");
			String water_level = request.getParameter("water_level");
			String design_level = request.getParameter("design_level");
			String his_flood_level = request.getParameter("his_flood_level");
			// BrgCardTopStruct entity1=
			// JSON.parseObject(request.getParameter("top_structs"),
			// BrgCardTopStruct.class);
			// BrgCardDownStruct entity2=
			// JSON.parseObject(request.getParameter("down_structs"),
			// BrgCardDownStruct.class);

			int i = BrgCardDao.getInstance().Changebcst(bridge_len, bridge_width, lane_width, bridge_t_s_height, bridge_b_height, bridge_t_height,
					approach_total_width, approach_width, approach_line_type, expansion_joint_type, support_type, acceleration_factor, abutment_slope,
					guard_pier_body, treatment_struct, water_level, design_level, his_flood_level, op.getId());
			// hssd.Changebcst(bridge_len, bridge_width, lane_width,
			// bridge_t_s_height, bridge_b_height, bridge_t_height,
			// approach_total_width,
			// approach_width, approach_line_type, top_struct_hole_no1,
			// top_struct_hole_no2, top_struct_hole_no3, top_struct_hole_no4,
			// top_struct_type1,
			// top_struct_type2, top_struct_type3, top_struct_type4,
			// top_struct_span1, top_struct_span2, top_struct_span3,
			// top_struct_span4,
			// top_struct_stuff1, top_struct_stuff2, top_struct_stuff3,
			// top_struct_stuff4, down_struct_pier1, down_struct_pier2,
			// down_struct_pier3,
			// down_struct_pier4, down_struct_type1, down_struct_type2,
			// down_struct_type3, down_struct_type4, down_struct_stuff1,
			// down_struct_stuff2,
			// down_struct_stuff3, down_struct_stuff4, down_struct_base_type1,
			// down_struct_base_type2, down_struct_base_type3,
			// down_struct_base_type4,
			// expansion_joint_type, support_type, acceleration_factor,
			// abutment_slope, guard_pier_body, treatment_struct, water_level,
			// design_level,
			// his_flood_level, op.getId());
			boolean flag = false;
			if (i > 0)
			{
				flag = true;
			}
			if (flag)
			{
				ro.setError(0);
				ro.setSuccess("success");
				EvalAuditDao.getInstance().clearEvaPath(op.getId());
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("storeTopDown"))
		{
			int a = 0;
			int b = 0;
			String ss = request.getParameter("top_structs");
			String sss = request.getParameter("down_structs");
			ArrayList<BrgCardTopStruct> top_structs = (ArrayList<BrgCardTopStruct>) JSON.parseArray(ss, BrgCardTopStruct.class);
			ArrayList<BrgCardDownStruct> down_structs = (ArrayList<BrgCardDownStruct>) JSON.parseArray(sss, BrgCardDownStruct.class);
			for (int i = 0; i < top_structs.size(); i++)
			{
				a = BrgCardDao.getInstance().updateBrgCardTopStruct(top_structs.get(i));
			}
			for (int i = 0; i < down_structs.size(); i++)
			{
				b = BrgCardDao.getInstance().updateBrgCardDownStruct(down_structs.get(i));
			}
			ro.setSuccess("success");
			ro.setError(0);
			ro.ToJsp(response);
		}
		if (type.equals("changebcai"))
		{
			String highway_id = request.getParameter("highway_id");
			String bridge_no = request.getParameter("bridge_no");
			String bridge_name = request.getParameter("bridge_name");
			String bridge_pile_no = request.getParameter("bridge_pile_no");
			String function_type = request.getParameter("function_type");
			String beneath_path_name = request.getParameter("beneath_path_name");
			String beneath_path_pile_no = request.getParameter("beneath_path_pile_no");
			String design_load = request.getParameter("design_load");
			String pass_load = request.getParameter("pass_load");
			String skew_slope = request.getParameter("skew_slope");
			String deck_pavement = request.getParameter("deck_pavement");
			String maintain_org = request.getParameter("maintain_org");
			String build_year = request.getParameter("build_year");
			String edit_section = request.getParameter("edit_section");
			String edit_zone = request.getParameter("edit_zone");
			if (edit_zone.equals(""))
			{
				edit_zone = null;
			}
			String edit_span_built = request.getParameter("edit_span_built");
			String edit_brg_type = request.getParameter("edit_brg_type");
			String edit_location = request.getParameter("edit_location");
			String edit_max_kuajing = request.getParameter("edit_max_kuajing");
			String edit_main_kuajiegou = request.getParameter("edit_main_kuajiegou");
			String longitude = "";
			String latitude = "";
			if (edit_location != "" && edit_location.contains(","))
			{
				longitude = request.getParameter("edit_location").split(",")[0];
				latitude = request.getParameter("edit_location").split(",")[1];
			}
			int i = BrgCardDao.getInstance().updateBrgCardAdminId2(highway_id, maintain_org, edit_section, edit_zone, bridge_no, bridge_name, bridge_pile_no,
					function_type, edit_span_built, edit_brg_type, beneath_path_name, beneath_path_pile_no, design_load, pass_load, skew_slope, deck_pavement,
					build_year, longitude, latitude, op.getId(),edit_max_kuajing,edit_main_kuajiegou);
			boolean flag = false;
			if (i > 0)
			{
				flag = true;
			}
			if (flag)
			{
				// op.setLine_name(roadline_name);
				op.setLine_name(request.getParameter("highway_name"));
				op.setLine_no(request.getParameter("highway_id"));
				op.setSection_id(request.getParameter("edit_section"));
				op.setSection_name(request.getParameter("section"));
				op.setZone_id(request.getParameter("edit_zone"));
				op.setZone_name(request.getParameter("zone"));
				op.setManage_id(request.getParameter("maintain_org"));
				op.setManage_name(request.getParameter("org"));
				op.setSpan_build(request.getParameter("edit_span_build"));
				op.setName(bridge_name);
				session.setAttribute("OperationConstruct", op);
				ChkAuditDao.getInstance().clearChkAuditPDF_Path(op.getId());
				EvalAuditDao.getInstance().clearEvaPath(op.getId());
				ro.setError(0);
				ro.setSuccess("success");
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initBrgPicture"))
		{
			ArrayList<BrgCardAdminId> brgCardAdminId = BrgCardDao.getInstance().getBrgCardAdminIdData(op.getId());
			if (brgCardAdminId.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(brgCardAdminId);
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("addTop"))
		{
			try {
				int i = BrgCardDao.getInstance().addTop(op.getId(), IDtool.getUUID().replace("-", ""));
				if (i > 0)
				{
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(user_name,"增加", "操作成功","BrgCardServlet+addTop");
				} else
				{
					ro.setError(1);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(user_name,"增加", e.getMessage(),"BrgCardServlet+addTop+brgid:"+op.getId());
			}
			ro.ToJsp(response);
		}
		if (type.equals("delTop"))
		{
			int i = 0;
			try {
				if (BrgCardDao.getInstance().getCount(op.getId(), "top") < 2)
				{
					i = BrgCardDao.getInstance().clearStruct(request.getParameter("id"), "top");
				} else
				{
					i = BrgCardDao.getInstance().delTop(request.getParameter("id"));
				}
				if (i > 0)
				{
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(user_name,"删除","操作成功","BrgCardServlet+delTop");
				} else
				{
					ro.setError(1);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(user_name,"删除", e.getMessage(),"BrgCardServlet+delTop+brgid:"+op.getId());
			}
			ro.ToJsp(response);
		}
		if (type.equals("addDown"))
		{
			try {
				int i = BrgCardDao.getInstance().addDown(op.getId(), IDtool.getUUID().replace("-", ""));
				if (i > 0)
				{
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(user_name,"增加","操作成功","BrgCardServlet+addDown");
				} else
				{
					ro.setError(1);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(user_name,"增加", e.getMessage(),"BrgCardServlet+addDown+brgid:"+op.getId());
			}
			ro.ToJsp(response);
		}
		if (type.equals("delDown"))
		{
			int i = 0;
			try {
				if (BrgCardDao.getInstance().getCount(op.getId(), "down") < 2)
				{
					i = BrgCardDao.getInstance().clearStruct(request.getParameter("id"), "down");
				} else
				{
					i = BrgCardDao.getInstance().delDown(request.getParameter("id"));
				}
				if (i > 0)
				{
					ro.setError(0);
					ro.setSuccess("success");
					LogDao.getInstance().addLogInfo(user_name,"删除","操作成功","BrgCardServlet+delDown");
				} else
				{
					ro.setError(1);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(user_name,"删除",e.getMessage(),"BrgCardServlet+delDown+brgid:"+op.getId());
			}
			ro.ToJsp(response);
		}
		if (type.equals("getBridge_id"))
		{
			String bridge_id = op.getId();
			if (bridge_id != null && !bridge_id.equals(""))
			{
				ro.setSuccess("success");
				ro.setObj(bridge_id);
				ro.setError(0);
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initTableBridge"))
		{
			List<BrgCardInfoVO> ll = BrgCardDao.getInstance().getAdministrativeIdentificationData(op.getId());
			if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}
		// 桥梁结构技术数据
		if (type.equals("TableBridge2"))
		{
			if (BrgCardDao.getInstance().isBrgCardStructTechExit(op.getId()) < 1)
			{
				BrgCardDao.getInstance().addBrgCardStructTech(op.getId());
			}
			ArrayList<BrgCardStructTechVO> ll = BrgCardDao.getInstance().getBrgCardStructTechData(op.getId());
			
			// hssd.ShowBriInfo2(op.getId());
			if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initBrgCardDocument"))
		{
			if (BrgCardDao.getInstance().isBrgCardDocumentExit(op.getId()) == 0)
			{
				BrgCardDao.getInstance().addBrgCardDocument(op.getId());
			}

			List<BrgCardDocument> ll = BrgCardDao.getInstance().getBrgCardDocumentData(op.getId());
			// hssd.ShowBriInfo3(op.getId());
			if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initBrgCardEvaluation"))
		{
			List<BrgCardEvaluation> ll = BrgCardDao.getInstance().getBrgCardEvaluationData(op.getId());
			// hssd.ShowBriInfo4(op.getId());
			if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initBrgCardConstructPrj"))
		{
			ArrayList<BrgCardConstructPrjVO> ll = new ArrayList<BrgCardConstructPrjVO>();
			BrgCardConstructPrjVO entity = new BrgCardConstructPrjVO();
			entity.setBrgCardConstructPrj(BrgCardDao.getInstance().getBrgCardConstructPrjData(op.getId()));
			entity.setBrgCardConstructPrjMemo(BrgCardDao.getInstance().getBrgCardConstructPrjMemoData(op.getId()));
			ll.add(entity);
			// hssd.ShowBriInfo5(op.getId());
			if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("getOptionsByDataId"))
		{
			String item_id = request.getParameter("id");
			List<DicBrgCardDomain> ll = DicCardDao.getInstance().initBridgeCardTable(item_id);
			if (ll == null)
			{
				ro.setError(2);
				ro.setSuccess("fail");
			} else if (ll.size() > 0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			} else
			{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
