package hs.bm.vo;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgPrjPhoto;

import java.util.ArrayList;

public class BrgCardPictureVO
{
	private ArrayList<BrgPrjPhoto> brgPrjPhoto;
	private ArrayList<BrgCardAdminId> brgCardAdminId;

	public ArrayList<BrgPrjPhoto> getBrgPrjPhoto()
	{
		return brgPrjPhoto;
	}

	public void setBrgPrjPhoto(ArrayList<BrgPrjPhoto> brgPrjPhoto)
	{
		this.brgPrjPhoto = brgPrjPhoto;
	}

	public ArrayList<BrgCardAdminId> getBrgCardAdminId()
	{
		return brgCardAdminId;
	}

	public void setBrgCardAdminId(ArrayList<BrgCardAdminId> brgCardAdminId)
	{
		this.brgCardAdminId = brgCardAdminId;
	}
	 
}
