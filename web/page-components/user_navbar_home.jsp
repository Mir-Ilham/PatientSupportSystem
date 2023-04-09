<%@page import="com.patient_support_system.entities.Patient"%>
<%@page import="com.patient_support_system.entities.Doctor"%>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentDoctor");
    Patient patient = (Patient) session.getAttribute("currentPatient");
    String admin = (String) session.getAttribute("currentUser");
%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><span class="fa fa-hand-holding-heart"></span> The Dodo Medic</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <%
                    if (admin != null) {
                %>
                <li class="nav-item">
                    <a  href="#" class="nav-link active" aria-current="page"><span class="fa fa-square-h"></span> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="admin_dashboard.jsp"><span class="fa fa-user-circle"></span> Admin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet?user=admin"><span class="fa fa-arrow-right-from-bracket"></span> Logout</a>
                </li>
                <%
                } else if (doctor != null) {
                %>
                <li class="nav-item">
                    <a  href="#" class="nav-link active" aria-current="page"><span class="fa fa-square-h"></span> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="shared-views/view_doctor_detail.jsp?id=<%= doctor.getDoctorId() %>"><span class="fa fa-user-circle"></span> <%= doctor.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet?user=doctor"><span class="fa fa-arrow-right-from-bracket"></span> Logout</a>
                </li>

                <%
                } else if (patient != null) {
                %>
                <li class="nav-item">
                    <a  href="#" class="nav-link active" aria-current="page"><span class="fa fa-square-h"></span> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="shared-views/view_patient_detail.jsp?id=<%= patient.getPatientId() %>"><span class="fa fa-user-circle"></span> <%= patient.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet?user=patient"><span class="fa fa-arrow-right-from-bracket"></span> Logout</a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>