package hs.bm.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.druid.sql.ast.statement.SQLIfStatement.Else;
import com.alibaba.fastjson.JSON;

import hs.bm.bean.ChkProjectInfo;
import hs.bm.bean.SysOrgInfo;
import hs.bm.bean.SysOrgUsrInfo;
import hs.bm.bean.SysUsrUsrInfo;
import hs.bm.bean.SysZoneInfo;
import hs.bm.dao.CheckBridgeDao;
import hs.bm.dao.CopyCulvertDao;
import hs.bm.dao.CopyDao;
import hs.bm.dao.CopyPassDao;
import hs.bm.dao.GetLogDao;
import hs.bm.dao.LogDao;
import hs.bm.dao.PrjMgrDao;
import hs.bm.dao.StructMgrDao;
import hs.bm.util.GetMacAndNetCard;
import hs.bm.vo.ResObj;
import hs.bm.vo.StructInformation;
import hs.bm.vo.ZoneInfoVo;

public class PrjMgrServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		String log_user=(String) request.getSession().getAttribute("username");

		if (type.equals("initAllStructTable"))
		{
			List<StructInformation> ll = PrjMgrDao.getInstance().initAllStructTable();
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

		if (type.equals("initStructTable"))
		{
			String chk_type = request.getParameter("chk_type");
			String maintain_org = request.getParameter("maintain_org");
			List<StructInformation> ll = PrjMgrDao.getInstance().initStructTable(chk_type,maintain_org);
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

		if (type.equals("initStructTable2"))
		{
			String chk_type = request.getParameter("chk_type");
			String zoneId = request.getParameter("zoneId");
			List<StructInformation> ll = PrjMgrDao.getInstance().initStructTable2(zoneId,chk_type);
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
		
		if (type.equals("initPrjTable"))
		{
			HttpSession session = request.getSession();
			String orgid = (String) session.getAttribute("orgid");
			String userRole = (String) session.getAttribute("userRole");
			
			List<ChkProjectInfo> ll = new ArrayList<>();
			if ("orgAdmin".equals(userRole) || "orgCharge".equals(userRole) /*|| "superAdmin".equals(userRole)*/
					|| "orgDuty".equals(userRole) || "orgEngineer".equals(userRole)) {
				orgid=orgid.substring(0,4)+"%";
				ll = PrjMgrDao.getInstance().initPrjTable2(orgid);
			}else {
				ll = PrjMgrDao.getInstance().initPrjTable();
			}
			
			
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

		if (type.equals("initUser"))
		{
			List<String> ll = PrjMgrDao.getInstance().initUser();
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

		if (type.equals("initOrg"))
		{
			List<SysOrgInfo> ll = PrjMgrDao.getInstance().initOrg();
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
		if (type.equals("lookStruct"))
		{
			String prj_id = request.getParameter("prj_id");
			Map<String, List<String>> map = PrjMgrDao.getInstance().getStruct(prj_id);
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}

		if(type.equals("getbridgeCount")){
			String prj_id = request.getParameter("prj_id");
			Map<String,Integer> map = PrjMgrDao.getInstance().getStructCount(prj_id);
			ro.setSuccess("success");
			ro.setError(0);
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}
		
		if (type.equals("saveNewPrj"))
		{
			try {
				HttpSession session = request.getSession();
				String prj_desc = request.getParameter("prj_desc");
				String chk_type = request.getParameter("chk_type");
				String org_id = request.getParameter("org_id");
				String ht=request.getParameter("ht");
				String maintain_org = request.getParameter("maintain_org");
				if(chk_type.equals("often")){
					maintain_org=(String) session.getAttribute("orgname");
				}
				String prj_charge_man = request.getParameter("prj_charge_man");
				String prj_member = request.getParameter("prj_member");
				String structsJSON = request.getParameter("structs");
				String zone_id = request.getParameter("zoneId");
				List<StructInformation> ll = JSON.parseArray(structsJSON, StructInformation.class);
				String prj_times = GetMacAndNetCard.getMac(GetMacAndNetCard.getBase64Decodec(GetMacAndNetCard.readLicense()), "times");
				String date = GetMacAndNetCard.getMac(GetMacAndNetCard.getBase64Decodec(GetMacAndNetCard.readLicense()), "limitDate");
				String start = date.split("!")[0];
				String end = date.split("!")[1];
				if(end.equals("#")){
					String prj_id = UUID.randomUUID().toString().replaceAll("-", "");
					int i = PrjMgrDao.getInstance().saveNewPrj(prj_id, prj_desc, chk_type, maintain_org,zone_id, prj_charge_man, prj_member, ll,ht);
					switch (i)
					{
					case 0:
						ro.setError(1);
						ro.setSuccess("fail");
						break;
					case -1:
						ro.setError(2);
						ro.setSuccess("fail");
						break;
					case -2:
						ro.setError(3);
						ro.setSuccess("fail");
						break;
					default:
						ro.setError(0);
						ro.setObj(prj_id);
						ro.setSuccess("success");
						ro.ToJsp(response);
						break;
					}
				}else{
					int sum = PrjMgrDao.getInstance().getPrj_Struct_No_sum(start,end);
					/* 添加项目超限 */
					if (Integer.parseInt(prj_times)  < sum+ ll.size())
					{
						ro.setError(4);
						ro.setSuccess("fail");
						ro.ToJsp(response);
					}
					/* 未超限 */
					else
					{
						String prj_id = UUID.randomUUID().toString().replaceAll("-", "");
						int i = PrjMgrDao.getInstance().saveNewPrj(prj_id, prj_desc, chk_type, maintain_org, null, prj_charge_man, prj_member, ll,ht);
						switch (i)
						{
						case 0:
							ro.setError(1);
							ro.setSuccess("fail");
							break;
						case -1:
							ro.setError(2);
							ro.setSuccess("fail");
							break;
						case -2:
							ro.setError(3);
							ro.setSuccess("fail");
							break;
						default:
							ro.setError(0);
							ro.setObj(prj_id);
							ro.setSuccess("success");
							ro.ToJsp(response);
							break;
						}
					}
				}
				LogDao.getInstance().addLogInfo(log_user,"增加成功", "PrjMgrServlet+saveNewPrj","PrjMgrServlet");
			} catch (NumberFormatException e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "PrjMgrServlet+saveNewPrj",e.getMessage()+" *** ");
			}
			
			return;
		}

		if (type.equals("addStruct"))
		{
			try {
				String prj_times = GetMacAndNetCard.getMac(GetMacAndNetCard.getBase64Decodec(GetMacAndNetCard.readLicense()), "times");
				String date = GetMacAndNetCard.getMac(GetMacAndNetCard.getBase64Decodec(GetMacAndNetCard.readLicense()), "limitDate");
				String start = date.split("!")[0];
				String end = date.split("!")[1];
				String structsJSON = request.getParameter("structs");
				String chk_type = request.getParameter("chk_type");
				String prj_id = request.getParameter("prj_id");
				String prj_charge_man = request.getParameter("prj_charge_man");
				List<StructInformation> ll = JSON.parseArray(structsJSON, StructInformation.class);
				if(end.equals("#")){
					int i = PrjMgrDao.getInstance().addStruct(prj_id, chk_type, ll, prj_charge_man);
					switch (i)
					{
					case 0:
						ro.setError(1);
						ro.setSuccess("fail");
						break;
					case -1:
						ro.setError(2);
						ro.setSuccess("fail");
						break;
					case -2:
						ro.setError(3);
						ro.setSuccess("fail");
						break;
					default:
						for (StructInformation sf : ll)
						{
							if (sf.getStruct_mode().equals("bridge"))
							{
								CopyDao.getInstance().startCopyOne(prj_id, chk_type, sf.getStruct_id());
							} else if (sf.getStruct_mode().equals("pass"))
							{
								CopyPassDao.getInstance().startCopyOne(prj_id, chk_type, sf.getStruct_id());
							} else if (sf.getStruct_mode().equals("culvert"))
							{
								CopyCulvertDao.getInstance().startCopyOne(prj_id, chk_type, sf.getStruct_id());
							}
						}
						ro.setError(0);
						ro.setObj(prj_id);
						ro.setSuccess("success");
						ro.ToJsp(response);
						break;
					}
				}else{
					int sum = PrjMgrDao.getInstance().getPrj_Struct_No_sum(start,end);
					if (Integer.parseInt(prj_times)  < sum+ ll.size())
					{
						ro.setError(4);
						ro.setSuccess("fail");
						ro.ToJsp(response);
					} else
					{

						
						int i = PrjMgrDao.getInstance().addStruct(prj_id, chk_type, ll, prj_charge_man);
						switch (i)
						{
						case 0:
							ro.setError(1);
							ro.setSuccess("fail");
							break;
						case -1:
							ro.setError(2);
							ro.setSuccess("fail");
							break;
						case -2:
							ro.setError(3);
							ro.setSuccess("fail");
							break;
						default:
							for (StructInformation sf : ll)
							{
								if (sf.getStruct_mode().equals("bridge"))
								{
									CopyDao.getInstance().startCopyOne(prj_id, chk_type, sf.getStruct_id());
								} else if (sf.getStruct_mode().equals("pass"))
								{
									CopyPassDao.getInstance().startCopyOne(prj_id, chk_type, sf.getStruct_id());
								} else if (sf.getStruct_mode().equals("culvert"))
								{
									CopyCulvertDao.getInstance().startCopyOne(prj_id, chk_type, sf.getStruct_id());
								}
							}
							ro.setError(0);
							ro.setObj(prj_id);
							ro.setSuccess("success");
							ro.ToJsp(response);
							break;
						}
					}
				}
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "PrjMgrServlet+addStruct","addStruct");
			} catch (NumberFormatException e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "PrjMgrServlet+addStruct",e.getMessage()+" *** ");
			}
			return;
		}

		if (type.equals("editPrj"))
		{
			try {
				String prj_charge_man = request.getParameter("prj_charge_man");
				String prj_member = request.getParameter("prj_member");
				String prj_id = request.getParameter("prj_id");
				int i = PrjMgrDao.getInstance().editPrj(prj_charge_man, prj_member, prj_id);
				switch (i)
				{
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				case -3:
					ro.setError(4);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					break;
				}
				LogDao.getInstance().addLogInfo(log_user,"修改成功", "PrjMgrServlet+editPrj","editPrj");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "PrjMgrServlet+editPrj",e.getMessage()+" *** ");
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("endPrj"))
		{
			String prj_id = request.getParameter("prj_id");
			int i = PrjMgrDao.getInstance().endPrj(prj_id);
		//@author xianing//项目完成时候，增加完成记录到表中	
			if(i>0){
				String info = CheckBridgeDao.getInstance().getPrjDesc(prj_id);
//				GetLogDao.getInstance().setLog(info+ "项目完成");
			}
		
			
			switch (i)
			{
			case -1:
				ro.setError(2);
				ro.setSuccess("fail");
				break;
			case -3:
				ro.setError(4);
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

		if (type.equals("delPrj"))
		{
			try {
				String prj_id = request.getParameter("prj_id");
				int i = PrjMgrDao.getInstance().delPrj(prj_id);
				switch (i)
				{
				case -1:
					ro.setError(2);
					ro.setSuccess("fail");
					break;
				case -3:
					ro.setError(4);
					ro.setSuccess("fail");
					break;
				default:
					ro.setError(0);
					ro.setSuccess("success");
					break;
				}
				LogDao.getInstance().addLogInfo(log_user,"删除成功", "PrjMgrServlet+delPrj","delPrj");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"删除失败", "PrjMgrServlet+delPrj",e.getMessage()+" *** ");
			}
			ro.ToJsp(response);
			return;
		}

		if (type.equals("copy"))
		{
			String prj_id = request.getParameter("prj_id");
			String chk_type = request.getParameter("chk_type");
			CopyDao.getInstance().startCopy(prj_id, chk_type);
			CopyCulvertDao.getInstance().startCopy(prj_id, chk_type);
			CopyPassDao.getInstance().startCopy(prj_id, chk_type);
			ro.setSuccess("success");
			ro.setError(0);
			ro.ToJsp(response);
			return;
		}

		if (type.equals("initUser2"))
		{
			String zoneId = request.getParameter("checkZone");
			
			List<String> orgCharge = PrjMgrDao.getInstance().initStruPersion("orgDuty", zoneId);
			List<String> orgEngineer = PrjMgrDao.getInstance().initStruPersion("orgEngineer", zoneId);
			List<ArrayList<String>> list =new ArrayList<>();
			list.add((ArrayList<String>) orgCharge);
			list.add((ArrayList<String>) orgEngineer);
			if (orgCharge == null||orgEngineer==null)
			{
				ro.setError(2);
			} else if (orgCharge.size() > 0&&orgEngineer.size()>0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(list);
				
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		
		if (type.equals("initCheckPeople"))
		{
			
			List<String> guests = PrjMgrDao.getInstance().initCheckPeople();
			if (guests == null)
			{
				ro.setError(2);
			} else if (guests.size() > 0&&guests.size()>0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(guests);
				
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		
		if (type.equals("initZone"))
		{
			HttpSession session = request.getSession();
			//String userRole = (String) session.getAttribute("userRole");
			String username = (String) session.getAttribute("username");
			String orgid =  (String) session.getAttribute("orgid");
			
			List<SysZoneInfo> sysZoneInfos = StructMgrDao.getInstance().initZoneByOrgId(orgid);
			
			if (sysZoneInfos==null)
			{
				ro.setError(2);
			} else if (sysZoneInfos.size()>0)
			{
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(sysZoneInfos);
				
			} else
			{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("initZoneDailyPrj"))
		{
			String orgid = request.getParameter("orgid");
			
			List<ZoneInfoVo> sysZoneInfos = new PrjMgrDao().initZoneDailyPrj(orgid);
			if(sysZoneInfos.size()>0){
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(sysZoneInfos);	
			}else{
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
			return;
		}
		if (type.equals("updateDailyPrj"))
		{
			try {
				String prj_charge_man = request.getParameter("prjChargeMan");
				String check_people = request.getParameter("checkPeople");
				String zone_id = request.getParameter("zone_id");
				
				int i = new PrjMgrDao().updateSysZoneInfo(check_people,prj_charge_man,zone_id);
				if(i>0){
					ro.setError(0);
					ro.setSuccess("success");
				}else{
					ro.setError(1);
					ro.setSuccess("fail");
				}
				LogDao.getInstance().addLogInfo(log_user,"修改成功", "PrjMgrServlet+updateDailyPrj","updateDailyPrj");
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改失败", "PrjMgrServlet+updateDailyPrj",e.getMessage()+" *** ");
			}
			ro.ToJsp(response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
