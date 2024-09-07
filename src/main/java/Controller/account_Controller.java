package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Accounts;
import Service.account_Service;
@WebServlet(urlPatterns = {"/trang-dang-nhap","/trang-dang-ki"})
public class account_Controller extends HttpServlet
{
	account_Service account_Service;
	public account_Controller()
	{
		 account_Service=new account_Service();
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		if(action==null)
		{
			action="getPassword";
		}
		if(session!=null)
		{
			Accounts account = (Accounts) session.getAttribute("account");
			switch (action)
			{
				case "logout" :
				{
					session.invalidate();
					break;
				}
				case "passwordForm":
				{
					String email = account.getEmail();
					account_Service.passwordForm(request,response,email);
					break;
				}
			}
		}
		response.sendRedirect(request.getContextPath()+"views/web/login.jsp");
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		HttpSession session=request.getSession();
		Accounts account = (Accounts) session.getAttribute("account");
		String action=request.getParameter("action");
		switch(action)
		{
			case "login" :
			{
				account_Service.checkLogin(request, response);
				break;
			}
			case "register" :
			{
				account_Service.insertCustomer(request, response);
				break;
			}
			case "changePassword" :
			{
				account_Service.changePassword(request, response,account.getEmail());
				break;
			}
		}
	}
}
