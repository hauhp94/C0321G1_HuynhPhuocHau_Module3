package controller;

import model.bean.Service;
import model.service.ServiceService;
import model.service.ServiceServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServiceServlet",urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    ServiceService serviceService = new ServiceServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createService(request, response);
                break;
            case "delete":
//                try {
//                    deleteCustomer(request, response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
                break;
            case "edit":
//                updateCustomer(request, response);
                break;
            case "search":
//                searchCustomer(request, response);
                break;
            case "searchById":
//                searchCustomerById(request, response);
                break;
            default:
//                showCustomerList(request, response);
                break;
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String service_name = request.getParameter("service_name");
        String service_code = request.getParameter("service_code");
        int service_area = Integer.parseInt(request.getParameter("service_area"));
        double service_cost = Double.parseDouble(request.getParameter("service_cost"));
        int service_max_people = Integer.parseInt(request.getParameter("service_max_people"));
        int rent_type_id = Integer.parseInt(request.getParameter("rent_type_id"));
        int service_type_id = Integer.parseInt(request.getParameter("service_type_id"));
        String standard_room = request.getParameter("standard_room");
        String description_other_convenience = request.getParameter("description_other_convenience");
        double pool_area = Double.parseDouble(request.getParameter("pool_area"));
        int number_of_floors = Integer.parseInt(request.getParameter("number_of_floors"));
        String free_service = request.getParameter("free_service");
        Service service = new Service(1,service_code,service_name,service_area,service_cost,
                service_max_people,rent_type_id,null,service_type_id,null,
                standard_room,description_other_convenience,pool_area,number_of_floors,free_service);
        serviceService.save(service);
        response.sendRedirect("../furama/service_add.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateService(request, response);
                break;
            case "delete":
//                try {
//                    deleteCustomer(request, response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
                break;
            case "edit":
//                updateCustomer(request, response);
                break;
            case "search":
//                searchCustomer(request, response);
                break;
            case "searchById":
//                searchCustomerById(request, response);
                break;
            default:
                showServiceList(request, response);
                break;
        }
    }

    private void showServiceList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setAttribute("serviceList", serviceService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/furama/service_list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void showCreateService(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/furama/service_add.jsp");
    }
}
