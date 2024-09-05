package IDAO;

import Model.Accounts;
import Model.Customers;

public interface IAccount 
{
	public boolean insertCustomer(Customers customer,Accounts account);
	public boolean changePassword(String email,String password);
	public Accounts checkLogin(Accounts account);
	public String getPassword(String email);
}
