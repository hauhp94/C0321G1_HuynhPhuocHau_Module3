<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/24/2021
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kết quả</title>
    <style>
        td {
            padding: 5px;
            color: darkblue;
            background-color: aliceblue;
        }

        h1 {
            text-align: center;
            color: brown;
            font-family: Aparo
        }

        table {
            border: 1px #b8ff6d solid;
            margin: auto;
            background-color: aliceblue;
            color: black
        }
    </style>
</head>
<body>
<h1>kết quả</h1>
<table>
    <tr>
        <td><p>Mô tả sản phẩm</p></td>
        <td><p>${moTa}</p></td>
    </tr>
    <tr>
        <td><p>Giá bán niêm yết</p></td>
        <td><p>${giaNiemYet} triệu VND</p></td>
    </tr>
    <tr>
        <td><p>Tỷ lệ chiết khấu</p></td>
        <td><p>${tyLeChietKhau} %</p></td>
    </tr>
    <tr>
        <td><p>Số tiền chiết chấu</p></td>
        <td><p>${ketQua} triệu VND</p></td>
    </tr>
</table>

</body>
</html>
