<%@page import="com.patient_support_system.entities.Patient"%>
<%@page import="com.patient_support_system.entities.Doctor"%>
<%
    Doctor doctor_user = (Doctor) session.getAttribute("currentDoctor");
    Patient patient_user = (Patient) session.getAttribute("currentPatient");
    String admin_user = (String) session.getAttribute("currentUser");
    if (admin_user != null) {
        response.sendRedirect("admin_dashboard.jsp");
    } else if (doctor_user != null) {
        response.sendRedirect("doctor_dashboard.jsp");
    } else if (patient_user != null) {
        response.sendRedirect("patient_dashboard.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.patient_support_system.entities.Message"%>
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
        <title>Patient Support System</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="page-components/navbar.jsp" %>
        <!-- Login Form -->
        <div class="container-fluid p-5">
            <div class="row">
                <div class="card col-md-4 offset-md-4 rounded border-0 p-0">
                    <div class="card-header primary-background text-white text-center">
                        <span class="fa fa-address-card fa-2x"></span>
                        <p>Login Here</p>
                    </div>
                    <div class="card-body rounded-bottom border-start border-end border-bottom border-primary">
                        <%  Message msg = (Message) session.getAttribute("msg");
                            if (msg != null) {
                        %>
                        <div class="alert <%= msg.getCssClass()%> p-1" role="alert">
                            <%= msg.getContent()%>
                        </div>
                        <%
                                session.removeAttribute("msg");
                            }
                        %>
                        <form action="LoginServlet" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="user-type">Select user type</label>
                                <select name="user-type" id="user-type" class="form-select" aria-label="User type">
                                    <option value="patient">Patient</option>
                                    <option value="doctor">Doctor</option>
                                    <option value="admin">Admin</option>
                                </select>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </form>
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
