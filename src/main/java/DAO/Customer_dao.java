package DAO;
import IDAO.ICustomer;
import Model.Customers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Customer_dao implements ICustomer
{
    myConnection myConn=new myConnection();
    Connection conn=myConn.getConnection();
    PreparedStatement pstmt=null;
    @Override
    public boolean updateCustomer(int ID, String cusName, String address, String phone)
    {
        String query="CALL updateCustomer(?,?,?,?)";
        try
        {
            pstmt=conn.prepareStatement(query);
            pstmt.setInt(1, ID);
            pstmt.setString(2, cusName);
            pstmt.setString(3, address);
            pstmt.setString(4, phone);
            pstmt.executeUpdate();
            conn.close();
            return true;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteCustomer(int ID)
    {
        String query="CALL deleteCustomer(?)";
        try
        {
            pstmt=conn.prepareStatement(query);
            pstmt.setInt(1, ID);
            pstmt.executeUpdate();
            conn.close();
            return true;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Customers> findAll()
    {
        String query="SELECT * FROM customer";
        try
        {
            List<Customers> listCus=new ArrayList<Customers>();
            pstmt=conn.prepareStatement(query);
            ResultSet rs=pstmt.executeQuery();
            while (rs.next())
            {
                Customers customer=new Customers();
                customer.setID(rs.getInt("ID"));
                customer.setCusName(rs.getString("cusName"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                listCus.add(customer);
            }
            conn.close();
            return listCus;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return  null;
        }
    }

    @Override
    public Customers findCustomer(String email)
    {
        String query="CALL findCustomer(?)";
        try
        {
            pstmt=conn.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs=pstmt.executeQuery();
            Customers customer=new Customers();
            while (rs.next())
            {
                customer.setID(rs.getInt("ID"));
                customer.setCusName(rs.getString("cusName"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
            }
            conn.close();
            return customer;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return  null;
        }
    }
}
