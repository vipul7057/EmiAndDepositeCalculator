<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr"%>
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

    <title>Login Page</title>
</head>
<style>
    body {
        background-image: url('');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
    }
</style>

<body style="background-color: #EAEDED">
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
			<a class="navbar-brand" href="#"><img src="loanica.PNG" alt=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="homepage.jsp">
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
    <div style="display: flex;height: 80vh">

        <div style="display: flex;flex: 1;justify-content: center;align-items: center;flex-direction: column;opacity: 0.8">
            <div style="height: 60vh;width: 500px;display: flex;justify-content: center;align-items:center;flex-direction: column;border-radius: 5%;padding: 20px" class="bg-dark">
             <div style="color: red;font-weight: 600">${msg}</div>
                <spr:form action="loanPageFinal.htm" method="post" commandName="loan" style="">
                    <div class="form-group">
                        <label style="color: white"  for="exampleInputEmail1">Amount</label>
                        <spr:input style="width: 280px" type="number" path="amount" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" />

                    </div>
                    <div class="form-group">
                        <label style="color: white"   for="exampleInputPassword1">Tenor(in months):</label>
                        <spr:input path="tenor" class="form-control" type="number" id="exampleInputPassword1" />
                    </div>

                    <button type="submit" class="btn btn-warning">Deposite</button>
                </spr:form>
            </div>

        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

</body></html>
