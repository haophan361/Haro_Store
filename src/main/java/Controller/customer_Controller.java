package Controller;

import Model.Accounts;
import Service.customer_Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = {"/nguoi-dung"})
public class customer_Controller extends HttpServlet
{
    customer_Service customer_service;
    public customer_Controller()
    {
        customer_service = new customer_Service();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        String action=request.getParameter("action");
        Accounts account = (Accounts) request.getSession().getAttribute("account");
        switch (action)
        {
            case "updateForm":
            {
                String email = account.getEmail();
                customer_service.updateForm(request,response,email);
                break;
            }
            default:
            {
                doPost(request, response);
            }
        }
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
    {
        String action=request.getParameter("action");
        switch (action)
        {
            case "updateCustomer":
            {
                customer_service.updateCustomer(request,response);
                break;
            }
        }
    }
}
