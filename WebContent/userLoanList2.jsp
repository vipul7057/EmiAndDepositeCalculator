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
		<%
			List<Loan> elist = (List<Loan>) request.getAttribute("userLoanList");
			if(elist.size() == 0)
			{
		%>
		<h3>No Loan Applied</h3>
		<%
			}
			else
			{
		%>
		<table class="table table-striped table-dark">
			<thead>
				<tr>
				<th scope="col">Loan ID</th>	
					<th scope="col">Loan Amount</th>
					<th scope="col">Tenor(In Months)</th>
					<th scope="col">Total EMI</th>
					<th scope="col">Status</th>
					<th scope="col">Pay</th>
				</tr>
			</thead>
			<tbody>

				<%
					for (Loan list : elist) {
				%>
				<tr>
					<td scope="row"><%=list.getLoanId()%></td>
					<td><%=list.getAmount()%></td>
					<td><%=list.getTenor()%></td>
					<td><%=list.getEmi()%></td>
					<td><%=list.getStatus()%></td>

					<%
						if (list.getStatus().equals("Waiting")) {
					%>
					
					<%
						} else {
					%>
					<td><a href="prepareDeposite.htm?loanId=<%=list.getLoanId()%>">
							<button class="btn btn-success">Deposite</button>
					</a></td>
					<%
						}
					%>



				</tr>
				<%
					}
				%>

			</tbody>
		</table>



		<%
			}
			if (request.getAttribute("amount").equals(0.0)) {
		%>
		<p>--</p>
		<%
			} else {
		%>
		<h3>
			Total Loan Amount : <span style="color: red"><%=request.getAttribute("amount")%></span>
		</h3>
		<h3>
			Total Number of Loans : <span style="color: red"><%=request.getAttribute("count")%></span>
		</h3>
		<%
			}
		%>


		<a href="homepage.jsp"><button class="btn btn-outline-success">Back
				To HomePage</button></a>

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
