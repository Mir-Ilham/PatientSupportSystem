<%--<%@page errorPage="error_page.jsp" %>--%>
<%@page import="com.patient_support_system.dao.QuestionDao"%>
<%@page import="com.patient_support_system.helper.ConnectionProvider"%>
<%@page import="com.patient_support_system.entities.Question"%>
<%@page import="java.util.ArrayList"%>
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
        <title>View questionnaire</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="../page-components/user_navbar.jsp" %>
        <!-- Questionnaire -->
        <%            ArrayList<Question> questions = new ArrayList<>();
            QuestionDao dao = new QuestionDao(ConnectionProvider.getConnection());
            questions = dao.getAllQuestions();
        %>
        <div class="container-fluid p-5">
            <a href="../patient_dashboard.jsp" class="btn primary-background text-light">
                <span class="fa-solid fa-arrow-left"></span>
                Back
            </a>
            <div class="row">
                <div class="card col-md-4 offset-md-4 rounded border-0 p-0">
                    <div class="card-header primary-background text-white text-center">
                        <span class="fa fa-rectangle-list fa-2x"></span>
                        <p>Questionnaire</p>
                    </div>
                    <div class="card-body rounded-bottom border-start border-end border-bottom border-primary">
                        <form id="questionnaire">
                            <input type="hidden" name="patient-id" value="<%=patient.getPatientId()%>">
                            <%
                                for (Question q : questions) {
                            %>
                            <div class="form-floating mb-3">
                                <p><%= q.getQuestionText() %></p>
                                <textarea class="form-control pt-3" name="<%= q.getQuestionId() %>" style="height: 60px"></textarea>
                            </div>
                            <%
                                }
                            %>
                            <div class="container text-center hide" id="loader">
                                <span class="fa fa-arrow-rotate-right fa-spin fa-4x"></span>
                                <h4>Please wait...</h4>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary" id="submit-btn">Submit</button>
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
                const form = document.getElementById("questionnaire");
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
                            swal("Entered successfully...");
                        } else {
                            swal("Something went wrong...try again");
                        }

                    });

                    XHR.addEventListener("error", (event) => {
                        submitBtn.classList.remove("hide");
                        loader.classList.add("hide");
                        swal("Something went wrong...try again");
                    });

                    XHR.open("POST", "../SaveQuestionnaireServlet");
                    XHR.send(FD);
                }

                form.addEventListener("submit", (event) => {
                    event.preventDefault();
                    sendData();
                    form.reset();
                });
            });
        </script>
    </body>
</html>
