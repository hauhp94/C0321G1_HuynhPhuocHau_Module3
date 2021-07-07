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
    <title>Furama Resort</title>
    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>
</head>
<body>
<!--navbar-->
<%--<div class="container-fluid">--%>
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
                    <a class="dropdown-item" href="/employee?action=list">Employee list</a>
                    <a class="dropdown-item" href="/employee?action=create">Add Employee</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Customer
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/customer?action=list">Customer list</a>
                    <a class="dropdown-item" href="/customer?action=create">Add Customer</a>
                    <a class="dropdown-item" href="/customer?action=CustomerService">Customer Use Service</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Service
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/service?action=list">Service list</a>
                    <a class="dropdown-item" href="/service?action=create">Add Service</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Contract
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/contract?action=list">Contract list</a>
                    <a class="dropdown-item" href="/contract?action=create">Add Contract</a>
                    <a class="dropdown-item" href="/contractDetail?action=create">Add Contract Detail</a>
                </div>
            </li>
            <form class="form-inline my-2 my-lg-0" action="/customer" method="post">
                <input type="hidden" name="action" value="search">
                <input class="form-control mr-sm-2" type="search" placeholder="Search Customer" aria-label="Search"
                       name="customer_name">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
            </form>
<%--            <form action="/customer" method="post" class="form-inline my-2 my-lg-0">--%>
<%--                <input type="hidden" name="action" value="search">--%>
<%--                <input type="search" name="customer_name" placeholder="Name customer">--%>
<%--                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by name</button>--%>
<%--            </form>--%>
        </ul>

    </div>
</nav>
<%--</div>--%>
    <%--</nav>--%>
<script src="../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../assert/datatables/js/jquery.dataTables.js"></script>
<script src="../assert/datatables/js/dataTables.bootstrap4.js"></script>
<script src="../assert/jquery/popper.min.js"></script>
<script src="../assert/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
