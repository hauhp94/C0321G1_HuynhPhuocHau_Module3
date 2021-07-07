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
                    <input type="search" name="customer_name" placeholder="Name customer">
                    <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by name</button>
                </form>
            </div>
            <div class="mx-5">
                <form action="/customer" method="post" class="form-inline my-2 my-lg-0">
                    <input type="hidden" name="action" value="searchById">
                    <input type="search" name="customer_id" placeholder="Id customer">
                    <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by id</button>
                </form>
            </div>
            <%--        <a href="/furama/customer?action=service" class="btn btn-success my-2 my-lg-0 mx-5">Customers are using the service</a>--%>

        </div>
        <%--        <c:if test=""--%>
        <c:if test="${empty customerList}">
            <h3>Customer list use service empty !</h3>
        </c:if>
        <c:if test="${not empty customerList}">
            <table class="table table-striped table-bordered align-content-center" id="tableCustomerService">
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
                    <th>Contract ID</th>
                    <th>Service Id</th>
                    <th>Contract Detail Id</th>
                    <th>Quantity</th>
                    <th>Attach service name</th>
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
                        <td>${customer.contractId}</td>
                        <td>${customer.serviceId}</td>
                        <td>${customer.contractDetailId}</td>
                        <td>${customer.quantity}</td>
                        <td>${customer.attach_service_name}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer -->

<script>
    $(document).ready(function () {
        $('#tableCustomerService').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
</body>
</html>
