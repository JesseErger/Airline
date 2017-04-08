<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*"%>
<%ResultSet resultset =null; ResultSet count =null;%>
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
</head>
<body>
	<form method="post" action="CreateFlight.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Add Flight</th>
					</tr>
				</thead>
				<%
					
					try {
						//Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
						Statement stmt = null;
				        stmt = conn.createStatement();
						String sql = String.format("SELECT model FROM `sys`.`plane`");
						resultset = stmt.executeQuery(sql);
						ResultSetMetaData resultsetmd = resultset.getMetaData();
						int size = resultsetmd.getColumnCount();					
				%>

				<center>
					<h1>Select Plane</h1>
					<select>
						<%
							while (resultset.next()) {
						%>
						<option><%=resultset.getString(size)%></option>
						<%
							}
						%>
					</select>
				</center>

				<%
					} catch (Exception e) {
						out.println("INVALID ->" + e);
					}
				%>
				<tbody>
					<tr>
						<td>Departure Location</td>
						<td><input type="text" name="departure_loc" required /></td>
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
						<td>Flight Duration(Minutes)</td>
						<td><input type="text" id = "dur" name="duration_min" required /></td>
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