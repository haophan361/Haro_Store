package Service;

import DAO.Customer_dao;
import Model.Customers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class customer_Service
{
    Customer_dao customer_dao;
    public void updateForm(HttpServletRequest request, HttpServletResponse response, String email) throws ServletException, IOException
    {
        customer_dao= new Customer_dao();
        Customers customer=customer_dao.findCustomer(email);
        String[] address=customer.getAddress().split(",");
        String city=address[0];
        String district=address[1];
        String ward=address[2];
        String houseNo=address[3];
        request.setAttribute("ID",customer.getID());
        request.setAttribute("name", customer.getCusName());
        request.setAttribute("city",city);
        request.setAttribute("district",district);
        request.setAttribute("ward",ward);
        request.setAttribute("houseNo", houseNo);
        request.setAttribute("phone", customer.getPhone());
        RequestDispatcher requestdispatcher=request.getRequestDispatcher("views/web/updateCustomer.jsp");
        requestdispatcher.forward(request, response);
    }
    public void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        customer_dao= new Customer_dao();
        int ID=Integer.parseInt(request.getParameter("ID"));
        String name=request.getParameter("name");
        String city=request.getParameter("cityName");
        String district=request.getParameter("districtName");
        String ward=request.getParameter("wardName");
        String houseNo=request.getParameter("houseNo");
        String address=city+","+district+","+ward+","+houseNo;
        String phone=request.getParameter("phone");
        Customers customer=new Customers(ID,name,address,phone);
        customer_dao.updateCustomer(customer);
        response.sendRedirect("trang-chu?action=listPro");
    }
}
