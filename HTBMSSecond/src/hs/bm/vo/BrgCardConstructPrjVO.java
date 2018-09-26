package hs.bm.vo;

import hs.bm.bean.BrgCardConstructPrj;
import hs.bm.bean.BrgCardConstructPrjMemo;

import java.util.ArrayList;

public class BrgCardConstructPrjVO
{
	ArrayList<BrgCardConstructPrj> brgCardConstructPrj;
	ArrayList<BrgCardConstructPrjMemo> brgCardConstructPrjMemo;


	public ArrayList<BrgCardConstructPrj> getBrgCardConstructPrj()
	{
		return brgCardConstructPrj;
	}

	public void setBrgCardConstructPrj(ArrayList<BrgCardConstructPrj> brgCardConstructPrj)
	{
		this.brgCardConstructPrj = brgCardConstructPrj;
	}

	public ArrayList<BrgCardConstructPrjMemo> getBrgCardConstructPrjMemo()
	{
		return brgCardConstructPrjMemo;
	}

	public void setBrgCardConstructPrjMemo(ArrayList<BrgCardConstructPrjMemo> brgCardConstructPrjMemo)
	{
		this.brgCardConstructPrjMemo = brgCardConstructPrjMemo;
	}
}
