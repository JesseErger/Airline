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
try{
username = session.getAttribute("Username").toString();
first_name = session.getAttribute("First_Name").toString();
last_name = session.getAttribute("Last_Name").toString();
email = session.getAttribute("Email").toString();
acc_type = session.getAttribute("Account_Type").toString();
loged_out = session.getAttribute("loged_out").toString();
}
catch(Exception e){
    // Are not logged in/ invalid session
	String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
    response.sendRedirect(site);
    return;
}
if(loged_out.equals("")){
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
}

h2 {
	color: #123450;
	font-weight: bold;
	font-style: italian;
}

   .up {
	top: 20px;
	left: 700px;
	position: absolute;
	background-color: none;
	text-transform:capitalize;
	
}
 .container{
   overflow: hidden;
   background-color:grey;
   font-family:Arial;
 }
 
 .container a{
   float: left;
   font-size: 16px;
   color:white;
   text-align:center;
   padding:14px 16px;
   text-decoration:none;
 }
 
 .dropdown{
    float:left;
    overflow:hidden;
 }
 
 .dropdown .dropbtn{
     cursor: pointer;
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: grey;
 }
 
 .container a:hover,
 .dropdown:hover .dropbtn{
 background-color: red;
 }
 
 .dropdown-content{
    display:none;
    position:absolute;
    background-color:#f9f9f9;
    min-width:160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index:1;
 }
 
 .dropdown-content a{
    float: none;
    color:black;
    padding: 12px,16px;
    text-decoration:none;
    display:block;
    text-align:left;
 }
 
 .dropdown-content a:hover{
   background-color:#ddd;
 }
 .dropdown:hover .dropdown-content{
   display: block;
 }
 .show{
 display:block
 }
</style>
<title>Account</title>
</head>
<body>
	<h1>Welcome to Iowa Airline!!</h1>

	<hr />
	<div class="up"	>
	<table>
		<tr>
			<td ><font color="red">Hello <%out.println(first_name); %>! </font>
			<button type="button" onclick="location = 'LogOut.jsp'">Log Out</button>
			</td>
		</tr>
		<tr>
			<td><font color="red">Email: <% out.println(email); %></font>
			</td>
		</tr>
	</table>
	</div>
	<div class="container">
	<a href = "#home">Home</a>
	<div class="dropdown"><button class="dropbtn" onclick="myfunction()">find your destination</button>
	<div class="dropdown-content" id=myDropdown>
	<a href="#">Los Angles</a>
	<a href="#">Seattle</a>
	<a href="#">New York</a>
	<a href="#">Miami</a>
	<a href="#">Chicago</a>
	</div>
	</div>
	<div class="dropdown"><button class="dropbtn" onclick="myfunction()">User information</button>
	<div class="dropdown-content" id="myDropdown">
	    <a href="#">change Username</a>
	    <a href="ResetPasswordPage.jsp">change password</a>
	    <a href="#">add card</a>
	    <a href="#">delete card</a>
	    <a href="#">order history</a>
	    <a href="#">your next trip</a>
	    <a href = "Login.jsp">Log out</a>
	    </div>
	 </div>
	 <% try{
		 if(session.getValue("Account_Type").equals("admin")){
		 out.println("<a href=\"NewUserPage.jsp\"title=\"Create Manager\">Create Manager</a>");
		 }
	 }
	 catch(Exception e){
			String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
	        response.sendRedirect(site);
		}
		 %>
	<%try{
		 if(session.getValue("Account_Type").equals("admin")){
		 out.println("<a href=\"#\"title=\"add plane\">add plane</a>");
		 }
	 }
	 catch(Exception e){
			String site = new String("#");
	        response.sendRedirect(site);
		}
	
	%>	 
    </div>
    <h2>Thank you for choosing Iowa airline, we will provide you with
		best service for your trip</h2>	
    
	
	
	
	
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