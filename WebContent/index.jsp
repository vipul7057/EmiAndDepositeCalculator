<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Homepage</title>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">
            <img src="loanica.PNG" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active"><a class="nav-link" href="index.jsp">
                        <div style="color: black">Home</div>
                    </a></li>
                <li class="nav-item"><a class="nav-link" href="#">
                        <div style="color: black">Features</div>
                    </a></li>

                <li>
                    <div class="dropdown">
                        <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Registration</button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="prepareRegForm.htm">User</a>
                        </div>
                    </div>
                </li>
                <li class="ml-3">
                    <div class="dropdown">
                        <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Login</button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="prepareLoginForm.htm">User</a> <a class="dropdown-item" href="LoginAdmin.htm">Admin</a>

                        </div>
                    </div>
                </li>

            </ul>
        </div>
    </nav>
    <div style="height: 65vh;display: flex;justify-content: center;align-items: center">
        <div style="display: flex;flex: 1">
            <img src="animate.PNG" style="margin-left: 60px" alt="">
        </div>
        <div style="display: flex;flex: 1;flex-direction: column">
            <h1 style="font-size: 60px;margin-left: 40px">A personal loan for multiple purposes!</h1>
            <p style="margin-left: 40px">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur culpa molestiae aliquid laboriosam impedit voluptatem, nesciunt obcaecati ea dolore earum eaque quidem suscipit officiis error corporis dolorem accusantium praesentium totam!</p>
            <button class="btn btn-success" style="width: 150px;margin-left: 40px;">Learn More</button>
        </div>
    </div>
    <div style="height: 30vh;display: flex;justify-content: center;align-items: center;background-color: #322153">
        <div style="display: flex;flex: 1;flex-direction: column;justify-content:center;align-items:center">
            <img src="loan.PNG" alt="">
            <p style="color: white;margin-left: 40px">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam enim blanditiis ex iusto expedita vel explicabo distinctio.</p>

        </div>



        <div style="display: flex;flex: 1;flex-direction: column;justify-content:center;align-items:center">
            <h3 style="color: green">Quick Link</h3>
            <ul style="color: white">
                <li>Services</li>
                <li> Calculator</li>
                <li>Contact Us</li>
            </ul>
        </div>


        <div style="display: flex;flex: 1;flex-direction: column;justify-content:center;align-items:center">
            <h3 style="color: green">Address</h3>
            <p style="color: white;margin-left: 20px">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae eligendi veniam, voluptatibus hic deserunt, quam.</p>
        </div>
        <div style="display: flex;flex: 1;flex-direction: column;justify-content:center;align-items:center">

            <h3 style="color: green">Social Connect</h3>
           <div style="display: flex">
                <i class="fa fa-facebook-square" style="font-size:30px;color:white;margin-right: 10px"></i>
             <i class="fa fa-twitter" style="font-size:30px;color:white;margin-right: 10px"></i>
               <i class="fa fa-instagram" style="font-size:30px;color:white;"></i>
           </div>
        </div>
    </div>
<hr>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

</body>

</html>
