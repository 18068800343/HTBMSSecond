package hs.bm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import hs.bm.bean.DicCulStructTypeDef;
import hs.bm.bean.DicPassStructTypeDef;
import hs.bm.dao.DicStructTypeDao;
import hs.bm.vo.BrgStructTypeVO;
import hs.bm.vo.ResObj;

public class DicStructTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DicStructTypeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		
		if(type.equals("initBridgeType")){
			List<BrgStructTypeVO> ll = DicStructTypeDao.getInstance().initBridgeType();
			if(ll==null){
				ro.setError(2);
			}else if(ll.size()>0){
					ro.setError(0);
					ro.setSuccess("success");
					ro.setObj(ll);
			}else{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("initCulvertType")){
			List<DicCulStructTypeDef> ll = DicStructTypeDao.getInstance().initCulvertType();
			if(ll==null){
				ro.setError(2);
			}else if(ll.size()>0){
					ro.setError(0);
					ro.setSuccess("success");
					ro.setObj(ll);
			}else{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		if(type.equals("initPassType")){
			List<DicPassStructTypeDef> ll = DicStructTypeDao.getInstance().initPassType();
			if(ll==null){
				ro.setError(2);
			}else if(ll.size()>0){
					ro.setError(0);
					ro.setSuccess("success");
					ro.setObj(ll);
			}else{
				ro.setError(1);
			}
			ro.ToJsp(response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
