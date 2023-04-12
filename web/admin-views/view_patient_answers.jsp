<%@page import="com.patient_support_system.dao.AnswerDao"%>
<%@page import="com.patient_support_system.dao.QuestionDao"%>
<%@page import="com.patient_support_system.helper.ConnectionProvider"%>
<%@page import="com.patient_support_system.entities.Answer"%>
<%@page import="com.patient_support_system.entities.Question"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("currentUser") == null) {
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
        <script src="scripts/adminViewController.js" type="text/javascript" defer></script>
        <title>View patient's answer</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="../page-components/user_navbar.jsp" %>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
        %>
        <div class="container">
            <h3 class="text-custom mb-4 mt-2">Responses by patient id <%= id %></h3>
            <div class="mb-3">
                <a href="view_patients.jsp" class="btn primary-background text-light">
                    <span class="fa-solid fa-arrow-left"></span>
                    Back
                </a>
                <a class="btn btn-outline-primary" href="add_appointment.jsp?id=<%= id%>">Add appointment</a>
            </div>
            <div class="card p-4 mb-3 border border-primary" style="width: 40rem">
                <%            
                    ArrayList<Question> questions = new ArrayList<>();
                    ArrayList<Answer> answers = new ArrayList<>();
                    QuestionDao questionDao = new QuestionDao(ConnectionProvider.getConnection());
                    AnswerDao answerDao = new AnswerDao(ConnectionProvider.getConnection());
                    questions = questionDao.getAllQuestions();
                    answers = answerDao.getAllPatientAnswers(id);

                    for (int i = 0; i < answers.size(); i++) {
                        String a = answers.get(i).getAnswerText();
                %>
                <div>
                    <h5 class="text-custom"><%= questions.get(i % questions.size()).getQuestionText()%></h5>
                    <p><%= answers.get(i).getAnswerText()%></p>
                </div>
                <%
                        if ((i + 1) % questions.size() == 0) {
                %>
                <p class="text-light primary-background p-1">Response timestamp: <%= answers.get(i - 1).getAnswerDate()%></p>
                
            </div><div class="card p-4 mb-3  border border-primary" style="width: 40rem">
                <%
                        }
                    }
                %>
                <p class="fw-bold text-secondary">Total responses: <%= answers.size() / questions.size() %></p>
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

