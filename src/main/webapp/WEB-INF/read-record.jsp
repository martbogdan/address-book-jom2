
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read Records</title>
</head>
<body>
<%@include file="header.html"%>
<br><br>
<%
    String address = (String) request.getAttribute("address");
%>
<table>
    <tr>
        <td><span>First name: </span></td>
        <td><span style="font-weight: bold"><%=request.getParameter("firstName")%></span></td>
    </tr>
    <tr>
        <td>Last name:</td>
        <td><span style="font-weight: bold"><%=request.getParameter("lastName")%></span></td>
    </tr>
    <tr>
        <td>Address: </td>
        <td><span style="font-weight: bold"><%=address%></span></td>
    </tr>
</table>

</body>
</html>
