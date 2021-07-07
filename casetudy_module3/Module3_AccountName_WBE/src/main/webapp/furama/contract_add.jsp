<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 7/7/2021
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Creat Contract</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row container-fluid">
<jsp:include page="side_bar.jsp"></jsp:include>
<%--    noi dung --%>
<div class=" h-100 col-lg-10">
    <h2>Create Contract</h2>
    <form action="/contract" method="post" >
        <input type="hidden" name="action" value="create">
        <div class="custom-control custom-checkbox">
            <table class="table table-striped border-dark">
                <tr>
                    <td>Ngày bắt đầu: </td>
                    <td><input type="datetime-local"  name="contract_start_date"></td>
                </tr>
                <tr>
                    <td>Ngày kết thúc: </td>
                    <td><input type="datetime-local" name="contract_end_date"></td>
                </tr>
                <tr>
                    <td>Tiền đặt cọc: </td>
                    <td><input type="number" step="any" name="contract_deposit"></td>
                </tr>

                <tr>
                    <td>Tổng tiền: </td>
                    <td><input type="number" step="any" name="contract_total_money"></td>
                </tr>
                <tr>
                    <td>ID Nhân viên làm hợp đồng: </td>
                    <td><input type="number" name="employee_id"></td>
                </tr>
                <tr>
                    <td>ID Khách hàng: </td>
                    <td><input type="number" name="customer_id"></td>
                </tr>
                <tr>
                    <td>ID Dịch vụ: </td>
                    <td><input type="number" name="service_id"></td>
                </tr>
                <tr>
                    <td colspan="2"><button class="btn btn-success" type="submit">Save</button> </td>
                </tr>
            </table>
        </div>
    </form>
</div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Footer -->
</body>
</html>
