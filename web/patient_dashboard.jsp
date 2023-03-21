<%--<%@page errorPage="error_page.jsp" %>--%>
<%@page import="com.patient_support_system.entities.Patient" %>
<%
    Patient patient = (Patient) session.getAttribute("currentPatient");
    if (patient == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Dashboard</title>
    </head>
    <body>
        <h1>The Patient's Dashboard</h1>
        <p>
            <%= patient.getName() %>
        </p>
    </body>
</html>
