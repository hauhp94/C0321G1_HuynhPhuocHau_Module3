package controller;

import model.bean.PhongTro;
import model.service.PhongTroService;
import model.service.PhongTroServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet(name = "PhongTroServlet",urlPatterns = {"/phongtro",""})
public class PhongTroServlet extends HttpServlet {
    private PhongTroService service = new PhongTroServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createPhongTro(request, response);
                break;
            case "delete":
                try {
                    deletePhongTro(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
//                updateCustomer(request, response);
                break;
            case "search":
                searchPhongTro(request, response);
                break;
            case "searchById":
//                searchCustomerById(request, response);
                break;
            default:
//                showCustomerList(request, response);
                break;
        }
    }

    private void searchPhongTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        List<PhongTro> phongTroList = this.service.findByName(key);
        RequestDispatcher dispatcher;
        if (phongTroList.isEmpty()) {
            dispatcher = request.getRequestDispatcher("/phong_tro/phong_tro_list.jsp");
        } else {
            request.setAttribute("phongTroList", phongTroList);
            dispatcher = request.getRequestDispatcher("/phong_tro/phong_tro_list.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void deletePhongTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        PhongTro phongTro = this.service.findById(id);
        RequestDispatcher dispatcher;
        if (phongTro == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
            dispatcher.forward(request, response);
        } else {
            this.service.remove(id);
            response.sendRedirect("/phongtro?action=list");
        }
    }

    private void createPhongTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("ten_nguoi_thue");
        String so_dien_thoai = request.getParameter("so_dien_Thoai");
        LocalDate ngay_bat_dau = LocalDate.parse(request.getParameter("ngay_bat_dau"));
        int hinh_thuc_thanh_toan = Integer.parseInt(request.getParameter("hinh_thuc_thanh_toan"));
        String ghi_chu = request.getParameter("ghi_chu");
        PhongTro phongTro = new PhongTro(1,name,so_dien_thoai,ngay_bat_dau,hinh_thuc_thanh_toan,null,ghi_chu);
//        Map<String, String> mapMessage  = service.save(customer);
        service.save(phongTro);
        showCreatePhongTro(request,response);
//        if (mapMessage.isEmpty()){
//            showCustomerList(request, response);
//        }else {
//            request.setAttribute("messCustomer_code", mapMessage.get("code"));
//            request.setAttribute("messCustomer_id_card", mapMessage.get("idCard"));
//            request.setAttribute("messCustomer_phone", mapMessage.get("phoneNumber"));
//            request.setAttribute("messCustomer_email", mapMessage.get("email"));
//            request.setAttribute("customer", customer);
//            showCreateCustomer(request, response);
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreatePhongTro(request, response);
                break;
            case "edit":
//                showEditForm(request, response);
                break;
            case "list":
                showPhongTroList(request, response);
                break;
            default:
                showPhongTroList(request, response);
                break;
        }
    }

    private void showCreatePhongTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/phong_tro/phong_tro_add.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showPhongTroList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("phongTroList", service.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("phong_tro/phong_tro_list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
