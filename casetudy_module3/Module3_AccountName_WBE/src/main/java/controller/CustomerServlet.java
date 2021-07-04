package controller;

import model.bean.Customer;
import model.service.CustomerService;
import model.service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private CustomerService service = new CustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "delete":
//                try {
//                    deleteProduct(request, response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "search":
//                searchProduct(request, response);
                break;
            default:
                showCustomerList(request, response);
                break;
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
//        int id= Integer.parseInt(request.getParameter("customer_id"));
        int id = Integer.parseInt(request.getParameter("customer_id"));
        String name = request.getParameter("customer_name");
        String code = request.getParameter("customer_code");
        int type_id = Integer.parseInt(request.getParameter("customer_type"));
        LocalDate birthday = LocalDate.parse(request.getParameter("customer_birthday"));
        int gender = Integer.parseInt(request.getParameter("customer_gender"));
        String id_card = request.getParameter("customer_id_card");
        String phone = request.getParameter("customer_phone");
        String email = request.getParameter("customer_email");
        String address = request.getParameter("customer_address");
        Customer customer = new Customer(id, code, type_id, null, name, birthday,
                gender, id_card, phone, email, address);
        RequestDispatcher dispatcher;
        if (customer== null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.service.update(id, customer);
            try {
                response.sendRedirect("/furama/home.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerList", service.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/furama/customer_list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("customer_name");
        String code = request.getParameter("customer_code");
        int type_id = Integer.parseInt(request.getParameter("customer_type"));
        LocalDate birthday = LocalDate.parse(request.getParameter("customer_birthday"));
        int gender = Integer.parseInt(request.getParameter("customer_gender"));
        String id_card = request.getParameter("customer_id_card");
        String phone = request.getParameter("customer_phone");
        String email = request.getParameter("customer_email");
        String address = request.getParameter("customer_address");
        Customer customer = new Customer(1, code, type_id, null, name, birthday,
                gender, id_card, phone, email, address);
        service.save(customer);
        try {
            response.sendRedirect("../furama/customer_add.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
//                showCreatePage(request, response);
                break;
            case "delete":
//                showDeleteForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "view":
//                viewProduct(request, response);
                break;
            case "list":
                showCustomerList(request, response);
                break;
            default:
                showCustomerList(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.service.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("/furama/customer_edit.jsp");
            dispatcher.forward(request, response);
        }

    }
}
