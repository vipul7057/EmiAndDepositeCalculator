
<!DOCTYPE html>
<html>
<head>
<title>Log-In</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/0ff6456f25.js"
	crossorigin="anonymous"></script>
<style>
body {
	background-image: url("background.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.img {
	width: 50vh;
	height: 50vh;
	margin-left: 16%;
	margin-top: 40%;
}

#icn {
	font-size: 25px;
	margin: 19px;
	color: white;
	cursor: pointer;
}

.mobileShow {
	display: inline;
}

/* Smartphone Portrait and Landscape */
@media only screen and (min-device-width: 320px) and (max-device-width:
	580px) {
	.mobileShow {
		display: inline;
	}
}

.mobileHide {
	display: inline;
}

/* Smartphone Portrait and Landscape */
@media only screen and (min-device-width: 320px) and (max-device-width:
	580px) {
	.mobileHide {
		display: none;
	}
}
</style>
</head>
<body>
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
	<div class="mt-4"><a href="prepareLoginForm.htm"><button class="btn btn-md btn-light btn-outline-success">Back To Homepage</button></a>
	</div>
	<div class="container-fluid">
		<div class="row" style="height: 100vh">

			<div class="col-3 bg-inf1o mobileHide"></div>
			<div
				class="col-md-6 align-items-center justify-content-center mobileShow">
				<div class="row d-flex align-items-center justify-content-center"
					style="height: 20vh"></div>
				<div class="row shadow ml-0 mr-5">
					<div
						class="col-4 text-dark d-flex align-items-center justify-content-center"
						style="height: 50vh; font-family: cursive; background-color: #00cba9;">
						Forgot Password</div>
					<div class="col-8 d-flex align-items-center justify-content-center"
						style="height: 50vh; background: whitesmoke">
						<form action="forgot_password.htm" method="post">
							<div class="ml-5 form-group display-3">
								<i class="fas fa-user-friends"></i>
							</div>
							<div style="color: red">${msg}</div>
							<div class="form-group">
								<input type="email" required="" class="form-control"
									placeholder="Enter Email" name="email" />
							</div>

							<div class="form-group">
								<input type="submit"
									class="rounded-pill form-control btn btn-info" name=""
									value="Send Password" />

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>