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
        <!-- Banner -->
        <div class="container-fluid primary-background text-white p-5">
            <div class="container">
                <h3 class="fw-light display-3">Welcome to the Dodo Medic</h3>
                <p>The online patient support system that cares for you!</p>
                <p>
                    Welcome to our website, designed to help you receive the
                    healthcare you need in a fast, efficient, and personalized way.
                    We understand that navigating the healthcare system can be overwhelming,
                    especially when you're not sure where to start or who to turn to.
                    That's why we've created a simple and effective way for you
                    to submit your healthcare information to a general practitioner
                    who will refer you to a doctor that is best suited for your specific needs.
                    By filling out our standard questionnaire, you can ensure
                    that the information provided to the GP is accurate and
                    complete, allowing for a more informed referral process.
                </p>
                <p>
                    Our website is easy to use, with clear instructions and simple navigation,
                    ensuring that you can complete the questionnaire quickly and with confidence.
                    Additionally, we take your privacy and security seriously, ensuring
                    that all of your personal and medical information is protected and kept confidential.
                </p>
                <p>
                    So, take the first step towards better health and submit your
                    responses to our standard questionnaire today.
                    We look forward to helping you on your healthcare journey.
                </p>
                <a class="btn btn-lg btn-outline-light"><span class="fa fa-user-plus"></span> Register</a>
                <a href="login_page.jsp" class="btn btn-lg btn-outline-light"><span class="fa fa-user"></span> Login</a>
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
