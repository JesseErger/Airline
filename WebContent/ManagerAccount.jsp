<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*,org.joda.time.*" %>
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
h1 {
	text-align: center;
	color: orange;
}

body {
background-image: url(plane5.PNG);
font-family: Verdana,sans-serif;

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
	background-color: grey;
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
	background-color: #9E9C86;
}

.container a:hover, .dropdown:hover .dropbtn {
	background-color: red;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
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
	display: block;
	

}


body, html {
    height: 100%;
    margin: 0;
}

.hero-image {
  background-image: url("manager.PNG");
  height: 65%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}

</style>

<title>M Account</title>
</head>
<body>

		
<div class="hero-image">
  <div class="hero-text">
    <h2 style="font-size:50px" >Manage our flight</h2>
  </div>
</div>	

	
<div class="container">
		<a href="LogOut.jsp">Log out</a>
		<a href="SearchPage.jsp">Search Flights</a>
		<div class="dropdown">
			<button class="dropbtn" onclick="myfunction()">Manage Reservations</button>
			<div class="dropdown-content" id="myDropdown">
					<a href="SearchReservationPage.jsp">Check In Reservation</a>
					<a href="SearchRefundReservation.jsp">Refund Reservation</a>
				
			</div>
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




</body>
</html>