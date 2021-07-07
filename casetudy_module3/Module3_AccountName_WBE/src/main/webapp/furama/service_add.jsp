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
    <title>Add Service</title>
<%--    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>--%>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row container-fluid">
<jsp:include page="side_bar.jsp"></jsp:include>
        <%--    noi dung --%>
        <div class=" h-100 col-lg-10">
            <h2>Add new service</h2>
            <form action="/service" method="post" >
                <input type="hidden" name="action" value="create">
                <div class="custom-control custom-checkbox">
                    <table class="table table-striped border-dark">
                        <tr>
                            <td>Tên dịch vụ: </td>
                            <td><input type="text" name="service_name"></td>
                        </tr>
                        <tr>
                            <td>Mã dịch vụ: </td>
                            <td><input type="text" name="service_code"></td>
                        </tr>
                        <tr>
                            <td>Diện tích sử dụng: </td>
                            <td><input type="number" name="service_area"></td>
                        </tr>

                        <tr>
                            <td>Chi phí thuê: </td>
                            <td><input type="number" step="any" name="service_cost"></td>
                        </tr>
                        <tr>
                            <td>Số người tối đa: </td>
                            <td><input type="number" name="service_max_people"></td>
                        </tr>
                        <tr>
                            <td>Kiểu thuê: </td>
                            <td>
                                <input type="radio" id="nam" name="rent_type_id" value="1" >
                                <label for="nam">Năm</label><br>
                                <input type="radio" id="thang" name="rent_type_id" value="2">
                                <label for="thang">Tháng</label><br>
                                <input type="radio" id="ngay" name="rent_type_id" value="3" checked>
                                <label for="ngay">Ngày</label><br>
                                <input type="radio" id="gio" name="rent_type_id" value="4">
                                <label for="gio">Giờ</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td>Loại dịch vụ: </td>
                            <td>
                                <input type="radio" id="Villa" name="service_type_id" value="1" checked >
                                <label for="Villa">Villa</label><br>
                                <input type="radio" id="House" name="service_type_id" value="2">
                                <label for="House">House</label><br>
                                <input type="radio" id="Room" name="service_type_id" value="3" >
                                <label for="Room">Room</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td>Tiêu chuẩn phòng: </td>
                            <td><input type="text" name="standard_room"></td>
                        </tr>
                        <tr>
                            <td>Tiện nghi khác: </td>
                            <td><input type="text" name="description_other_convenience"></td>
                        </tr>
                        <tr>
                            <td>Diện tích hồ bơi: </td>
                            <td><input type="number"  step="any" name="pool_area"></td>
                        </tr>
                        <tr>
                            <td>Số tầng: </td>
                            <td><input type="number"  step="any" name="number_of_floors"></td>
                        </tr>
                        <tr>
                            <td>Dịch vụ miễn phí đi kèm: </td>
                            <td><input type="text" name="free_service"></td>
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
<%--<script src="../assert/jquery/jquery-3.5.1.min.js"></script>--%>
<%--<script src="../assert/datatables/js/jquery.dataTables.js"></script>--%>
<%--<script src="../assert/datatables/js/dataTables.bootstrap4.js"></script>--%>
<%--<script src="../assert/jquery/popper.min.js"></script>--%>
<%--<script src="../assert/bootstrap4/js/bootstrap.js"></script>--%>
</body>
</html>
