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
<%
	User user = (User) session.getAttribute("user");
String userName = "", profilePic = "";
if (user != null) {
	userName = user.getUserName();
	profilePic = user.getProfilePic();
}
%>
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

<title>Homepage</title>
</head>

<body style="background-color: #EAEDED">

	<div>
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
		<div style="display: flex; justify-content: center" class="mt-3">
			<img
				src="https://www.bareinternational.com/wp-content/uploads/2018/02/AdobeStock_100196663-1030x443.jpeg"
				style="width: 650px; height: 300px;" alt="..."> <img
				src="https://img.freepik.com/free-photo/businessman-analyzing-company-financial-report-balance-with-digital-augmented-reality-graphics_34141-379.jpg?size=626&ext=jpg"
				style="width: 600px; height: 300px;" alt="...">
		</div>
		<div align="center" style="margin-bottom: 10px;margin-top: 20px"><a href="file_upload_form.jsp"><button class="btn btn-warning">Upload
				Profile Picture</button></a></div>


		<h2 align="center">
			Welcome- 
			<%=(session.getAttribute("user") != null) ? ((User) session.getAttribute("user")).getUserName() : "!!!!!!!!"%>
		</h2>
		<div align="center">

			<img alt="no pic" src="<%="images/" + profilePic%>" height="150"
				width="150"> &nbsp;&nbsp;
		</div>

		<br>
		<div style="display: flex">
			<div
				style="display: flex; flex: 1; justify-content: center; align-items: center">
				<div class="card ml-3" style="width: 18rem;">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSkdz_M52di_fjA_tsDlCsF9UbjkyNLsleX8w&usqp=CAU"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Loan</h5>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Ex et eaque necessitatibus voluptatem placeat,
							ducimus, voluptas maiores veritatis atque. .</p>
						<a href="prepareLoanPage.htm" class="btn btn-primary">Apply
							for Loan</a>
					</div>
				</div>
			</div>
			<div style="display: flex; flex: 1">
				<div
					style="display: flex; flex: 1; justify-content: center; align-items: center;">
					<div class="card ml-3" style="width: 18rem;">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRz-QAU8nOOl8M8AavLpHHhN0J19agskNQaxw&usqp=CAU"
							class="card-img-top" alt="...">
						<div class="card-body" style="height: 220px">
							<h5 class="card-title">Loan List</h5>
							<p class="card-text" style="margin-bottom: 40px">Lorem ipsum
								dolor sit amet, consectetur adipisicing elit. adipisicing
								elitadipisicing elit</p>
							<a href="seeLoanList.htm" class="btn btn-primary">Show</a>
						</div>
					</div>
				</div>
			</div>
			<div style="display: flex; flex: 1" class="">
				<div
					style="display: flex; flex: 1; justify-content: center; align-items: center">
					<div class="card ml-3" style="width: 18rem;">
						<img style="height: 150px"
							src="https://lh3.googleusercontent.com/bXsJnF2AQA-xAG7GdoS6X5icWJvEZkRwRqc_RkUJG4c-CHbFF--y1xKbY1nEDuuvRkqP=w300-rw"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Emi Calculator</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Ex et eaque necessitatibus voluptatem placeat,
								ducimus, voluptas maiores veritatis atque. .</p>
							<a href="emiCalculatorFromUser.htm" class="btn btn-primary">Calculate</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		>
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