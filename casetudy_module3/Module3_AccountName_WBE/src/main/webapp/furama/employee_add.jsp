<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 7/6/2021
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Employee</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row container-fluid">
    <jsp:include page="side_bar.jsp"></jsp:include>
    <div class=" h-100 col-lg-10">
        <h2>Add new employee</h2>
        <form action="/employee" method="post">
            <input type="hidden" name="action" value="create">
            <div class="custom-control custom-checkbox ">
                <table class="table table-striped border-dark">
                    <tr>
                        <td>Tên nhân viên:</td>
                        <td><input type="text" name="employee_name" value="${employee.getEmployee_name()}"  class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Ngày sinh:</td>
                        <td><input type="date"
                                   min="1920-01-01" max="2030-12-31" name="employee_birthday"
                                   value="${employee.getEmployee_birthday()}"  class="form-control"></td>
                    </tr>

                    <tr>
                        <td>Số CMND:</td>
                        <td>
                            <input type="text" name="employee_id_card" value="${employee.getEmployee_id_card()}"  class="form-control">
                            <c:if test="${messEmployee_id_card != null}">
                                <small class="form-text text-danger">${messEmployee_id_card}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>Mức lương:</td>
                        <td>
                            <input type="number" step="any" name="employee_salary" value="${employee.getEmployee_salary()}"  class="form-control">

                            <c:if test="${messEmployee_salary != null}">
                                <small  class="form-text text-danger">${messEmployee_salary}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td>
                            <input type="text" name="employee_phone" value="${employee.getEmployee_phone()}"  class="form-control">
                            <c:if test="${messEmployee_phone != null}">
                                <small  class="form-text text-danger">${messEmployee_phone}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <input type="text" name="employee_email" value="${employee.getEmployee_email()}"  class="form-control">
                            <c:if test="${messEmployee_email != null}">
                                <small class="form-text text-danger">${messEmployee_email}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>Địa chỉ:</td>
                        <td><input type="text" name="employee_address" value="${employee.getEmployee_address()}"  class="form-control"></td>
                    </tr>
                    <tr>
                        <td><label for="viTri">Vị trí:</label></td>
                        <td>
                            <select id="viTri" name="position_id" class="form-control">
                                <option value="1" ${employee.getPosition_id() == 1 ? 'selected': ''}>Lễ tân</option>
                                <option value="2" ${employee.getPosition_id() == 2 ? 'selected': ''}>Phục vụ</option>
                                <option value="3" ${employee.getPosition_id() == 3 ? 'selected': ''}>Chuyên viên</option>
                                <option value="4" ${employee.getPosition_id() == 4 ? 'selected': ''}>Giám sát</option>
                                <option value="5" ${employee.getPosition_id() == 5 ? 'selected': ''}>Quản lý</option>
                                <option value="6" ${employee.getPosition_id() == 6 ? 'selected': ''}>Giám đốc</option>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td><label for="trinhDo">Trình độ:</label></td>
                        <td>
                            <select id="trinhDo" name="education_degree_id" class="form-control">
                                <option value="1" ${employee.getEducation_degree_id() == 1 ? 'selected': ''}>Trung cấp</option>
                                <option value="2" ${employee.getEducation_degree_id() == 2 ? 'selected': ''}>Cao đẳng</option>
                                <option value="3" ${employee.getEducation_degree_id() == 3 ? 'selected': ''}>Đại học</option>
                                <option value="4" ${employee.getEducation_degree_id() == 4 ? 'selected': ''}>Sau đại học</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="boPhan">Bộ phận:</label></td>
                        <td>
                            <select id="boPhan" name="division_id" class="form-control">
                                <option value="1" ${employee.getDivision_id() == 1 ? 'selected': ''}>Sale marketing</option>
                                <option value="2" ${employee.getDivision_id() == 2 ? 'selected': ''}>Hành chính</option>
                                <option value="3" ${employee.getDivision_id() == 3 ? 'selected': ''}>Phục vụ</option>
                                <option value="4" ${employee.getDivision_id() == 4 ? 'selected': ''}>Quản lý</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username" value="${employee.getUsername()}"  class="form-control"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn btn-success">Save</button>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
