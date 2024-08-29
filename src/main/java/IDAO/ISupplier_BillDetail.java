package IDAO;
import java.util.List;
import Model.Supplier_BillDetails;
public interface ISupplier_BillDetail 
{
	public boolean insertSupplier_BillDetail(int supplierbillID, int productID,double cost ,int quantity);
	public boolean updateSupplier_BillDetail(int ID,int supplierbillID, int productID,double cost ,int quantity );
	public boolean deleteSupplier_BillDetail(int ID);
	public List<Supplier_BillDetails> findAll();
	public List<Supplier_BillDetails> searchSupplier_BillDetail(int billID);
}
