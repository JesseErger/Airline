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
h1 {
	text-align: center;
	color: red;
}

body {
	background-image: url(plane2.PNG);
	font-family: Verdana;
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
	background-color: grey;
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

*{box-sizing:border-box;
}

ul{
 list-style-type:none;
}

.month ul{
margin:0;
padding:0;
}

.month ul li{
  color:red;
  font-size: 20px;
  text-transform: uppercase;
  letter-spacing:3px;
}

.month .prev{
   float: left;
   padding-top:10px;
}

.month .next {
    float: right;
    padding-top: 10px;
}

.weeks {
    margin: 0;
    padding: 10px 0;
    background-color: #ddd;
}

.weeks li {
    display: inline-block;
    width: 13.6%;
    color: #666;
    text-align: center;
}

.days {
    padding: 10px 0;
    background: #eee;
    margin: 0;
}

.days li {
    list-style-type: none;
    display: inline-block;
    width: 13.6%;
    text-align: center;
    margin-bottom: 5px;
    font-size:12px;
    color: #777;
}

.days li .active {
    padding: 5px;
    background: #1abc9c;
    color: white !important
}

@media screen and (max-width:720px) {
    .weekdays li, .days li {width: 13.1%;}
}

@media screen and (max-width: 420px) {
    .weekdays li, .days li {width: 12.5%;}
    .days li .active {padding: 2px;}
}

@media screen and (max-width: 290px) {
    .weekdays li, .days li {width: 12.2%;}
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
				<td><font color="red">Hello <%
					out.println(first_name);
				%>!
				</font>
					<button type="button" onclick="location = 'LogOut.jsp'">Log
						Out</button></td>
			</tr>
			<tr>
				<td><font color="red">Email: <%
					out.println(email);
				%></font></td>
			</tr>
		</table>
	</div>
	<div class="container">
		<a href="#home">Home</a>
		<div class="dropdown">
			<button class="dropbtn" onclick="myfunction()">find your
				destination</button>
			<div class="dropdown-content" id=myDropdown>
				<a href="#">Los Angles</a> <a href="#">Seattle</a> <a href="#">New
					York</a> <a href="#">Miami</a> <a href="#">Chicago</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn" onclick="myfunction()">User
				information</button>
			<div class="dropdown-content" id="myDropdown">
				<a href="#">change Username</a> <a href="ChangePasswordPage.jsp">change
					password</a> <a href="#">add card</a> <a href="#">delete card</a> <a
					href="#">order history</a> <a href="#">your next trip</a> <a
					href="LogOut.jsp">Log out</a>
			</div>
		</div>
		
	</div>
	<h2>Thank you for choosing Iowa airline, we will provide you with
		best service for your trip</h2>
		
	<h4>enter your depature date</h4>	
	<table>
	<div class="month">
	  <ul>
	   <li class="prev">&#10094;</li>
       <li class="next">&#10095;</li>
       <li style="text-align:center">April<br><span style="font-size:18px">2017</span>
    </li>
    </ul>
	</div>
	
	<ul class="weeks">
	<li>Mo</li>
  <li>Tu</li>
  <li>We</li>
  <li>Th</li>
  <li>Fr</li>
  <li>Sa</li>
  <li>Su</li>
	</ul>
	
	<ul class="days">  
  <li>1</li>
  <li>2</li>
  <li>3</li>
  <li>4</li>
  <li>5</li>
  <li>6</li>
  <li>7</li>
  <li>8</li>
  <li>9</li>
  <li><span class="active">10</span></li>
  <li>11</li>
  <li>12</li>
  <li>13</li>
  <li>14</li>
  <li>15</li>
  <li>16</li>
  <li>17</li>
  <li>18</li>
  <li>19</li>
  <li>20</li>
  <li>21</li>
  <li>22</li>
  <li>23</li>
  <li>24</li>
  <li>25</li>
  <li>26</li>
  <li>27</li>
  <li>28</li>
  <li>29</li>
  <li>30</li>
  <li>31</li>
</ul>
</table>
	
	
	
	
	





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