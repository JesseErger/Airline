<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*"%>
<%
	Boolean iscust = false;
	try {
		String to = request.getParameter("to");
		String from = request.getParameter("from");
		String date = request.getParameter("date");
		String ticketClass = request.getParameter("class");
		String password = request.getParameter("password");
		String conf_password = request.getParameter("ConfirmPassword");

		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
		PreparedStatement flights = conn
				.prepareStatement("Select * from flight where origin=? and destination=? and CONVERT(DATETIME, FLOOR(CONVERT(FLOAT, departure_time))) =?");

		out.print("Your account has been succesfully created!");

		if (iscust) {
			response.setHeader("Refresh", "5;url=Login.jsp");
		} else {
			response.setHeader("Refresh", "5;url=Account.jsp");
		}

	} catch (Exception e) {
		if (e.getMessage().contains("Duplicate") && e.getMessage().contains("key"))
			out.println("This username has already been selected, please choose a different username");
		else
			out.println("There has been a problem creating the account, please try again!");
	}
%>