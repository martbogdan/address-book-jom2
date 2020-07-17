
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
<%@include file="header.html"%>
<br><br>
<%
    Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
    Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");
    String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
%>

<%
    if (statusCode != 500) {
%>
    <h1>code: <%=statusCode%></h1>
    <h3>url: <%=requestUri%></h3>
<%
    } else {
        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
%>
    <h1 style="font-weight: bold; color: red"><%=response.getStatus()%></h1>
    <h2 style="color: red"><%=exception.getMessage()%></h2>
    <h3>url: <%=requestUri%></h3>
<%
    }
%>
</body>
</html>
