package hs.bm.bean;

import java.sql.Date;
import java.sql.Timestamp;

public class SysUsrUsrInfo2
{

	/** 用户ID */
	private Integer usr_id;

	/** 用户名 */
	private String usr_name;
	/** 用户密码 */
	private String usr_pwd;
	/***/
	private String usr_role;
	/** 最近一次登录时间 */
	private Timestamp login_time;
	/***/
	private String sign_path;
	
	private String org_usr_id;

	public void setUsr_id(Integer usr_id)
	{
		this.usr_id = usr_id;
	}

	public Integer getUsr_id()
	{
		return usr_id;
	}

	public void setUsr_name(String usr_name)
	{
		this.usr_name = usr_name;
	}

	public String getUsr_name()
	{
		return usr_name;
	}

	public void setUsr_pwd(String usr_pwd)
	{
		this.usr_pwd = usr_pwd;
	}

	public String getUsr_pwd()
	{
		return usr_pwd;
	}

	public void setUsr_role(String usr_role)
	{
		this.usr_role = usr_role;
	}

	public String getUsr_role()
	{
		return usr_role;
	}

	public void setLogin_time(Timestamp login_time)
	{
		this.login_time = login_time;
	}

	public Timestamp getLogin_time()
	{
		return login_time;
	}

	public void setSign_path(String sign_path)
	{
		this.sign_path = sign_path;
	}

	public String getSign_path()
	{
		return sign_path;
	}

	public String getOrg_usr_id() {
		return org_usr_id;
	}

	public void setOrg_usr_id(String org_usr_id) {
		this.org_usr_id = org_usr_id;
	}

}
