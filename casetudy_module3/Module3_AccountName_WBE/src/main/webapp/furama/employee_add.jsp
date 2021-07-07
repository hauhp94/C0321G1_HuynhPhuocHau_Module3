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
    <title>Employee List</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row container-fluid">
    <jsp:include page="side_bar.jsp"></jsp:include>
    <div class=" h-100 col-lg-10">
        <h2>Add new employee</h2>
        <form action="/employee" method="post">
            <input type="hidden" name="action" value="create">
            <div class="custom-control custom-checkbox">
                <table class="table table-striped border-dark">
                    <tr>
                        <td>Tên nhân viên:</td>
                        <td><input type="text" name="employee_name"></td>
                    </tr>
                    <tr>
                        <td>Ngày sinh:</td>
                        <td><input type="date"
                                   min="1920-01-01" max="2030-12-31" name="employee_birthday"></td>
                    </tr>
                    <tr>
                        <td>Số CMND:</td>
                        <td><input type="text" name="employee_id_card"></td>
                    </tr>
                    <tr>
                        <td>Mức lương:</td>
                        <td><input type="number" step="any" name="employee_salary"></td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td><input type="text" name="employee_phone"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="employee_email"></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ:</td>
                        <td><input type="text" name="employee_address"></td>
                    </tr>
                    <tr>
                        <td><label for="viTri">Vị trí:</label></td>
                        <td>
                            <select id="viTri" name="position_id">
                                <option value="1" selected>Lễ tân</option>
                                <option value="2">Phục vụ</option>
                                <option value="3">Chuyên viên</option>
                                <option value="4">Giám sát</option>
                                <option value="5">Quản lý</option>
                                <option value="6">Giám đốc</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="trinhDo">Trình độ:</label></td>
                        <td>
                            <select id="trinhDo" name="education_degree_id">
                                <option value="1" selected>Trung cấp</option>
                                <option value="2">Cao đẳng</option>
                                <option value="3">Đại học</option>
                                <option value="4">Sau đại học</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="boPhan">Bộ phận:</label></td>
                        <td>
                            <select id="boPhan" name="division_id">
                                <option value="1" selected>Sale marketing</option>
                                <option value="2">Hành chính</option>
                                <option value="3">Phục vụ</option>
                                <option value="4">Quản lý</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username"></td>
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
