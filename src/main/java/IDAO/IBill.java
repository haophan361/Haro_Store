package IDAO;
import java.util.List;
import Model.Bills;

public interface IBill 
{
	public boolean insertBill(int cusID, int status, String address);
	public boolean updateBill(int iD, int cusID, int status, String address);
	public boolean updateReceive_date(int ID);
	public boolean deleteBill(int ID);
	public List<Bills> findAll();
	public List<Bills> paidBill();
	public List<Bills> receiveBill();
}
