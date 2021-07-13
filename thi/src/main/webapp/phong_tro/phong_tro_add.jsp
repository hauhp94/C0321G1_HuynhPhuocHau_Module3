<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 7/12/2021
  Time: 9:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="row">
    <jsp:include page="../layout/side_bar.jsp"></jsp:include>

    <%--    noi dung --%>
    <div class=" h-100 col-lg-10 ">
        <%--        <c:if test=""--%>
            <h2>Thêm phòng trọ</h2>
            <form action="/phongtro" method="post">
                <input type="hidden" name="action" value="create">
                <div class="custom-control custom-checkbox ">
                    <table class="table table-striped border-dark form-group">
                        <tr>
                            <td>Tên người thuê:</td>
                            <td><input type="text" name="ten_nguoi_thue" value="${phongTro.tenNguoiThue}" class="form-control"></td>

                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td>
                                <input type="text" name="so_dien_Thoai" value="${phongTro.soDienThoai}"  class="form-control">
                                <c:if test="${messPhongTro_phone != null}">
                                    <small class="form-text text-danger">${messPhongTro_phone}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>Ngày bắt đầu thuê:</td>
                            <td><input type="date" name="ngay_bat_dau" value="${phongTro.ngayBatDau}"  class="form-control"></td>
                        </tr>


                        <tr>
                            <td>Hình thức thanh toán:</td>
                            <td>
                                <input type="radio" id="thang" name="hinh_thuc_thanh_toan" value="1" checked ${phongTro.idHinhThucThanhToan == 1 ? 'checked': ''}>
                                <label for="thang" >Theo tháng</label><br>
                                <input type="radio" id="quy" name="hinh_thuc_thanh_toan" value="2" ${phongTro.idHinhThucThanhToan == 2 ? 'checked': ''}>
                                <label for="quy" >Theo quý</label><br>
                                <input type="radio" id="nam" name="hinh_thuc_thanh_toan" value="3" ${phongTro.idHinhThucThanhToan == 3 ? 'checked': ''}>
                                <label for="nam" >Theo năm</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td>Ghi chú:</td>
                            <td><input type="text" name="ghi_chu" value="${phongTro.ghiChu}"  class="form-control"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="btn btn-success" type="submit">Save</button>
                            </td>
                        </tr>

                    </table>
                </div>
            </form>
    </div>
</div>
<!-- Footer -->
<jsp:include page="../layout/footer.jsp"></jsp:include>
<!-- Footer -->
</body>
</html>
