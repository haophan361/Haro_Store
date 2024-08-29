package Model;

import java.time.LocalDateTime;

public class Bills 
{
	private int ID;
	private int cusID;
	private double cost;
	private int status;
	private LocalDateTime purchase_date;
	private String address;
	private LocalDateTime receive_date;
	
	public Bills(int iD, int cusID, double cost, int status, LocalDateTime purchase_date, String address, LocalDateTime receive_date) 
	{
		super();
		ID = iD;
		this.cusID = cusID;
		this.cost = cost;
		this.status=status;
		this.purchase_date = purchase_date;
		this.address = address;
		this.receive_date = receive_date;
	}
	public Bills(int cusID, double cost,int status, LocalDateTime purchase_date, String address, LocalDateTime receive_date) 
	{
		super();
		this.cusID = cusID;
		this.cost = cost;
		this.status=status;
		this.purchase_date = purchase_date;
		this.address = address;
		this.receive_date = receive_date;
	}
	public int getID() 
	{
		return ID;
	}
	public void setID(int iD) 
	{
		ID = iD;
	}
	public int getCusID() 
	{
		return cusID;
	}
	public void setCusID(int cusID) 
	{
		this.cusID = cusID;
	}
	public double getCost() 
	{
		return cost;
	}
	public void setCost(double cost) 
	{
		this.cost = cost;
	}
	public int getStatus() 
	{
		return status;
	}
	public void setStatus(int status) 
	{
		this.status = status;
	}
	public LocalDateTime getPurchase_date() 
	{
		return purchase_date;
	}
	public void setPurchase_date(LocalDateTime purchase_date) 
	{
		this.purchase_date = purchase_date;
	}
	public String getAddress() 
	{
		return address;
	}
	public void setAddress(String address) 
	{
		this.address = address;
	}
	public LocalDateTime getRecive_date() 
	{
		return receive_date;
	}
	public void setRecive_date(LocalDateTime recive_date) 
	
	{
		this.receive_date = recive_date;
	}
}
