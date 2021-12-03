<%@page import="beauty.*"%>

  
 <%

 String shape_jsp= beautyServlet.shape1;
 %>
<!DOCTYPE HTML>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
	
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>beauty</title>
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
    color: black;
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
.fold {
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
    background: #e8eced url('./img/weight loss.jpg') no-repeat center;
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
    background: url('./img/apple.PNG') no-repeat top center ;
   
}
#pictures ul li.picture-2 {
    background: url('./img/pear.PNG') no-repeat top center;
}
#pictures ul li.picture-3 {
    background: url('./img/tri.PNG') no-repeat top center;
}

#pictures ul li.picture-4 {
    background: url('./img/rectangular.PNG') no-repeat top center;
       
}
#pictures ul li.picture-5 {
    background: url('./img/hourglass.PNG') no-repeat top center;
}
#pictures ul li.picture-6 {
    background: url('./img/oval.PNG') no-repeat top center;
}


#first-stuff {
    background-color: #f8fafa;
    padding: 60px 0;
    text-align: center;
}
#first-stuff h3 {
    display: block;
    margin: 0 auto 20px auto;
    width: 400px;
    border-bottom: 1px solid #02b8dd;
    padding: 0 0 20px 0;
}
#first-stuff a img {
    margin: 20px 0;
}

#two-stuff {
    padding: 60px 0;
    text-align: center;
}
#two-stuff article {
    width: 460px;
    height: 270px;
    float: left;
    background-color: #f5f5f5;
}
#two-stuff article:first-child {
    margin-right: 20px;
}
#two-stuff article .overlay {
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

#part1 {
  height: 100px;
  background-color: pink;
}

#part2 {
  height: 100px;
  background-color: yellow;
}
</style>
   

 
<body> 
<header>
     <div class="fold">
        <h1>Lifestyle<span class="color">.</span></h1>
        <nav>
            <ul>
                
                <li><a href="home.jsp">Home</a></li>
                <li><a href="http://localhost:9778/shopping-cart/index.jsp">Products</li>
                <li><a href="register.jsp">Have you Registered?</a></li>
            </ul>
        </nav>
    </div>
    </header>
    
    
    
    <div  id="hero-image">
  
    <div class="fold">
        <h2><strong>Lifestyle App</strong><br/>
        <br>
       Beauty Page </h2>
        <a href="#pictures" class="button-1">Get Started</a>
    </div>
</div>
<center><h5>Which Body shape do you belong to ? Please see the below part: </h5></center>
  <div id="pictures">
    <div class="fold">
        <ul>
            <li class="picture-1">
                <h4>Apple</h4>
                <p>Bust is larger than the hips and the waist is well defined.</p>
            </li>
            <li class="picture-2">
                <h4>Pear</h4>
                <p>Hips are larger than your bust and you have a defined waist</p>
            </li>
            <li class="picture-3">
                <h4>Inverted Triangle </h4>
                <p>Waist larger than the bust and hips.</p>
            </li>
             <li class="picture-4">
                <h4>Rectangular</h4>
                <p>Bust and hips are basically the same measurement. Waist is slightly smaller than the bust and hips.</p>
            </li>
            <li class="picture-5">
                <h4>Hour Glass</h4>
                <p>Bust and hips are basically the same measurement and you have a defined waist.</p>
            </li>
            <li class="picture-6">
                <h4>Oval</h4>
                <p>Large bust, narrow hips, and a full mid part.</p>
            </li>
            
            <div class="clear"></div>
        </ul>
    </div>
</div>
    
    <div id="first-stuff">
    <div class="fold">
        <article>
            <h5>Please select your shape to know more:</h5>
  <div class = container>

<form action="beauty" method="post">
<div class="form-check form-check-inline">
<input class="form-check-input" type="radio" id="shape" name="shape" value="apple" >
  <label class="form-check-label" for="apple">Apple</label><br>
</div>

<div class="form-check form-check-inline">
  <input type="radio" id="shape" name="shape" value="pear">
  <label class="form-check-label" for="pear">Pear</label><br>
</div>

<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" id="shape" name="shape" value="inverted_triangle">
  <label class="form-check-label" for="inverted_triangle">Inverted Triangle</label>
</div>

<div class="form-check form-check-inline">
 <input class="form-check-input"  type="radio" id="shape" name="shape" value="rectangular">
  <label class="form-check-label" for="rectangular">Rectangular</label>
</div>

<div class="form-check form-check-inline">
 <input class="form-check-input" type="radio" id="shape" name="shape" value="hour_glass">
  <label class="form-check-label" for="hour_glass">Hour glass</label>
</div>

<div class="form-check form-check-inline">
 <input class="form-check-input"  type="radio" id="shape" name="shape" value="oval">
  <label class="form-check-label" for="oval">Oval</label>
</div>
<br> <br>



 <input type="submit">
</form>

</div>

            <a href="#"><img src="./img/shape.jpeg" alt="image" /></a>
        </article>
    </div>
</div>
    

    
</body>
</html>