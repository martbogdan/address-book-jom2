
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
%>
    <h2><%=exception.getMessage()%></h2>
    <h3>url: <%=requestUri%></h3>
<%
    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
    }
%>
</body>
</html>
