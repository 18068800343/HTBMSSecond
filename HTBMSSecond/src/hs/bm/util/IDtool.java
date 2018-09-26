package hs.bm.util;

import java.util.UUID;

public class IDtool
{
	public static String getUUID(){
		UUID uuid = java.util.UUID.randomUUID();
		String uid = uuid.toString();
		return uid;
		
	}
	public static void main(String[] args)
	{
		String id = getUUID();
		System.out.println(id);
	}
}
