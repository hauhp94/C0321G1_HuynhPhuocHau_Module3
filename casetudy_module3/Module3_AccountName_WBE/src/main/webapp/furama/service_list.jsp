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
    <title>Service List</title>
<%--    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>--%>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row container-fluid">
<jsp:include page="side_bar.jsp"></jsp:include>
        <%--    noi dung --%>
        <div class="col-lg-10">
            <%--        <c:if test=""--%>
            <c:if test="${empty serviceList}">
                <h3>Service list empty !</h3>
            </c:if>
            <c:if test="${not empty serviceList}">
                <table class="table table-striped table-bordered align-content-center" id="tableService">
                    <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Type Service</th>
                        <th>Rent Type</th>
                        <th>Area</th>
                        <th>Cost</th>
                        <th>Max People</th>
                        <th>Standard Room</th>
                        <th>Description</th>
                        <th>Pool area</th>
                        <th>Number floor</th>
                        <th>Free service</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${serviceList}" var="service">
                        <tr>
                            <td>${service.service_id}</td>
                            <td>${service.service_code}</td>
                            <td>${service.service_name}</td>
                            <td>${service.service_type_name}</td>
                            <td>${service.rent_type_name}</td>
                            <td>${service.service_area}</td>
                            <td>${service.service_cost}</td>
                            <td>${service.service_max_people}</td>
                            <td>${service.standard_room}</td>
                            <td>${service.description_other_convenience}</td>
                            <td>${service.pool_area}</td>
                            <td>${service.number_of_floors}</td>
                            <td>${service.free_service}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
</div>
<!-- Footer -->
</div>
<jsp:include page="footer.jsp"></jsp:include>

<!-- Footer -->
<%--<script src="../assert/jquery/jquery-3.5.1.min.js"></script>--%>
<%--<script src="../assert/datatables/js/jquery.dataTables.js"></script>--%>
<%--<script src="../assert/datatables/js/dataTables.bootstrap4.js"></script>--%>
<%--<script src="../assert/jquery/popper.min.js"></script>--%>
<%--<script src="../assert/bootstrap4/js/bootstrap.js"></script>--%>
<script>
    $(document).ready(function () {
        $('#tableService').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
</body>
</html>
