package Service;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

import DAO.Product_dao;
import Model.Products;
@MultipartConfig
public class product_Service extends HttpServlet
{
	Product_dao product_dao;
	public product_Service()
	{
		product_dao=new Product_dao();
	}
	
	public void selectAllProduct(HttpServletRequest request,HttpServletResponse response,String role) throws ServletException,IOException
	{
		List<Products> products=product_dao.findAll();
        request.setAttribute("products", products);
        request.setAttribute("title", "listProducts");
        if(role.equals("Customer"))
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
		String keyword=request.getParameter("keyword");
		List<Products> products=product_dao.searchProduct(keyword);
		request.setAttribute("products", products);
		request.setAttribute("title", "search"+keyword);
		if(role.equals("Customer"))
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
	public void newForm(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		response.sendRedirect(request.getContextPath()+"views/admin/addProduct.jsp");
	}
	public void updateForm(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		int ID=Integer.parseInt(request.getParameter("ID"));
		Products product=product_dao.findProduct(ID);
		request.setAttribute("ID",product.getID());
		request.setAttribute("name", product.getProductName());
		request.setAttribute("type", product.getProductType());
		request.setAttribute("brand", product.getBrand());
		request.setAttribute("cost", product.getCost());
		request.setAttribute("quantity", product.getQuantity());
		request.setAttribute("image_url", product.getImage_url());
		RequestDispatcher requestdispatcher=request.getRequestDispatcher("views/admin/addProduct.jsp");
		requestdispatcher.forward(request, response);
	}
	public void insertProduct(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String name=request.getParameter("name");
		String type=request.getParameter("type");
		String brand=request.getParameter("brand");
		double cost=Double.parseDouble(request.getParameter("cost"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));

		Part filePart=request.getpar
		String image_url=filePart.getSubmittedFileName();
		String uploadPath=getServletContext().getRealPath("/static/Image/");
		File uploadDir=new File(uploadPath);
		if(!uploadDir.exists())
		{
			uploadDir.mkdirs();
		}
		//String filePath=uploadPath+File.separator+image_url;
		//filePart.write(filePath);

		Products product=new Products(name,type,brand,cost,quantity,image_url);
		product_dao.insertProduct(product);
		response.sendRedirect("trang-chu?action=listPro");
	}
	public void updateProduct(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int ID=Integer.parseInt(request.getParameter("ID"));
		String name=request.getParameter("name");
		String type=request.getParameter("type");
		String brand=request.getParameter("brand");
		double cost=Double.parseDouble(request.getParameter("cost"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		Part filePart=request.getPart("imageCode");
		String image_url=filePart.getSubmittedFileName();
		Products product=new Products(ID,name,type,brand,cost,quantity,image_url);
		product_dao.updateProduct(product);
		response.sendRedirect("trang-chu?action=listPro");
	}
	public void deleteProduct(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int ID=Integer.parseInt(request.getParameter("ID"));
		product_dao.deleteProduct(ID);
		response.sendRedirect("trang-chu?action=listPro");
	}
}
