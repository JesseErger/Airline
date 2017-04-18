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
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/cupertino/jquery-ui.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
</script>
<script>
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
</script>
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
						<td>From</td>
						<td><select name="origin">
								<option value="Chicago">Chicago</option>
								<option value="New York">New York</option>
								<option value="Iowa City">Iowa City</option>
								<option value="Des Moines">Des Moines</option>
								<option value="San Franscisco">San Franscisco</option>
						</select></td>
					</tr>
					<tr>
						<td>To</td>
						<td><select name="destination">
								<option value="Chicago">Chicago</option>
								<option value="New York" selected>New York</option>
								<option value="Iowa City">Iowa City</option>
								<option value="Des Moines">Des Moines</option>
								<option value="San Franscisco">San Franscisco</option>
						</select></td>
					</tr>
					<tr>
						<td>Departure Date</td>
						<td><input type="text" name="date_of_departure" id="datepicker" required /></td>
					</tr>
					<tr>
						<td>Departure Time(HH:MM)</td>
						<td><input type="text" name="time_of_departure" required /></td>
					</tr>
					<tr>
						<td>Arrival Date</td>
						<td><input type="text" name="arrival_date" id="datepicker1" required /></td>
					</tr>
					<tr>
						<td>Arrival Time(HH:MM)</td>
						<td><input type="text" name="arrival_time" required /></td>
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
