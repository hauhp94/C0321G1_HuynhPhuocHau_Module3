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
    <title>Furama Resort</title>
    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>
</head>
<body>
<!--navbar-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <img src="../assert/image/furama.jpg" height="50" width="70">
            </li>

        </ul>
        <ul class="navbar-nav mr-1">
            <li class="nav-item">
                <p>Huỳnh Phước Hậu</p>
            </li>
        </ul>
    </div>
</nav>
<!--navbar-->
<nav class="navbar navbar-expand-lg navbar-light bg-light ">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-center " id="navbarSupportedContent">
        <ul class="navbar-nav ">
            <li class="nav-item active ">
                <a class="nav-link font-weight-bold " href="/">Home </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Employee</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Employee list</a>
                    <a class="dropdown-item" href="#">Add Employee</a>
                    <a class="dropdown-item" href="#">Edit Employee</a>
                    <a class="dropdown-item" href="#">Search Employee by id</a>
                    <a class="dropdown-item" href="#">Search Employee by name</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Customer
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/customer?action=list">Customer list</a>
                    <a class="dropdown-item" href="../furama/customer_add.jsp">Add Customer</a>
                    <a class="dropdown-item" href="#">Edit Customer</a>
                    <a class="dropdown-item" href="#">Search Customer by id</a>
                    <a class="dropdown-item" href="#">Search Customer by name</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Service
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Service list</a>
                    <a class="dropdown-item" href="#">Add Service</a>
                    <a class="dropdown-item" href="#">Edit Service</a>
                    <a class="dropdown-item" href="#">Search Service by id</a>
                    <a class="dropdown-item" href="#">Search Service by name</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Contract
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Contract list</a>
                    <a class="dropdown-item" href="#">Add Contract</a>
                    <a class="dropdown-item" href="#">Edit Contract</a>
                    <a class="dropdown-item" href="#">Search Contract by id</a>
                </div>
            </li>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
            </form>
        </ul>

    </div>
</nav>
<div class="container-fluid">
    <%--</nav>--%>
    <!-- A vertical navbar -->
    <div class="row">
        <div class=" col-lg-2 bg-dark " style="height: auto">
            <ul>
                <div class="justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link 1</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link 2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link 3</a>
                    </li>
                </div>
            </ul>
        </div>
        <%--    noi dung --%>
        <div class="align-content-center col-lg-10 ">
            <h2>Add new customer</h2>
            <form action="/customer" method="post" >
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="customer_id" value="${requestScope["customer"].getCustomer_id()}">
                <div class="custom-control custom-checkbox">
                    <table class="table table-striped border-dark">
                        <tr>
                            <td>id</td>
                            <td>${requestScope["customer"].getCustomer_id()}</td>

                        </tr>
                        <tr>
                            <td>Tên khách hàng: </td>
                            <td><input type="text" name="customer_name" value="${requestScope["customer"].getCustomer_name()}"></td>
                        </tr>
                        <tr>
                            <td>Loại khách hàng: </td>
                            <td>
                                <input type="radio" id="Diamond" name="customer_type" value="1" >
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
                            <td>Mã khách hàng: </td>
                            <td><input type="text" name="customer_code" value="${requestScope["customer"].getCustomer_code()}"></td>
                        </tr>
                        <tr>
                            <td>Ngày sinh: </td>
                            <td><input type="date" name="customer_birthday" value="${requestScope["customer"].getCustomer_birthday()}"></td>
                        </tr>
                        <tr>
                            <td>Giới tính: </td>
                            <td>
                                <input type="radio" id="nam" name="customer_gender" value="1" checked>
                                <label for="nam">Nam</label><br>
                                <input type="radio" id="nu" name="customer_gender" value="0">
                                <label for="nu">Nữ</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td>Số CMND: </td>
                            <td><input type="text" name="customer_id_card" value="${requestScope["customer"].getCustomer_id_card()}"></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại: </td>
                            <td><input type="text" name="customer_phone" value="${requestScope["customer"].getCustomer_phone()}"></td>
                        </tr>
                        <tr>
                            <td>Email: </td>
                            <td><input type="text" name="customer_email" value="${requestScope["customer"].getCustomer_email()}"></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ: </td>
                            <td><input type="text" name="customer_address" value="${requestScope["customer"].getCustomer_address()}"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><button class="btn btn-success" type="submit">Update</button> </td>
                        </tr>

                    </table>
                </div>
            </form>
        </div>
        <!-- Footer -->
        <footer class="page-footer font-small cyan darken-3 text-center">

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
</body>
</html>
