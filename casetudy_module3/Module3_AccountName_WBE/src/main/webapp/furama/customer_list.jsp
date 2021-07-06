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
    <title>Customer List</title>
<%--    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>--%>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="side_bar.jsp"></jsp:include>
        <%--    noi dung --%>
        <div class=" h-100 col-lg-10 ">
            <div class="row justify-content-center m-2">
                <a href="/furama/customer_add.jsp" class="btn btn-success my-2 my-lg-0 mx-5">Add new customer</a>
                <div class="mx-5">
                    <form action="/customer" method="post" class="form-inline my-2 my-lg-0">
                        <input type="hidden" name="action" value="search">
                        <input type="search" name="customer_name" placeholder="Name customer">
                        <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by name</button>
                    </form>
                </div>
                <div class="mx-5">
                    <form action="/customer" method="post" class="form-inline my-2 my-lg-0">
                        <input type="hidden" name="action" value="searchById">
                        <input type="search" name="customer_id" placeholder="Id customer">
                        <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by id</button>
                    </form>
                </div>
            </div>
            <%--        <c:if test=""--%>
            <c:if test="${empty customerList}">
                <h3>Customer list empty !</h3>
            </c:if>
            <c:if test="${not empty customerList}">
                <table class="table table-striped table-bordered align-content-center" id="tableCustomer">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Code customer</th>
                            <%--                                                <th>customer_type_id</th>--%>
                        <th>Customer type</th>
                        <th>Birthday</th>
                        <th>Gender</th>
                        <th>ID card</th>
                        <th>Phone number</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${customerList}" var="customer">
                        <tr>
                            <td>${customer.customer_id}</td>
                            <td>${customer.customer_name}</td>
                            <td>${customer.customer_code}</td>
                                <%--                                                        <td>${customer.customer_type_id}</td>--%>
                            <td>${customer.customer_type_name}</td>
                            <td>${customer.customer_birthday}</td>
                            <td>
                                <c:if test="${customer.customer_gender==0}">Female</c:if>
                                <c:if test="${customer.customer_gender==1}">Male</c:if>
                            </td>
                            <td>${customer.customer_id_card}</td>
                            <td>${customer.customer_phone}</td>
                            <td>${customer.customer_email}</td>
                            <td>${customer.customer_address}</td>
                            <td><a href="/customer?action=edit&id=${customer.customer_id}"
                                   class="btn btn-warning">Edit</a>
                                <button onclick="onDelete('${customer.customer_id}','${customer.customer_name}')"
                                        type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelId">
                                    Delete
                                </button>
                                <button onclick="onEdit('${customer.customer_id}','${customer.customer_name}',
                                        '${customer.customer_code}','${customer.customer_birthday}',
                                        '${customer.customer_id_card}','${customer.customer_phone}',
                                        '${customer.customer_email}','${customer.customer_address}')"
                                        type="button" class="btn btn-danger" data-toggle="modal"
                                        data-target="#modelIdEdit">
                                    Edit2
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <%--            modal delete--%>
            <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirm delete</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/customer" method="post">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="${customer.getCustomer_id()}" id="idCustomerDel">
                            <div class="modal-body">
                                Ban co muon xoa <input id="nameCustomerDel">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Ok</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%--            model edit--%>
            <div class="modal fade" id="modelIdEdit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit customer</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/customer" method="post">
                            <input type="hidden" name="action" value="edit">
                            <%--                            <input type="hidden" name="customer_id" value="${customer.getCustomer_id()}" id="idCustomerEdit">--%>
                            <div class="modal-body">
                                <table class="table table-striped border-dark">
                                    <tr>
                                        <td>id</td>
                                        <td>
                                            <input id="idCustomerEdit" name="customer_id" type="hidden">
                                            <input id="idCustomerEditShow" name="customer_id" disabled>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tên khách hàng:</td>
                                        <td><input type="text" name="customer_name" id="nameCustomerEdit"></td>
                                    </tr>
                                    <tr>
                                        <td>Loại khách hàng:</td>
                                        <td>
                                            <input type="radio" id="Diamond" name="customer_type" value="1">
                                            <label for="Diamond">Diamond</label><br>
                                            <input type="radio" id="Platinium" name="customer_type" value="2">
                                            <label for="Platinium">Platinium</label><br>
                                            <input type="radio" id="Gold" name="customer_type" value="3">
                                            <label for="Gold">Gold</label><br>
                                            <input type="radio" id="Silver" name="customer_type" value="4">
                                            <label for="Silver">Silver</label><br>
                                            <input type="radio" id="Member" name="customer_type" value="5" checked>
                                            <label for="Member">Member</label><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mã khách hàng:</td>
                                        <td><input type="text" name="customer_code" id="customer_code"></td>
                                    </tr>
                                    <tr>
                                        <td>Ngày sinh:</td>
                                        <td><input type="date" name="customer_birthday" id="customer_birthday"></td>
                                    </tr>
                                    <tr>
                                        <td>Giới tính:</td>
                                        <td>
                                            <input type="radio" id="nam" name="customer_gender" value="1" checked>
                                            <label for="nam">Nam</label><br>
                                            <input type="radio" id="nu" name="customer_gender" value="0">
                                            <label for="nu">Nữ</label><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Số CMND:</td>
                                        <td><input type="text" name="customer_id_card" id="customer_id_card"></td>
                                    </tr>
                                    <tr>
                                        <td>Số điện thoại:</td>
                                        <td><input type="text" name="customer_phone" id="customer_phone"></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><input type="text" name="customer_email" id="customer_email"></td>
                                    </tr>
                                    <tr>
                                        <td>Địa chỉ:</td>
                                        <td><input type="text" name="customer_address" id="customer_address"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <button class="btn btn-success" type="submit">Update</button>
                                        </td>
                                    </tr>

                                </table>
                                <%--                                Ban co muon xoa <input id="nameCustomerEdit">--%>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Ok</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <footer class="page-footer font-small cyan darken-3 text-center w-100">

            <!-- Footer Elements -->
            <div class="container ">

                <!-- Grid row-->
                <div class="row ">

                    <!-- Grid column -->
                    <div class="col-md-12 py-5">
                        <div class="mb-5 flex-center">

                            <!-- Facebook -->
                            <a class="fb-ic">
                                <i class="fab fa-facebook-f fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                            </a>
                            <!-- Twitter -->
                            <a class="tw-ic">
                                <i class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                            </a>
                            <!-- Google +-->
                            <a class="gplus-ic">
                                <i class="fab fa-google-plus-g fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                            </a>
                            <!--Linkedin -->
                            <a class="li-ic">
                                <i class="fab fa-linkedin-in fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                            </a>
                            <!--Instagram-->
                            <a class="ins-ic">
                                <i class="fab fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                            </a>
                            <!--Pinterest-->
                            <a class="pin-ic">
                                <i class="fab fa-pinterest fa-lg white-text fa-2x"> </i>
                            </a>
                        </div>
                    </div>
                    <!-- Grid column -->

                </div>
                <!-- Grid row-->

            </div>
            <!-- Footer Elements -->

            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">© 2021 Copyright:
                <p> Casetudy Module 3 </p>
            </div>
            <!-- Copyright -->

        </footer>
        <!-- Footer -->
        <script src="../assert/jquery/jquery-3.5.1.min.js"></script>
        <script src="../assert/datatables/js/jquery.dataTables.js"></script>
        <script src="../assert/datatables/js/dataTables.bootstrap4.js"></script>
        <script src="../assert/jquery/popper.min.js"></script>
        <script src="../assert/bootstrap4/js/bootstrap.js"></script>
        <script>
            function onDelete(id, name) {
                document.getElementById("idCustomerDel").value = id;
                console.log(name);
                document.getElementById("nameCustomerDel").value = name;
            }

            function onEdit(id, name,code,birthday,id_card,phone,email,address) {
                document.getElementById("idCustomerEdit").value = id;
                document.getElementById("idCustomerEditShow").value = id;
                document.getElementById("nameCustomerEdit").value = name;
                document.getElementById("customer_code").value = code;
                document.getElementById("customer_birthday").value = birthday;
                document.getElementById("customer_id_card").value = id_card;
                document.getElementById("customer_phone").value = phone;
                document.getElementById("customer_email").value = email;
                document.getElementById("customer_address").value = address;
            }
        </script>

        <script>
            $(document).ready(function () {
                $('#tableCustomer').dataTable({
                    "dom": 'lrtip',
                    "lengthChange": false,
                    "pageLength": 5
                })
            })
        </script>
</body>
</html>
