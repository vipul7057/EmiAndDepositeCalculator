<%@page import="com.cdac.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (session.getAttribute("user") == null) {
	response.sendRedirect(request.getContextPath() + "/index.jsp");

}
%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>Homepage</title>
</head>
<style>
    #jumbo {
        background-image: url('https://akhealth.org/wp-content/plugins/admin-custom-login/images/3d-background.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
    }
</style>

<body>

    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
            <a class="navbar-brand" href="#"><img src="loanica.PNG" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active"><a class="nav-link" href="adminHomepage.jsp">
                            <div style="color: black">Home</div>
                        </a></li>
                    <li class="nav-item"><a class="nav-link" href="#">
                            <div style="color: black">Features</div>
                        </a></li>

                    <li class="nav-item"><a class="nav-link" href="logout.htm">
                            <div style="color: white">
                                <button class="btn btn-danger">Logout</button>
                            </div>
                        </a></li>

                </ul>
            </div>
        </nav>
        <!--        <h3 class="mb-2">Admin Login:-<%= ((User) session.getAttribute("user")).getUserName()%> </%>-->
        <div class="jumbotron" id="jumbo">
            <h1 class="display-3" style="color: white">Welcome admin!</h1>

            <hr class="my-4">
            <p style="color: white;font-weight: 400;font-size: 30px">See All Users</p>
            <a class="btn btn-warning btn-lg btn-outline-light" href="showAllUser.htm" role="button" style="color: black">Show User</a>
        </div>


    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

</body></html>