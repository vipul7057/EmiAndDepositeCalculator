<!doctype html>
<%@page import="com.cdac.dto.User"%>
<%@page import="com.cdac.dto.Loan"%>
<%@page import="java.util.List"%>
<%
	response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (session.getAttribute("user") == null) {
	response.sendRedirect(request.getContextPath() + "/index.jsp");

}
%>
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

<title>Loan List</title>
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
						href="adminHomepage.jsp">
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
		<a href="adminHomepage.jsp"><button
				class="mb-3 btn btn-light btn-outline-danger">Back To
				HomePage</button></a>

		<div class="mb-2">
			<p>Interest rate :- 7%</p>
		</div>
		<%
			List<Loan> elist = (List<Loan>) request.getAttribute("allLoanList");
		if (elist.size() == 0) {
		%>
		<h3>No User has taken Loan</h3>
		<%
			} else {
		%>
		<table class="table table-bordered ">
			<thead class="thead-dark">
				<tr>
					<th scope="col">User ID</th>
					<th scope="col">Loan ID</th>
					<th scope="col">Loan Amount</th>
					<th scope="col">Tenor(In Months)</th>
					<th scope="col">Total EMI</th>
					<th scope="col">Status</th>
					<th scope="col">Request</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Loan list : elist) {
				%>
				<tr>
					<td scope="row"><%=list.getUserId()%></td>
					<td><%=list.getLoanId()%></td>
					<td><%=list.getAmount()%></td>
					<td><%=list.getTenor()%></td>
					<td><%=list.getEmi()%></td>
					<td><%=list.getStatus()%></td>


					<td>
						<div class="dropdown">
							<a class="btn btn-secondary dropdown-toggle" href="#"
								role="button" id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> Actions </a>

							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<a class="dropdown-item"
									href="approveRequest.htm?loanId=<%=list.getLoanId()%>">Approve</a>
								<a class="dropdown-item"
									href="rejectRequest.htm?loanId=<%=list.getLoanId()%>">Reject</a>
							</div>
						</div>
					</td>

				</tr>
				<%
					}
				}
				%>


			</tbody>
		</table>



		<table class="table table-bordered ">
			<thead class="thead-dark">
				<tr>
					<th scope="col">User ID</th>
					<th scope="col">User Name</th>
					<th scope="col">User Email</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<User> ulist = (List<User>) request.getAttribute("allUserList");

				for (User list : ulist) {
					if (list.getUserName().equals("admin")) {
						continue;
					} else {
				%>

				<tr>
					<td scope="row"><%=list.getUserId()%></td>
					<td><%=list.getUserName()%></td>
					<td><%=list.getUserEmail()%></td>
					<td>
					<a href="deleteUser.htm?userId=<%=list.getUserId()%>"><button class="btn btn-danger btn-outline-warning">Delete User</button></a></td>
				</tr>
				<%
					}
				}
				%>


			</tbody>
		</table>


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
