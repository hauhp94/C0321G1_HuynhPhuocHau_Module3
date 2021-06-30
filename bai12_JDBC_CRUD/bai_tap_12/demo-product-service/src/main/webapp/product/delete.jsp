<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/29/2021
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>Delete Product</h1>
<form action="/product" method="post">
    <input type="hidden" name="action" value="delete">
    <table>
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
            <td>
                <img src="/assert/image/${requestScope["product"].getImageProduct()}">
            </td>
        </tr>
        <tr>
            <td>are you sure ?</td>
            <td><button type="submit">Delete</button></td>
        </tr>
    </table>
</form>
<p>
    <a href="/product">Back to customer list</a>
</p>
</body>
</html>
