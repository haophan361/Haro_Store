package Model;

public class Customers 
{
	private int ID;
	private String cusName;
	private String email;
	private String address;
	private String phone;
	
	public Customers(int iD, String cusName, String address, String phone) 
	{
		super();
		ID = iD;
		this.cusName = cusName;
		this.address = address;
		this.phone = phone;
	}
	public Customers(String cusName, String email,String address, String phone) 
	{
		super();
		this.cusName = cusName;
		this.email = email;
		this.address = address;
		this.phone = phone;
	}
	public int getID() 
	{
		return ID;
	}
	public void setID(int iD) 
	{
		ID = iD;
	}
	public String getCusName() 
	{
		return cusName;
	}
	public void setCusName(String cusName) 
	{
		this.cusName = cusName;
	}
	public String getEmail() 
	{
		return email;
	}
	public void setEmail(String email) 
	{
		this.email = email;
	}
	public String getAddress() 
	{
		return address;
	}
	public void setAddress(String address) 
	{
		this.address = address;
	}
	public String getPhone() 
	{
		return phone;
	}
	public void setPhone(String phone) 
	{
		this.phone = phone;
	}
	
}
