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
</head>
<body>
<div>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="row container-fluid">
        <jsp:include page="side_bar.jsp"></jsp:include>
        <%--    noi dung --%>
        <div class="align-content-center col-lg-10 ">
            <h2>Add new customer</h2>
            <form action="/customer" method="post">
                <input type="hidden" name="action" value="create">
                <div class="custom-control custom-checkbox ">
                    <table class="table table-striped border-dark form-group">
                        <tr>
                            <td>Tên khách hàng:</td>
                            <td><input type="text" name="customer_name" value="${customer.getCustomer_name()}" class="form-control"></td>

                        </tr>
                        <tr>
                            <td>Loại khách hàng:</td>
                            <td>
                                <input type="radio" id="Diamond" name="customer_type" value="1" checked ${customer.getCustomer_type_id() == 1 ? 'checked': ''}>
                                <label for="Diamond">Diamond</label><br>
                                <input type="radio" id="Platinium" name="customer_type" value="2" ${customer.getCustomer_type_id() == 2 ? 'checked': ''}>
                                <label for="Platinium">Platinium</label><br>
                                <input type="radio" id="Gold" name="customer_type" value="3" ${customer.getCustomer_type_id() == 3 ? 'checked': ''}>
                                <label for="Gold">Gold</label><br>
                                <input type="radio" id="Silver" name="customer_type" value="4" ${customer.getCustomer_type_id() == 4 ? 'checked': ''}>
                                <label for="Silver">Silver</label><br>
                                <input type="radio" id="Member" name="customer_type" value="5" ${customer.getCustomer_type_id() == 5 ? 'checked': ''}>
                                <label for="Member">Member</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td>Mã khách hàng:</td>
                            <td>
                                <input type="text" name="customer_code" value="${customer.getCustomer_code()}"  class="form-control">
                                <c:if test="${messCustomer_code != null}">
                                    <small class="form-text text-danger">${messCustomer_code}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>Ngày sinh:</td>
                            <td><input type="date" name="customer_birthday" value="${customer.getCustomer_birthday()}"  class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Giới tính:</td>
                            <td>
                                <input type="radio" id="nam" name="customer_gender" value="1" checked ${customer.getCustomer_gender() == 1 ? 'checked': ''}>
                                <label for="nam" >Nam</label><br>
                                <input type="radio" id="nu" name="customer_gender" value="0" ${customer.getCustomer_gender() == 0 ? 'checked': ''}>
                                <label for="nu" >Nữ</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td>Số CMND:</td>
                            <td>
                                <input type="text" name="customer_id_card" value="${customer.getCustomer_id_card()}"  class="form-control">
                                <c:if test="${messCustomer_id_card != null}">
                                    <small class="form-text text-danger">${messCustomer_id_card}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td>
                                <input type="text" name="customer_phone" value="${customer.getCustomer_phone()}"  class="form-control">
                                <c:if test="${messCustomer_phone != null}">
                                    <small class="form-text text-danger">${messCustomer_phone}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>
                                <input type="text" name="customer_email" value="${customer.getCustomer_email()}"  class="form-control">
                                <c:if test="${messCustomer_email != null}">
                                    <small class="form-text text-danger">${messCustomer_email}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>Địa chỉ:</td>
                            <td><input type="text" name="customer_address" value="${customer.getCustomer_address()}"  class="form-control"></td>
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
