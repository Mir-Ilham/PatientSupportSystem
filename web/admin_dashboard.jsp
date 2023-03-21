<%--<%@page errorPage="error_page.jsp" %>--%>
<%
    if (session.getAttribute("currentUser") == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <h1>The Admin's Dashboard</h1>
    </body>
</html>
