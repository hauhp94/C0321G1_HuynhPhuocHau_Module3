<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/24/2021
  Time: 11:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <style>
      button{
        background-color: cornflowerblue;
        color: black;
      }
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
  <h1>Ứng dụng Product Discount Calculator</h1>
  <form action="/display-discount" method="post">
    <table>
      <tr>
        <td><p>Product Description:</p></td>
        <td><input type="text" name="moTa"></td>
      </tr>
      <tr>
        <td><p>List Price:</p></td>
        <td><input type="number" name="giaNiemYet" placeholder="triệu vnd"></td>
      </tr>
      <tr>
        <td><p>Discount Percent:</p></td>
        <td><input type="number" name="tyLeChietKhau" placeholder="% chiết khấu"></td>
      </tr>
      <tr>
        <td colspan="2"><button type="submit">Calculate Discount</button> </td>
      </tr>
    </table>
  </form>
  </body>
</html>
