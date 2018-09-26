package hs.bm.servlet;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgCardDocument;
import hs.bm.bean.BrgCardStructTech;
import hs.bm.bean.CulInfo;
import hs.bm.bean.DicHwInfo;
import hs.bm.bean.DicManageOrg;
import hs.bm.bean.DicManageSection;
import hs.bm.bean.DicManageZone;
import hs.bm.bean.PassInfo;
import hs.bm.bean.SysOrgInfo;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.LogDao;
import hs.bm.dao.NewBrgDao;
import hs.bm.dao.NewCulvetDao;
import hs.bm.dao.NewPassDao;
import hs.bm.util.IDtool;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.ResObj;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewBrgServlet extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	
	public NewBrgServlet()
	{
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String type = req.getParameter("type");
		ResObj ro = new ResObj();
		NewBrgDao nbd = new NewBrgDao();
		String log_user=(String) req.getSession().getAttribute("username");
		if (type.equals("init_maintain_org"))
		{
			ArrayList<SysOrgInfo> list = nbd.init_maintain_org();
			if (list.size()!=0)
			{
				ro.setObj(list);
				ro.setError(0);
				ro.setSuccess("success");
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(resp);
		}
		if (type.equals("init_section_id"))
		{
			String manage_id= req.getParameter("id");
			ArrayList<DicManageSection> list= nbd.init_section(manage_id);
			ro.setObj(list);
			ro.setError(0);
			ro.setSuccess("success");
			ro.ToJsp(resp);
			
		}
		if (type.equals("init_zone_id"))
		{
			String manage_id= req.getParameter("id");
			ArrayList<DicManageZone> list = nbd.init_manage_zone(manage_id);
			ro.setObj(list);
			ro.setError(0);
			ro.setSuccess("success");
			ro.ToJsp(resp);
		}
		if (type.equals("init_line"))
		{
			ArrayList<DicHwInfo> list = nbd.init_line();
			if (list.size() !=0)
			{
				ro.setObj(list);
				ro.setError(0);
				ro.setSuccess("success");
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(resp);
		}
		if (type.equals("new_brg"))
		{
			try {
				BrgCardAdminId bcai = new BrgCardAdminId();
				bcai.setBridge_id(IDtool.getUUID().replace("-", ""));
				bcai.setHighway_id(req.getParameter("new_highway_name"));
				bcai.setManage_id(req.getParameter("new_maintain_org"));
				bcai.setSection_id(req.getParameter("new_section_id"));
				bcai.setZone_id(req.getParameter("new_zone_id"));
				bcai.setBridge_no(req.getParameter("new_brg_no"));
				bcai.setBridge_name(req.getParameter("new_brg_name"));
				bcai.setBridge_pile_no(req.getParameter("new_pier_no"));
				bcai.setSpan_build(req.getParameter("new_span_build"));
				bcai.setBridge_mode(req.getParameter("new_bridge_mode"));
				bcai.setMain_span(req.getParameter("new_main_span"));
				String location = req.getParameter("new_location");
				if(location.equals("")||location==null){
					bcai.setLatitude("");
					bcai.setLongitude("");
				}else{
					bcai.setLatitude(req.getParameter("new_location").split(",")[1]);
					bcai.setLongitude(req.getParameter("new_location").split(",")[0]);
				}
				int i = nbd.insertBrg_card_admin_id(bcai);
				if (i>0)
				{
					BrgCardStructTech brgCardStructTech = new BrgCardStructTech();
					brgCardStructTech.setBridge_id(bcai.getBridge_id());
					i = nbd.insertBrgCardStructTech(brgCardStructTech);
				}
				if(i>0){
					BrgCardDocument brgCardDocument = new BrgCardDocument();
					brgCardDocument.setBridge_id(bcai.getBridge_id());
					i = nbd.insertbrgCardDocument(brgCardDocument);
				}
				if(i>0){
					i = nbd.insertBrgCardConstructPrjMemo(bcai.getBridge_id());
					BrgCardDao.getInstance().addTop(bcai.getBridge_id(), IDtool.getUUID().replace("-", ""));
					int times = 2;
					for (int j = 0; j < times; j++)
					{
						BrgCardDao.getInstance().addDown(bcai.getBridge_id(), IDtool.getUUID().replace("-", ""));
					}
				}
				if(i>0){
					ro.setSuccess("success");
					ro.setError(0);
					LogDao.getInstance().addLogInfo(log_user,"增加成功", "NewBrgServlet+new_brg","new_brg");
				}else{
					ro.setSuccess("fail");
					ro.setError(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "NewBrgServlet+new_brg",e.getMessage());
			}
			ro.ToJsp(resp);
		}
		if(type.equals("new_cul")){
			try {
				CulInfo ci = new CulInfo();
				ci.setCulvert_id(IDtool.getUUID().replace("-", ""));
				ci.setCulvert_no(req.getParameter("new_culvert_no"));
				ci.setCulvert_name(req.getParameter("new_culvert_name"));
				ci.setHighway_id(req.getParameter("new_highway_name"));
				ci.setStub_no(req.getParameter("new_stub_no"));
				ci.setManage_id(req.getParameter("new_manage_org"));
				ci.setSection_id(req.getParameter("new_section_id"));
				ci.setZone_id(req.getParameter("new_zone_id"));
				String location = req.getParameter("new_location");
				if(location.equals("")||location==null){
					ci.setLongitude("");
					ci.setLatitude("");
				}else
				{
					ci.setLongitude(req.getParameter("new_location").split(",")[0]);
					ci.setLatitude(req.getParameter("new_location").split(",")[1]);
				}
				int i = NewCulvetDao.getInstance().insertCul_Info(ci);
				if (i>0)
				{
					ro.setSuccess("success");
					ro.setError(0);
					LogDao.getInstance().addLogInfo(log_user,"增加成功", "NewBrgServlet+new_cul","new_cul");
				}else {
					ro.setError(1);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "NewBrgServlet+new_cul",e.getMessage());
			}
			ro.ToJsp(resp);
		}
		if(type.equals("new_pass")){
			try {
				PassInfo pi = new PassInfo();
				pi.setPass_id(IDtool.getUUID().replace("-", ""));
				pi.setPass_no(req.getParameter("new_pass_no"));
				pi.setPass_name(req.getParameter("new_pass_name"));
				pi.setHighway_id(req.getParameter("new_highway_name"));
				pi.setStub_no(req.getParameter("new_stub_no"));
				pi.setManage_id(req.getParameter("new_manage_org"));
				pi.setSection_id(req.getParameter("new_section_id"));
				pi.setZone_id(req.getParameter("new_zone_id"));
				String location =req.getParameter("new_location");
				if(location.equals("")||location==null){
					pi.setLongitude("");
					pi.setLatitude("");
				}else{
					pi.setLongitude(req.getParameter("new_location").split(",")[0]);
					pi.setLatitude(req.getParameter("new_location").split(",")[1]);
				}
				int i = NewPassDao.getInstance().insertCul_Info(pi);
				if (i>0)
				{
					ro.setSuccess("success");
					ro.setError(0);
					LogDao.getInstance().addLogInfo(log_user,"增加成功", "NewBrgServlet+new_pass","new_pass");
				}else {
					ro.setError(1);
					ro.setSuccess("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"增加失败", "NewBrgServlet+new_pass",e.getMessage());
			}
			ro.ToJsp(resp);
		}
		if(type.equals("getHighway_no"))
		{
			String highway_id = req.getParameter("highway_id");
			ArrayList<DicHwInfo> dicHwInfo= NewBrgDao.getInstance().getHighway_no(highway_id);
			if (dicHwInfo.size()>0)
			{
				ro.setSuccess("success");
				ro.setObj(dicHwInfo);
				ro.setError(0);
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(resp);
		}
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doGet(req, resp);
	}
	
	
}
