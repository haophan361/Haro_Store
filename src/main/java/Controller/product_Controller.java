package Controller;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Accounts;
import Service.product_Service;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
@WebServlet(urlPatterns = {"/trang-chu"})
public class product_Controller extends HttpServlet
{
	private static final long serialVersionUID=2686801510274002166L;
	product_Service productService=null;
	protected void doGet (HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		productService=new product_Service();
		Accounts user = (Accounts) request.getSession().getAttribute("account");
        if(user == null)
        {   
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/login.jsp");
            dispatcher.forward(request, response);
        }
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
			case"listPro":
			{
				productService.selectAllProduct(request, response);
				break;
			}
			default:
			{
				doPost(request,response);
			}
		}
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
}
