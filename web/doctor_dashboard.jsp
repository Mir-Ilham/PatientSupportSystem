<%--<%@page errorPage="error_page.jsp" %>--%>
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
        <title>Doctor's Dashboard</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="page-components/user_navbar_home.jsp" %>
        <!-- Doctor options -->
        <div class="container pt-5">
            <div class="row">
                <div class="card col-md-4 rounded border-0 p-0">
                    <div class="card-header primary-background text-white text-center">
                        <span class="fa fa-user-doctor fa-2x"></span>
                        <p>Doctor Options</p>
                    </div>
                    <div class="card-body rounded-bottom border-start border-end border-bottom border-primary">
                        <ul class="list-group list-group-flush text-center">
                            <li class="list-group-item border-0">
                                <a class="btn btn-outline-primary text-start ps-4" style="width: 16rem" href="doctor-views/view_appointments.jsp">
                                    <span class="fa-regular fa-calendar-check"></span> &nbsp;View appointments
                                </a>
                            </li>
                            <li class="list-group-item border-0">
                                <a class="btn btn-outline-primary text-start ps-4" style="width: 16rem" href="doctor-views/view_prescriptions.jsp">
                                    <span class="fa-solid fa-prescription-bottle-medical"></span> &nbsp;View prescriptions
                                </a>
                            </li>
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
