package hs.bm.vo;

public class RoleInfo {
	
	private boolean admin;
	private boolean guest;
	private boolean manage;
	private boolean member;
	private boolean superAdmin;
	private boolean orgAdmin;
	private boolean orgCharge;
	private boolean orgDuty;
	private boolean orgEngineer;
	
	public boolean isOrgCharge()
	{
		return orgCharge;
	}


	public void setOrgCharge(boolean orgCharge)
	{
		this.orgCharge = orgCharge;
	}


	public boolean isOrgDuty()
	{
		return orgDuty;
	}


	public void setOrgDuty(boolean orgDuty)
	{
		this.orgDuty = orgDuty;
	}


	public boolean isOrgEngineer()
	{
		return orgEngineer;
	}


	public void setOrgEngineer(boolean orgEngineer)
	{
		this.orgEngineer = orgEngineer;
	}


	public boolean isOrgAdmin() {
		return orgAdmin;
	}


	public void setOrgAdmin(boolean orgAdmin) {
		this.orgAdmin = orgAdmin;
	}


	public RoleInfo(){
		admin = false;
		guest = false;
		manage = false;
		member = false;
		superAdmin=false;
	}
	
	
	public boolean isSuperAdmin() {
		return superAdmin;
	}


	public void setSuperAdmin(boolean superAdmin) {
		this.superAdmin = superAdmin;
	}


	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	public boolean isGuest() {
		return guest;
	}
	public void setGuest(boolean guest) {
		this.guest = guest;
	}
	public boolean isManage() {
		return manage;
	}
	public void setManage(boolean manage) {
		this.manage = manage;
	}
	public boolean isMember() {
		return member;
	}
	public void setMember(boolean member) {
		this.member = member;
	}
	
	
}
