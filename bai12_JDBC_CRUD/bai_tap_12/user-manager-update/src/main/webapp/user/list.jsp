<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/30/2021
  Time: 7:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="assert/font_anwesome/css/all.min.css" />

</head>
<body>
<div class="container">
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>

    </h2>
</center>
<div align="center">
    <form action="/users" method="post">
        <input type="hidden" name="action" value="search">
        <p> Tìm theo country</p>

        <input type="text" placeholder="country" name="country" >
        <button type="submit" class="btn btn-secondary">Tìm</button>

    </form>
    <form action="/users" method="post">
        <input type="hidden" name="action" value="sortByName">
        <button type="submit" class="btn btn-success">Sắp xếp theo tên</button>
    </form>
    <table class="table table-striped table-bordered" id="tableUser">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}" class="btn btn-warning">Edit</a>
<%--                    <a href="/users?action=delete&id=${user.id}" class="btn btn-danger">Delete</a>--%>
                    <button onclick="onDelete('${user.getId()}','${user.getName()}')" type="button" class="btn btn-danger"data-toggle="modal" data-target="#modelId">Delete</button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/users" method="get">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="${user.getId()}" id="idUserDel">
                <div class="modal-body">
                    Ban co muon xoa <input id="nameUserDel">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Ok</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/datatables/js/jquery.dataTables.js"></script>
<script src="assert/datatables/js/dataTables.bootstrap4.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>
<script>
    function onDelete(id, name) {
        document.getElementById("idUserDel").value = id;
        console.log(name);
        document.getElementById("nameUserDel").value = name;
    }
</script>

<script>
    $(document).ready(function () {
        $('#tableUser').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
</body>
</html>