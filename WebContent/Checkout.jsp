<%@ 
page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*" import="classes.sendMail"%>

<%
	//very simple version of checking out, probably will crash
	//must be signed in
	String flightNumber = request.getParameter("Buy");
	sendMail.send("Thanks for buying", "You have bought flight number " + flightNumber,
			session.getAttribute("Email").toString());
	Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
	String sql = "Select * from flight where origin=? and destination=? and " + "departure_time BETWEEN '";
	Statement subtractAvailability = conn.createStatement();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkout</title>
</head>
<body>

</body>
</html>