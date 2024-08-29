package Controller;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.product_Service;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
@WebServlet(urlPatterns = {"/trang-chu"})
public class product_Controller extends HttpServlet
{
	private static final long serialVersionUID=2686801510274002166L;
	product_Service productService=null;
	protected void doGet (HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		productService=new product_Service();
		String action=request.getParameter("action");
		if(action==null)
		{
			action="listPro";
		}
		switch (action)
		{
			case "searchPro":
			{
				productService.selectProduct(request, response);
				break;
			}
			case "insertPro":
			{
				break;
			}
			case "updatePro":
			{
				break;
			}
			case "deletePro":
			{
				break;
			}
			default:
			{
				productService.selectAllProduct(request, response);
				break;
			}
		}
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
}
