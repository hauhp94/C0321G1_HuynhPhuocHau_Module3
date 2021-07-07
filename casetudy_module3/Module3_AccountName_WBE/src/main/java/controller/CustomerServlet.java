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
import java.util.ArrayList;
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
                try {
                    deleteCustomer(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            case "searchById":
                searchCustomerById(request, response);
                break;
            default:
                showCustomerList(request, response);
                break;
        }
    }

    private void searchCustomerById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("customer_id"));
        Customer customer = this.service.findById(id);
        List<Customer> customerList = new ArrayList<>();
        if(customer!=null) {
            customerList.add(customer);
        }
        RequestDispatcher dispatcher;
        if (customerList.isEmpty()) {
            dispatcher = request.getRequestDispatcher("/furama/customer_list.jsp");
        } else {
            request.setAttribute("customerList", customerList);
            dispatcher = request.getRequestDispatcher("/furama/customer_list.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("customer_name");
        List<Customer> customerList = this.service.findByName(name);
        RequestDispatcher dispatcher;
        if (customerList.isEmpty()) {
            dispatcher = request.getRequestDispatcher("/furama/customer_list.jsp");
        } else {
            request.setAttribute("customerList", customerList);
            dispatcher = request.getRequestDispatcher("/furama/customer_list.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.service.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
            dispatcher.forward(request, response);
        } else {
            this.service.remove(id);
            response.sendRedirect("/customer?action=list");
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
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
                response.sendRedirect("/customer?action=list");
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
                showCreateCustomer(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "list":
                showCustomerList(request, response);
                break;
            case "CustomerService":
                showCustomerListWithService(request, response);
                break;
            default:
                showCustomerList(request, response);
                break;
        }
    }

    private void showCustomerListWithService(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerList", service.findAllAndService());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/furama/customer_list_service.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

//    private void showCustomerListWithService(HttpServletRequest request, HttpServletResponse response) {
//        request.setAttribute("customerList", service.findAllAndService());
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/furama/customer_list.jsp");
//        try {
//            requestDispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }
//    }

    private void showCreateCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/furama/customer_add.jsp");
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
