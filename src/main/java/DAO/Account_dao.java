package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import IDAO.IAccount;
import Model.Accounts;
import Model.Customers;
public class Account_dao implements IAccount
{
	myConnection myConn=new myConnection();
	Connection conn=myConn.getConnection();
	PreparedStatement pstmt=null;
	Accounts account=null;
	@Override
	public boolean changePassword(String email, String password) 
	{
		String query="CALL changePassword(?,?)";
		try
		{
			pstmt=conn.prepareStatement(query);
			pstmt.setString(0, email);
			pstmt.setString(1,password);
			pstmt.executeUpdate();
			conn.close();
			return true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean insertAccount(Accounts account) 
	{
		String query="CALL insertAccount_Admin(?,?)";
		try
		{
			pstmt=conn.prepareStatement(query);
			pstmt.setString(0, account.getEmail());
			pstmt.setString(1,account.getPassword());
			pstmt.executeUpdate();
			conn.close();
			return true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean insertCustomer(Customers customer,Accounts account) 
	{	
		String query="CALL insertCustomer(?,?,?,?,?)";
		try
		{
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, customer.getCusName());
			pstmt.setString(2, customer.getEmail());
			pstmt.setString(3, customer.getAddress());
			pstmt.setString(4, customer.getPhone());
			pstmt.setString(5, account.getPassword());
			pstmt.executeUpdate();
			conn.close();
			return true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	public Accounts checkLogin(Accounts account)
	{
		String query="CALL checkLogin(?,?)";
		try
		{
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,account.getEmail());
			pstmt.setString(2,account.getPassword());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				account=new Accounts();
				account.setEmail(rs.getString("email"));
				account.setPassword(rs.getString("password"));
			}
			return account;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
