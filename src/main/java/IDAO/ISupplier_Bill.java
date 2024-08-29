package IDAO;
import java.util.List;
import Model.Supplier_Bills;
public interface ISupplier_Bill 
{
	public boolean insertSupplierBill(int supplierID,int status);
	public boolean updateSupplierBill(int ID,int supplierID,int status);
	public boolean updateReceive_date(int ID);
	public boolean deleteSupplierBill(int ID);
	public List<Supplier_Bills> findAll();
	public List<Supplier_Bills> searchSupplier_Bill(String keyword);
	public List<Supplier_Bills> bill_BySupplierID(int ID);
	public List<Supplier_Bills> paidSupplier_Bill();
	public List<Supplier_Bills> receiveSupplier_Bill();
}
