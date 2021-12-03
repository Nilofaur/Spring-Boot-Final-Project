<%@page import="com.tryme.DaoClass"%>
<%@page import="com.tryme.LoginDao"%>
<%@page import="com.tryme.*"%>
<%@page import="com.tryme.GetLoginId"%>
<%@page import="java.util.*"%>
<%@page import= "java.util.Date"%>

<%@ include file="links.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<% 
  if(session.getAttribute("username")==null)
  {
	  response.sendRedirect("login.jsp");
  }
  %>

<%
String tod="";
//Instantiate a Date object
Date date = new Date();
tod=date.toString();
%>

<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
.box {
	background-color: white;
	width: 40%;
	height: 40%;
	border: 5px  #FFFFCC;
	padding: 50px;
	margin: 50px;
	
}
.box1 {
	background-color: white;
	width: 40%;
	height: 40%;
	border: 5px  #FFFFCC;
	padding: 50px;
	margin: 300px;
	
}
.top-left {
  position: absolute;
  top: 350px;
  left: 250px;
}

.top-right {
  position: absolute;
  top: 350px;
  right: 250px;
}
.container {
	position: relative;
	text-align: center;
	color: black;
}

.fold {
    margin: 0 auto;
    padding: 0 10px;
    width: 940px;
}

#pictures ul {
    margin: 80px 0;
}
#pictures ul li {
    width: 300px;
    padding-top: 300px;
    float: left;
    margin-right: 10px;
    text-align: center;
}
#pictures ul li.picture-1 {
    background: url('./img/s.PNG') no-repeat top center ;
   
}
#pictures ul li.picture-2 {
    background: url('./img/upz.PNG') no-repeat top center;
}

</style>


<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Login success</title>
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
<meta charset="ISO-8859-1">
<style>
body {
	background-image: url('./img/orange.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>login success</title>

<script>
function hideButton(x)
 {
  x.style.display = 'none';
 }
</script>
</head>
<body>
	<div align="center">

		<h3>You have logged in successfully</h3>

	<!-- 	<a href="plan.jsp?name=${username}"><button>Please click
					here to go to your Plan</button> 
			<br></a> -->
			
			<p> <%=tod%> </p>
			
		
	<form action="plan.jsp?name${username}&days=">
		<label for="days"></label> 
		 <select name="days" class="btn btn-light" id="days">
			<option value="mon" >Mon</option>
			<option value="tue">tue</option>
			<option value="wed">Wed</option>
			<option value="thu">Thu</option>
			<option value="fri">Fri</option>
			<option value="sat">Sat</option>
			<option value="sun">Sun</option>
			
			
		</select> <input type="submit" class="btn btn-light" value="View the plan">
		
	</form>


<br><br>
<div class = text-center>

<form action="LoginSuccessServlet" method="post">



<input type="submit" onclick="hideButton(this)" role="button" value="Is this your First Time ?" name="firsttime" class="btn btn-info btn-lg btn-rounded px-5">
<br><br>
<input type="submit" onclick="hideButton(this)" role="button" value="No " name="no" class="btn btn-light btn-lg btn-rounded px-5">
</form>


<%

String first = request.getParameter("firsttime");
String no = request.getParameter("no");
if(first!=null)
{

	%>

<div class="top-left">



<a href="aboutme.jsp?name=${username}"  class="btn btn-danger btn-rounded" data-mdb-ripple-color="dark" >
'About Me' Form </a> </div></div>

	<br>
	<%}	%>


	<%   if(no!=null){

%>
<div class="top-right">

<a href="manualupdate.jsp?name=${username}"  class="btn btn-danger btn-rounded" data-mdb-ripple-color="dark" >
'Update' Form </a> </div></div>
	

	<%}	%>

  <form action="logout">
			<br> <input type="submit" class="btn btn-light" value="Logout">
		</form>
</div>
</body>
</html>