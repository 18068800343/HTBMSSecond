package hs.bm.vo;

public class SysUsrUsrInfoVo
{

	/** 用户ID */
	private String usr_id;

	/** 用户名 */
	private String usr_name;
	/** 用户密码 */
	private String usr_pwd;
	/***/
	private String usr_role;
	/** 最近一次登录时间 */
	private String login_time;
	/***/
	private String sign_path;
	
	private String org_usr_id;

	private String org_usr_name;
	
	private String email;
	
	private String qq;
	
	private String phone_no;
	
	private String job_name;
	
	private String department_id;

	public SysUsrUsrInfoVo() {
		super();
	}

	public SysUsrUsrInfoVo(String usr_id, String usr_name, String usr_pwd, String usr_role, String login_time,
			String sign_path, String org_usr_id, String org_usr_name, String email, String qq, String phone_no,
			String job_name, String department_id) {
		super();
		this.usr_id = usr_id;
		this.usr_name = usr_name;
		this.usr_pwd = usr_pwd;
		this.usr_role = usr_role;
		this.login_time = login_time;
		this.sign_path = sign_path;
		this.org_usr_id = org_usr_id;
		this.org_usr_name = org_usr_name;
		this.email = email;
		this.qq = qq;
		this.phone_no = phone_no;
		this.job_name = job_name;
		this.department_id = department_id;
	}

	public String getUsr_id() {
		return usr_id;
	}

	public void setUsr_id(String usr_id) {
		this.usr_id = usr_id;
	}

	public String getUsr_name() {
		return usr_name;
	}

	public void setUsr_name(String usr_name) {
		this.usr_name = usr_name;
	}

	public String getUsr_pwd() {
		return usr_pwd;
	}

	public void setUsr_pwd(String usr_pwd) {
		this.usr_pwd = usr_pwd;
	}

	public String getUsr_role() {
		return usr_role;
	}

	public void setUsr_role(String usr_role) {
		this.usr_role = usr_role;
	}

	public String getLogin_time() {
		return login_time;
	}

	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}

	public String getSign_path() {
		return sign_path;
	}

	public void setSign_path(String sign_path) {
		this.sign_path = sign_path;
	}

	public String getOrg_usr_id() {
		return org_usr_id;
	}

	public void setOrg_usr_id(String org_usr_id) {
		this.org_usr_id = org_usr_id;
	}

	public String getOrg_usr_name() {
		return org_usr_name;
	}

	public void setOrg_usr_name(String org_usr_name) {
		this.org_usr_name = org_usr_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}

	public String getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	
	
}
