<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>
<%
try{
    int reservationID  = Integer.parseInt(request.getParameter("ReservationID"));
    
    Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
		PreparedStatement pst2 = conn
				.prepareStatement("Select username from reservations where reservation_ID=?");
		pst2.setInt(1, reservationID);
		ResultSet rs = pst2.executeQuery();
		if(rs.next()){
		   session.setAttribute("Cant_Find", "False");
		   session.setAttribute("Found_User", "True");
		   session.setAttribute("Username", rs.getNString("username"));
		   PreparedStatement account = conn
					.prepareStatement("Select * from users where username=?");
		   account.setString(2,session.getAttribute("Username").toString());
		  account.executeQuery();
		  rs.next();
		   session.setAttribute("Username2", rs.getNString("username"));
		   session.setAttribute("Password2", rs.getNString("password"));
		   session.setAttribute("First_Name2", rs.getNString("firstname"));
		   session.setAttribute("Last_Name2", rs.getNString("lastname"));
		   session.setAttribute("Email2", rs.getNString("email"));
		   session.setAttribute("Account_Type2", rs.getNString("acc_type"));
		   String site2 = new String("http://localhost:8080/com.airline.web.index/UserInfomation.jsp");
		   response.sendRedirect(site2);
			}
		else{
			session.setAttribute("Cant_Find", "True");
			//String site2 = new String("http://localhost:8080/com.airline.web.index/EnterReservationID.jsp");
			//response.sendRedirect(site2);
			out.println("cant find");
			}
}
catch(Exception e){
	
}
%>