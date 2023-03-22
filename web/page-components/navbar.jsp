<%@page import="com.patient_support_system.entities.Patient"%>
<%@page import="com.patient_support_system.entities.Doctor"%>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentDoctor");
    Patient patient = (Patient) session.getAttribute("currentPatient");
    String admin = (String) session.getAttribute("currentUser");
%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp"><span class="fa fa-hand-holding-heart"></span> The Dodo Medic</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a  href="home.jsp" class="nav-link active" aria-current="page"><span class="fa fa-square-h"></span> Home</a>
                </li>
                <%
                    if (admin == null && doctor == null && patient == null) {
                %>
                <li class="nav-item">
                    <a href="login_page.jsp" class="nav-link"><span class="fa fa-address-card"></span> Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Register</a>
                </li>
                <%
                    }
                %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Clinical Departments
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- User options -->
        <ul class="navbar-nav mr-right">
            <%
                if (admin != null) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="admin_dashboard.jsp"><span class="fa fa-user-circle"></span> Admin</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet?user=admin"><span class="fa fa-arrow-right-from-bracket"></span> Logout</a>
            </li>
            <%
            } else if (doctor != null) {
            %>

            <li class="nav-item">
                <a class="nav-link" href="doctor_dashboard.jsp"><span class="fa fa-user-circle"></span> <%= doctor.getName()%></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet?user=doctor"><span class="fa fa-arrow-right-from-bracket"></span> Logout</a>
            </li>

            <%
            } else if (patient != null) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="patient_dashboard.jsp"><span class="fa fa-user-circle"></span> <%= patient.getName()%></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet?user=patient"><span class="fa fa-arrow-right-from-bracket"></span> Logout</a>
            </li>
            <%
                }
            %>
        </ul>

    </div>
</nav>