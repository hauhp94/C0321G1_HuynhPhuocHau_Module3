<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 7/7/2021
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contract List</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row container-fluid">
<jsp:include page="side_bar.jsp"></jsp:include>
<%--    noi dung --%>
<div class=" h-100 col-lg-10">
    <%--        <c:if test=""--%>
    <c:if test="${empty contractList}">
        <h3>Contract list empty !</h3>
    </c:if>
    <c:if test="${not empty contractList}">
        <table class="table table-striped table-bordered align-content-center" id="tableContract">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Tiền đặt cọc</th>
                <th>Tổng tiền</th>
                <th>ID nhân viên</th>
                <th>Tên nhân viên</th>
                <th>ID khách hàng</th>
                <th>Tên khách hàng</th>
                <th>ID dịch vụ</th>
                <th>Tên dịch vụ</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${contractList}" var="contract">
                <tr>
                    <td>${contract.getContract_id()}</td>
                    <td>${contract.getContract_start_date()}</td>
                    <td>${contract.getContract_end_date()}</td>
                    <td>${contract.getContract_deposit()}</td>
                    <td>${contract.getContract_total_money()}</td>
                    <td>${contract.getEmployee_id()}</td>
                    <td>${contract.getEmployee_name()}</td>
                    <td>${contract.getCustomer_id()}</td>
                    <td>${contract.getCustomer_name()}</td>
                    <td>${contract.getService_id()}</td>
                    <td>${contract.getService_name()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

</div>

</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Footer -->
<script>
    $(document).ready(function () {
        $('#tableContract').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
</body>
</html>
