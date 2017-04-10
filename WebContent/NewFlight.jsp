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
	<form method="post" action="CreateFlight.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Add Flight</th>
					</tr>
				</thead>
				<%
				String origin = request.getParameter("origin").toString();
				String destination = request.getParameter("destination").toString();
				String date_of_departure = request.getParameter("date_of_departure").toString();
				String time_of_departure = request.getParameter("time_of_departure").toString();
				String arrival_date = request.getParameter("arrival_date").toString();
				String arrival_time = request.getParameter("arrival_time").toString();
				String capacity = request.getParameter("capacity").toString();
				session.setAttribute("origin", origin);
				session.setAttribute("destination", destination);
				session.setAttribute("date_of_departure", date_of_departure);
				session.setAttribute("time_of_departure", time_of_departure);
				session.setAttribute("arrival_date", arrival_date);
				session.setAttribute("arrival_time", arrival_time);
				session.setAttribute("capacity", capacity);
					try {
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
						Statement stmt = null;
				        stmt = conn.createStatement();
						String sql = String.format("SELECT model FROM `sys`.`plane` WHERE capacity >= %s",capacity);
						resultset = stmt.executeQuery(sql);
						ResultSetMetaData resultsetmd = resultset.getMetaData();
						int size = resultsetmd.getColumnCount();					
				%>
					Select from available Planes
					<select name = 'model' id ='model'>
						<%
							while (resultset.next()) {
						%>
						<option><%=resultset.getString(size)%></option>
						<%
							}
						%>
						
					</select>
				<%
					} catch (Exception e) {
						out.println("INVALID ->" + e);
					}					
				%>
				
				<tbody>					
					<tr>
						<td>First Class Seating</td>
						<td><input type="text" name="first_class" required /></td>
					</tr>
					<tr>
						<td>Business Class Seating</td>
						<td><input type="text" name="business_class" required /></td>
					</tr>
					<tr>
						<td>Coach Seating</td>
						<td><input type="text" name="coach_class" required /></td>
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
