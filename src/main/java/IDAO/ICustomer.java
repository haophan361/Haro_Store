package IDAO;
import java.util.List;
import Model.Customers;
public interface ICustomer 
{
	public boolean updateCustomer(Customers customer);
	public boolean deleteCustomer(int ID);
	public List<Customers> findAll();
	public Customers findCustomer(String keyword);
}
