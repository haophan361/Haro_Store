package Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Account_dao;
import DAO.Customer_dao;
import Model.Accounts;
import Model.Customers;

public class account_Service 
{
	Account_dao account_dao;

	public void insertCustomer(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		account_dao=new Account_dao();
		String cusName=request.getParameter("name");
		String email=request.getParameter("email");
		String city=request.getParameter("cityName");
		String district=request.getParameter("districtName");
		String ward=request.getParameter("wardName");
		String houseNo=request.getParameter("houseNo");
		String address=city+", "+district+", "+ward+", "+houseNo;
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		Customers customer=new Customers(cusName,email,address,phone);
		Accounts account=new Accounts(email,password);
		account_dao.insertCustomer(customer,account);
		request.getRequestDispatcher("views/web/login.jsp").forward(request, response);
	}
	public void changePassword(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		account_dao=new Account_dao();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		account_dao.changePassword(email, password);
	}
	public void checkLogin(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		account_dao=new Account_dao();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Accounts account=new Accounts(email,password);
		Accounts check=account_dao.checkLogin(account);
		if(check!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("account", check);
			session.setAttribute("role", check.getRole());
			response.sendRedirect(request.getContextPath()+"/trang-chu");
		}
		else
		{
			request.getRequestDispatcher("views/web/login.jsp").forward(request, response);
		}
	}

	public void passwordForm(HttpServletRequest request, HttpServletResponse response,String email) throws ServletException,IOException
	{
		account_dao=new Account_dao();
		String password=account_dao.getPassword(email);
		request.setAttribute("password", password);
		request.getRequestDispatcher("views/web/passwordForm.jsp").forward(request, response);
	}
	public void changePassword(HttpServletRequest request, HttpServletResponse response,String email) throws ServletException,IOException
	{
		account_dao=new Account_dao();
		String password=request.getParameter("password");
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		String confirmPassword=request.getParameter("confirmPassword");
		if(password.equals(oldPassword))
		{
			if(newPassword.equals(confirmPassword))
			{
				account_dao.changePassword(email,newPassword);
				response.sendRedirect(request.getContextPath()+"/trang-chu?action=listPro");
			}
			else
			{
				request.setAttribute("errorMessage","Mật khẩu nhập không khớp");
				request.getRequestDispatcher("views/web/passwordForm.jsp").forward(request, response);
			}
		}
		else
		{
			request.setAttribute("errorMessage","Mật khẩu cũ không chính xác");
			request.getRequestDispatcher("views/web/passwordForm.jsp").forward(request, response);
		}
	}
}
