package Service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Account_dao;
import Model.Accounts;
import Model.Customers;

public class account_Service 
{
	Account_dao account_dao=null;
	List<Accounts> accounts =null;
	public void insertCustomer(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		account_dao=new Account_dao();
		String cusName=request.getParameter("name");
		String email=request.getParameter("email");
		String city=request.getParameter("city");
		String district=request.getParameter("district");
		String ward=request.getParameter("ward");
		String houseNo=request.getParameter("houseNo");
		String address=city+" "+district+" "+ward+" "+houseNo;
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
        System.out.println("Họ và tên: " + cusName);
        System.out.println("Tỉnh/Thành phố: " + city);
        System.out.println("Quận/Huyện: " + district);
        System.out.println("Phường/Xã: " + ward);
        System.out.println("Số nhà, Tên đường: " + houseNo);
        System.out.println("Số điện thoại: " + phone);
        System.out.println("Email: " + email);
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
	public void insertAccount(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		account_dao=new Account_dao();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Accounts account=new Accounts(email,password);
		account_dao.insertAccount(account);
		request.getRequestDispatcher("views/web/login.jsp").forward(request, response);
	}
	public void checkLogin(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		account_dao=new Account_dao();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Accounts account=new Accounts(email,password);
		if(account_dao.checkLogin(account) != null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("account", account);
			response.sendRedirect("/trang-chu");
		}
		else
		{
			request.getRequestDispatcher("views/web/login.jsp").forward(request, response);
		}
	}
}
