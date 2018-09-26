package hs.bm.vo;


public class SysUsrPassRoleVo {
	private String usr_id;
	private String usr_name;
	private String usr_pwd;
	private String role_name;
	private String usr_role;
	private String usr_no;
	private String org_usr_name;
	private String email;
	private String qq;
	private String phone_no;
	public SysUsrPassRoleVo() {
		super();
	}
	public SysUsrPassRoleVo(String usr_id, String usr_name, String usr_pwd, String role_name, String usr_role,
			String usr_no, String org_usr_name, String email, String qq, String phone_no) {
		super();
		this.usr_id = usr_id;
		this.usr_name = usr_name;
		this.usr_pwd = usr_pwd;
		this.role_name = role_name;
		this.usr_role = usr_role;
		this.usr_no = usr_no;
		this.org_usr_name = org_usr_name;
		this.email = email;
		this.qq = qq;
		this.phone_no = phone_no;
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
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getUsr_role() {
		return usr_role;
	}
	public void setUsr_role(String usr_role) {
		this.usr_role = usr_role;
	}
	public String getUsr_no() {
		return usr_no;
	}
	public void setUsr_no(String usr_no) {
		this.usr_no = usr_no;
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
	
}
