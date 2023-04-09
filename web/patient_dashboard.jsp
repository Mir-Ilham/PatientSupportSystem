<%--<%@page errorPage="error_page.jsp" %>--%>
<%@page import="com.patient_support_system.entities.Patient" %>
<%
    Patient patient_user = (Patient) session.getAttribute("currentPatient");
    if (patient_user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="styles/main.css" />
        <!-- Bootstrap CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Patient's Dashboard</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="page-components/user_navbar_home.jsp" %>
        <!-- Patient options -->
        <div class="container-fluid primary-background p-5 text-white">
            <div class="row">
                <div class="card col-md-4 offset-md-4 primary-background border-0">
                    <div class="card-header text-center border border-light">
                        <p>Patient Options</p>
                    </div>
                    <div class="card-body bg-white text-dark">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><a href="patient-views/view_questionnaire.jsp">Respond to questionnaire</a></li>
                            <li class="list-group-item"><a href="patient-views/view_appointments.jsp">View appointments</a></li>
                            <li class="list-group-item"><a href="patient-views/view_prescriptions.jsp">View prescriptions</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
        </script>
    </body>
</html>
