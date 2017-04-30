
<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

* {box-sizing:border-box}

.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: white;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: 25%;
}

/* Number text (1/3 etc) */
.numbertext {
  color: black;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 13px;
  width: 13px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 25%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

button {
    background-color: grey;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

.picture{
   left:20px;
}
img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}
body {
	background-image: url(plane2.PNG);
	font-family: Verdana,sans-serif;
}

h1 {
	text-align: center;
	color: white;
}

td {
	font-weight: bold;
	font-style: center
}

a:hover {
	background-color: blue;
	color: white;
	text_decoration: underline;
	font-weight: bold;
}

a:active {
	background-color: red;
}

.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.85); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: ;
    margin: 5% auto 5% auto; /* 5% from the top, 15% from the bottom and centered */
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: pink;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

.imgcontainer {
    text-align: right;
    margin: 12px 0 12px 0;
    position: relative;
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}

.createAccount{
   position: absolute;
   top: 30px;
   right: 30px
}

.login{
position: absolute;
top :20px;
left: 20px;
}
.logintable{
   color:#DEDFD7;
}

#flight{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 60%
}

#flight td, #flight th {
    border: 1px solid #ddd;
    padding: 10px;
    border: 5px;
    text-align:center;
}



#flight th {
    padding-top: 30px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #69C830;
    color: white;
}

input[type=text], input[type=password] {
    width: 80%;
    padding: 10px 15px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

#pt{
 text-align:center;
}

#sub{
  background-color: green;
    color: white;
    padding: 10px 15px;
    margin: 8px 0;
    border: none;
    width: 25%;
}

#res{
background-color: red;
    color: white;
    padding: 10px 15px;
    margin: 8px 0;
    border: none;
    width: 25%;

}

</style>
<title>Login</title>

</head>
<body>
	<form method="post" action="validate.jsp">
	
		<h1>Welcome to Iowa Airline</h1>
		<div class="login"><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button></div>
		<hr />
		   <%
				try {
					if ("True".equals(session.getAttribute("Invalid_Login").toString()))
						out.println("<center>Invalid Login, please try again!</center>");
				} catch (Exception e) {
				}
			%>
		<div id="id01" class = "modal">
		<center>
		 <div class="modal-content animate" >
			
			<p><center><img id="myImg" src="plane.PNG" width="300" height="200" ></center></p>
			<div class="logintable"><table border="1" cellspacing="2" id="flight">
				<thead>
					<tr>
						<th colspan="2">Login Here</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>Username</td>
						<td><input type="text" name="username" required /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" required /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input id = "sub" type="submit"
							value="Login" /> &nbsp;&nbsp; <input id = "res" type="reset" value="Reset" />
						</td>
					</tr>


					<tr>
						<td id="pt"><a href="ResetPasswordPage.jsp" title="reset password">Forgot
								Password?</a></td>
						<td id="pt"><a href="CreateUserPage.jsp" title="create account">Create an Account</a></td>
					</tr>
					
				</tbody>
			</table></div>
			</div>
		</center>
		</div>
	</form>
	
	<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 7</div>
 <div class="picture"> <img src="plane3.PNG" width = "600", height = "400"></div>
  <div class="text">Welcome to Iowa Airline</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 7</div>
  <div class="picture"><img src="service.PNG" width = "600", height = "400"></div>
  <div class="text">We provides best service</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 7</div>
 <div class="picture"> <img src="on time.PNG" width = "600", height = "400"></div>
  <div class="text">Our plane took off on time</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 7</div>
 <div class="picture"> <img src="first class.PNG" width = "600", height = "400"></div>
  <div class="text">we provide different classes</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">5 / 7</div>
 <div class="picture"> <img src="business class.PNG" width = "600", height = "400"></div>
  <div class="text">we provide different classes</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">6 / 7</div>
 <div class="picture"> <img src="economy.PNG" width = "600", height = "400"></div>
  <div class="text">we provide different classes</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">7 / 7</div>
 <div class="picture"> <img src="happy journey.PNG" width = "600", height = "400"></div>
  <div class="text">you will have a wonderful journey if you choose us</div>
</div>
</div>

<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 4000); // Change image every 4 seconds
}
</script>
</body>
</html>

