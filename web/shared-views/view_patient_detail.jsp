<%@page import="com.patient_support_system.dao.PatientDao"%>
<%@page import="com.patient_support_system.helper.ConnectionProvider"%>
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
        <script src="../scripts/backFunctionality.js" type="text/javascript" defer></script>
        <style>
            .btn-custom {
                padding: 8px 8px;
                border-radius: 5px;
                text-decoration: none;
                margin-right: 10px;
            }
        </style>
        <title>View patient's detail</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="../page-components/user_navbar.jsp" %>
        <%            int patientId = Integer.parseInt(request.getParameter("id"));
            PatientDao dao = new PatientDao(ConnectionProvider.getConnection());
            Patient selected = dao.getPatientById(patientId);
        %>   
        <div class="container p-4">
            <div class="mb-3">
            <%            
                if (admin == null && patient == null) {
            %>
                <a href="../doctor_dashboard.jsp" class="btn-custom primary-background text-light">
                    <span class="fa-solid fa-arrow-left"></span>
                    Back
                </a>
                <a class="btn btn-outline-primary" href="../doctor-views/add_prescription.jsp?id=<%= patientId%>">Add prescription</a>
            <%
                } else {
            %>
                <a href="#" class="btn primary-background text-light">
                    <span class="fa-solid fa-arrow-left"></span>
                    Back
                </a>
            <%
                }
            %>
            </div>
            <div class="card border-primary" style="width: 20rem;">
                <img src="../images/default.png" class="card-img-top" alt="Doctor profile picture">
                <div class="card-body">
                    <h5 class="card-title text-custom"><%= selected.getName()%></h5>
                    <p class="card-text">
                        <%
                            if (selected.getGender().equals("male")) {
                        %>
                        Mr.
                        <%
                        } else {
                        %>
                        Mrs.
                        <%
                            }
                        %>
                        <%= selected.getName()%> is a registered patient seeking medical support.
                    </p>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item border-primary">Patient Id: <%= selected.getPatientId()%></li>
                        <li class="list-group-item border-primary">Date of birth: <%=  selected.getDateOfBirth()%></li>
                        <li class="list-group-item border-primary">Gender: <%=  selected.getGender()%></li>
                        <li class="list-group-item border-primary">Blood group: <%=  selected.getBloodGroup()%></li>
                        <li class="list-group-item border-primary">Date registered: <%=  selected.getDateRegistered()%></li>
                    </ul>
                </div>
            </div>
        </div>
        <a href="../doctor-views/add_prescription.jsp?id=<%= patientId%>">Add prescription</a>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
        </script>
    </body>
</html>

