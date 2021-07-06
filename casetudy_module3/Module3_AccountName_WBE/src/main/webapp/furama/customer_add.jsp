<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 7/2/2021
  Time: 10:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Customer</title>
<%--    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>--%>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="side_bar.jsp"></jsp:include>
<%--    noi dung --%>
    <div class="align-content-center col-lg-10 ">
        <h2>Add new customer</h2>
        <form action="/customer" method="post" >
            <input type="hidden" name="action" value="create">
            <div class="custom-control custom-checkbox">
                <table class="table table-striped border-dark">
                    <tr>
                        <td>Tên khách hàng: </td>
                        <td><input type="text" name="customer_name"></td>
                    </tr>
                    <tr>
                        <td>Loại khách hàng: </td>
                        <td>
                            <input type="radio" id="Diamond" name="customer_type" value="1" checked>
                            <label for="Diamond">Diamond</label><br>
                            <input type="radio" id="Platinium" name="customer_type" value="2">
                            <label for="Platinium">Platinium</label><br>
                            <input type="radio" id="Gold" name="customer_type" value="3">
                            <label for="Gold">Gold</label><br>
                            <input type="radio" id="Silver" name="customer_type" value="4">
                            <label for="Silver">Silver</label><br>
                            <input type="radio" id="Member" name="customer_type" value="5">
                            <label for="Member">Member</label><br>
                        </td>
                    </tr>
                    <tr>
                        <td>Mã khách hàng: </td>
                        <td><input type="text" name="customer_code"></td>
                    </tr>
                    <tr>
                        <td>Ngày sinh: </td>
                        <td><input type="date" name="customer_birthday"></td>
                    </tr>
                    <tr>
                        <td>Giới tính: </td>
                        <td>
                            <input type="radio" id="nam" name="customer_gender" value="1" checked>
                            <label for="nam">Nam</label><br>
                            <input type="radio" id="nu" name="customer_gender" value="0">
                            <label for="nu">Nữ</label><br>
                        </td>
                    </tr>
                    <tr>
                        <td>Số CMND: </td>
                        <td><input type="text" name="customer_id_card"></td>
                    </tr>
                    <tr>
                        <td>Số điện thoại: </td>
                        <td><input type="text" name="customer_phone"></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="customer_email"></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ: </td>
                        <td><input type="text" name="customer_address"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button class="btn btn-success" type="submit">Save</button> </td>
                    </tr>

                </table>
            </div>
        </form>
    </div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Footer -->
<%--<script src="../assert/jquery/jquery-3.5.1.min.js"></script>--%>
<%--<script src="../assert/datatables/js/jquery.dataTables.js"></script>--%>
<%--<script src="../assert/datatables/js/dataTables.bootstrap4.js"></script>--%>
<%--<script src="../assert/jquery/popper.min.js"></script>--%>
<%--<script src="../assert/bootstrap4/js/bootstrap.js"></script>--%>
</body>
</html>
