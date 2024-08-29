package Model;

public class Supplier_BillDetails 
{
	private int ID;
	private int supplierbillID;
	private int productID;
	private double cost;
	private int quantity;
	
	public Supplier_BillDetails(int iD, int supplierbillID, int productID,double cost ,int quantity) 
	{
		super();
		ID = iD;
		this.supplierbillID = supplierbillID;
		this.productID = productID;
		this.cost=cost;
		this.quantity = quantity;
	}
	public Supplier_BillDetails(int supplierbillID, int productID, double cost, int quantity) 
	{
		super();
		this.supplierbillID = supplierbillID;
		this.productID = productID;
		this.cost=cost;
		this.quantity = quantity;
	}
	public int getID() 
	{
		return ID;
	}
	public void setID(int iD) 
	{
		ID = iD;
	}
	public int getSupplierbillID() 
	{
		return supplierbillID;
	}
	public void setSupplierbillID(int supplierbillID) 
	{
		this.supplierbillID = supplierbillID;
	}
	public int getProductID() 
	{
		return productID;
	}
	public void setProductID(int productID) 
	{
		this.productID = productID;
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
	
}
