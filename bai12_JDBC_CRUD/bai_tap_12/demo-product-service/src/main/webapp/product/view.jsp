<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/29/2021
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
    <link rel="stylesheet" type="text/css" href="/assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">
    <style>
        body, html {
            height: 100%;
        }

        .bg {
            /* The image used */
            background-image: url("../assert/image/background2.jpeg");

            /* Full height */
            height: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body>
<div class="bg container-fluid">
<div class="container">

<h1>Product details</h1>
<table class="table">
    <tr>
        <td>ID: </td>
        <td>${requestScope["product"].getIdProduct()}</td>
    </tr>
    <tr>
        <td>Name: </td>
        <td>${requestScope["product"].getNameProduct()}</td>
    </tr>
    <tr>
        <td>Price: </td>
        <td>${requestScope["product"].getPriceProduct()}</td>
    </tr>
    <tr>
        <td>Image: </td>
        <td>
            <img src="assert/image/${requestScope["product"].getImageProduct()}" height="100" width="100">
        </td>
    </tr>
</table>
    <a href="/product" class="btn btn-success">Back to customer list</a>
</div>
</div>
</body>
</html>
