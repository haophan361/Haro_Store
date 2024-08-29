package IDAO;
import java.util.List;
import Model.BillDetails;
public interface IBillDetail 
{
	public boolean insertBillDetail(int billID, int proID, int quantity);
	public boolean updateBillDetail(int iD, int billID, int proID, int quantity);
	public boolean deleteBillDetail(int ID);
	public List<BillDetails> findAll();
	public List<BillDetails> searchBillDetail(int billID);
}
