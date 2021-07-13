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
    <title>Employee List</title>
    <%--    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>--%>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row container-fluid">
<jsp:include page="side_bar.jsp"></jsp:include>
<%--    noi dung --%>
<div class=" h-100 col-lg-10">
    <div class="row justify-content-center m-2">
        <a href="/furama/employee_add.jsp" class="btn btn-success my-2 my-lg-0 mx-5">Add new employee</a>
        <div class="mx-5">
            <form action="/employee" method="post" class="form-inline my-2 my-lg-0">
                <input type="hidden" name="action" value="search">
                <input type="search" name="employee_name" placeholder="Name employee" class="form-control">
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by name</button>
            </form>
        </div>
        <div class="mx-5">
            <form action="/employee" method="post" class="form-inline my-2 my-lg-0">
                <input type="hidden" name="action" value="searchById">
                <input type="search" name="employee_id" placeholder="Id employee" class="form-control">
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Search by id</button>
            </form>
        </div>
    </div>
    <%--        <c:if test=""--%>
    <c:if test="${empty employeeList}">
        <h3>Employee list empty !</h3>
    </c:if>
    <c:if test="${not empty employeeList}">
        <table class="table table-striped table-bordered align-content-center d-inline-block w-100 "  style="overflow-x: scroll" id="tableEmployee">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Birthday</th>
                <th>ID Card</th>
                <th>Salary</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Position</th>
                <th>Education Degree</th>
                <th>Division</th>
                <th>User Name</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${employeeList}" var="employee">
                <tr>
                    <td>${employee.getEmployee_id()}</td>
                    <td>${employee.getEmployee_name()}</td>
                    <td>${employee.getEmployee_birthday()}</td>
                    <td>${employee.getEmployee_id_card()}</td>
                    <td>${employee.getEmployee_salary()}</td>
                    <td>${employee.getEmployee_phone()}</td>
                    <td>${employee.getEmployee_email()}</td>
                    <td>${employee.getEmployee_address()}</td>
                    <td>${employee.getPosition_name()}</td>
                    <td>${employee.getEducation_degree_name()}</td>
                    <td>${employee.getDivision_name()}</td>
                    <td>${employee.getUsername()}</td>
                    <td>
                        <button onclick="onDelete('${employee.getEmployee_id()}','${employee.getEmployee_name()}')"
                                type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelId">
                            Delete
                        </button>
                        <button onclick="onEdit('${employee.getEmployee_id()}','${employee.getEmployee_name()}',
                                '${employee.getEmployee_birthday()}','${employee.getEmployee_id_card()}',
                                '${employee.getEmployee_salary()}','${employee.getEmployee_phone()}',
                                '${employee.getEmployee_email()}','${employee.getEmployee_address()}',
                                '${employee.getPosition_id()}','${employee.getEducation_degree_id()}',
                                '${employee.getDivision_id()}','${employee.getUsername()}')"
                                type="button" class="btn btn-warning" data-toggle="modal"
                                data-target="#modelIdEdit">
                            Edit
                        </button>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
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
            <form action="/employee" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="${employee.getEmployee_id()}" id="idEmployeeDel">
                <div class="modal-body">
                    Ban co muon xoa <input id="nameEmployeeDel" disabled>
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
                <h5 class="modal-title">Edit employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/employee" method="post">
                <input type="hidden" name="action" value="edit">
                <div class="modal-body">
                    <table class="table table-striped border-dark">
                        <tr>
                            <td>id</td>
                            <td>
                                <input id="idEmployeeEdit" name="employee_id" type="hidden">
                                <input id="idEmployeeEditShow" name="employee_id" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td>Tên nhân viên:</td>
                            <td><input type="text" name="employee_name" id="nameEmployeeEdit"></td>
                        </tr>
                        <tr>
                            <td>Ngày sinh:</td>
                            <td>
                                <input type="date" id="employee_birthday" name="employee_birthday">
                            </td>
                        </tr>
                        <tr>
                            <td>Số CMND:</td>
                            <td><input type="text" name="employee_id_card" id="employee_id_card"></td>
                        </tr>
                        <tr>
                            <td>Mức lương:</td>
                            <td><input type="number" step="any" name="employee_salary" id="employee_salary"></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td>
                                <input type="number" id="employee_phone" name="employee_phone">
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="employee_email" id="employee_email"></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ:</td>
                            <td><input type="text" name="employee_address" id="employee_address"></td>
                        </tr>
                        <tr>
                            <td><label for="employee_position">Vị trí:</label></td>
                            <td>
                                <select id="employee_position" name="position_id">
                                    <option value="1">Lễ tân</option>
                                    <option value="2">Phục vụ</option>
                                    <option value="3">Chuyên viên</option>
                                    <option value="4">Giám sát</option>
                                    <option value="5">Quản lý</option>
                                    <option value="6">Giám đốc</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="employee_education_degree">Trình độ:</label></td>
                            <td>
                                <select id="employee_education_degree" name="education_degree_id">
                                    <option value="1">Trung cấp</option>
                                    <option value="2">Cao đẳng</option>
                                    <option value="3">Đại học</option>
                                    <option value="4">Sau đại học</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="employee_division"> Bộ phận:</label></td>
                            <td>
                                <select id="employee_division" name="division_id">
                                    <option value="1">Sale marketing</option>
                                    <option value="2">Hành chính</option>
                                    <option value="3">Phục vụ</option>
                                    <option value="4">Quản lý</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" name="employee_username" id="employee_username"></td>
                        </tr>

                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer -->
<script>
    function onDelete(id, name) {
        document.getElementById("idEmployeeDel").value = id;
        console.log(name);
        document.getElementById("nameEmployeeDel").value = name;
    }

    function onEdit(id, name, birthday, id_card, salary, phone, email, address, position, education, division, username) {
        document.getElementById("idEmployeeEdit").value = id;
        document.getElementById("idEmployeeEditShow").value = id;
        document.getElementById("nameEmployeeEdit").value = name;
        document.getElementById("employee_birthday").value = birthday;
        document.getElementById("employee_id_card").value = id_card;
        document.getElementById("employee_salary").value = salary;
        document.getElementById("employee_phone").value = phone;
        document.getElementById("employee_email").value = email;
        document.getElementById("employee_address").value = address;
        document.getElementById("employee_position").value = position;
        document.getElementById("employee_education_degree").value = education;
        document.getElementById("employee_division").value = division;
        document.getElementById("employee_username").value = username;
    }
</script>

<script>
    $(document).ready(function () {
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
</body>
</html>
