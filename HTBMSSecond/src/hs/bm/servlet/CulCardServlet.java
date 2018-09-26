package hs.bm.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.alibaba.fastjson.JSON;

import hs.bm.bean.BrgPrjPhoto;
import hs.bm.bean.CulInfo;
import hs.bm.bean.CulPrjPhoto;
import hs.bm.bean.DicBrgCardDomain;
import hs.bm.bean.DicCulStructTypeDef;
import hs.bm.bean.DicHwInfo;
import hs.bm.bean.DicPassStructTypeDef;
import hs.bm.bean.PassInfo;
import hs.bm.bean.PassPrjPhoto;
import hs.bm.dao.BrgCardDao;
import hs.bm.dao.NewCulvetDao;
import hs.bm.dao.NewPassDao;
import hs.bm.dao.UserDao;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.BridgeCardTreeInfo;
import hs.bm.vo.Culvert_infoVO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.Pass_InfoVO;
import hs.bm.vo.Photo_path;
import hs.bm.vo.ResObj;
import hs.bm.vo.SysUsrPassRole;

/**
 * Servlet implementation class CulCardServlet
 */
public class CulCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CulCardServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
//		HwSectionStructDao hssd=new HwSectionStructDao();
//		ChkAuditDao cad = new ChkAuditDao();
		String inf = request.getParameter("inf");
		OperationConstruct op = (OperationConstruct) session.getAttribute("OperationConstruct");
		//PriInf dcd = JSON.parseObject(inf, PriInf.class);
		if (op==null)
		{
			ro.setSuccess("empty");
			ro.ToJsp(response);
			return;
		}
		/**上传图片*/
		if (type.equals("img")) {
			String cultype=(String)session.getAttribute("cultype");
			String passtype=(String)session.getAttribute("passtype");
			String hhhbs=op.getId();
			session.removeAttribute("cultype");
			session.removeAttribute("passtype");
			String result = null;
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			String card = "card";
			String uploadurl=PropertiesUtil.getPropertiesByName("rootDir");
			if(passtype==null){
				uploadurl=uploadurl + File.separator + hhhbs+ File.separator  + card ;
				File uploadPath = new File(uploadurl);
				if (!uploadPath.exists()) {
					uploadPath.mkdirs();
				}
				try {
					List<FileItem> items = upload.parseRequest(request);
					for(FileItem fileItem:items){
						if(!fileItem.isFormField()){
							File saveFile=null;
							if(cultype.equals("立面照")){
								String fileName = hhhbs+"_lmz.jpg";
								saveFile = new File(uploadPath, fileName);
								result = saveFile.getAbsolutePath();
							}else{
								String fileName = hhhbs+"_zmz.jpg";
								saveFile = new File(uploadPath, fileName);
								result = saveFile.getAbsolutePath();
							}
							InputStream in = fileItem.getInputStream();
							OutputStream out = new FileOutputStream(saveFile);
							byte[] bs = new byte[1024];
							int i= -1;
							while((i=in.read(bs))!=-1){
								out.write(bs, 0, i);
							}
							out.flush();
							out.close();
							in.close();
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(result==null){
					ro.setSuccess("fail");
				}else{
					NewCulvetDao.getInstance().storePath_culvert(result, cultype, hhhbs,op.getPrj_id());
//					cad.clearPassOrCul_Path(op.getMode(), op.getId(),  "");
					ro.setError(0);
					ro.setSuccess("success");
				}
				ro.ToJsp(response);
				return;
			}else{
				uploadurl=uploadurl+ File.separator + hhhbs+ File.separator +  card  ;
				File uploadPath = new File(uploadurl);
				if (!uploadPath.exists()) {
					uploadPath.mkdirs();
				}
				try {
					List<FileItem> items = upload.parseRequest(request);
					for(FileItem fileItem:items){
						if(!fileItem.isFormField()){
							File saveFile=null;
							if(passtype.equals("立面照")){
								String fileName = hhhbs+"_lmz.jpg";
								saveFile = new File(uploadPath, fileName);
								result = saveFile.getAbsolutePath();
							}else{
								String fileName = hhhbs+"_zmz.jpg";
								saveFile = new File(uploadPath, fileName);
								result = saveFile.getAbsolutePath();
							}
							InputStream in = fileItem.getInputStream();
							OutputStream out = new FileOutputStream(saveFile);
							byte[] bs = new byte[1024];
							int i= -1;
							while((i=in.read(bs))!=-1){
								out.write(bs, 0, i);
							}
							out.flush();
							out.close();
							in.close();
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(result==null){
					ro.setSuccess("fail");
				}else{
					NewPassDao.getInstance().storePath_pass(result, passtype, hhhbs,op.getPrj_id());
//					cad.clearPassOrCul_Path(op.getMode(), op.getId(),  "");
					ro.setError(0);
					ro.setSuccess("success");
				}
				ro.ToJsp(response);
				return;
			}
		}
		if (type.equals("culvert_type"))
		{
			ArrayList<DicCulStructTypeDef> list =null;
//					hssd.getCul_type();
			if (list.size()>0)
			{
				ro.setError(0);
				ro.setObj(list);
				ro.setSuccess("success");
			}else {
				ro.setError(1);
				ro.setSuccess("fail");
			}
			ro.ToJsp(response);
		}
		if (type.equals("selectc")){
			String cultype=request.getParameter("britype");
			session.setAttribute("cultype", cultype);
			ro.setError(0);
			ro.setSuccess("success");
			ro.ToJsp(response);
			}
		
		if (type.equals("selectp")){
			String passtype=request.getParameter("britype");
			session.setAttribute("passtype", passtype);
			ro.setError(0);
			ro.setSuccess("success");
			ro.ToJsp(response);
			}
		
		/**/
		if(type.equals("initTableCulvert")){
			ArrayList<Culvert_infoVO> ll =NewCulvetDao.getInstance().getCulInfoData(op.getId());
//					hssd.ShowCulInfo(dcd);
			if(ll.size()>0){
				ro.setError(0);
				ro.setSuccess("success");
				ro.setObj(ll);
			}
			ro.ToJsp(response);
			return;
		}
	

	if(type.equals("initTablePass")){
		ArrayList<Pass_InfoVO> ll =NewPassDao.getInstance().getPass_InfoVOData(op.getId()); 
//				hssd.ShowPassInfo(dcd);
		if(ll.size()>0){
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(ll);
		}
		ro.ToJsp(response);
		return;
	}
	
	if(type.equals("editCulvert")){
		String culvert_id = op.getId();
		CulInfo entity = new CulInfo();
		String edit_highway_name = request.getParameter("edit_highway_name");
		String edit_culvert_name = request.getParameter("edit_culvert_name");
		String edit_stub_no = request.getParameter("edit_stub_no");
		String edit_culvert_no = request.getParameter("edit_culvert_no");
		String edit_span_build = request.getParameter("edit_span_build");
		String edit_culvert_type = request.getParameter("edit_culvert_type");
		String edit_location = request.getParameter("edit_location");
		if(edit_location.equals("")||edit_location==null){
			entity.setLatitude("");
			entity.setLongitude("");
		}else{
			entity.setLongitude(request.getParameter("edit_location").split(",")[0]);
			entity.setLatitude(request.getParameter("edit_location").split(",")[1]);
		}
		entity.setHighway_id(edit_highway_name);
		entity.setCulvert_name(edit_culvert_name);
		entity.setStub_no(edit_stub_no);
		entity.setCulvert_no(edit_culvert_no);
		entity.setSpan_build(edit_span_build);
		entity.setCulvert_type(edit_culvert_type);
		entity.setCulvert_id(op.getId());
		entity.setZone_id(request.getParameter("edit_zone"));
		entity.setSection_id(request.getParameter("edit_section"));
		entity.setManage_id(request.getParameter("edit_org"));
		int i = NewCulvetDao.getInstance().updateCulvert_Info(entity);
//				hssd.changeCulInfo(line_name, stub_no, maintain_org, culvert_type, culvert_id, culvert_aperture);
		boolean flag =false;
		if(i>0){
			flag = true;
//			cad.clearPassOrCul_Path(op.getMode(), op.getId(),  "");
			op.setLine_name(request.getParameter("highway_name"));
			op.setLine_no(request.getParameter("edit_highway_name"));
			op.setSection_id(request.getParameter("edit_section"));
			op.setSection_name(request.getParameter("section"));
			op.setZone_id(request.getParameter("edit_zone"));
			op.setZone_name(request.getParameter("zone"));
			op.setManage_id(request.getParameter("edit_org"));
			op.setManage_name(request.getParameter("org"));
			op.setSpan_build(request.getParameter("edit_span_build"));
			op.setName(edit_culvert_name);
			session.setAttribute("OperationConstruct", op);
		}
		if(flag){
			ro.setError(0);
			ro.setSuccess("success");
		}
		ro.ToJsp(response);
		return;
	}
	
	if(type.equals("editPass")){
		PassInfo entity = new PassInfo();
		entity.setPass_id(op.getId());
		entity.setHighway_id(request.getParameter("edit_highway_name"));
		entity.setPass_name(request.getParameter("edit_pass_name"));
		entity.setStub_no(request.getParameter("edit_stub_no"));
		entity.setPass_no(request.getParameter("edit_pass_no"));
		entity.setSkew_angle(request.getParameter("edit_skew_angle"));
		entity.setSpan_build(request.getParameter("edit_span_build"));
		entity.setConstruct_ym(request.getParameter("edit_build_year"));
		entity.setPass_type(request.getParameter("edit_pass_type"));
		entity.setUse_type(request.getParameter("edit_use_type"));
		entity.setManage_id(request.getParameter("edit_org"));
		entity.setZone_id(request.getParameter("edit_zone"));
		entity.setSection_id(request.getParameter("edit_section"));
		String edit_location = request.getParameter("edit_location");
		if(edit_location.equals("")||edit_location==null){
			entity.setLatitude("");
			entity.setLongitude("");
		}else{
			entity.setLongitude(request.getParameter("edit_location").split(",")[0]);
			entity.setLatitude(request.getParameter("edit_location").split(",")[1]);
		}
		int i = NewPassDao.getInstance().upDatePassInfo(entity) ;
		boolean flag =false;
		if(i>0){
			flag = true;
//			cad.clearPassOrCul_Path(op.getMode(), op.getId(), "");
			op.setLine_name(request.getParameter("highway_name"));
			op.setLine_no(request.getParameter("edit_highway_name"));
			op.setSection_id(request.getParameter("edit_section"));
			op.setSection_name(request.getParameter("section"));
			op.setZone_id(request.getParameter("edit_zone"));
			op.setZone_name(request.getParameter("zone"));
			op.setManage_id(request.getParameter("edit_org"));
			op.setManage_name(request.getParameter("org"));
			op.setSpan_build(request.getParameter("edit_span_build"));
			op.setName(request.getParameter("edit_pass_name"));
			session.setAttribute("OperationConstruct", op);
		}
		if(flag){
			ro.setError(0);
			ro.setSuccess("success");
		}
		ro.ToJsp(response);
		return;
	}
	if(type.equals("initCulvertPhoto")){
		ArrayList<CulPrjPhoto> entity = new ArrayList<CulPrjPhoto>();
		entity = NewCulvetDao.getInstance().getPhotoPath(op.getId());
		Photo_path pp = new Photo_path();
		for (int i = 0; i < entity.size(); i++)
		{
			if (entity.get(i).getPhoto_type().equals("face"))
			{
				pp.setFace_path(entity.get(i).getPath());
			}else{
				pp.setFacade_path(entity.get(i).getPath());
			}
		}
		if (entity.size()>0)
		{
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(pp);
		}else{
			ro.setError(1);
			ro.setSuccess("fail");
		}
		ro.ToJsp(response);
		return;
	}
	if(type.equals("initPassPhoto")){
		ArrayList<PassPrjPhoto> entity = new ArrayList<PassPrjPhoto>();
		entity = NewPassDao.getInstance().getPhotoPath(op.getId());
		Photo_path pp = new Photo_path();
		for (int i = 0; i < entity.size(); i++)
		{
			if (entity.get(i).getPhoto_type().equals("face"))
			{
				pp.setFace_path(entity.get(i).getPath());
			}else{
				pp.setFacade_path(entity.get(i).getPath());
			}
		}
		if (entity.size()>0)
		{
			ro.setError(0);
			ro.setSuccess("success");
			ro.setObj(pp);
		}else{
			ro.setError(1);
			ro.setSuccess("fail");
		}
		ro.ToJsp(response);
		return;
	}
	
}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}