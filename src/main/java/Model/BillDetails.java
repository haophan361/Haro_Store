package Model;


public class BillDetails 
{
	private int ID;
	private int billID;
	private int proID;
	private int quantity;
	
	public BillDetails(int iD, int billID, int proID, int quantity) 
	{
		super();
		ID = iD;
		this.billID = billID;
		this.proID = proID;
		this.quantity = quantity;
	}
	public BillDetails(int billID, int proID, int quantity) 
	{
		super();
		this.billID = billID;
		this.proID = proID;
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
	public int getBillID() 
	{
		return billID;
	}
	public void setBillID(int billID) 
	{
		this.billID = billID;
	}
	public int getProID() 
	{
		return proID;
	}
	public void setProID(int proID) 
	{
		this.proID = proID;
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
