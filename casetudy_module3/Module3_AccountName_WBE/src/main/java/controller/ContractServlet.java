package controller;

import model.bean.Contract;
import model.bean.Customer;
import model.repository.ContractRepository;
import model.repository.ContractRepositoryImpl;
import model.service.ContractService;
import model.service.ContractServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {
    ContractService contractService = new ContractServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createContract(request, response);
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

    private void createContract(HttpServletRequest request, HttpServletResponse response) {
        String contract_start_date =request.getParameter("contract_start_date");
        String contract_end_date = request.getParameter("contract_end_date");
        double contract_deposit = Double.parseDouble(request.getParameter("contract_deposit"));
        double contract_total_money = Double.parseDouble(request.getParameter("contract_total_money"));
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int service_id = Integer.parseInt(request.getParameter("service_id"));
        Contract contract = new Contract(1,contract_start_date,contract_end_date,contract_deposit
                ,contract_total_money,employee_id,null,customer_id,null,service_id,null);
        contractService.save(contract);
        try {
            response.sendRedirect("../furama/contract_add.jsp");
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
                showCreateContract(request, response);
                break;
            case "edit":
//                showEditForm(request, response);
                break;
            case "list":
                showContractList(request, response);
                break;
            default:
                showContractList(request, response);
                break;
        }
    }

    private void showContractList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("contractList", contractService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/furama/contract_list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateContract(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/furama/contract_add.jsp");
    }
}
