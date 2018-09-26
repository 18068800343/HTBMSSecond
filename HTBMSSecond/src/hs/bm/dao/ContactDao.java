package hs.bm.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import hs.bm.vo.*;
public class ContactDao {
	
	private static ContactDao contactDao;

	public static ContactDao getInstance()
	{
		if (contactDao == null)
		{
			contactDao = new ContactDao();
		}
		return contactDao;
	}
	
    /**
	 *@category 插入到sys_contact这个表
	 * */
    public int saveContact(String id,String name,String add,String company,String phone,String qq_number){
    	int i=0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql=" INSERT INTO sys_contactus(id,contact_name,contact_add,company,phone,qq_number) VALUES(?,?,?,?,?,?) ";
    	String[] arr=new String[]{id,name,add,company,phone,qq_number};
    	i=mdo.executeUpdate(sql, arr);
    	mdo.close();
    	return i;
    }
    
    public int isExit(){
    	int i=0;
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql=" SELECT * FROM sys_contactus WHERE 1=1 ";
    	String[] arr=new String[]{};
    	ResultSet rs=mdo.executeQuery(sql, arr);
    	try
		{
			if (rs.next())
			{
				i = 1;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
    	mdo.close();
    	return i;
    }
    
}
