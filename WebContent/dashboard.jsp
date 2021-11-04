<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	if (session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dashboard</title>
</head>
<body>

	<div class="test">
		<h2>Dashboard</h2>
		<p>
	</div>

	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>


	<!-- Background image -->
	<div class="bg-image d-flex justify-content-center align-items-center"
		style="background-image: url('https://mdbootstrap.com/img/new/slides/007.jpg'); height: 100vh;">
		<!-- Background image -->

		<div class="container px-4">
			<div class="row gx-5">
				<div class="col">

					<div class="test1"></div>

					<div class="text-white p-3">
						<p>
							<br> Today with the activity you did, your total calorie for
							the day should not exceed ${everyday_maxcalorie1}
						<h4></h4>
						<br> Consumed calorie for today :
						<h4>${consumed_calories}</h4>
						<br> Your burnt calories by physical activity :
						<h4>${burnt_byworkout}</h4>
						<br> So End of the day, you spent
						<h4>${eod_spent}</h4>
						<br> Total balance remaining:
						<h4>${totalbalanceleft}</h4>
						<br>

					</div>
					</p>
					<a class="btn btn-light" href="home.jsp">Go back to Home</a> <a
						class="btn btn-light" href="login.jsp">Logout</a>
				</div>

			</div>
		</div>

	</div>

	<br>

	<br>

</body>
</html>