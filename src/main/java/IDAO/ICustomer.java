package IDAO;
import java.util.List;
import Model.Customers;
public interface ICustomer 
{
	public boolean updateCustomer(int iD, String cusName, String address, String phone);
	public boolean deleteCustomer(int ID);
	public List<Customers> findAll();
	public Customers findCustomer(String keyword);
}
