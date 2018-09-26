package hs.bm.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import hs.bm.dao.Eval04Dao;
import hs.bm.dao.LogDao;
import hs.bm.dao.MyDataOperation;
import hs.bm.dao.MyDataSource;
import hs.bm.util.CMDUtil;
import hs.bm.vo.Eval04VO;
import hs.bm.vo.OperationConstruct;
import hs.bm.vo.ResObj;

public class Eval04Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String choice=request.getParameter("choice");
		String log_user=(String) request.getSession().getAttribute("username");
		if(choice.equals("1")){
			queryEval04(request,response);
		}else if(choice.equals("2")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			Map<String, String> map = Eval04Dao.getInstance().getScore(oc.getPrj_id(), oc.getId());
			/*if(map.get("score_clean")==null || map.get("score_clean").equals("") || map.get("score_fix")==null || map.get("score_fix").equals("")){
				ResObj ro = new ResObj();
				ro.setSuccess("fail");;
				ro.setError(4);
				ro.ToJsp(response);
			}else{*/
				completeAss(request,response);
			//}
		}
		if(choice.equals("buildPDF")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			String path = CMDUtil.buildEval(oc.getPrj_id(), oc.getId(), "2004", oc.getChk_type());
			String sql = "UPDATE eva_brg_rec set pdf=? where prj_id=? and bridge_id=? and ER_STD ='2004'";
			MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
			dataOperation.executeUpdate(sql, new String[]{path, oc.getPrj_id(), oc.getId() });
			dataOperation.close();
			return;
		}
		
		if(choice.equals("forceEval")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			boolean flag = CMDUtil.forceEval(oc.getPrj_id(), oc.getId(), "2004", oc.getChk_type());
			System.out.println(flag);
			ResObj ro = new ResObj();
			ro.setSuccess("success");;
			ro.setError(0);
			ro.setObj(flag);
			ro.ToJsp(response);
			return;
		}
		
		if(choice.equals("evaRes")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			String level = Eval04Dao.getInstance().getLevel(oc.getPrj_id(), oc.getId());
			System.out.println(level);
			ResObj ro = new ResObj();
			ro.setSuccess("success");;
			ro.setError(0);
			ro.setObj(level);
			ro.ToJsp(response);
			return;
		}
		
		if(choice.equals("getScore")){
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			Map<String, String> map = Eval04Dao.getInstance().getScore(oc.getPrj_id(), oc.getId());
			ResObj ro = new ResObj();
			ro.setSuccess("success");;
			ro.setError(0);
			ro.setObj(map);
			ro.ToJsp(response);
			return;
		}
		
		if(choice.equals("setScore")){
			ResObj ro = new ResObj();
			String score_clean = request.getParameter("score_clean");
			String score_fix = request.getParameter("score_fix");
			OperationConstruct oc = (OperationConstruct)request.getSession().getAttribute("OperationConstruct");
			try {
				int i = Eval04Dao.getInstance().setScore(score_clean, score_fix, oc.getPrj_id(), oc.getId());
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
					LogDao.getInstance().addLogInfo(log_user,"修改", "操作成功","Eval04Servlet+setScore");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				LogDao.getInstance().addLogInfo(log_user,"修改", e.getMessage(),"Eval04Servlet+setScore+score_clean:"+score_clean+"+score_fix:"+score_fix+"+prj_id:"+oc.getPrj_id()+"+id:"+oc.getId());
			}
			ro.ToJsp(response);
			return;
 		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * 查询04评定中桥梁中有病害的构件和所对应的指标
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryEval04(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		OperationConstruct oc=(OperationConstruct)session.getAttribute("OperationConstruct");
		if(!(oc==null)){
		this.returnLL(response, Eval04Dao.getInstance().queryEval04(new Object[]{oc.getId(),oc.getPrj_id(),oc.getId()}));
		
		}else{
			this.returnI(response, -1);
		}
		
	
	}
	
	/**
	 * 完成评定按钮
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void completeAss(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		int i=0;
		String eval04=request.getParameter("value");
		List<Eval04VO> ll=JSON.parseArray(eval04, Eval04VO.class);
		Eval04Dao ed=new Eval04Dao();
		for(int ii=0;ii<ll.size();ii++){
			 i=ed.updateValue(new Object[]{ll.get(ii).getIiv().get(0).getValue(),ll.get(ii).getIiv().get(1).getValue(),ll.get(ii).getIiv().get(2).getValue(),ll.get(ii).getPrj_no(),ll.get(ii).getBridge_no(),ll.get(ii).getComponent_id()});
		}
		i=ed.updateEvaluationRec(new Object[]{1,this.dateTime(1),ll.get(0).getEr_no(),ll.get(0).getEr_std()});
		this.returnI(response, i);
		
	}
	
	/**dao层return值为i的时候的操作*/
	private void returnI(HttpServletResponse response,int i)throws ServletException, IOException{
		 ResObj ro=new ResObj();
		if(i>0){
			ro.setSuccess("success");
		}else{
			ro.setSuccess("fail");
			ro.setError(i);
		}
		ro.ToJsp(response);
	}
	/**dao层return值为ll的时候的操作*/
	private void returnLL(HttpServletResponse response,List<Eval04VO> list)throws ServletException, IOException{
		ResObj ro=new ResObj();
		if(list==null||list.size()==0){
			ro.setSuccess("fail");
			
		}else{
			ro.setSuccess("success");
			ro.setObj(list);
		}
		 ro.ToJsp(response);
	}
	
	/**时间格式*/
	private String dateTime(int i){
		String dateTime=null;
		if(i==0){
			dateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		}else if(i==1){
			dateTime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}else if(i==2){
			dateTime=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒").format(new Date());
		}else if(i==3){
			dateTime=new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
		}
		return dateTime;
	}
}
