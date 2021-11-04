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
	background-image: url('./img/cat.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>login success</title>
</head>
<body>
	<div align="center">

		<h3>You have Logged in Successfully</h3>

	<!-- 	<a href="plan.jsp?name=${username}"><button>Please click
					here to go to your Plan</button> 
			<br></a> -->
			
			<h4>todays date : <%=tod%> </h4>
			
			
			<br> <br> <a href="aboutme.jsp?name=${username}">If
			you have not filled the about me form please click me </a> 
		
		<br> <br> <a href="manualupdate.jsp?name=${username}"> Update your meal and physical activity here 
			 </a>

	<form action="plan.jsp?name${username}&days=">
		<label for="days"> Today:</label> <select name="days" id="days">
			<option value="mon">Mon</option>
			<option value="tue">tue</option>
			<option value="wed">Wed</option>
			<option value="thu">Thu</option>
			<option value="fri">Fri</option>
			<option value="sat">Sat</option>
			<option value="sun">Sun</option>
		</select> <input type="submit" value="View your plan for today :)">
	</form>
 <form action="logout">
			<br> <input type="submit" value="logout">
		</form>
</div>
</body>
</html>