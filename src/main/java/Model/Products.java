package Model;

public class Products 
{
	private int ID;
	private String productName;
	private String productType;
	private String brand;
	private double cost;
	private int quantity;
	private String image_url;
	public Products() 
	{
		
	}
	public Products(int iD, String productName, String productType, String brand, double cost, int quantity,String image_url) 
	{
		super();
		ID = iD;
		this.productName = productName;
		this.productType = productType;
		this.brand = brand;
		this.cost = cost;
		this.quantity = quantity;
		this.image_url=image_url;
	}
	public Products(String productName, String productType, String brand, double cost, int quantity,String image_url) 
	{
		super();
		this.productName = productName;
		this.productType = productType;
		this.brand = brand;
		this.cost = cost;
		this.quantity = quantity;
		this.image_url=image_url;
	}
	public int getID() 
	{
		return ID;
	}
	public void setID(int iD) 
	{
		ID = iD;
	}
	public String getProductName() 
	{
		return productName;
	}
	public void setProductName(String productName) 
	{
		this.productName = productName;
	}
	public String getProductType() 
	{
		return productType;
	}
	public void setProductType(String productType) 
	{
		this.productType = productType;
	}
	public String getBrand() 
	{
		return brand;
	}
	public void setBrand(String brand) 
	{
		this.brand = brand;
	}
	public double getCost() 
	{
		return cost;
	}
	public void setCost(double cost) 
	{
		this.cost = cost;
	}
	public int getQuantity() 
	{
		return quantity;
	}
	public void setQuantity(int quantity) 
	{
		this.quantity = quantity;
	}
	public String getImage_url() 
	{
		return image_url;
	}
	public void setImage_url(String image_url) 
	{
		this.image_url = image_url;
	}
	
}
