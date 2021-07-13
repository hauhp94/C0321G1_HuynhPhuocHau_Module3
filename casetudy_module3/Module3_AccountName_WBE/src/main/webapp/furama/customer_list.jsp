<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Customer List</title>
    <%--    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>--%>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row container-fluid">
<jsp:include page="side_bar.jsp"></jsp:include>
<%--    noi dung --%>
<div class="col-lg-10 ">
    <div class="row justify-content-center m-2">
        <a href="/furama/customer_add.jsp" class="btn btn-success my-2 my-lg-0 mx-5">Add new customer</a>
        <div class="mx-5">
            <form action="/customer" method="post" class="form-inline my-2 my-lg-0">
                <input type="hidden" name="action" value="search">
                <input type="search" name="customer_name" placeholder="Name customer" class="form-control">
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by name</button>
            </form>
        </div>
        <div class="mx-5">
            <form action="/customer" method="post" class="form-inline my-2 my-lg-0">
                <input type="hidden" name="action" value="searchById">
                <input type="search" name="customer_id" placeholder="Id customer" class="form-control">
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by id</button>
            </form>
        </div>
<%--        <a href="/furama/customer?action=service" class="btn btn-success my-2 my-lg-0 mx-5">Customers are using the service</a>--%>

    </div>
    <%--        <c:if test=""--%>
    <c:if test="${empty customerList}">
        <h3>Customer list empty !</h3>
    </c:if>
    <c:if test="${not empty customerList}">
        <table class="table table-striped table-bordered align-content-center d-inline-block w-100" style="overflow-x: scroll" id="tableCustomer">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Code customer</th>
                <th>Customer type</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>ID card</th>
                <th>Phone number</th>
                <th>Email</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customerList}" var="customer">
                <tr>
                    <td>${customer.customer_id}</td>
                    <td>${customer.customer_name}</td>
                    <td>${customer.customer_code}</td>
                        <%--                                                        <td>${customer.customer_type_id}</td>--%>
                    <td>${customer.customer_type_name}</td>
                    <td>${customer.customer_birthday}</td>
                    <td>
                        <c:if test="${customer.customer_gender==0}">Female</c:if>
                        <c:if test="${customer.customer_gender==1}">Male</c:if>
                    </td>
                    <td>${customer.customer_id_card}</td>
                    <td>${customer.customer_phone}</td>
                    <td>${customer.customer_email}</td>
                    <td>${customer.customer_address}</td>
                    <td>
                        <button onclick="onDelete('${customer.customer_id}','${customer.customer_name}')"
                                type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelId">
                            Delete
                        </button>
                        <button onclick="onEdit('${customer.customer_id}','${customer.customer_name}',
                                '${customer.customer_code}','${customer.customer_birthday}',
                                '${customer.customer_id_card}','${customer.customer_phone}',
                                '${customer.customer_email}','${customer.customer_address}',
                                '${customer.customer_gender}','${customer.customer_type_id}')"
                                type="button" class="btn btn-warning" data-toggle="modal"
                                data-target="#modelIdEdit">
                            Edit
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <%--            modal delete--%>
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
                <form action="/customer" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${customer.getCustomer_id()}" id="idCustomerDel">
                    <div class="modal-body">
                        Ban co muon xoa <input id="nameCustomerDel" disabled>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Ok</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%--            model edit--%>
    <div class="modal fade" id="modelIdEdit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit customer</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/customer" method="post">
                    <input type="hidden" name="action" value="edit">
                    <%--                            <input type="hidden" name="customer_id" value="${customer.getCustomer_id()}" id="idCustomerEdit">--%>
                    <div class="modal-body">
                        <table class="table table-striped border-dark ">
                            <tr>
                                <td>id</td>
                                <td>
                                    <input id="idCustomerEdit" name="customer_id" type="hidden" class="form-control">
                                    <input id="idCustomerEditShow" name="customer_id" disabled>
                                </td>
                            </tr>
                            <tr>
                                <td>Tên khách hàng:</td>
                                <td><input type="text" name="customer_name" id="nameCustomerEdit" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><label for="customer_type">Loại khách hàng:</label></td>
                                <td>
                                    <select id="customer_type" name="customer_type" class="form-control">
                                        <option value="1">Diamond</option>
                                        <option value="2">Platinium</option>
                                        <option value="3">Gold</option>
                                        <option value="4">Silver</option>
                                        <option value="5">Member</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Mã khách hàng:</td>
                                <td><input type="text" name="customer_code" id="customer_code" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>Ngày sinh:</td>
                                <td><input type="date" name="customer_birthday" id="customer_birthday" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><label for="customer_gender"> Giới tính:</label></td>
                                <td>
                                    <select id="customer_gender" name="customer_gender" class="form-control">
                                        <option value="1">Nam</option>
                                        <option value="0">Nữ</option>
                                    </select>
                                    <%--                                            <input type="radio" id="nam" name="customer_gender" value="1" checked>--%>
                                    <%--                                            <label for="nam">Nam</label><br>--%>
                                    <%--                                            <input type="radio" id="nu" name="customer_gender" value="0">--%>
                                    <%--                                            <label for="nu">Nữ</label><br>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>Số CMND:</td>
                                <td><input type="text" name="customer_id_card" id="customer_id_card" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>Số điện thoại:</td>
                                <td><input type="text" name="customer_phone" id="customer_phone" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><input type="text" name="customer_email" id="customer_email" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>Địa chỉ:</td>
                                <td><input type="text" name="customer_address" id="customer_address" class="form-control"></td>
                            </tr>

                        </table>
                        <%--                                Ban co muon xoa <input id="nameCustomerEdit">--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer -->
<%--        <script src="../assert/jquery/jquery-3.5.1.min.js"></script>--%>
<%--        <script src="../assert/datatables/js/jquery.dataTables.js"></script>--%>
<%--        <script src="../assert/datatables/js/dataTables.bootstrap4.js"></script>--%>
<%--        <script src="../assert/jquery/popper.min.js"></script>--%>
<%--        <script src="../assert/bootstrap4/js/bootstrap.js"></script>--%>
<script>
    function onDelete(id, name) {
        document.getElementById("idCustomerDel").value = id;
        console.log(name);
        document.getElementById("nameCustomerDel").value = name;
    }

    function onEdit(id, name, code, birthday, id_card, phone, email, address, gender, type_id) {
        document.getElementById("idCustomerEdit").value = id;
        document.getElementById("idCustomerEditShow").value = id;
        document.getElementById("nameCustomerEdit").value = name;
        document.getElementById("customer_code").value = code;
        document.getElementById("customer_birthday").value = birthday;
        document.getElementById("customer_id_card").value = id_card;
        document.getElementById("customer_phone").value = phone;
        document.getElementById("customer_email").value = email;
        document.getElementById("customer_address").value = address;
        document.getElementById("customer_gender").value = gender;
        document.getElementById("customer_type").value = type_id;
    }
</script>

<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
</body>
</html>
