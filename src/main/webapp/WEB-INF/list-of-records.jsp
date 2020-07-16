<%@ page import="java.util.List" %>
<%@ page import="com.softserve.jom2.AddressBook" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Records</title>
</head>
<body>

<%@include file="header.html"%>
<br><br>
<span>Sort by: </span>
<a href="/records/list?sortType=ASC">ascending</a>
<span> | </span>
<a href="/records/list?sortType=DESC">descending</a>
<br><br>
<table border="1">
    <tr>
        <th>№</th>
        <th>First name</th>
        <th>Last name</th>
        <th>Address</th>
        <th colspan="3">Operation</th>
    </tr>

    <%
        AddressBook addresses = (AddressBook) request.getAttribute("addresses");
        String[] pair;
        List<String> records = new ArrayList<>();
        addresses.forEach((address)-> records.add(String.valueOf(address)));
        for (int i = 0; i < records.size(); i++) {
            pair = records.get(i)
                    .replace("First name: ","")
                    .replace(", Last name: ","\n")
                    .replace(", Address: ", "\n")
                    .split("\n", 3);

    %>
    <tr>
        <td><%=i+1%></td>
        <td><%=pair[0]%></td>
        <td><%=pair[1]%></td>
        <td><%=pair[2]%></td>
        <td>
            <a href="/records/read?firstName=<%=pair[0]%>&lastName=<%=pair[1]%>">Read</a>
        </td>
        <td>
            <a href="/records/update?firstName=<%=pair[0]%>&lastName=<%=pair[1]%>">Update</a>
        </td>
        <td>
            <a href="/records/delete?firstName=<%=pair[0]%>&lastName=<%=pair[1]%>">Delete</a>
        </td>

    </tr>
    <%
        }
    %>
</table>
</body>
</html>
