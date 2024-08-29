package IDAO;

import java.util.List;

import Model.Suppliers;

public interface ISupplier 
{
	public boolean insertSupplier(String name,String address,String phone);
	public boolean updateSupplier(int ID,String name,String address,String phone);
	public List<Suppliers> findAll();
	public List<Suppliers> searchSupplier(String keyword);
}
