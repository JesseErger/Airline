<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String res_id = request.getParameter("res").split("_")[1];
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
Statement stmt = null;
stmt = conn.createStatement();
String check_in = String.format("UPDATE `sys`.`reservations` SET `checked_in`='1' WHERE `reservation_ID`= '%s'",res_id);
stmt.executeUpdate(check_in);
out.print("Customer has been checked in succesfully!");
if(session.getAttribute("Account_Type").equals("admin")){
	response.setHeader("Refresh", "2;url=Account.jsp");
}
else{
	response.setHeader("Refresh", "2;url=ManagerAccount.jsp");
}
%>
</body>
</html>