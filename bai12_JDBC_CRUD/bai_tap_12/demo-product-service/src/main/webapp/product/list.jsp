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
    <link rel="stylesheet" type="text/css" href="/assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">

</head>
<body>
<div class="container">
    <h1 class="text-center">Product List</h1>
    <a class="btn btn-success mb-2" href="/product?action=create" role="button">create</a>
    <form action="product" method="post" class="form-row text-center justify-content-md-end">
        <input type="hidden" name="action" value="search">
        <p class="text-center m-2">Tìm sản phẩm theo tên:</p>
        <input type="text" name="name" placeholder="input name product" class="text-info">
        <button type="submit" class="btn-success">Search</button>
    </form>
    <c:if test="${empty productList}">
        <h3>Product list empty !</h3>
    </c:if>
    <c:if test="${not empty productList}">
        <table class="table table-striped table-bordered" id="tableProduct">
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
                    <td><a href="/product?action=view&id=${product.getIdProduct()}"
                           class="text-decoration-none text-dark">${product.nameProduct}</a></td>
                    <td>${product.priceProduct}</td>
                    <td>
                        <img src="assert/image/${product.imageProduct}" width="100" height="100">
                    </td>
                    <td><a href="/product?action=edit&id=${product.getIdProduct()}" class="btn btn-warning">Edit</a>
                    </td>
                    <td>
                        <button onclick="onDelete('${product.getIdProduct()}','${product.getNameProduct()}')" type="button" class="btn btn-danger"data-toggle="modal" data-target="#modelId">Delete</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
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
            <form action="/product" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="idProductDel">
                <div class="modal-body">
                    Ban co muon xoa <input id="nameProductDel">
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
        document.getElementById("idProductDel").value = id;
        console.log(name);
        document.getElementById("nameProductDel").value = name;
    }
</script>

<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
</body>
</html>
