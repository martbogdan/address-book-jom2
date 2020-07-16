<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Record in Address Book</title>
</head>
<body>
<%@include file="header.html" %>
<br><br>
<%
    String message = (String) request.getAttribute("message");
%>
<div style="color: red">
    <%=message%>
</div>


<form action="/records/create" method="post">
    <table>
        <tr>
            <td>
                <label for="firstName">First Name: </label>
            </td>
            <td>
                <input type="text" id="firstName" name="firstName" required>
            </td>
        </tr>
        <tr>
            <td>
                <label for="lastName">Last Name: </label>
            </td>
            <td>
                <input type="text" id="lastName" name="lastName" required>
            </td>
        </tr>
        <tr>
            <td>
                <label for="address">Address: </label>
            </td>
            <td>
                <textarea id="address" name="address" required></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Create">
            </td>
            <td>
                <input type="reset" value="Clear">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
