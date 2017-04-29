<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,org.joda.time.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {
}

h1 {
	text-align: center;
	color: red;
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
</style>
<title>Add Flight</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
String flight_id = request.getParameter("flight_id").toString().split("_")[1];
session.setAttribute("flight_update_id", flight_id);
%>
<form method="post" action="UpdatePricing.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Update Flight <%out.println(flight_id+"'s");%> Pricing</th>
					</tr>
				</thead>
<tbody>					
					<tr>
						<td>New First Class Pricing</td>
						<td><input type="text" name="first_cost" required /></td>
					</tr>
					<tr>
						<td>New Business Class Pricing</td>
						<td><input type="text" name="business_cost" required /></td>
					</tr>
					<tr>
						<td>New Coach Pricing</td>
						<td><input type="text" name="coach_cost" required /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Submit" /> &nbsp;&nbsp; <input type="reset" value="Reset" />
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
</body>
</html>