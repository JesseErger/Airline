<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>
<%
try{
    String firstname  = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
		PreparedStatement pst2 = conn
				.prepareStatement("Select firstname,lastname from users where firstname=? and lastname=?");
		PreparedStatement account2 = conn
				.prepareStatement("Select * from users where firstname=? and lastname=?");
		pst2.setString(1, firstname);
		pst2.setString(2, lastname);
		account2.setString(1,firstname);
		account2.setString(2,lastname);
		ResultSet rs = pst2.executeQuery();
		if(rs.next()){
		   session.setAttribute("Cant_Find", "False");
		   session.setAttribute("Found_User", "True");
		   rs = account2.executeQuery();
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
			String site2 = new String("http://localhost:8080/com.airline.web.index/EnterFirstLast.jsp");
			response.sendRedirect(site2);
			}
}
catch(Exception e){
	
}
%>
			