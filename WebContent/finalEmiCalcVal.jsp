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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<title>Emi Calculator</title>
</head>

<body>
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
		<h4 style="text-align: center;">Your Personal Loan EMI</h4>
		<hr>
		<div
			style="height: 60vh; display: flex; justify-content: center; align-items: center; background-color: #F5F5F5">

			<div
				style="height: 40vh; width: 800px; display: flex;flex-direction:column; justify-content: center; align-items: center; border: 1px solid black; background-color: #D7E1EC; border-radius: 20px">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">Amount</th>
							<th scope="col">Tenor</th>
							<th scope="col">Interest Rate</th>
							<th scope="col">Final EMI</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=request.getAttribute("amount") %></td>
							<td><%=request.getAttribute("tenor") %></td>
							<td><%=request.getAttribute("rate") %></td>
							<td><h3 style="color: red"><%=request.getAttribute("finalemi") %></h3></td>
						</tr>

					</tbody>
				</table>
				</div>
				
		</div>
<a href="emiCalculatorFromUser.htm"><button class="btn btn-secondary">Calculate Again</button></a>
			
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
