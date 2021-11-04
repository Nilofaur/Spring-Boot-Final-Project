<%@page import="SQL.*"%>
<%@page import="pdf.*"%>
<%@page import="java.sql.SQLException"%>
   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% 
  if(session.getAttribute("username")==null)
  {
	  response.sendRedirect("login.jsp");
  }
  %>
 
  
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<h1>Report</h1>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<style>
body {
background-image: url('./img/winter.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
  
}
</style>
<meta charset="UTF-8">

<title>Report</title>
</head>
<body>

<%
SQL.get_all();
%>

<form action="pdfServlet" method="post">
<h1>Name <input type="text" name="weight" value="<%=SQL.name1 %>" readonly >  </h1>
<h1>id <input type="text" name="weight" value="<%=SQL.user_id %>" readonly >  </h1>
<h1>Plan <input type="text" name="age" value="<%=SQL.plan%>" readonly >  <br> </h1>



<input type="submit" value="Generate Report">
   

</form>


</body>
</html>