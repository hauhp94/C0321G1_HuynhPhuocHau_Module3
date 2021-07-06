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
    <title>Furama Resort</title>
<%--    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/datatables/css/dataTables.bootstrap4.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../assert/font_anwesome/css/all.min.css"/>--%>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="side_bar.jsp"></jsp:include>
<%--    noi dung --%>
    <div class=" h-100 col-lg-10">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../assert/image/furama.jpg" alt="Los Angeles" width="1024" height="575">
                </div>
                <div class="carousel-item">
                    <img src="../assert/image/furama2.jpg" alt="Chicago" width="1024" height="575">
                </div>
                <div class="carousel-item">
                    <img src="../assert/image/furama3.jpg" alt="New York" width="1024" height="575">
                </div>
                <div class="carousel-item">
                    <img src="../assert/image/furama4.jpg" alt="New York" width="1024" height="575">
                </div>
                <div class="carousel-item">
                    <img src="../assert/image/furama5.jpg" alt="New York" width="1024" height="575">
                </div>
                <div class="carousel-item">
                    <img src="../assert/image/furama6.jpg" alt="New York" width="1024" height="575">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>

        </div>
    </div>
</div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Footer -->
<%--<script src="../assert/jquery/jquery-3.5.1.min.js"></script>--%>
<%--<script src="../assert/datatables/js/jquery.dataTables.js"></script>--%>
<%--<script src="../assert/datatables/js/dataTables.bootstrap4.js"></script>--%>
<%--<script src="../assert/jquery/popper.min.js"></script>--%>
<%--<script src="../assert/bootstrap4/js/bootstrap.js"></script>--%>
</body>
</html>
