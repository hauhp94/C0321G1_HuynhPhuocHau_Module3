import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "discountServlet",urlPatterns = "/display-discount")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String moTa = request.getParameter("moTa");
        double giaNiemYet = Double.parseDouble(request.getParameter("giaNiemYet"));
        double tyLeChietKhau = Double.parseDouble(request.getParameter("tyLeChietKhau"));
        double ketQua = giaNiemYet*tyLeChietKhau*0.01;
        request.setAttribute("moTa",moTa);
        request.setAttribute("giaNiemYet",giaNiemYet);
        request.setAttribute("tyLeChietKhau",tyLeChietKhau);
        request.setAttribute("ketQua",ketQua);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
