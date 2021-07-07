<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 7/7/2021
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Contract Detail</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row container-fluid">
<jsp:include page="side_bar.jsp"></jsp:include>
<%--    noi dung --%>
<div class=" h-100 col-lg-10">
    <h2>Create Contract Detail</h2>
    <form action="/contractDetail" method="post">
        <input type="hidden" name="action" value="create">
        <div class="custom-control custom-checkbox">
            <table class="table table-striped border-dark">
                <tr>
                    <td>ID Hợp đồng:</td>
                    <td><input type="number" name="contract_id"></td>
                </tr>
                <tr>
                    <td><label for="attach_service_id"> Dịch vụ đi kèm: </label></td>
                    <td>
                   <select id="attach_service_id" name="attach_service_id">
                        <option value="1" >Massage</option>
                        <option value="2">Karaoke</option>
                        <option value="3" selected>Food</option>
                        <option value="4">Drinking</option>
                        <option value="5">Rent Car</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Số lượng:</td>
                    <td><input type="number" step="any" name="quantity"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button class="btn btn-success" type="submit">Save</button>
                    </td>
                </tr>
            </table>
        </div>
    </form>


</div>

</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Footer -->
</body>
</html>
