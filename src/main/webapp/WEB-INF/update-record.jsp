
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Record</title>
</head>
<body>
<%@include file="header.html"%>
<form action="/records/update" method="post">
    <%String address = (String) request.getAttribute("address");%>
    <table>
        <tr>
            <td>
                <label for="firstName">First name: </label>
            </td>
            <td>
                <input type="text" id="firstName" name="firstName" value="<%=request.getParameter("firstName")%>" disabled>
            </td>
        </tr>
        <tr>
            <td>
                <label for="lastName">Last name: </label>
            </td>
            <td>
                <input type="text" id="lastName" name="lastName" value="<%=request.getParameter("lastName")%>" disabled>
            </td>
        </tr>
        <tr>
            <td>
                <label for="addressIn">Address: </label>
            </td>
            <td>
                <textarea id="addressIn" name="addressIn" placeholder="<%=address%>" required></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Update">
            </td>
            <td>
                <input type="reset" value="Clear">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
