package hs.bm.servlet;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.metal.OceanTheme;

import com.alibaba.fastjson.JSON;

import hs.bm.util.IDtool;
import hs.bm.util.Nullchange;
import hs.bm.vo.ResObj;
import hs.bm.bean.BrgCardTopStruct;
import hs.bm.bean.BrgSpanInfo;
import hs.bm.bean.DicBrgCardDomain;
import hs.bm.bean.DicBrgStructMemberDef;
import hs.bm.bean.DicMemberCondition;
import hs.bm.bean.DicMemberStandard;
import hs.bm.bean.MemMemberTypeDef;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.BrgMbrDao;
import hs.bm.dao.LogDao;
import hs.bm.vo.BrgLXVO;
import hs.bm.vo.BrgMemberVO;
import hs.bm.vo.BrgSpanInfoVO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.QuickDownSpanVo;
import hs.bm.vo.DicVisVO;
import hs.bm.vo.QuickSpanVO;

;

public class BrgMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String choice = request.getParameter("choice");
		String type = request.getParameter("type");
		if (choice.equals("1")) {
			queryLX(request, response);
		} else if (choice.equals("2")) {
			insertSpan(request, response);
		} else if (choice.equals("3")) {
			querySpan(request, response);
		} else if (choice.equals("4")) {
			editSpan(request, response);
		} else if (choice.equals("5")) {
			delSpan(request, response);
		} else if (choice.equals("6")) {
			queryMember(request, response);
		} else if (choice.equals("7")) {
			addMember(request, response);
		} else if (choice.equals("8")) {
			editMember(request, response);
		} else if (choice.equals("9")) {
			delMember(request, response);
		} else if (choice.equals("10")) {
			queryBH(request, response);
		} else if (choice.equals("member_type")) {
			queryMember_Type(request, response);
		} else if (choice.equals("mem_mem_type")) {
			queryMem_Mem_Type(request, response);
		} else if (choice.equals("initTree")) {
			initTree(request, response);
		}

		if (choice.equals("getAllBridge")) {
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			List<Map<String, String>> ll = BrgMbrDao.getIntance().getAllBridge();
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
		/** todo */
		if (choice.equals("quickSpanNumber")) {
			ResObj ro = new ResObj();
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			String data = request.getParameter("quick_span_number");
			String quick_span_type = request.getParameter("quick_span_type");
			String span_top = request.getParameter("span_top");
			String span_down = request.getParameter("span_down");
			// ArrayList list_check_val = check_val.toCharArray();
			ArrayList err = new ArrayList();
			String[] list;
			if (data.contains(",")) {
				list = data.split(",");
			} else {
				list = new String[] { data };
			}
			ArrayList arrs = getAllSpanNo(list);
			for (int i = 0; i < arrs.size(); i++) {
				ArrayList arr = (ArrayList) arrs.get(i);
				for (int j = 0; j < arr.size(); j++) {
					ArrayList<BrgSpanInfo> brgSpanInfo = BrgMbrDao.getIntance().isSpanExit(oc.getId(),
							(String) arr.get(j), quick_span_type, span_top, span_down);
					if (brgSpanInfo.size() > 0) {
						err.add(brgSpanInfo);
					}
				}
			}
			if (err.size() > 0) {
				ro.setObj(err);
				ro.setSuccess("fail");
			} else {
				ro.setObj(arrs);
				ro.setSuccess("success");
			}
			ro.ToJsp(response);
		}
		/** xianing */
		if (choice.equals("quickBuildDownSpan")) {
			ResObj ro = new ResObj();
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			String data = request.getParameter("quick_span_number");
			String[] list;
			if (data.contains(",")) {
				list = data.split(",");
			} else {
				list = new String[] { data };
			}
			ArrayList arrs = getAllSpanNo(list);
			ro.setObj(arrs);
			ro.setSuccess("success");
			ro.ToJsp(response);
		}
		if (choice.equals("quickSpan_s")) {
			ResObj ro = new ResObj();
			ro.setSuccess("fail");
			int count = 0;
			int count_a = 0;
			boolean flag = false;
			/* get params */
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			String str = request.getParameter("quickSpan_s");
			String condition = request.getParameter("condition");
			String span_top = request.getParameter("span_top");
			String span_down = request.getParameter("span_down");
			ArrayList<QuickSpanVO> list = (ArrayList<QuickSpanVO>) JSON.parseArray(str, QuickSpanVO.class);
			if (condition.equals("1")) {
				condition = "分离式";

				for (int i = 0; i < list.size(); i++) {
					QuickSpanVO entity = list.get(i);
					/* 构件标准 */
					ArrayList<DicMemberStandard> dicMemberStandard = BrgMbrDao.getIntance().getDicMemberStandardByDMC(
							entity.getQuickSpan_brg_type(), condition, entity.getQuickSpan_format(),
							entity.getQuickSpan_location());
					/* 建跨 */
					if (span_top != null) {
						String s_id = IDtool.getUUID().replace("-", "");
						BrgMbrDao.getIntance().buildQuickSpan(s_id, oc.getId(), "上行", entity.getQuickSpan_no(),
								BrgMbrDao.getIntance().getIdByName(entity.getQuickSpan_brg_type()),
								entity.getQuickSpan_line_no(), entity.getQuickSpan_length(),
								entity.getQuickSpan_material(), entity.getQuickSpanning_case(),
								entity.getQuickClearance());
						/* 建立上行构件 */
						for (int j = 0; j < dicMemberStandard.size(); j++) {
							String member_name = dicMemberStandard.get(j).getMember_name();
							if (member_name.contains("i")) {
								if (member_name.contains("(i-1)")) {
									member_name = member_name.replace("(i-1)",
											(Integer.parseInt(entity.getQuickSpan_no()) - 1) + "");
								} else {
									member_name = member_name.replace("i", entity.getQuickSpan_no());
								}
							}
							int a = BrgMbrDao.getIntance().buildQuickSpan_member(IDtool.getUUID().replace("-", ""),
									s_id, dicMemberStandard.get(j).getMember_type(), member_name,
									dicMemberStandard.get(j).getMember_model());
							if (a == 1) {
								count += 1;
							}
						}
						if (count == dicMemberStandard.size()) {
							flag = true;
						}
					}
					if (span_down != null) {
						/* 建跨 */
						String s_id = IDtool.getUUID().replace("-", "");
						BrgMbrDao.getIntance().buildQuickSpan(s_id, oc.getId(), "下行", entity.getQuickSpan_no(),
								BrgMbrDao.getIntance().getIdByName(entity.getQuickSpan_brg_type()),
								entity.getQuickSpan_line_no(), entity.getQuickSpan_length(),
								entity.getQuickSpan_material(), entity.getQuickSpanning_case(),
								entity.getQuickClearance());
						/* 建立下行构件 */
						for (int j = 0; j < dicMemberStandard.size(); j++) {
							String member_name = dicMemberStandard.get(j).getMember_name();
							if (member_name.contains("i")) {
								if (member_name.contains("(i-1)")) {
									member_name = member_name.replace("(i-1)",
											(Integer.parseInt(entity.getQuickSpan_no()) - 1) + "");
								} else {
									member_name = member_name.replace("i", entity.getQuickSpan_no());
								}
							}
							int a = BrgMbrDao.getIntance().buildQuickSpan_member(IDtool.getUUID().replace("-", ""),
									s_id, dicMemberStandard.get(j).getMember_type(), member_name,
									dicMemberStandard.get(j).getMember_model());
							if (a == 1) {
								count += 1;
							}
						}
						if (count == dicMemberStandard.size()) {
							flag = true;
						}
					}
				}

			} else {
				condition = "整体式";

				for (int i = 0; i < list.size(); i++) {
					QuickSpanVO entity = list.get(i);
					/* 构件标准 */
					ArrayList<DicMemberStandard> dicMemberStandard = BrgMbrDao.getIntance().getDicMemberStandardByDMC(
							entity.getQuickSpan_brg_type(), condition, entity.getQuickSpan_format(),
							entity.getQuickSpan_location());
					/* 建跨 */
					String s_id = IDtool.getUUID().replace("-", "");
					BrgMbrDao.getIntance().buildQuickSpan(s_id, oc.getId(), "无", entity.getQuickSpan_no(),
							BrgMbrDao.getIntance().getIdByName(entity.getQuickSpan_brg_type()),
							entity.getQuickSpan_line_no(), entity.getQuickSpan_length(), entity.getQuickSpan_material(),
							entity.getQuickSpanning_case(), entity.getQuickClearance());
					/* 建立构件 */
					for (int j = 0; j < dicMemberStandard.size(); j++) {
						String member_name = dicMemberStandard.get(j).getMember_name();
						if (member_name.contains("i")) {
							if (member_name.contains("(i-1)")) {
								member_name = member_name.replace("(i-1)",
										(Integer.parseInt(entity.getQuickSpan_no()) - 1) + "");
							} else {
								member_name = member_name.replace("i", entity.getQuickSpan_no());
							}
						}
						
						int a = BrgMbrDao.getIntance().buildQuickSpan_member(IDtool.getUUID().replace("-", ""), s_id,
								dicMemberStandard.get(j).getMember_type(), member_name,
								dicMemberStandard.get(j).getMember_model());
						if (a == 1) {
							count += 1;
						}
					}
					if (count == dicMemberStandard.size()) {
						count_a += 1;
					}
				}
				if (count_a == list.size()) {
					flag = true;
				}
			}
			if (flag = true) {
				ro.setSuccess("success");
			}
			ro.ToJsp(response);
		}

		if (choice.equals("quickDownSpan_s")) {
			ResObj ro = new ResObj();
			ro.setSuccess("fail");
			int count = 0;
			int count_a = 0;
			boolean flag = false;
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			String str = request.getParameter("quickSpan_s");
			String condition = request.getParameter("condition");
			String span_top = request.getParameter("span_top");
			String span_down = request.getParameter("span_down");
			ArrayList<QuickDownSpanVo> list = (ArrayList<QuickDownSpanVo>) JSON.parseArray(str, QuickDownSpanVo.class);
			
			BrgMbrDao brgMbrDao = new BrgMbrDao();
			brgMbrDao.DeleteDownSpans(oc.getId());
			if (condition.equals("1")) {
				condition = "分离式";
				if (span_top != null && span_down != null) {
					Nullchange.mergeList(list, "", oc);
				} else {
					if (span_top != null) {
						Nullchange.mergeList(list, "上行", oc);
					}
					if (span_down != null) {
						Nullchange.mergeList(list, "下行", oc);
						/*						 
						 * list = (ArrayList<QuickDownSpanVo>)JSON.parseArray(str, QuickDownSpanVo.class); 
						 * for(QuickDownSpanVo quickDownSpanVo:list){
						 *   quickDownSpanVo.setBridge_id(oc.getId());
						 *   quickDownSpanVo.setDirection("下行");
						 *   quickDownSpanVo.setQuickSpan_duntai_no("下行"+
						 *   quickDownSpanVo.getQuickSpan_duntai_no());
						 *   brgMbrDao.insertDownSpan(quickDownSpanVo); 
						 * }
						 */
					}
				}
			} else {
				condition = "整体式";
				Nullchange.mergeList(list, "无方向", oc);
			}
			if (flag = true) {
				ro.setSuccess("success");
			}
			ro.ToJsp(response);
		}
		if (choice.equals("initQuickSpan_brg_type")) {
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			String condition = request.getParameter("condition");
			if (condition.equals("1")) {
				condition = "分离式";
			} else {
				condition = "整体式";
			}
			ArrayList<DicMemberCondition> entity = BrgMbrDao.getIntance().getDicMemberCondition(condition);
			if (entity.size() > 0) {
				ro.setObj(entity);
			} else {
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if (choice.equals("initQuickSpan_format")) {
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			String condition = request.getParameter("condition");
			if (condition.equals("1")) {
				condition = "分离式";
			} else {
				condition = "整体式";
			}
			String brg_type = request.getParameter("brg_type");
			ArrayList<DicMemberCondition> entity = BrgMbrDao.getIntance().getDicMemberCondition_conditionNorm(condition,
					brg_type);
			if (entity.size() > 0) {
				ro.setObj(entity);

			} else {
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if (choice.equals("copyThisDirection")) {
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			String copyDirection = request.getParameter("direction");
			String copyBridge = request.getParameter("copyBridge");
			String bridge = request.getParameter("bridge");
			String oldDirection = request.getParameter("oldDirection");
			boolean flag = BrgMbrDao.getIntance().copyThisDirection(copyBridge, copyDirection, bridge, oldDirection);
			ro.setObj(flag);
			ro.ToJsp(response);
			return;
		}
		if (choice.equals("copyThisMem")) {
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			String direction = request.getParameter("direction");
			String span_no = request.getParameter("span_no");
			String copyBridge = request.getParameter("copyBridge");
			String s_id = request.getParameter("s_id");
			boolean flag = BrgMbrDao.getIntance().copyThisMem(copyBridge, direction, span_no, s_id);
			ro.setObj(flag);
			ro.ToJsp(response);
			return;
		}
		if (choice.equals("copyAllMem")) {
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			String copyBridge = request.getParameter("copyBridge");
			OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			boolean flag = BrgMbrDao.getIntance().copyAllMem(copyBridge, oc.getId());
			ro.setObj(flag);
			ro.ToJsp(response);
			return;
		}
		if (choice.equals("buildDirection")) {
			String brg_id = request.getParameter("brg_id");
			List<String> ll = BrgMbrDao.getIntance().buildDirection(brg_id);
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
		if ("getSpan_material".equals(choice)) {
			ResObj ro = new ResObj();
			List<DicBrgCardDomain> ll = BrgMbrDao.getIntance().getSpan_material();
			if (ll.size() > 0) {
				ro.setSuccess("success");
				ro.setError(0);
				ro.setObj(ll);
			} else {
				ro.setSuccess("fail");
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		if (choice.equals("buildSpan")) {
			String brg_id = request.getParameter("brg_id");
			String direction = request.getParameter("direction");
			List<String> ll = BrgMbrDao.getIntance().buildSpan(brg_id, direction);
			ResObj ro = new ResObj();
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(ll);
			ro.ToJsp(response);
			return;
		}
		if (choice.equals("isCheckAudited")) {
			ResObj ro = new ResObj();
			OperationConstruct op = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
			String audit_state = BrgMbrDao.getIntance().isCheckAudited(op.getId(), op.getPrj_id());
			if (!audit_state.equals("")) {
				ro.setError(0);
				ro.setSuccess(audit_state);
			} else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
	}
	private void initTree(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResObj ro = new ResObj();
		OperationConstruct oc = (OperationConstruct) request.getSession().getAttribute("OperationConstruct");
		
		ArrayList<BrgSpanInfo> brgSpanInfo = BrgMbrDao.getIntance().getBrgSpanInfo_direction(oc.getId());
		this.returnLL(response, brgSpanInfo);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	/** 查询桥型，构件类型，主材类型，支座类型，获取session中的桥梁编号 */
	private void queryLX(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BrgLXVO> ll = new ArrayList<BrgLXVO>();
		ll = BrgMbrDao.getIntance().queryLX(null);
		HttpSession session = request.getSession();
		OperationConstruct oc = (OperationConstruct) session.getAttribute("OperationConstruct");
		if (!(oc == null)) {
			ll.get(0).setBridge_id(oc.getId());
			this.returnLL(response, ll);
		} else {
			this.returnI(response, -1);
		}
	}

	/**
	 * 查询构件类型
	 * 
	 * @param request
	 * @param response
	 */
	private void queryMember_Type(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<DicBrgStructMemberDef> ll = null;
		ll = BrgMbrDao.getIntance().queryMemberType();
		try {
			this.returnLL(response, ll);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void queryMem_Mem_Type(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<MemMemberTypeDef> ll = null;
		String id = request.getParameter("id");
		ll = BrgMbrDao.getIntance().getMM_type(id);
		try {
			this.returnLL(response, ll);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

	/** 查询跨号 */
	private void querySpan(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BrgSpanInfoVO> ll = null;
		HttpSession session = request.getSession();
		OperationConstruct oc = (OperationConstruct) session.getAttribute("OperationConstruct");
		if (!(oc == null)) {
			ll = BrgMbrDao.getIntance().querySpan(new Object[] { oc.getId() });
			for (int ii = 0; ii < ll.size(); ii++) {
				ll.get(ii).setBrg_type_name(this.getQXName(ll.get(ii).getBrg_type_id()));
			}
		} else {
			this.returnI(response, -1);
		}
		this.returnLL(response, ll);
	}

	/**
	 * 查询跨号是否重复
	 */
	private int checkSpan(HttpServletRequest request, HttpServletResponse response, BrgSpanInfoVO bs)
			throws ServletException, IOException {
		return BrgMbrDao.getIntance()
				.checkSpan(new Object[] { bs.getBridge_id(), bs.getDirection(), bs.getSpan_no(), bs.getS_id() });
	}

	/** 增加跨号 */
	private void insertSpan(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResObj ro = new ResObj();
		int i = 0;
		String log_user=(String) request.getSession().getAttribute("username");
		String span = request.getParameter("span");
		BrgSpanInfoVO bs = JSON.parseObject(span, BrgSpanInfoVO.class);
		bs.setBrg_type_id(this.getQXId(bs.getBrg_type_name()));
		try {
			i = this.checkSpan(request, response, bs);
			if (i == -1) {
			} else {
				i = BrgMbrDao.getIntance()
						.insertKH(new Object[] { bs.getS_id(), bs.getBridge_id(), bs.getDirection(), bs.getSpan_no(),
								bs.getBrg_type_id(), bs.getSpan_line_no(), bs.getSpan_length(), bs.getSpan_material(),
								bs.getSpanning_case(), bs.getClearance() });
			}
			if (i > 0) {
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"增加跨号", "操作成功","BrgMemberServlet+insertSpan+span:"+span);
			} else {
				ro.setSuccess("fail");
				ro.setError(i);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"增加跨号", e.getMessage(),"BrgMemberServlet+insertSpan+span:"+span);
		}
		ro.ToJsp(response);
	}

	/** 修改跨号 */
	public void editSpan(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResObj ro = new ResObj();
		String log_user=(String) request.getSession().getAttribute("username");
		int i = 0;
		BrgSpanInfoVO bs = JSON.parseObject(request.getParameter("span"), BrgSpanInfoVO.class);
		bs.setBrg_type_id(this.getQXId(bs.getBrg_type_name()));
		try {
			i = this.checkSpan(request, response, bs);
			if (i == 0) {
				i = BrgMbrDao.getIntance()
						.updateSpan(new Object[] { bs.getDirection(), bs.getSpan_no(), bs.getBrg_type_id(),
								bs.getSpan_line_no(), bs.getSpan_length(), bs.getSpan_material(), bs.getSpanning_case(),
								bs.getClearance(), bs.getS_id() });
			}
			if (i > 0) {
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"修改跨号", "操作成功","BrgMemberServlet+insertSpan+span:"+request.getParameter("span"));
			} else {
				ro.setSuccess("fail");
				ro.setError(i);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"修改跨号", e.getMessage(),"BrgMemberServlet+insertSpan+span:"+request.getParameter("span"));
		}
		ro.ToJsp(response);
	}

	/** 删除跨号 */
	public void delSpan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResObj ro = new ResObj();
		String log_user=(String) request.getSession().getAttribute("username");
		int i=0;
		try {
			i=BrgMbrDao.getIntance().deleteSpan(new Object[] { request.getParameter("spanid") });
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"删除跨号", e.getMessage(),"BrgMemberServlet+delSpan+spanid:"+request.getParameter("spanid") );
		}
		if (i > 0) {
			ro.setSuccess("success");
			LogDao.getInstance().addLogInfo(log_user,"删除跨号", "操作成功","BrgMemberServlet+delSpan+spanid:"+request.getParameter("spanid") );
		} else {
			ro.setSuccess("fail");
			ro.setError(i);
		}
		ro.ToJsp(response);
	}

	/** 查询构件 */
	private void queryMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.returnLL(response, BrgMbrDao.getIntance().queryMember(new Object[] { request.getParameter("spanid") }));
	}

	/** 可视化页面查询病害 */
	private void queryBH(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.returnLL(response,
				BrgMbrDao.getIntance().queryBingHai(new Object[] { request.getParameter("bridge_id") }));

	}

	/** 增加构件 */
	private void addMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResObj ro = new ResObj();
		int i = 0;
		String log_user=(String) request.getSession().getAttribute("username");
		String r_id = UUID.randomUUID().toString().replace("-", "");
		BrgMemberVO mv = JSON.parseObject(request.getParameter("member"), BrgMemberVO.class);
		i = BrgMbrDao.getIntance().checkMember(new Object[] { mv.getS_id(), mv.getMember_no() });
		if (i == 0) {

			i = BrgMbrDao.getIntance().insertMember(new Object[] { r_id, mv.getS_id(), mv.getMember_type(),
					mv.getMember_no(), mv.getMember_desc(), mv.getMember_model() });
		}
		if (i > 0) {
			try {
				ArrayList<BrgMemberVO> brgMemberVO = new ArrayList<BrgMemberVO>();
				mv.setR_id(r_id);
				brgMemberVO.add(mv);
				if (brgMemberVO.size() == 0) {
					ro.setSuccess("fail");
				} else {
					ro.setSuccess("success");
					ro.setObj(brgMemberVO);
					LogDao.getInstance().addLogInfo(log_user,"增加构件", "操作成功","BrgMemberServlet+addMember");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加构件", e.getMessage(),"BrgMemberServlet+addMember+mv:"+mv);
			}
			ro.ToJsp(response);
		}

	}

	/** 修改构件 */
	public void editMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResObj ro = new ResObj();
		int i = 0;
		String log_user=(String) request.getSession().getAttribute("username");
		BrgMemberVO mv = JSON.parseObject(request.getParameter("member"), BrgMemberVO.class);
		try {
			if (request.getParameter("memberno").equals(mv.getMember_no())) {
			} else {
				i = BrgMbrDao.getIntance().checkMember(new Object[] { mv.getS_id(), mv.getMember_no() });
			}
			if (i == 0) {
				i = BrgMbrDao.getIntance().updateMember(new Object[] { mv.getMember_type(), mv.getMember_no(),
						mv.getMember_desc(), mv.getMember_model(), mv.getR_id() });
			}
			if (i > 0) {
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"修改构件", "操作成功","BrgMemberServlet+editMember");
			} else {
				ro.setSuccess("fail");
				ro.setError(i);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"修改构件", e.getMessage(),"BrgMemberServlet+editMember+mv:"+mv);
		}
		ro.ToJsp(response);
	}

	/** 删除构件 */
	public void delMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResObj ro = new ResObj();
		String log_user=(String) request.getSession().getAttribute("username");
		try {
			int i=BrgMbrDao.getIntance().delMember(new Object[] { request.getParameter("memberid") });
			if (i > 0) {
				ro.setSuccess("success");
				LogDao.getInstance().addLogInfo(log_user,"删除构件", "操作成功","BrgMemberServlet+delMember");
			} else {
				ro.setSuccess("fail");
				ro.setError(i);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogDao.getInstance().addLogInfo(log_user,"删除构件", e.getMessage(),"BrgMemberServlet+delMember+memberid:"+ request.getParameter("memberid"));
		}
		ro.ToJsp(response);
	}

	/** dao层return值为i的时候的操作 */
	private void returnI(HttpServletResponse response, int i) throws ServletException, IOException {
		ResObj ro = new ResObj();
		if (i > 0) {
			ro.setSuccess("success");
		} else {
			ro.setSuccess("fail");
			ro.setError(i);
		}
		ro.ToJsp(response);
	}

	/** dao层return值为ll的时候的操作 */
	private void returnLL(HttpServletResponse response, List ll) throws ServletException, IOException {
		ResObj ro = new ResObj();
		if (ll.size() == 0) {
			ro.setSuccess("fail");

		} else {
			ro.setSuccess("success");
			ro.setObj(ll);
		}
		ro.ToJsp(response);
	}

	/** 根据桥型id获得桥型名称 */
	private String getQXName(String brg_type_id) {
		String brg_type_name = null;
		brg_type_name = BrgMbrDao.getIntance().getBaseNameById(brg_type_id);
		return brg_type_name;
	}

	/** 根据桥型名称获得桥型id */
	private String getQXId(String brg_type_name) {
		String brg_type_id = null;
		brg_type_id = BrgMbrDao.getIntance().getIdByName(brg_type_name);
		return brg_type_id;
	}

	public ArrayList getAllSpanNo(String[] str) {
		ArrayList list = new ArrayList();
		if (str.length > 1) {
			for (int i = 0; i < str.length; i++) {
				String s = str[i];
				String[] arrs = s.split("-");
				int start = Integer.parseInt(arrs[0]);
				int end = Integer.parseInt(arrs[1]);
				ArrayList single = new ArrayList();
				for (int j = 0; j < end - start + 1; j++) {
					System.out.println(start + j);
					single.add(start + j + "");
				}
				list.add(single);
			}
		} else {
			String[] arrs = str[0].split("-");
			int start = Integer.parseInt(arrs[0]);
			int end = Integer.parseInt(arrs[1]);
			ArrayList single = new ArrayList();
			for (int j = 0; j < end - start + 1; j++) {
				System.out.println(start + j);
				single.add(start + j + "");
			}
			list.add(single);
		}
		return list;
	}

}
