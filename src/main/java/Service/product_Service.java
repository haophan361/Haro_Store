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
	private Product_dao product_dao=null;
	List<Products> products;
	public void selectAllProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		product_dao=new Product_dao();
		products=product_dao.findAll();
        request.setAttribute("products", products);
        request.setAttribute("title", "Products");
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("views/web/home.jsp");
		requestDispatcher.forward(request, response);
	}
	public void selectProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		product_dao=new Product_dao();
		String keyword=request.getParameter("query");
		products=product_dao.searchProduct(keyword);
		request.setAttribute("products", products);
		request.setAttribute("title", "search");
		RequestDispatcher requestdispatcher=request.getRequestDispatcher("views/web/home.jsp");
		requestdispatcher.forward(request,response);
	}
}
