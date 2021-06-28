package servlet;

import modal.bean.Customer;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "CustomerServlet", urlPatterns = {"","/customer"})
public class CustomerServlet extends javax.servlet.http.HttpServlet {
    public static List<Customer> customerList;
    static {
        customerList=new ArrayList<>();
        customerList.add(new Customer("Nguyễn Quang Hải","01/01/1994", "Hà Nội","1.jpg"));
        customerList.add(new Customer("Nguyễn Văn Hải","01/12/1992", "Đà Nẵng","2.jpg"));
        customerList.add(new Customer("Nguyễn Quang Bình","12/01/1992", "Hà Nội","3.jpg"));
        customerList.add(new Customer("Nguyễn Long Hải","01/12/1980", "Quảng Nam","4.jpg"));
    }
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/list.jsp");
        requestDispatcher.forward(request,response);
    }
}
