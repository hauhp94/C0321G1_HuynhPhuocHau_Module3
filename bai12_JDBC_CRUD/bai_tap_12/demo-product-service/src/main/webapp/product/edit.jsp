<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/29/2021
  Time: 2:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
    <link rel="stylesheet" type="text/css" href="/assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">
</head>
<body>
<div class="container">

<h1>Edit Product</h1>
<form action="/product" method="post">
    <input type="hidden" name="action" value="edit">
    <table class="table">
        <tr>
            <td>ID:</td>
            <td><input type="number" name="id" value="${requestScope["product"].getIdProduct()}"></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" value="${requestScope["product"].getNameProduct()}"></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" value="${requestScope["product"].getPriceProduct()}"></td>
        </tr>
        <tr>
            <td>image:</td>
            <td><input type="text" name="image" value="${requestScope["product"].getImageProduct()}"></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit" class="btn-success btn">Update</button></td>
        </tr>
    </table>
</form>
<a href="/product" class="btn btn-success">Back to customer list</a>
</div>
</body>
</html>
