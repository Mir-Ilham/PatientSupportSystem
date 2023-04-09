<%@page import="com.patient_support_system.dao.DoctorDao"%>
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
        <script src="scripts/adminViewController.js" type="text/javascript" defer></script>
        <title>View doctor's detail</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="../page-components/user_navbar.jsp" %>
        <%            
            int doctorId = Integer.parseInt(request.getParameter("id"));
            DoctorDao dao = new DoctorDao(ConnectionProvider.getConnection());
            Doctor selected = dao.getDoctorById(doctorId);
        %>
        <div class="container p-4">
            <div class="card border-primary" style="width: 20rem;">
                <img src="../images/<%= selected.getDoctorProfile()%>" class="card-img-top" alt="Doctor profile picture">
                <div class="card-body">
                    <h5 class="card-title text-custom"><%= selected.getName()%></h5>
                    <p class="card-text">
                        Dr. <%= selected.getName()%> specializes in the department of <%= selected.getSpecialization()%>
                    </p>
                </div>

                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item border-primary">Doctor Id: <%= selected.getDoctorId()%></li>
                        <li class="list-group-item">Specialization <%= selected.getSpecialization()%></li>
                    </ul>
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

