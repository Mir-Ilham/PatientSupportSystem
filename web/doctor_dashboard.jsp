<%--<%@page errorPage="error_page.jsp" %>--%>
<%@page import="com.patient_support_system.entities.Doctor" %>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentDoctor");
    if (doctor == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Dashboard</title>
    </head>
    <body>
        <h1>The Doctor's Dashboard</h1>
        <p>
            <%= doctor.getName() %>
        </p>
    </body>
</html>
