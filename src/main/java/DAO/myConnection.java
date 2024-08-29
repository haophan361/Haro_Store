package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class myConnection 
{
	private static final String URL = "jdbc:mysql://localhost:3306/haohao_store";
    private static final String USER = "root";
    private static final String PASSWORD = "phanphuchao";
    Connection conn;
    public Connection getConnection()
    {
    	conn=null;
    	try
    	{
    		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            conn = (Connection) DriverManager.getConnection(URL,USER,PASSWORD);
    	}
    	catch(SQLException e)
    	{
    		e.printStackTrace();
    		Logger.getLogger(myConnection.class.getName()).log(Level.SEVERE, null,e);
    	}
    	return conn;
    }
}
