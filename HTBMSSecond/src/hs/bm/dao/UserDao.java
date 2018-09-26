package hs.bm.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import hs.bm.bean.SysOrgUsrInfo;
import hs.bm.vo.*;
public class UserDao {
	private String testingCompanyId="0000#0000#0000";
	/**
	 * 查询所有用户信息，包括用户id，用户名，密码以及角色名
	 * */
    public ArrayList<SysUsrPassRole> GetSysUsrPassRole(){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT usr_id,usr_name,usr_pwd,usr_role from sys_usr_usr_info";
    	ResultSet rs=mdo.executeQuery(sql, null);
    	String usr_id = null;
    	String usr_name = null;
    	String usr_pwd = null;
    	String role_name = null;	
    	ArrayList<SysUsrPassRole> al=new ArrayList<SysUsrPassRole>();
    	try {
			while(rs.next()){
				usr_id=rs.getString(1);
				usr_name=rs.getString(2);
				usr_pwd=rs.getString(3);
				role_name=rs.getString(4);
				SysUsrPassRole supr=new SysUsrPassRole();
				supr.setUsr_id(usr_id);
		    	supr.setUsr_name(usr_name);
		    	supr.setUsr_pwd(usr_pwd);
		    	supr.setRole_name(role_name);
		    	al.add(supr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
		return al;
    }
    /**
	 *根据用户id，用户名，密码插入到sys_usr_usr_info这个用户表
     * @param role_name 
	 * */
    public int InsertUser(String usr_name,String usr_pwd,String org_usr_id,String role_name){
    	int i=0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="insert into sys_usr_usr_info(usr_name,usr_pwd,org_usr_id,usr_role) values(?,?,?,?)";
    	String[] arr=new String[]{usr_name,usr_pwd,org_usr_id,role_name};
    	i=mdo.executeUpdate(sql, arr);
    	mdo.close();
    	return i;
    }
    
    
    
    
    /**
	 *根据用户名获取用户id
	 * */
    public String GetUsr_id(String usr_name){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql1="select usr_id from sys_usr_usr_info where usr_name=?";
    	String[] arr=new String[]{usr_name};
    	ResultSet rs=mdo.executeQuery(sql1, arr);
    	String usr_id=null;
    	try {
			while(rs.next()){
				usr_id=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
    	return usr_id;
    }
    
    
    /**
   	 *根据用户id获取org_usr_id
   	 * */
       public String GetOrgUsrId(Integer usr_id){
       	Connection conn=MyDataSource.getInstance().getConnection();
       	MyDataOperation mdo=new MyDataOperation(conn,false);
       	String sql1="select org_usr_id from sys_usr_usr_info where usr_id=?";
       	Integer[] iter=new Integer[]{usr_id};
       	ResultSet rs=mdo.executeQuery(sql1, iter);
       	String org_usr_id=null;
       	try {
   			while(rs.next()){
   				org_usr_id=rs.getString(1);
   			}
   		} catch (SQLException e) {
   			e.printStackTrace();
   		}
       	mdo.close();
       	return org_usr_id;
       }
    
       /**
      	 *管养单位获取人员真实姓名
      	 * */
          public String getRealUserNameGY(String userName){
          	Connection conn=MyDataSource.getInstance().getConnection();
          	MyDataOperation mdo=new MyDataOperation(conn,false);
          	String sql1="select org_usr_name from sys_usr_usr_info a left join sys_org_usr_info b on a.org_usr_id=b.org_usr_id where usr_name=?";
          	String[] iter=new String[]{userName};
          	ResultSet rs=mdo.executeQuery(sql1, iter);
          	String org_usr_id=null;
          	try {
      			while(rs.next()){
      				org_usr_id=rs.getString(1);
      			}
      		} catch (SQLException e) {
      			e.printStackTrace();
      		}
          	mdo.close();
          	return org_usr_id;
          }
          /**
        	 *检测单位获取人员真实姓名
        	 * */
            public String getRealUserNameJC(String userName){
            	Connection conn=MyDataSource.getInstance().getConnection();
            	MyDataOperation mdo=new MyDataOperation(conn,false);
            	String sql1="select org_usr_name from sys_usr_usr_info a left join sys_org_usr_info b on concat(a.usr_id,'')=b.org_usr_id where a.usr_name=?";
            	String[] iter=new String[]{userName};
            	ResultSet rs=mdo.executeQuery(sql1, iter);
            	String org_usr_id=null;
            	try {
        			while(rs.next()){
        				org_usr_id=rs.getString(1);
        			}
        		} catch (SQLException e) {
        			e.printStackTrace();
        		}
            	mdo.close();
            	return org_usr_id;
            }
    /**
	 *根据用户id删除一个用户
	 * */
    public int DeleteUser(String usr_id){
    	int i=0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="DELETE from sys_usr_usr_info where usr_id=?";
    	String[] arr=new String[]{usr_id};
    	i=mdo.executeUpdate(sql, arr);
    	mdo.close();
    	return i;
    }
    
    /**
   	 *根据用户id删除一个用户
   	 * */
       public int DeleteOrgUsr(String org_usr_id){
       	int i=0;
       	Connection conn=MyDataSource.getInstance().getConnection();
       	MyDataOperation mdo=new MyDataOperation(conn,false);
       	String sql="DELETE from sys_org_usr_info where org_usr_id=?";
       	String[] arr=new String[]{org_usr_id};
       	i=mdo.executeUpdate(sql, arr);
       	mdo.close();
       	return i;
       }
    
    /**
	 *根据用户名，以及新密码修改sys_usr_usr_info表中这个用户名所对应的密码
	 * */
    public int UpdateUsr_pwd(String usr_name,String usr_pwd){
    	int i=0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="update sys_usr_usr_info set usr_pwd=? where usr_name=? ";
    	String[] arr=new String[]{usr_pwd,usr_name};
    	i=mdo.executeUpdate(sql, arr);
    	mdo.close();
    	return i;
    }
    
    
    /**
   	 *根据用户id，用户名，密码，用户角色关系编号，角色名来增加一个用户
   	 * */
    public ArrayList<SysUsrPassRole> AddUser(String usr_name,String usr_pwd,String org_usr_id,String role_name){
    	UserDao ud=new UserDao();
    	int i1=ud.InsertUser(usr_name, usr_pwd,org_usr_id,role_name);
    	ArrayList<SysUsrPassRole> al=new ArrayList<SysUsrPassRole>();
    	
           
			
    	if(i1<1){
    		System.out.println("插入用户表失败");
    		
    	}else{
    		SysUsrPassRole supr=new SysUsrPassRole();
 		   //supr.setUsr_no(getAccountCount()+"");
 				supr.setUsr_id(getUsr_id(usr_name));
 		    	supr.setUsr_name(usr_name);
 		    	supr.setUsr_pwd(usr_pwd);
 		    	supr.setUsr_role(role_name);
 		    	al.add(supr);
    	
    	}
    	return al;
    }
    
    /*
     * @author xianing
     * 增加人员
     */
    public ArrayList<SysUsrPassRole> AddPerson(String usr_name,String usr_pwd,String org_usr_id,String role_name){
    	UserDao ud=new UserDao();
    	int i1=ud.InsertUser(usr_name, usr_pwd,org_usr_id,role_name);
    	ArrayList<SysUsrPassRole> al=new ArrayList<SysUsrPassRole>();
    	
           
    	return al;
    }
    
    
    private String getUsr_id(String usr_name) {
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql=" select usr_id  from sys_usr_usr_info where usr_name=?";
    	ResultSet rs=mdo.executeQuery(sql, new String[]{usr_name});
    	int i=0;
    	String usr_id=null;
    	try {
			while(rs.next()){
				//System.out.println("kkkkkk");
				usr_id=rs.getString("usr_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
		return usr_id;
	}
	private int getAccountCount() {
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql=" select count(*) a from sys_usr_usr_info ";
    	ResultSet rs=mdo.executeQuery(sql, null);
    	int i=0;
    	try {
			while(rs.next()){
				//System.out.println("kkkkkk");
				i=Integer.parseInt(rs.getString("a"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
		return i;
	}
	/**
   	 *根据用户id，以及角色名修改用户角色信息表里这个用户id所对应的角色id
     * @param usr_id2 
   	 * */
    public int UpdateRoleByName(String role_name,String usr_name,String usr_pwd, String usr_id){
    	int i=0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="update sys_usr_usr_info set usr_name=?,usr_pwd=?,usr_role=? where usr_id=? ";
    	String[] arr=new String[]{usr_name,usr_pwd,role_name,usr_id};
    	i=mdo.executeUpdate(sql, arr);
    	mdo.close();
    	return i;
    }
    
    /**
   	 *根据org_usr_id，修改sys_usr_usr_info表的内容
     * @param usr_id2 
   	 * */
    public int UpdateSysOrgUsrInfoByOrgUsrId(SysOrgUsrInfo soui,String orgUsrId){
    	int i=0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="update sys_org_usr_info set org_usr_name=?,e_mail=?,phone_no=?,department_id=?,qq=?,job_name=? where org_usr_id=? ";
    	String[] arr=new String[]{soui.getOrg_usr_name(),soui.getE_mail(),
    			                  soui.getPhone_no(),soui.getDepartment_id(),
    			                  soui.getQq(),soui.getJob_name(),orgUsrId};
    	i=mdo.executeUpdate(sql, arr);
    	mdo.close();
    	return i;
    }
    
    /**
   	 *根据用户id，以及角色名修改用户角色信息表里这个用户id所对应的角色id
     * @param org_usr_id,usr_id
     * @author xianing
   	 * */
    public int UpdateOrgUsrIdByUsrId(String org_usr_id,String usr_id){
    	int i=0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="update sys_usr_usr_info set org_usr_id=? where usr_id=? ";
    	String[] arr=new String[]{org_usr_id,usr_id};
    	i=mdo.executeUpdate(sql, arr);
    	mdo.close();
    	return i;
    }
    
    /**
     * 保存签名路径
     * @param Sign_Path
     * @param company 
     * @return int(状态)
     */
    public int store_Sign_Path(String Sign_Path,String usr_name, String company){
    	String sql=null;
    	//判断是否为检测公司
    	int i=0;
    	sql="UPDATE sys_usr_usr_info SET sign_path=? WHERE usr_name=?";
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	
    	String[] arr = new String[]{Sign_Path,usr_name};
    	i = mdo.executeUpdate(sql, arr);
    	/*if(company.equals(testingCompanyId)){
    		sql="UPDATE sys_usr_usr_info SET sign_path=? WHERE usr_name=?";
    		i=updateImgPathTesting(Sign_Path,usr_no,sql);
    	}
    	
    	else{
    		List<OrgUserInfo> oril=getOrg_usr_idByCompany(company);
    		//判断是否为管养公司管理员
    		if(oril.size()==0){
    			sql="UPDATE sys_usr_usr_info SET sign_path=? WHERE usr_no=? and org_usr_id=?";
    			i=updateImgPath(Sign_Path,usr_no,company,sql);
    		}
    		//管养公司其他人员
    		else{
    			sql="UPDATE sys_usr_usr_info SET sign_path=? WHERE usr_no=? and org_usr_id=?";
    			i=updateImgPath(Sign_Path,usr_no,oril.get(0).getOrg_usr_id(),sql);
    		}
    	}*/
    	mdo.close();
    	return i;
    }
    private int updateImgPath(String Sign_Path,String usr_no,String org_usr_id,String sql){
    	int i = 0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	
    	String[] arr = new String[]{Sign_Path,usr_no,org_usr_id};
    	i = mdo.executeUpdate(sql, arr);
    	mdo.close();
		return i;
    }
    private int updateImgPathTesting(String Sign_Path,String usr_no,String sql){
    	int i = 0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	
    	String[] arr = new String[]{Sign_Path,usr_no};
    	i = mdo.executeUpdate(sql, arr);
    	mdo.close();
		return i;
    }
	private List<OrgUserInfo> getOrg_usr_idByCompany(String company) {
		company=company.substring(0, 4)+"%";
		String sql = "SELECT * from sys_org_usr_info where department_id like ?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]{company});

		List<OrgUserInfo> oril = new ArrayList<OrgUserInfo>();
		try
		{
			while (rs.next())
			{
				OrgUserInfo ori = new OrgUserInfo();
				ori.setOrg_usr_id(rs.getString("org_usr_id"));
				
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}
	public static void main(String[] args) {
		//UserDao ud=new UserDao();
//		System.out.println(ud.GetRole_id("11"));

	}
	 /**
   	 *确保用户编号在同一公司下唯一
   	 * */
	public int identifyId(String org_id, String id) {
		// TODO Auto-generated method stub
		String org_idPre=org_id.substring(0, 4)+"%";
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql=" select usr_no from sys_usr_usr_info where org_usr_id in(select org_usr_id from sys_org_usr_info where department_id like ? ) ";
    	String[] arr = new String[]{org_idPre};
    	ResultSet rs=mdo.executeQuery(sql, arr);
    	int i=0;
    	try {
			while(rs.next()){
				//System.out.println("kkkkkk");
				if(id.equals(rs.getString("usr_no"))){
					i=-1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
		return i;
	}
	public List<SysUsrPassRoleVo> initTesTingCompanyTable() {
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql=" select * from sys_usr_usr_info a LEFT JOIN sys_org_usr_info b "
    			  +" on concat(a.usr_id) = b.org_usr_id where a.org_usr_id is null and a.usr_role!='superAdmin'";
    	ResultSet rs=mdo.executeQuery(sql, null);
    	ArrayList<SysUsrPassRoleVo> al=new ArrayList<SysUsrPassRoleVo>();
    	int i=1;
    	try {
			while(rs.next()){
				SysUsrPassRoleVo supr=new SysUsrPassRoleVo();
				supr.setUsr_no(i+"");
				supr.setUsr_id(rs.getString("usr_id"));
		    	supr.setUsr_name(rs.getString("usr_name"));
		    	supr.setUsr_pwd(rs.getString("usr_pwd"));
		    	supr.setUsr_role(rs.getString("usr_role"));
		    	supr.setOrg_usr_name(rs.getString("org_usr_name"));
		    	supr.setPhone_no(rs.getString("phone_no"));
		    	supr.setQq(rs.getString("qq"));
		    	supr.setEmail(rs.getString("e_mail"));
		    	al.add(supr);
		    	i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
		return al;
	}
	public List<SysUsrPassRoleVo> initKeepingCompanyTable(String org_id) {
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String org_id1=org_id.substring(0, 4)+"%";
    	String sql="  SELECT	a.*,b.org_usr_name,b.e_mail,b.qq,b.phone_no,b.org_usr_id "
    			  + " FROM sys_usr_usr_info AS a LEFT JOIN sys_org_usr_info AS b "
    			  + " ON a.org_usr_id = b.org_usr_id WHERE b.org_usr_id IN"
    			  + " ((SELECT org_usr_id FROM sys_org_usr_info WHERE department_id LIKE ? )) ";
    	ResultSet rs=mdo.executeQuery(sql, new String[]{org_id1});
    	ArrayList<SysUsrPassRoleVo> al=new ArrayList<SysUsrPassRoleVo>();
    	int i=1;
    	try {
			while(rs.next()){
				SysUsrPassRoleVo supr=new SysUsrPassRoleVo();
				supr.setUsr_id(rs.getString("usr_id"));
				supr.setUsr_no(i+"");
		    	supr.setUsr_name(rs.getString("usr_name"));
		    	supr.setUsr_pwd(rs.getString("usr_pwd"));
		    	supr.setUsr_role(rs.getString("usr_role"));
		    	supr.setOrg_usr_name(rs.getString("org_usr_name"));
		    	supr.setPhone_no(rs.getString("phone_no"));
		    	supr.setQq(rs.getString("qq"));
		    	supr.setEmail(rs.getString("e_mail"));
		    	al.add(supr);
		    	i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
    	ArrayList<SysUsrPassRoleVo> al1=new ArrayList<SysUsrPassRoleVo>();
    	al1=getKeepingAdmin(org_id);
    	al.addAll(al1);
		return al;
	}
	
	public List<SysUsrPassRoleVo> getKeepingCompanyTableByDepartmentId(String department_id) {
		Connection conn=MyDataSource.getInstance().getConnection();
		if(department_id.endsWith("0000")){
		   department_id=department_id.substring(0,10)+"%";
		}
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="  SELECT	a.*,b.org_usr_name,b.e_mail,b.qq,b.phone_no,b.org_usr_id "
  			  + " FROM sys_usr_usr_info AS a LEFT JOIN sys_org_usr_info AS b "
  			  + " ON a.org_usr_id = b.org_usr_id WHERE b.department_id like ? ";
    	ResultSet rs=mdo.executeQuery(sql, new String[]{department_id});
    	ArrayList<SysUsrPassRoleVo> al=new ArrayList<SysUsrPassRoleVo>();
    	int i=1;
    	try {
			while(rs.next()){
				SysUsrPassRoleVo supr=new SysUsrPassRoleVo();
				supr.setUsr_id(rs.getString("usr_id"));
				supr.setUsr_no(i+"");
		    	supr.setUsr_name(rs.getString("usr_name"));
		    	supr.setUsr_pwd(rs.getString("usr_pwd"));
		    	supr.setUsr_role(rs.getString("usr_role"));
		    	supr.setOrg_usr_name(rs.getString("org_usr_name"));
		    	supr.setPhone_no(rs.getString("phone_no"));
		    	supr.setQq(rs.getString("qq"));
		    	supr.setEmail(rs.getString("e_mail"));
		    	al.add(supr);
		    	i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
		return al;
	}
	
	private ArrayList<SysUsrPassRoleVo> getKeepingAdmin(String org_id) {
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql=" select * from sys_usr_usr_info where org_usr_id =? ";
    	ResultSet rs=mdo.executeQuery(sql, new String[]{org_id});
    	ArrayList<SysUsrPassRoleVo> al=new ArrayList<SysUsrPassRoleVo>();
    	int i=1;
    	try {
			while(rs.next()){
				SysUsrPassRoleVo supr=new SysUsrPassRoleVo();
				supr.setUsr_id(rs.getString("usr_id"));
				supr.setUsr_no(i+"");
		    	supr.setUsr_name(rs.getString("usr_name"));
		    	supr.setUsr_pwd(rs.getString("usr_pwd"));
		    	supr.setUsr_role(rs.getString("usr_role"));
		    	al.add(supr);
		    	i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
    	return al;
	}
	public int identifyIdTesting(String org_id, String id) {
		
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql=" select usr_no from sys_usr_usr_info where org_usr_id is null and usr_role!=? and usr_role!=?";
    	
    	ResultSet rs=mdo.executeQuery(sql, new String[]{"superAdmin","orgAdmin"});
    	int i=0;
    	try {
			while(rs.next()){
				//System.out.println("kkkkkk");
				if(id.equals(rs.getString("usr_no"))){
					i=-1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
		return i;
	}
	public List<SysUsrPassRole> getEditPerson(String usr_id) {
		Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql=" select * from sys_usr_usr_info where usr_id =? ";
    	ResultSet rs=mdo.executeQuery(sql, new String[]{usr_id});
    	ArrayList<SysUsrPassRole> al=new ArrayList<SysUsrPassRole>();
    	try {
			while(rs.next()){
				SysUsrPassRole supr=new SysUsrPassRole();
				supr.setUsr_id(rs.getString("usr_id"));
				//supr.setUsr_no(rs.getString("usr_no"));
		    	supr.setUsr_name(rs.getString("usr_name"));
		    	supr.setUsr_pwd(rs.getString("usr_pwd"));
		    	supr.setUsr_role(rs.getString("usr_role"));
		    	
		    	al.add(supr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	mdo.close();
		return al;
	}
	public List<OrgUserInfo> getOrg_usr_id(String usr_id) {
		String sql = "select * from sys_org_usr_info where org_usr_id=(select org_usr_id from sys_usr_usr_info where usr_id=?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new String[]
		{ usr_id });
		List<OrgUserInfo> oril = new ArrayList<OrgUserInfo>();
		try
		{
			while (rs.next())
			{
				OrgUserInfo ori = new OrgUserInfo();
				ori.setOrg_usr_name(rs.getString("org_usr_name"));
				ori.setOrg_usr_id(rs.getString("org_usr_id"));
				oril.add(ori);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		dataOperation.close();
		return oril;
	}

}
