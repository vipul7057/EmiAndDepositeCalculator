<%@page import="com.cdac.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form"%>
<%
	response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (session.getAttribute("user") == null) {
	response.sendRedirect(request.getContextPath() + "/index.jsp");

}
%>


<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- 
<link type="text/css" rel="stylesheet" href="css/style.css">
 -->

<style>
body {
background: #20002c;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #cbb4d4, #20002c);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #cbb4d4, #20002c); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

}

#container {
	align: center;
	margin-top: 20px;
	margin-left: 400px;
	width: 500px;
	height: 500px;
}

table {
	color: black;
	border: none;
}
</style>

</head>
<body>
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
	<h2 align="center">
		Welcome
		<%=(session.getAttribute("user") != null) ? ((User) session.getAttribute("user")).getUserName() : "!!!!!!!!"%>
	</h2>


	<div id="container" class="mt-5" style="color: white">
		<form method="POST" action="upload_file.htm"
			enctype="multipart/form-data">
			<table align="center">
				<tr>
					<td>File to upload:</td>
					<td><input type="file"  name="file"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-primary btn-sm mt-2"  value="Upload"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>