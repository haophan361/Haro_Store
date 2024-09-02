package Service;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Product_dao;
import Model.Products;
public class product_Service extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public Product_dao product_dao=null;
	
	public void selectAllProduct(HttpServletRequest request,HttpServletResponse response,String role) throws ServletException,IOException
	{
		product_dao=new Product_dao();
		List<Products> products=product_dao.findAll();
        request.setAttribute("products", products);
        request.setAttribute("title", "listProducts");
        if(role.equals("Khách hàng"))
        {
        	RequestDispatcher requestDispatcher=request.getRequestDispatcher("views/web/home.jsp");
    		requestDispatcher.forward(request, response);
        }
        else
        {
        	RequestDispatcher requestDispatcher=request.getRequestDispatcher("views/admin/home.jsp");
    		requestDispatcher.forward(request, response);
        }
		
	}
	public void selectProduct(HttpServletRequest request,HttpServletResponse response,String role) throws ServletException,IOException
	{
		product_dao=new Product_dao();
		String keyword=request.getParameter("keyword");
		List<Products> products=product_dao.searchProduct(keyword);
		request.setAttribute("products", products);
		request.setAttribute("title", "search"+keyword);
		if(role.equals("Khách Hàng"))
        {
        	RequestDispatcher requestDispatcher=request.getRequestDispatcher("views/web/home.jsp");
    		requestDispatcher.forward(request, response);
        }
        else
        {
        	RequestDispatcher requestDispatcher=request.getRequestDispatcher("views/admin/home.jsp");
    		requestDispatcher.forward(request, response);
        }
	}
	public void newForm(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		request.getRequestDispatcher("/views/admin/addProduct.jsp").forward(request, response);
	}
	public void updateForm(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		Products product=new Products();
		product_dao=new Product_dao();
		int ID=Integer.parseInt(request.getParameter("ID"));
		product=product_dao.findProduct(ID);
		request.setAttribute("name", product.getProductName());
		request.setAttribute("type", product.getProductType());
		request.setAttribute("brand", product.getBrand());
		request.setAttribute("cost", product.getCost());
		request.setAttribute("quantity", product.getQuantity());
		request.setAttribute("image_url", product.getImage_url());
		RequestDispatcher requestdispatcher=request.getRequestDispatcher("views/admin/addProduct.jsp");
		requestdispatcher.forward(request, response);
	}
	public void insertProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		product_dao=new Product_dao();
		String name=request.getParameter("name");
		String type=request.getParameter("type");
		String brand=request.getParameter("brand");
		double cost=Double.parseDouble(request.getParameter("cost"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		String image_url="static/Image/"+request.getParameter("image_url");
		Products product=new Products(name,type,brand,cost,quantity,image_url);
		product_dao.insertProduct(product);
		RequestDispatcher requestdispatcher=request.getRequestDispatcher("trang-chu?action=listPro");
		requestdispatcher.forward(request, response);
	}
	public void updateProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		product_dao=new Product_dao();
		int ID=Integer.parseInt(request.getParameter("ID"));
		String name=request.getParameter("name");
		String type=request.getParameter("type");
		String brand=request.getParameter("brand");
		double cost=Double.parseDouble(request.getParameter("cost"));
		int quantity=Integer.parseInt(request.getParameter("quanity"));
		String image_url=request.getParameter("image_url");
		Products product=new Products(ID,name,type,brand,cost,quantity,image_url);
		product_dao.updateProduct(product);
		RequestDispatcher requestdispatcher=request.getRequestDispatcher("trang-chu?action=listPro");
		requestdispatcher.forward(request, response);
	}
	public void deleteProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		product_dao=new Product_dao();
		int ID=Integer.parseInt(request.getParameter("ID"));
		product_dao.deleteProduct(ID);
		RequestDispatcher requestdispatcher=request.getRequestDispatcher("trang-chu?action=listPro");
		requestdispatcher.forward(request, response);
	}
}
