<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
session.setAttribute("check_in", "yes");
%>
<form method="post" action="SearchReservation.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Search by First Name and Last Name or Reservation</th>
					</tr>
				</thead>	       
				<tbody>					
					<tr>
						<td>First Name</td>
						<td><input type="text" name="f_name" required /></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="l_name" required /></td>
					</tr>
					<tr>
						<td>Reservation number</td>
						<td><input type="text" name="res_num"  /></td>
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