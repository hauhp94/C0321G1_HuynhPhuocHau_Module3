<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 7/12/2021
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý phòng trọ</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="row">
    <jsp:include page="../layout/side_bar.jsp"></jsp:include>

    <%--    noi dung --%>
    <div class=" h-100 col-lg-10 ">

        <%--        <c:if test=""--%>
        <div class="row">
            <a class="btn btn-success mb-2" href="/phongtro?action=create" role="button">Create</a>
            <div class="mx-5">
                <form action="/phongtro" method="post" class="form-inline my-2 my-lg-0">
                    <input type="hidden" name="action" value="search">
                    <input type="search" name="key" placeholder="Name, id of phone" class="form-control">
                    <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by name, id,sdt</button>
                </form>
            </div>
        </div>
            <c:if test="${empty phongTroList}">
            <h3>Contract list empty !</h3>
        </c:if>
        <c:if test="${not empty phongTroList}">
            <table class="table table-striped table-bordered align-content-center" id="tableContract">
                <thead class="thead-dark">
                <tr>
                    <th>STT</th>
                    <th>Mã phòng trọ</th>
                    <th>Tên người thuê</th>
                    <th>Số điện thoại</th>
                    <th>Ngày bắt đầu thuê</th>
                    <th>Hình thức thanh toán</th>
                    <th>Ghi chú</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${phongTroList}" var="phong_tro">
                    <tr>
                        <td>stt</td>
                        <td>PT- ${phong_tro.maPhongTro}</td>
                        <td>${phong_tro.tenNguoiThue}</td>
                        <td>${phong_tro.soDienThoai}</td>
                        <td>${phong_tro.ngayBatDau}</td>
                        <td>${phong_tro.tenHinhThucThanhToan}</td>
                        <td>${phong_tro.ghiChu}</td>
                        <td>
                            <button onclick="onDelete('${phong_tro.maPhongTro}','${phong_tro.tenNguoiThue}')"
                                    type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelId">
                                Delete
                            </button>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

    </div>



    </div>
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/phongtro" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="${phongTro.tenNguoiThue}" id="idPhongTroXoa">
                <div class="modal-body">
                    Ban co muon xoa <input id="tenPhongTroXoa" disabled>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Ok</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<!-- Footer -->
<jsp:include page="../layout/footer.jsp"></jsp:include>
<!-- Footer -->
<script>
    function onDelete(id, name) {
        document.getElementById("idPhongTroXoa").value = id;
        console.log(name);
        document.getElementById("tenPhongTroXoa").value = name;
    }
</script>
</body>
</html>
