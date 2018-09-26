package hs.bm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseUtils
{
    
    private static Connection conn = null;
    
    // 鍔犺浇椹卞姩
    
    static
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        
    }
    
    // 寤虹珛杩炴帴
    
    public static Connection getConn()
    {
        String url = "jdbc:mysql://192.168.1.21:3306/htbmssecond?useUnicode=true&characterEncoding=utf-8&useOldAliasMetadataBehavior=true";
        String u = "root";
        String p = "root";
        
        try
        {
            conn = DriverManager.getConnection(url, u, p);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        return conn;
        
    }
    
    /**
     * 寤虹珛鍏抽棴鏂规硶
     * 
     */
    
    public static void close()
    {
        if (conn != null)
        {
            try
            {
                if (!conn.isClosed())
                {
                    conn.close();
                }
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            conn = null;
        }
    }
    

}

