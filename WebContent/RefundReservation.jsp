<%@ 
page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>

<%
try{
	String res_ID = request.getParameter("res").split("_")[1];
	Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
	String get_resv = String.format("Select * from reservations where `reservation_ID` = '%s'",res_ID);
	String del_res = String.format("Delete from `sys`.`reservations` where `reservation_ID` = '%s'",res_ID);
	
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt2 = null;
	ResultSet rs = null;	
	ResultSet rs1 = null;
    stmt = conn.createStatement();
    stmt1 = conn.createStatement();
    stmt2 = conn.createStatement();
    
    rs = stmt.executeQuery(get_resv);
   
    
   	if(rs.next()){
    stmt2.executeUpdate(del_res);
   	}
   	
   	String flight_ID = rs.getString("Flight_ID");
   	String s_class = rs.getString("seating_class");
   	String plane_id = String.format("Select `plane_ID` from `sys`.`flight` where `flight_ID` = '%s'",flight_ID);
    rs1 = stmt1.executeQuery(plane_id);
    rs1.next();
   	String plane_ID = rs1.getString("plane_ID");
   	String cap_row = "";
   	if(s_class.equals("first")){
   		cap_row = "f_capacity";
   	}
   	else if(s_class.equals("business")){
   		cap_row = "b_capacity";
   	}
   	else{
   		
   		cap_row = "c_capacity";
   	}
   	String cap_col = "";
   	if(s_class.equals("first")){
   		cap_col = "first_vacancy";
   	}
   	else if(s_class.equals("business")){
   		cap_col = "business_vacancy";
   	}
   	else{
   		cap_col = "coach_vacancy";
   	}
   	String cur_cap = String.format("Select `%s` from `sys`.`flight` where `flight_ID` = '%s'",cap_col,flight_ID);

   	rs1 = stmt.executeQuery(cur_cap);
   	rs1.next();
   	String cur = rs1.getString(cap_col);
   	int new_cap = Integer.parseInt(cur);
   	new_cap++;
   	String upd_flight = String.format("UPDATE `sys`.`flight` SET `%s`='%s' WHERE `flight_ID`= '%s'",cap_col,new_cap,flight_ID);
   	stmt.executeUpdate(upd_flight);
}
catch(Exception e){
	out.println(e);
	
}
out.print("Refund was succesful!");
if(session.getAttribute("Account_Type").equals("manager")){
response.setHeader("Refresh", "2;url=ManagerAccount.jsp");
}
else
{
	response.setHeader("Refresh", "2;url=Account.jsp");
}
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