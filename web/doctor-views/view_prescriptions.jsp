<%--<%@page errorPage="error_page.jsp" %>--%>
<%@page import="com.patient_support_system.dao.PrescriptionDao"%>
<%@page import="com.patient_support_system.helper.ConnectionProvider"%>
<%@page import="com.patient_support_system.entities.Prescription"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.patient_support_system.entities.Doctor" %>
<%
    Doctor doctor_user = (Doctor) session.getAttribute("currentDoctor");
    if (doctor_user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../styles/main.css" />
        <!-- Bootstrap CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>View prescriptions</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="../page-components/user_navbar.jsp" %>
        <!-- Table -->
        <%  
            int id = doctor.getDoctorId();
            ArrayList<Prescription> prescriptions = new ArrayList<>();
            PrescriptionDao dao = new PrescriptionDao(ConnectionProvider.getConnection());
            prescriptions = dao.getAllDoctorPrescriptions(id);
        %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Prescription id</th>
                    <th scope="col">Patient id</th>
                    <th scope="col">Date prescribed</th>
                </tr>
            </thead>
            <tbody>       
                <%
                    for (Prescription p : prescriptions) {
                %>
                <tr>
                    <th scope="row"><a href="../shared-views/view_prescription_details.jsp?id=<%= p.getPrescriptionId() %>"><%= p.getPrescriptionId() %></a></th>
                    <td><a href="../shared-views/view_patient_detail.jsp?id=<%= p.getPatientId() %>"><%= p.getPatientId() %></a></td>
                    <td><%= p.getDatePrescribed() %></td>
                </tr>                
                <%
                    }
                %>
            </tbody>
        </table>
        <!-- Bootstrap Bundle with Popper -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
        </script>
    </body>
</html>
