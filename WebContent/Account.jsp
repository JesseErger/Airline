<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>
<%
	String username = "";
	String first_name = "";
	String last_name = "";
	String email = "";
	String acc_type = "";
	String loged_out = "";
	try {
		username = session.getAttribute("Username").toString();
		first_name = session.getAttribute("First_Name").toString();
		last_name = session.getAttribute("Last_Name").toString();
		email = session.getAttribute("Email").toString();
		acc_type = session.getAttribute("Account_Type").toString();
		loged_out = session.getAttribute("loged_out").toString();
	} catch (Exception e) {
		// Are not logged in/ invalid session
		String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
		response.sendRedirect(site);
		return;
	}
	if (loged_out.equals("")) {
		String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
		response.sendRedirect(site);
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#myImg {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
    position:relative;
   
    
}

#myImg:hover {opacity: 0.5;}

#myImg2 {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
    position:relative;
   
}

#myImg2:hover {opacity: 0.5;}

#myImg3 {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
    position:relative;
    
}

#myImg3:hover {opacity: 0.5;}

#myImg4 {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
    position:relative;
   
    
}

#myImg4:hover {opacity: 0.5;}

#myImg5 {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
    position:relative;
    
}

#myImg5:hover {opacity: 0.5;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
}

/* Caption of Modal Image */
#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}

/* Add Animation */
.modal-content, #caption {    
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)} 
    to {-webkit-transform:scale(1)}
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
}

/* The Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
    .modal-content {
        width: 100%;
    }
}
h1 {
	text-align: center;
	color: orange;
}

body {
	background-image: url(plane2.PNG);
}

h2 {
	color: #123450;
	font-weight: bold;
	font-style: italian;
}

.up {
	top: 10px;
	right: 10px;
	position: absolute;
	background-color: none;
	text-transform: capitalize;
}

.container {
	overflow: hidden;
	background-color: blue;
	font-family: Arial;
}

.container a {
	float: left;
	font-size: 16px;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	cursor: pointer;
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: blue;
}

.container a:hover, .dropdown:hover .dropbtn {
	background-color: red;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	float: none;
	color: black;
	padding: 12px, 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.show {
	display: block
}
</style>
<title>Account</title>
</head>
<body>
	<h1>Welcome to Iowa Airline!!</h1>

	<hr />
	<div class="up">
		<table>
			<tr>
				<td><font color="orange">Hello <%
					out.println(first_name);
				%>!
				</font>
					<button type="button" onclick="location = 'LogOut.jsp'">Log
						Out</button></td>
			</tr>
			<tr>
				<td><font color="orange">Email: <%
					out.println(email);
				%></font></td>
			</tr>
		</table>
	</div>
	<div class="container">
		<a href="SearchPage.jsp">Search Flights</a>
		<div class="dropdown">
			<button class="dropbtn" onclick="myfunction()">User
				information</button>
			<div class="dropdown-content" id="myDropdown">
					<a href="ChangePasswordPage.jsp">Change
					Password</a> <a href="#">Edit Payment Information</a> <a
					href="UserReservations.jsp">Order History</a>  <a href="LogOut.jsp">Log out</a>
			</div>
		</div>
		<%
		try {
			if (session.getValue("Account_Type").equals("manager")) {
				String site = new String("http://localhost:8080/com.airline.web.index/ManagerAccount.jsp");
				response.sendRedirect(site);
			}
		} catch (Exception e) {
			String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
			response.sendRedirect(site);
		}
			try {
				if (session.getValue("Account_Type").equals("admin")) {
					out.println("<a href=\"NewUserPage.jsp\"title=\"Create Manager\">Create Manager</a>");
				}
			} catch (Exception e) {
				String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
				response.sendRedirect(site);
			}
		%>
		<%
			try {
				if (session.getValue("Account_Type").equals("admin")) {
					out.println("<a href=\"NewPlane.jsp\"title=\"add plane\">Add Plane</a>");
				}
			} catch (Exception e) {
				String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
				response.sendRedirect(site);
			}
		%>
		<%
			try {
				if (session.getValue("Account_Type").equals("admin")) {
					out.println("<a href=\"FlightInfo.jsp\"title=\"add flight\">Add Flight</a>");
				}
			} catch (Exception e) {
				String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
				response.sendRedirect(site);
			}
		%>
	</div>
	
	
	
	<script>
		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}
		window.onclick = function(e) {
			if (!e.target.matches('.dropbtn')) {
				var myDropdown = document.getElementById("myDropdown");
				if (myDropdown.classList.contains('show')) {
					myDropdown.classList.remove('show');
				}
			}
		}
	</script>
	
	<div>
	<p><img id="myImg" src="Iowa City.PNG" alt="Iowa City was the second capital of the Iowa Territory and the first
	 capital city of the State of Iowa. The Old Capitol building is a National Historic Landmark in the center of the
	  University of Iowa campus." width="300" height="200" > 	
	<img id="myImg2" src="newYork.PNG" alt="New York is a state in the northeastern United States, and is the 27th-most extensive,
	 fourth-most populous, and seventh-most densely populated U.S. state" width="300" height="200" >
	<img id="myImg3" src="Des Moines.PNG" alt="Des Moines is the capital and the most populous city in the U.S. state of Iowa. 
	It is also the county seat of Polk County. A small part of the city extends into Warren County.[" width="300" height="200" ></p>
	<p><img id="myImg4" src="Chicago.PNG" alt="Chicago, officially the City of Chicago, is the third-most populous city 
	    in the United States. With over 2.7 million residents, it is also th
	    e most populous city in both the state of Illinois and the Midwestern United States." width="300" height="200" >
	   <img id="myImg5" src="SanF.PNG" alt="San Francisco officially the City and County of San Francisco, is the cultural, commercial, 
	   and financial center of Northern California. It is the birthplace of the United Nations.[24][25][26] Located at the north 
	    end of the San  Francisco Peninsula" width="300" height="200" > </p>
	
	<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>
</div>


<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg');
var modalImg = document.getElementById("img01");

var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}
</script>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg2');
var modalImg = document.getElementById("img01");

var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}
</script>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg3');
var modalImg = document.getElementById("img01");

var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}
</script>


<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg4');
var modalImg = document.getElementById("img01");

var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}
</script>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg5');
var modalImg = document.getElementById("img01");

var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}
</script>




</body>
</html>