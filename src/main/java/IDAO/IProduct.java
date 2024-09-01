package IDAO;
import Model.Products;
import java.util.List;
public interface IProduct 
{
	public boolean insertProduct(Products product);
	public boolean updateProduct(Products product);
	public boolean deleteProduct(int ID);
	public List<Products> searchProduct (String keyword);
	public List<Products> typeProduct(String productType);
	public List<Products>findAll();
	public Products findProduct(int ID);
}
