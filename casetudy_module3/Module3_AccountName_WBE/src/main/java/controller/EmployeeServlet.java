package controller;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.EmployeeRepository;
import model.repository.EmployeeRepositoryImpl;
import model.service.EmployeeService;
import model.service.EmployeeServiceImpl;
import model.service.common.Validate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService = new EmployeeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "delete":
                try {
                    deleteEmployee(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            case "searchById":
                searchEmployeeById(request, response);
                break;
            default:
//                showCustomerList(request, response);
                break;
        }
    }

    private void searchEmployeeById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("employee_id"));
        Employee employee = this.employeeService.findById(id);
        List<Employee> employeeList = new ArrayList<>();
        if (employee != null) {
            employeeList.add(employee);
        }
        RequestDispatcher dispatcher;
        if (employeeList.isEmpty()) {
            dispatcher = request.getRequestDispatcher("/furama/employee_list.jsp");
        } else {
            request.setAttribute("employeeList", employeeList);
            dispatcher = request.getRequestDispatcher("/furama/employee_list.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("employee_name");
        List<Employee> employeeList = this.employeeService.findByName(name);
        RequestDispatcher dispatcher;
        if (employeeList.isEmpty()) {
            dispatcher = request.getRequestDispatcher("/furama/employee_list.jsp");
        } else {
            request.setAttribute("employeeList", employeeList);
            dispatcher = request.getRequestDispatcher("/furama/employee_list.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("employee_id"));
        String name = request.getParameter("employee_name");
        LocalDate birthday = LocalDate.parse(request.getParameter("employee_birthday"));
        String id_card = request.getParameter("employee_id_card");
        double salary = Double.parseDouble(request.getParameter("employee_salary"));
        String phone = request.getParameter("employee_phone");
        String email = request.getParameter("employee_email");
        String address = request.getParameter("employee_address");
        int position_id = Integer.parseInt(request.getParameter("position_id"));
        int education_degree_id = Integer.parseInt(request.getParameter("education_degree_id"));
        int division_id = Integer.parseInt(request.getParameter("division_id"));
        String employee_username = request.getParameter("employee_username");
        Employee employee = new Employee(id, name, birthday, id_card, salary, phone, email, address, position_id,
                null, education_degree_id, null, division_id, null,
                employee_username);
        RequestDispatcher dispatcher;
        if (employee == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.employeeService.update(id, employee);
            try {
                response.sendRedirect("/employee?action=list");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = this.employeeService.findById(id);
        RequestDispatcher dispatcher;
        if (employee == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
            dispatcher.forward(request, response);
        } else {
            this.employeeService.remove(id);
            response.sendRedirect("/employee?action=list");
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("employee_name");
        LocalDate birthday = LocalDate.parse(request.getParameter("employee_birthday"));
        String id_card = request.getParameter("employee_id_card");
        double salary = Double.parseDouble(request.getParameter("employee_salary"));
        String phone = request.getParameter("employee_phone");
        String email = request.getParameter("employee_email");
        String address = request.getParameter("employee_address");
        int position_id = Integer.parseInt(request.getParameter("position_id"));
        int education_degree_id = Integer.parseInt(request.getParameter("education_degree_id"));
        int division_id = Integer.parseInt(request.getParameter("division_id"));
        String username = request.getParameter("username");
        Employee employee = new Employee(1, name, birthday, id_card, salary, phone, email, address, position_id,
                null, education_degree_id, null, division_id, null, username);
        Map<String, String> mapMessage = employeeService.save(employee);
        if (mapMessage.isEmpty()) {
            showEmployeeList(request, response);
        } else {
            request.setAttribute("messEmployee_phone", mapMessage.get("phone"));
            request.setAttribute("messEmployee_id_card", mapMessage.get("idCard"));
            request.setAttribute("messEmployee_salary", mapMessage.get("salary"));
            request.setAttribute("messEmployee_email", mapMessage.get("email"));
            request.setAttribute("employee", employee);
            showCreateEmployee(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateEmployee(request, response);
                break;
            case "delete":
//                showDeleteForm(request, response);
                break;
            case "edit":
//                showEditForm(request, response);
                break;
            case "view":
//                viewProduct(request, response);
                break;
            case "list":
                showEmployeeList(request, response);
                break;
            default:
                showEmployeeList(request, response);
                break;
        }
    }

    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("employeeList", employeeService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/furama/employee_list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        response.sendRedirect("/furama/employee_add.jsp");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/furama/employee_add.jsp");
        requestDispatcher.forward(request, response);
    }
}
