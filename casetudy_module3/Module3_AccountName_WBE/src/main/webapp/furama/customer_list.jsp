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
    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>
</head>
<body>
<!--navbar-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <img src="../assert/image/furama.jpg" height="50" width="70">
            </li>

        </ul>
        <ul class="navbar-nav mr-1">
            <li class="nav-item">
                <p>Huỳnh Phước Hậu</p>
            </li>
        </ul>
    </div>
</nav>
<!--navbar-->
<nav class="navbar navbar-expand-lg navbar-light bg-light ">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-center " id="navbarSupportedContent">
        <ul class="navbar-nav ">
            <li class="nav-item active ">
                <a class="nav-link font-weight-bold " href="/">Home </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Employee</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Employee list</a>
                    <a class="dropdown-item" href="#">Add Employee</a>
                    <a class="dropdown-item" href="#">Edit Employee</a>
                    <a class="dropdown-item" href="#">Search Employee by id</a>
                    <a class="dropdown-item" href="#">Search Employee by name</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Customer
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/customer?action=list">Customer list</a>
                    <a class="dropdown-item" href="../furama/customer_add.jsp">Add Customer</a>
                    <a class="dropdown-item" href="#">Edit Customer</a>
                    <a class="dropdown-item" href="#">Search Customer by id</a>
                    <a class="dropdown-item" href="#">Search Customer by name</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Service
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Service list</a>
                    <a class="dropdown-item" href="#">Add Service</a>
                    <a class="dropdown-item" href="#">Edit Service</a>
                    <a class="dropdown-item" href="#">Search Service by id</a>
                    <a class="dropdown-item" href="#">Search Service by name</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Contract
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Contract list</a>
                    <a class="dropdown-item" href="#">Add Contract</a>
                    <a class="dropdown-item" href="#">Edit Contract</a>
                    <a class="dropdown-item" href="#">Search Contract by id</a>
                </div>
            </li>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
            </form>
        </ul>

    </div>
</nav>
<div class="container-fluid">
<%--</nav>--%>
<!-- A vertical navbar -->
<div class="row">
    <div class=" col-lg-2 bg-dark " style="height: auto">
        <ul>
            <div class="justify-content-center">
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 3</a>
                </li>
            </div>
        </ul>
    </div>
<%--    noi dung --%>
    <div class=" h-100 col-lg-10">
<%--        <c:if test=""--%>
        <c:if test="${empty customerList}">
            <h3>Customer list empty !</h3>
        </c:if>
        <c:if test="${not empty customerList}">
            <table class="table table-striped table-bordered align-content-center" id="tableCustomer">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Code customer</th>
<%--                                                <th>customer_type_id</th>--%>
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
                            <%--                            <td><a href="/customer?action=edit&id=${customer.customer_id()}"--%>
                            <%--                                   class="btn btn-warning">Edit</a>--%>
                            <%--                            </td>--%>
                            <%--                            <td>--%>
                            <%--                                <button onclick="onDelete('${customer.customer_id}','${customer.customer_name}')"--%>
                            <%--                                        type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelId">--%>
                            <%--                                    Delete--%>
                            <%--                                </button>--%>
                            <%--                            </td>--%>
                        <td><a href="/customer?action=edit&id=${customer.customer_id}" class="btn btn-warning">Edit</a>
                            <button onclick="onDelete('${customer.customer_id}','${customer.customer_name}')" type="button" class="btn btn-danger"data-toggle="modal" data-target="#modelId">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
<!-- Footer -->
<footer class="page-footer font-small cyan darken-3 text-center w-100">

    <!-- Footer Elements -->
    <div class="container ">

        <!-- Grid row-->
        <div class="row ">

            <!-- Grid column -->
            <div class="col-md-12 py-5">
                <div class="mb-5 flex-center">

                    <!-- Facebook -->
                    <a class="fb-ic">
                        <i class="fab fa-facebook-f fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!-- Twitter -->
                    <a class="tw-ic">
                        <i class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!-- Google +-->
                    <a class="gplus-ic">
                        <i class="fab fa-google-plus-g fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Linkedin -->
                    <a class="li-ic">
                        <i class="fab fa-linkedin-in fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Instagram-->
                    <a class="ins-ic">
                        <i class="fab fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Pinterest-->
                    <a class="pin-ic">
                        <i class="fab fa-pinterest fa-lg white-text fa-2x"> </i>
                    </a>
                </div>
            </div>
            <!-- Grid column -->

        </div>
        <!-- Grid row-->

    </div>
    <!-- Footer Elements -->

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2021 Copyright:
        <p> Casetudy Module 3 </p>
    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->
<script src="../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../assert/datatables/js/jquery.dataTables.js"></script>
<script src="../assert/datatables/js/dataTables.bootstrap4.js"></script>
<script src="../assert/jquery/popper.min.js"></script>
<script src="../assert/bootstrap4/js/bootstrap.js"></script>
    <script>
        function onDelete(id, name) {
            document.getElementById("idProductDel").value = id;
            console.log(name);
            document.getElementById("nameProductDel").value = name;
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
