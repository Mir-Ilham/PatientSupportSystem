<%@page import="com.patient_support_system.dao.PatientDao"%>
<%@page import="com.patient_support_system.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
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
        <script src="scripts/adminViewController.js" type="text/javascript" defer></script>
        <title>View patients</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="../page-components/user_navbar.jsp" %>
        <!-- Table -->
        <%            
            ArrayList<Patient> patients = new ArrayList<>();
            PatientDao dao = new PatientDao(ConnectionProvider.getConnection());
            patients = dao.getAllPatients();
        %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Date of birth</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Blood group</th>
                    <th scope="col">Date registered</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>       
                <%
                    for (Patient p : patients) {
                %>
                <tr>
                    <th scope="row"><%= p.getPatientId()%></th>
                    <!--Remove the href from here-->
                    <td><a href="../shared-views/view_patient_detail.jsp?id=<%= p.getPatientId()%>"><%= p.getName()%></a></td>
                    <td><%= p.getDateOfBirth()%></td>
                    <td><%= p.getGender()%></td>
                    <td><%= p.getBloodGroup()%></td>
                    <td><%= p.getDateRegistered()%></td>
                    <td><a href="view_patient_answers.jsp?id=<%= p.getPatientId()%>">View responses</a></td>
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

