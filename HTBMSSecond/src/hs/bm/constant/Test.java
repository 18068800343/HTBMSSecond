package hs.bm.constant;

import java.util.Date;

import hs.bm.util.ReadFileUtil;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String nextMonth = ReadFileUtil.getNextMonthFmt(new Date());
        System.out.println(nextMonth);
	}

}
