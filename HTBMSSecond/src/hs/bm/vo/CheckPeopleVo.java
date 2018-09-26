package hs.bm.vo;

import hs.bm.bean.SysUsrUsrInfo;

public class CheckPeopleVo extends SysUsrUsrInfo{

	boolean state;

	public CheckPeopleVo() {
		super();
	}

	
	public CheckPeopleVo(boolean state) {
		super();
		this.state = state;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}
	
}
