<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 6/25/2021
  Time: 10:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>$Title$</title>
</head>
<body>
<p>Simple servlet.CalculatorServlet</p>
<form method="post" action="/calculator">
    <table>
        <tr>
            <td><p>First operand</p></td>
            <td><input type="number" step="any" name="firstOperand"></td>
        </tr>
        <tr>
            <td><p>Operator</p></td>
            <td>
                <select name="operator">
                <option value="+">Addition</option>
                <option value="-">Subtraction</option>
                <option value="*">Multiplication</option>
                <option value="/">Division</option>
            </select>
            </td>
        </tr>
        <tr>
            <td><p>Second operand</p></td>
            <td><input type="number" step="any" name="secondOperand"></td>
        </tr>
        <tr>
            <td></td>
            <td><button type="submit">Calculator</button> </td>
        </tr>
    </table>



</form>
</body>
</html>
