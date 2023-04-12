<%@page import="com.patient_support_system.entities.Prescription"%>
<%@page import="com.patient_support_system.dao.PrescriptionDao"%>
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
        <title>View prescription details</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="../page-components/user_navbar.jsp" %>
        <%            
            int prescriptionId = Integer.parseInt(request.getParameter("id"));
            PrescriptionDao dao = new PrescriptionDao(ConnectionProvider.getConnection());
            Prescription selected = dao.getPrescriptionById(prescriptionId);
        %>
        <div class="container p-4">
            <a href="#" class="btn primary-background text-light mb-3">
                <span class="fa-solid fa-arrow-left"></span>
                Back
            </a>
            <div class="card border-primary" style="width: 20rem;">
                <div class="card-body">
                    <h5 class="card-title text-custom">Prescription <%= selected.getPrescriptionId()%></h5>
                    <p class="card-text">
                        <%= selected.getPrescriptionText()%>
                    </p>
                </div>

                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item border-primary">
                            <a href="view_doctor_detail.jsp?id=<%= selected.getDoctorId() %>">
                                Doctor id: <%= selected.getDoctorId()%>
                            </a>
                        </li>
                        <li class="list-group-item border-primary">
                            <a href="view_patient_detail.jsp?id=<%= selected.getPatientId()%>">
                                Patient id: <%= selected.getPatientId()%>
                            </a>
                        </li>
                        <li class="list-group-item border-primary">Date prescribed: <%= selected.getDatePrescribed()%></li>
                        <li class="list-group-item">Prescription end date: <%= selected.getEndDate()%></li>
                    </ul>
                </div>
            </div>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
        </script>
    </body>
</html>

