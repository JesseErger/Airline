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
String get_class_and_flightID = String.format("SELECT seating_class,flight_ID FROM `sys`.`reservations` where reservation_ID = '%s'",res_id);
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
Statement stmt = null;
Statement stmt2 = null;
Statement stmt3 = null;
stmt = conn.createStatement();
stmt2 = conn.createStatement();
stmt3 = conn.createStatement();

ResultSet rs = null;
ResultSet rs2 = null;
rs = stmt.executeQuery(get_class_and_flightID);
rs.next();
String sclass = rs.getString("seating_class");
String f_ID = rs.getString("flight_ID");

try{
String get_seat = String.format("SELECT max(seat_num) FROM `sys`.`reservations` where flight_ID = '%s' and seating_class = '%s'",f_ID,sclass);
rs2 = stmt2.executeQuery(get_seat);
rs2.next();
String seat_num = rs2.getString("max(seat_num)");
int new_seat = Integer.parseInt(seat_num) + 1;
seat_num = Integer.toString(new_seat);
String check_in = String.format("UPDATE `sys`.`reservations` SET `checked_in`='1',`seat_num` = '%s' WHERE `reservation_ID`= '%s'",seat_num,res_id);
stmt.executeUpdate(check_in);
out.print("Customer has been checked in succesfully! Their seat number is "+seat_num+" In seating class "+sclass);
if(session.getAttribute("Account_Type").equals("admin")){
	response.setHeader("Refresh", "5;url=Account.jsp");
}
else{
	response.setHeader("Refresh", "5;url=ManagerAccount.jsp");
}
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>