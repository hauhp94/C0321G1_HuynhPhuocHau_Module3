<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/29/2021
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap4/css/bootstrap.css">
</head>
<body>
<div class="container">
<h1 class="text-center">Product List</h1>
<a class="btn btn-success mb-2" href="/product?action=create" role="button">create</a>
<c:if test="${empty productList}">
    <h3>Product list empty !</h3>
</c:if>
<c:if test="${not empty productList}">
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name Product</th>
            <th>Price Product</th>
            <th>Image</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="product">
            <tr>
                <td>${product.idProduct}</td>
                <td><a href="/product?action=view&id=${product.getIdProduct()}" class="text-decoration-none text-dark">${product.nameProduct}</a></td>
                <td>${product.priceProduct}</td>
                <td>
                    <img src="/image/${product.imageProduct}" width="100" height="100">
                </td>
                <td><a href="/product?action=edit&id=${product.getIdProduct()}" class="btn btn-warning">Edit</a> </td>
                <td><a href="/product?action=delete&id=${product.getIdProduct()}" class="btn btn-danger">Delete</a> </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>
</div>
</body>
</html>
