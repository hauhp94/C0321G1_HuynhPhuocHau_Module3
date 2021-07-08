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
<%--    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>--%>
</head>
<body>
<!-- A vertical navbar -->

<div class="col-lg-2 bg-light list-group " style="height: auto">
    <a href="/employee?action=list" class="list-group-item list-group-item-action list-group-item-primary">Employee
        List</a>
    <a href="/customer?action=list" class="list-group-item list-group-item-action list-group-item-success">Customer
        List</a>
    <a href="/service?action=list" class="list-group-item list-group-item-action list-group-item-secondary">Service
        List</a>
    <a href="/contract?action=list" class="list-group-item list-group-item-action list-group-item-secondary">Contract
        List</a>
</div>

<%--    <script src="../assert/jquery/jquery-3.5.1.min.js"></script>--%>
<%--    <script src="../assert/datatables/js/jquery.dataTables.js"></script>--%>
<%--    <script src="../assert/datatables/js/dataTables.bootstrap4.js"></script>--%>
<%--    <script src="../assert/jquery/popper.min.js"></script>--%>
<%--    <script src="../assert/bootstrap4/js/bootstrap.js"></script>--%>
</body>
</html>
