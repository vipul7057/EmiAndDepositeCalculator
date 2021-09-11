<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<title>Login Page</title>
</head>
<style>
body {
	background-image:
		url('https://cdn.pixabay.com/photo/2017/09/07/08/53/money-2724235__340.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}
</style>
<body style="background-color: #EAEDED">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#"><img src="loanica.PNG" alt=""></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">
						<div style="color: black">Home</div>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">
						<div style="color: black">Features</div>
				</a></li>
				<li>
					<div class="dropdown">
						<button class="btn btn-danger dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Registration</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="prepareRegForm.htm">User</a>
						</div>
					</div>
				</li>

			</ul>
		</div>
	</nav>
	<div style="display: flex; height: 80vh">
		<div
			style="display: flex; flex: 1; justify-content: center; align-items: center; flex-direction: column">
			<div style="height: 30vh; width: 500px">
				<h1>
					Looking for a <span><br></span> same day loan?
				</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Dolorum, minima ea consequatur deleniti dolores, delectus ut vel
					placeat, necessitatibus suscipit nobis voluptatibus cupiditate! A
					repellendus commodi quisquam libero illo. Veniam.</p>
				<button style="border-radius: 10%; background-color: orange"
					class="btn btn-lg">FIND OUT MORE</button>
			</div>

		</div>
		<div
			style="display: flex; flex: 1; justify-content: center; align-items: center; flex-direction: column">
			
			<div
				style="height: 60vh; width: 450px; display: flex; justify-content: center; align-items: center; flex-direction: column; border-radius: 5%; padding: 20px;
				opacity: 0.9"
				class="bg-dark">
				<div style="color: red">${msg}</div>
				<spr:form action="logFinal.htm" method="post" commandName="user"
					class="login" style="">
					<div class="form-group">
						<label style="color: white" for="exampleInputEmail1">User
							Name</label>
						<spr:input path="userName" style="width:300px" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
						<font color="red"><spr:errors path="userName"></spr:errors></font>

					</div>

					<div class="form-group">
						<label style="color: white" for="exampleInputPassword1">Password</label>
						<spr:password path="userPass"  class="form-control"
							id="exampleInputPassword1" />
						<font color="red"><spr:errors path="userPass"></spr:errors></font>
					</div>
					<a href="forgot_password.jsp">ForgotPassword?</a>
					<br>
					<button type="submit" class="btn mt-2 btn-primary">Submit</button>
				</spr:form>
			</div>

		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

</body>
</html>
