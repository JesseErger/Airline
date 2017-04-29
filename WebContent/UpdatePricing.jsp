<%@ 
page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>

<%
try{
	String f_cost = request.getParameter("first_cost");
	String b_cost = request.getParameter("business_cost");
	String c_cost = request.getParameter("coach_cost");
	
	Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
	Statement stmt = conn.createStatement();
	String f_id = session.getAttribute("flight_update_id").toString();

   	String upd_price = String.format("UPDATE `sys`.`flight` SET `first_cost`='%s', `business_cost` ='%s', `coach_cost` ='%s' WHERE `flight_ID`='%s'",f_cost,b_cost,c_cost,f_id);
   	stmt.executeUpdate(upd_price); 
}
catch(Exception e){
	out.println(e);
	
}
out.print("Price update was succesful!");

	response.setHeader("Refresh", "2;url=Account.jsp");

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