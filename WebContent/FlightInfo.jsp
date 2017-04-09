<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*"%>
<%ResultSet resultset =null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {
	background-image: url(plane2.PNG);
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
<h1>Add flight</h1>
</head>
<body>
	<form method="post" action="NewFlight.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Add Flight</th>
					</tr>
				</thead>
					<tr>
						<td>Flight Origin</td>
						<td><input type="text" name="origin" required /></td>
					</tr>
					<tr>
						<td>Destination</td>
						<td><input type="text" name="destination" required /></td>
					</tr>
					<tr>
						<td>Departure Date</td>
						<td><input type="text" name="date_of_departure" required /></td>
					</tr>
					<tr>
						<td>Departure Time</td>
						<td><input type="text" name="time_of_departure" required /></td>
					</tr>
					<tr>
						<td>Arrival Date</td>
						<td><input type="text" name="arrival_date" required /></td>
					</tr>
					<tr>
						<td>Arrival Time</td>
						<td><input type="text" name="arrival_time" required /></td>
					</tr>
					<tr>
						<td>Desired Capacity</td>
						<td><input type="text" name="capacity" required /></td>
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
