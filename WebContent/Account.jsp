<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>
<%
String username = session.getAttribute("Username").toString();
String first_name = session.getAttribute("First_Name").toString();
String last_name = session.getAttribute("Last_Name").toString();
String email = session.getAttribute("Email").toString();
String acc_type = session.getAttribute("Account_Type").toString();
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

table {
	top: 20px;
	left: 700px;
	border: 2px dashed black;
	position: absolute;
	background-color: white;
}
</style>
<title>Account</title>
</head>
<body>
	<h1>Welcome to Iowa Airline!!</h1>
	<h2><%if(session.getValue("Account_Type").equals("admin")){
			out.println("<a href=\"NewUserPage.jsp\"title=\"Create Manager\">Create Manager</a>");
	}
		%></h2>
	<hr />
	<h2>Thank you for choosing Iowa airline, we will providing you
		best service for your trip</h2>
	<table>
		<tr>
			<td>Hello <%out.println(first_name); %>! <a href="Login.jsp"
				title="Log Out">Log out</a>
			</td>
		</tr>
		<tr>
			<td>Email: <%out.println(email); %>
			</td>
		</tr>
	</table>

</body>
</html>