<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/28/2021
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" , href="/bootstrap/css/bootstrap.css">
</head>
<body>
<h1>Customer list</h1>
<c:if test="${empty customerList}">
    <h3>Customer list is empty</h3>
</c:if>
<c:if test="${not empty customerList}">
    <table class="table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Date of birth</th>
            <th>Address</th>
            <th>Image</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customerList}" var="customer">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.dateOfBirth}</td>
                <td>${customer.address}</td>
                <td>
                    <img src="/assert/img/${customer.image}" height="50" width="50">
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
