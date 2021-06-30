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
</head>
<body>
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
<p>
    <a href="/product">Back to customer list</a>
</p>
</body>
</html>
