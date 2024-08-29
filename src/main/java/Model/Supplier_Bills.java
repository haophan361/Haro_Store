package Model;

import java.time.LocalDateTime;

public class Supplier_Bills 
{
	private int ID;
	private int supplierID;
	private double cost;
	private LocalDateTime purchase_date;
	private LocalDateTime receive_date;
	
	public Supplier_Bills(int iD, int supplierID, double cost, LocalDateTime purchase_date,LocalDateTime recive_date) 
	{
		super();
		ID = iD;
		this.supplierID = supplierID;
		this.cost = cost;
		this.purchase_date = purchase_date;
		this.receive_date = recive_date;
	}
	public Supplier_Bills(int supplierID, double cost, LocalDateTime purchase_date, LocalDateTime recive_date) 
	{
		super();
		this.supplierID = supplierID;
		this.cost = cost;
		this.purchase_date = purchase_date;
		this.receive_date = recive_date;
	}
	public int getID() 
	{
		return ID;
	}
	public void setID(int iD) 
	{
		ID = iD;
	}
	public int getSupplierID() 
	{
		return supplierID;
	}
	public void setSupplierID(int supplierID) 
	{
		this.supplierID = supplierID;
	}
	public double getCost() 
	{
		return cost;
	}
	public void setCost(double cost) 
	{
		this.cost = cost;
	}
	public LocalDateTime getPurchase_date() 
	{
		return purchase_date;
	}
	public void setPurchase_date(LocalDateTime purchase_date) 
	{
		this.purchase_date = purchase_date;
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
