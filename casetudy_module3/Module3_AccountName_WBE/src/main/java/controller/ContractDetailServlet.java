package controller;

import model.bean.Contract;
import model.bean.ContractDetail;
import model.service.ContractDetailService;
import model.service.ContractDetailServiceImpl;
import model.service.ContractService;
import model.service.ContractServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContractDetailServlet", urlPatterns = "/contractDetail")
public class ContractDetailServlet extends HttpServlet {
    ContractDetailService contractDetailService = new ContractDetailServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createContractDetail(request, response);
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

    private void createContractDetail(HttpServletRequest request, HttpServletResponse response) {
        int contract_id = Integer.parseInt(request.getParameter("contract_id"));
        int attach_service_id = Integer.parseInt(request.getParameter("attach_service_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ContractDetail contractDetail = new ContractDetail(1,contract_id,attach_service_id,quantity);
        contractDetailService.save(contractDetail);
        try {
            response.sendRedirect("../furama/contract_detail_add.jsp");
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
                showCreateContractDetail(request, response);
                break;
            case "edit":
//                showEditForm(request, response);
                break;
            case "list":
//                showCustomerList(request, response);
                break;
            default:
//                showCustomerList(request, response);
                break;
        }
    }

    private void showCreateContractDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/furama/contract_detail_add.jsp");

    }
}
