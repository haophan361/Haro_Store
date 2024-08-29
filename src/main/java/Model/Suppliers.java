package Model;

public class Suppliers 
{
	private int ID;
	private String supplierName;
	private String address;
	private String phone;
	
	public Suppliers(String supplierName, String address, String phone) 
	{
		super();
		this.supplierName = supplierName;
		this.address = address;
		this.phone = phone;
	}
	public Suppliers(int iD, String supplierName, String address, String phone) 
	{
		super();
		ID = iD;
		this.supplierName = supplierName;
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
	public String getSupplierName() 
	{
		return supplierName;
	}
	public void setSupplierName(String supplierName) 
	{
		this.supplierName = supplierName;
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
