<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,org.joda.time.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {
   font-family: Verdana,sans-serif;
   background-image:url(Signup-B.PNG)

}

h1 {
	text-align: center;
	color: red;
}

td {
	font-weight: bold;
	font-style: center
}

#flight{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 50%;
    color:black;
  
    
}

#flight td, #flight th {
    border: 1px solid #ddd;
    padding: 10px;
    border: 5px;
}

#flight tr:hover {background-color: #CCB3D3;}

#flight th {
    padding-top: 20px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #DAC2B2;
    color: black;
}

#sub{
  background-color: green;
    color: white;
    padding: 10px 15px;
    margin: 8px 0;
    border: none;
    width: 25%;
}

#res{
background-color: red;
    color: white;
    padding: 10px 15px;
    margin: 8px 0;
    border: none;
    width: 25%;

}
#left{
  text-align: right;
}

#right{
  text-align: left;
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
			<table border="1" cellpadding="5" cellspacing="2" id="flight">
				<thead>
					<tr>
						<th colspan="2">Update Flight <%out.println(flight_id+"'s");%> Pricing</th>
					</tr>
				</thead>
<tbody>					
					<tr>
						<td id="left">New First Class Pricing</td>
						<td><input type="text" name="first_cost" required /></td>
					</tr>
					<tr>
						<td id="left">New Business Class Pricing</td>
						<td><input type="text" name="business_cost" required /></td>
					</tr>
					<tr>
						<td id="left" >New Coach Pricing</td>
						<td><input type="text" name="coach_cost" required /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input id="sub" type="submit"
							value="Submit" /> &nbsp;&nbsp; <input id="res" type="reset" value="Reset" />
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
</body>
</html>