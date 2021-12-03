<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ include file="links.jsp"%>

<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Lifestyle Home page</title>
<!-- MDB icon -->
<link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
<!-- MDB -->
<link rel="stylesheet" href="css/mdb.min.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Home</title>

<style>
img {
	opacity: 0.2;
}
</style>
<style>
.box {
	background-color: white;
	width: 90%;
	border: 5px solid #FFFFCC;
	padding: 20px;
	margin: 50px;
}

.container {
	position: relative;
	text-align: center;
	color: black;
}


}
</style>
</head>

<body>



	<ul class="nav justify-content-end">
		<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="login.jsp">Logout</a>
		</li>
	
	</ul>

	<div class="test">
		<h2>HOMEPAGE</h2>
		<p>Welcome to Lifestyle App</p>
	</div>

	<div class="container">
	<div class="box">
		<p>
		<h1>INTRO</h1>
		<br>Lifestyle is a health application which motivates you to be
		healthy and provides a plan on physical activity and diet. These apps
		help not only to stay fit but also to keep their weight off over time
		by self-monitoring the physical activity and diet intake. The
		relationship between the weight management and applications will
		encourage you to self-monitor. The diet can be chosen by you and
		personalize it according to your food habits/cuisines.
		We also have home made beauty products on our ecommerce site. Buy our
		home-made beauty products for less price. Please scroll down to see the products page.
		</p>
	</div>



	<div class="box">
		<p>
		<h1>ABOUT</h1>
		<br>Through this application, you can Self-monitor the physical
		activity and diet by spending less time on the application. 
		<h3>User Manual:</h3>
		<h4>Login/Register</h4>
		Register and Login page could be found on the home page, and it is
		very straight forward to fill out the register form with basic email
		id, name, and a password. Once it is done the user could login with
		the right credentials at login page. Users don't have to login for
		viewing home and programme page. But to enrol in a certain plan the
		user is expected to register and login.
		<h4>Programme</h4>
		This page is only for viewing and it gives information on what to
		expect from this application regarding the diet and physical activity
		plan.
		<h4>About Me</h4>
		The user must fill the form with correct details about the user. It
		asks basic questions about height, weight, and age. The user will be
		navigated to plan page once it is done.
		<h4>Plan</h4>
		The user will be given a plan where she will fit in with the details
		she provided. The user can then navigate to manual update page.
		<h4>Manual update</h4>
		The user will have to fill this every day. It asks about the calories
		consume and activity done for the day. Depending on this it gives the
		calorie each day she is allowed and how much she spent on for the day.
		<h4>Dashboard</h4>
		The user will be navigated to dashboard, and it displays all the
		information about the user. It displays all the data from the database
		since the beginning until the day on what the user has done in terms
		of diet and physical activity.
		<h4>Report</h4>
		This page has the report for each week, and it can be downloaded as a
		PDF.
		<h4>Products</h4>
		This page is optional which is an ecommerce website. It has beauty
		products which can be purchased using the PayPal.


		</p>

	</div>


	<div class="box">
		<p>
		<h3>PRODUCTS</h3>
		<br>
		<iframe src="/shopping-cart/index.jsp"
			style="width: 90%; height: 70%;"></iframe>

	</div></div>




	<div class="container">

	
		<img src="./img/banana.jpg" alt="banana" width="100%" height="100%">

	</div>

</body>
</html>