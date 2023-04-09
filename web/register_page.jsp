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
        response.sendRedirect("doctor_dashboard.jsp");
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
        <title>Patient Support System</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="page-components/navbar.jsp" %>
        <!-- Register Form -->
        <div class="container-fluid primary-background p-5 text-white">
            <div class="row">
                <div class="card col-md-4 offset-md-4 primary-background border-0">
                    <div class="card-header text-center border border-light">
                        <span class="fa fa-user-plus fa-2x"></span>
                        <p>Patient Registration</p>
                    </div>
                    <div class="card-body bg-white text-dark">
                        <form id="register-form">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="mb-3">
                                <label for="date-of-birth" class="form-label">Date of birth</label>
                                <input type="date" class="form-control" id="date-of-birth" name="date-of-birth" required>
                            </div>
                            <div class="mb-3">
                                <label for="gender" class="form-label">Select Gender</label><br>
                                <input type="radio" id="gender" name="gender" value="male" checked> Male
                                <input type="radio" id="gender" name="gender" value="female"> Female
                            </div>
                            <div class="mb-3">
                                <label for="blood-group" class="form-label">Blood group</label>
                                <select class="form-select" id="blood-group" name="blood-group" aria-label="Select blood group">
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                </select>
                            </div>
                            <div class="container text-center hide" id="loader">
                                <span class="fa fa-arrow-rotate-right fa-spin fa-4x"></span>
                                <h4>Please wait...</h4>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary" id="submit-btn">Register</button>
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
        <!-- Sweet alert CDN -->
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
            integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
        </script>
        <script>
            window.addEventListener("load", () => {
                const form = document.getElementById("register-form");
                const submitBtn = document.getElementById("submit-btn");
                const loader = document.getElementById("loader");

                function sendData() {
                    const XHR = new XMLHttpRequest();
                    const FD = new FormData(form);

                    submitBtn.classList.add("hide");
                    loader.classList.remove("hide");

                    XHR.addEventListener("load", (event) => {
                        submitBtn.classList.remove("hide");
                        loader.classList.add("hide");
                        if (event.target.responseText.trim() === 'Done') {
                            swal("Registered successfully...")
                                    .then((value) => {
                                        window.location = "login_page.jsp";
                                    });
                        } else {
                            swal("Something went wrong...try again");
                        }

                    });

                    XHR.addEventListener("error", (event) => {
                        submitBtn.classList.remove("hide");
                        loader.classList.add("hide");
                        swal("Something went wrong...try again");
                    });

                    XHR.open("POST", "PatientRegisterServlet");
                    XHR.send(FD);
                }

                form.addEventListener("submit", (event) => {
                    event.preventDefault();

                    sendData();
                });
            });
        </script>
    </body>
</html>
