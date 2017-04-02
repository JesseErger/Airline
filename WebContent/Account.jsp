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
	<h2><%	try{
			if(session.getValue("Account_Type").equals("admin")){
			out.println("<a href=\"NewUserPage.jsp\"title=\"Create Manager\">Create Manager</a>");
			}
			}
			catch(Exception e){
				String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
		        response.sendRedirect(site);
			}
	
	
		%></h2>
	<hr />
	<h2>Thank you for choosing Iowa airline, we will provide you with
		best service for your trip</h2>	
	<table>
		<tr>
			<td>Hello <%out.println(first_name); %>! 
			<button type="button" onclick="location = 'LogOut.jsp'">Log Out</button>
			</form>
			</td>
		</tr>
		<tr>
			<td>Email: <% out.println(email); %>
			</td>
		</tr>
	</table>

</body>
</html>