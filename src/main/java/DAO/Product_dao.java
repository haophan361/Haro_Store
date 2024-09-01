package DAO;
import java.util.ArrayList;
import java.util.List;
import IDAO.IProduct;
import Model.Products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class Product_dao implements IProduct
{
	myConnection myConn=new myConnection();
	Connection conn=null;
	PreparedStatement pstmt=null;
	List<Products> pro=null;
	@Override
	public boolean insertProduct(Products product)
	{
		String query="CALL insertProduct(?,?,?,?,?,?)";
		try
		{
			conn=myConn.getConnection();
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1,product.getProductName());
			pstmt.setString(2,product.getProductType());
			pstmt.setString(3,product.getBrand());
			pstmt.setDouble(4, product.getCost());
			pstmt.setInt(5, product.getQuantity());
			pstmt.setString(6,product.getImage_url());
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
	public boolean updateProduct(Products product) 
	{
		String query="CALL updateProduct(?,?,?,?,?,?,?)";
		try
		{
			conn=myConn.getConnection();
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, product.getID());
			pstmt.setString(2,product.getProductName());
			pstmt.setString(3,product.getProductType());
			pstmt.setString(4,product.getBrand());
			pstmt.setDouble(5, product.getCost());
			pstmt.setInt(6, product.getQuantity());
			pstmt.setString(7,product.getImage_url());
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
	public boolean deleteProduct (int ID)
	{
		String query="CALL deleteProduct(?)";
		try
		{
			conn=myConn.getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, ID);
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
	public List<Products> searchProduct(String keyword) 
	{
		String query="CALL searchProduct(?)";
		pro=new ArrayList<Products>();
		try
		{
			conn=myConn.getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			ResultSet rs=pstmt.executeQuery();
			
			Products product=null;
			while(rs.next())
			{
				product=new Products();
				product.setProductName(rs.getString("productName"));
				product.setProductType(rs.getString("productType"));
				product.setBrand(rs.getString("brand"));
				product.setCost(rs.getDouble("cost"));
				product.setQuantity(rs.getInt("quantity"));
				product.setImage_url(rs.getString("image_url"));
				pro.add(product);
			}
			conn.close();
			return pro;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public List<Products> typeProduct(String productType) 
	{
		String query="CALL typeProduct(?)";
		pro=new ArrayList<Products>();
		try
		{
			conn=myConn.getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, productType);
			ResultSet rs=pstmt.executeQuery();
			
			Products product=null;
			while(rs.next())
			{
				product=new Products();
				product.setProductName(rs.getString("productName"));
				product.setProductType(rs.getString("productType"));
				product.setBrand(rs.getString("brand"));
				product.setCost(rs.getDouble("cost"));
				product.setQuantity(rs.getInt("quantity"));
				product.setImage_url(rs.getString("image_url"));
				pro.add(product);
			}
			conn.close();
			return pro;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public List<Products> findAll() 
	{
		String query="SELECT * FROM products";
		pro=new ArrayList<Products>();
		try
		{
			conn=myConn.getConnection();
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			
			Products product=null;
			while(rs.next())
			{
				product=new Products();
				product.setID(rs.getInt("ID"));
				product.setProductName(rs.getString("productName"));
				product.setProductType(rs.getString("productType"));
				product.setBrand(rs.getString("brand"));
				product.setCost(rs.getDouble("cost"));
				product.setQuantity(rs.getInt("quantity"));
				product.setImage_url(rs.getString("image_url"));
				pro.add(product);
			}
			conn.close();
			return pro;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public Products findProduct(int ID)
	{
		String query="CALL findProduct(?)";
		try
		{
			conn=myConn.getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,"ID");
			ResultSet rs=pstmt.executeQuery();
			
			Products product=null;
			while(rs.next())
			{
				product=new Products();
				product.setID(rs.getInt("ID"));
				product.setProductName(rs.getString("productName"));
				product.setProductType(rs.getString("productType"));
				product.setBrand(rs.getString("brand"));
				product.setCost(rs.getDouble("cost"));
				product.setQuantity(rs.getInt("quantity"));
				product.setImage_url(rs.getString("image_url"));
			}
			conn.close();
			return product;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
