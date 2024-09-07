package Controller;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Accounts;
import Service.product_Service;

import java.io.IOException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
@WebServlet(urlPatterns = {"/trang-chu"})
@MultipartConfig
public class product_Controller extends HttpServlet
{
	product_Service productService;
	public void init()
	{
		productService=new product_Service();
	}
	protected void doGet (HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		String role;
		Accounts account = (Accounts) request.getSession().getAttribute("account");
        if(account == null)
        {   
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/login.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
        	role=account.getRole();
        	String action=request.getParameter("action");
        	if(action==null)
    		{
    			action="listPro";
    		}
        	if(role.equals("Customer"))
        	{
        		switch (action)
        		{
        			case "searchPro":
        			{
        				productService.selectProduct(request, response,role);
        				break;
        			}
        			case "listPro":
        			{
        				productService.selectAllProduct(request, response,role);
        				break;
        			}
        			default:
        			{
        				doPost(request,response);
        			}
        		}
        	}
        	else
        	{
        		switch (action)
        		{
        			case "searchPro":
        			{
        				productService.selectProduct(request, response,role);
        				break;
        			}
        			case "listPro":
        			{
        				productService.selectAllProduct(request, response,role);
        				break;
        			}
        			case "editForm":
        			{
        				productService.updateForm(request, response);
        				break;
        			}
        			case "newForm" :
        			{
        				productService.newForm(request, response);
        				break;
        			}
        			default:
        			{
        				doPost(request,response);
        			}
        		}
        	}
        }
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		Accounts account = (Accounts) request.getSession().getAttribute("account");
		String role=account.getRole();
		
		String action=request.getParameter("action");
		if(action==null)
		{
			action="listPro_admin";
		}
		switch(action)
		{
			case "insertPro":
			{
				productService.insertProduct(request, response,getServletContext());
				break;
			}
			case "updatePro":
			{
				productService.updateProduct(request, response);
				break;
			}
			case "deletePro":
			{
				productService.deleteProduct(request, response);
				break;
			}
			default :
			{
				productService.selectAllProduct(request, response,role);
			}
		}
	}
}
