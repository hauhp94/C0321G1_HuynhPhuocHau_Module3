<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/29/2021
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<h1>Create Product</h1>
<form action="/product" method="post">
    <input type="hidden" name="action" value="create">
    <table>
        <tr>
            <td>ID:</td>
            <td><input type="number" name="id"></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price"></td>
        </tr>
        <tr>
            <td>image:</td>
            <td><input type="text" name="image"></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">Create</button></td>
        </tr>
    </table>
</form>
<p>
    <a href="/product">Back to customer list</a>
</p>
</body>
</html>
