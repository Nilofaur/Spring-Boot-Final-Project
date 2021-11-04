<%@page import="beauty.*"%>
<% 
  if(session.getAttribute("username")==null)
  {
	  response.sendRedirect("login.jsp");
  }
  %>
  
 <%

 String shape_jsp= beautyServlet.shape1;
 String image1=beautyServlet.image1;
 
 %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Table</title>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
		    <link href='http://fonts.googleapis.com/css?family=Crete+Round' rel='stylesheet' type='text/css'>
</head>
<style>
body {
    background-color: #fff;
    color: #777;
    font: normal 15px "Helvetica Neue", Arial, Helvetica, Geneva, sans-serif;
}
p {
       line-height: 20px;
    margin-bottom: 20px;
  color: #444;
    text-align: center;
    font-size: 25px;
      font-weight: bold;
}
h1 {
    font-family: 'Crete Round', serif;
    font-weight: bold;
    color: #444;
    font-size: 45px;
    margin-bottom: 20px;
}
h2 {
    font-weight: 300;
    color: #444;
    font-size: 55px;
    text-transform: uppercase;
    text-align: center;
    margin-bottom: 20px;
}
h3 {
    font-size: 30px;
    color: #444;
    font-weight: bold;
    text-transform: uppercase;
    text-align: center;
    margin-bottom: 20px;
}
h4 {
    font-size: 24px;
    color: red;
    font-weight: bold;
    text-transform: uppercase;
    margin-bottom: 20px;
}
h5 {
    font-size: 15px;
    color: #444;
    font-weight: bold;
    text-transform: uppercase;
}
a {
    text-decoration: none;
    color: #444;
}
a:hover {
    color: #02b8dd;
}
strong {
    font-weight: bold;
}
small {
    font-size: 13px;
    color: #777;
    font-style: italic;
}
.clear {
    clear: both;
}
.wrapper {
    margin: 0 auto;
    padding: 0 10px;
    width: 940px;
}
header {
    height: 120px;
}
header h1 {
    float: left;
    margin-top: 32px;
}
header h1 .color {
    color: #02b8dd;
}
header nav {
    float: right;
}
header nav ul li {
    float: left;
    display: inline-block;
    margin-top: 50px;
}
header nav ul li a {
    color: #444;
    text-transform: uppercase;
    font-weight: bold;
    display: block;
    margin-right: 20px;
}
#hero-image {
    height: 580px;
    padding-top: 1px;
    background: #e8eced url('./img/<%=shape_jsp%>1.PNG') no-repeat center;
}

#hero-image h2 {
    margin: 180px 0 40px 0;
}
.button-1 {
    display: block;
    text-align: center;
    background: #444;
    border-radius: 3px;
    color: #fff;
    width: 180px;
    height: 50px;
    font-size: 20px;
    line-height: 50px;
    margin: 0 auto;
}
.button-1:hover {
    background-color: #02b8dd;
    color: #fff;
}

#features ul {
    margin: 80px 0;
}
#features ul li {
    width: 300px;
    padding-top: 300px;
    float: left;
    margin-right: 10px;
    text-align: center;
}

#primary-content {
    background-color: #f8fafa;
    padding: 60px 0;
    text-align: center;
}
#primary-content h3 {
    display: block;
    margin: 0 auto 20px auto;
    width: 400px;
    border-bottom: 1px solid #02b8dd;
    padding: 0 0 20px 0;
}
#primary-content a img {
    margin: 20px 0;
}

#secondary-content {
    padding: 60px 0;
    text-align: center;
}
#secondary-content article {
    width: 460px;
    height: 270px;
    float: left;
    background-color: #f5f5f5;
}
#secondary-content article:first-child {
    margin-right: 20px;
}
#secondary-content article .overlay {
    background: rgba(255, 255, 255, .95);
    height: 230px;
    width: 190px;
    padding: 20px;
}
article h4 {
    border-bottom: 1px solid #02b8dd;
    padding-bottom: 20px;
}
.more-link {
    border: 1px solid #02b8dd;
    color: #02b8dd;
    padding: 6px 20px;
    border-radius: 3px;
}
.more-link:hover {
    background-color: #02b8dd;
    color: #fff;
}

#cta {
    padding: 60px 0;
    text-align: center;
}
#cta h3 {
    display: block;
    margin: 0 auto 20px auto;
    width: 400px;
    border-bottom: 1px solid #02b8dd;
    padding: 0 0 20px 0;
}
.button-2 {
    display: block;
    margin: 0 auto;
    border: 2px solid #02b8dd;
    color: #02b8dd;
    border-radius: 3px;
    width: 180px;
    height: 50px;
    font-size: 20px;
    line-height: 50px;
}
.button-2:hover {
    background-color: #02b8dd;
    color: #fff;
}
footer {
    padding: 60px 0;
    background-color: #f8fafa;
}
#footer-info {
    width: 380px;
    float: left;
    margin-top: 10px;
}
#footer-links {
    width: 520px;
    float: right;
}
#footer-links ul {
    width: 150px;
    float: left;
    margin-left: 20px;
}
#footer-links ul li {
    margin: 10px 0;
}

</style>
<style>
html {
  scroll-behavior: smooth;
}

#section1 {
  height: 100px;
  background-color: pink;
}

#section2 {
  height: 100px;
  background-color: yellow;
}
</style>
   

 
<body> 
<header>
     <div class="wrapper">
        <h1>BEAUTY<span class="color">.</span></h1>
        <nav>
            <ul>
                
                <li><a href="home.jsp">Home</a></li>
                <li><a href="http://localhost:9778/shopping-cart/index.jsp">Products</li>
                <li><a href="register.jsp">Have you Registered?</a></li>
            </ul>
        </nav>
    </div>
    </header>
    
    <%System.out.println("shape_jsp"+shape_jsp); %>
    
    <div  id="hero-image">
  
    <div class="wrapper">
        <h2><strong>BEAUTY</strong><br/>
        <br>
      ${dress } </h2>
       
    </div>
</div>

    
    <div id="primary-content">
    <div class="wrapper">
        <article>
            <h5> Here you go ..</h5>


<p>${shape_tab}1.PNG</p>
<p> For ${shape_tab}, ${look_for } </p> <br>
<p> and avoid ${avoid } <p> <br>
<p> The best choice of dress to wear is ${dress } </p> <br>
<p> Mainly focus on ${hint} </p>




    
</body>
</html>