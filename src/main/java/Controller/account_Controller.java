package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.account_Service;
@WebServlet(urlPatterns = {"/trang-dang-nhap","/trang-dang-ki"})
public class account_Controller extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	account_Service account_Service=null;
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		request.getSession().invalidate();
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		String action=request.getParameter("action");
		if(action.equals("login"))
		{
			account_Service=new account_Service();
			account_Service.checkLogin(request, response);
		}
		else if(action.equals("register"))
		{
			account_Service=new account_Service();	
			account_Service.insertCustomer(request, response);
		}
	}
}
