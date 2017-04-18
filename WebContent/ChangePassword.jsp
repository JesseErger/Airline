<%@ 
page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*" 
	import="java.io.*,java.util.*,javax.mail.*"
	import="javax.mail.internet.*,javax.activation.*"
	import="javax.servlet.http.*,javax.servlet.*"%>
<%
//import="classes.sendMail"
	String username = "";
	String first_name = "";
	String last_name = "";
	String email = "";
	String acc_type = "";
	String loged_out = "";
	try {
		username = session.getAttribute("Username").toString();
		first_name = session.getAttribute("First_Name").toString();
		last_name = session.getAttribute("Last_Name").toString();
		email = session.getAttribute("Email").toString();
		acc_type = session.getAttribute("Account_Type").toString();
		loged_out = session.getAttribute("loged_out").toString();
	} catch (Exception e) {
		// Are not logged in/ invalid session
		String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
		response.sendRedirect(site);
		return;
	}
	if (loged_out.equals("")) {
		String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
		response.sendRedirect(site);
		return;
	}

	try {
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmNewPassword = request.getParameter("confirmNewPassword");
		
		if (newPassword.length() < 7 || (newPassword.toLowerCase() == newPassword)
				|| !newPassword.matches(".*\\d+.*")) {
			out.println(
					"Your password must contain at least 7 Characters, contain at least one upper case letter, and one number");
		} else if (!confirmNewPassword.equals(newPassword)) {
			out.println("Your password must match the confirm password!");
		} else {
			newPassword = "AES_ENCRYPT('";
			newPassword += request.getParameter("newPassword")+ "','_KEY_')";
			currentPassword = "AES_ENCRYPT('";
			currentPassword += request.getParameter("currentPassword")+ "','_KEY_')";
			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root",
					"Pwtemp01!");
			Statement stmt = null;
			stmt = conn.createStatement();
			String sql = String.format("Select * from `sys`.`users` where username = '%s' and password = %s ", username,currentPassword);
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				//sendMail.send("PASSWORD RESET", newPassword, email);
				String passUpdate = String.format("UPDATE `sys`.`users` SET `password`= %s WHERE `username`='%s'", newPassword,username);
				stmt.executeUpdate(passUpdate);
				out.println("Password has been updated! Redirecting you to your account.");
				response.setHeader("Refresh", "5;url=Account.jsp");
			} else {
				String passUpdate1 = String.format("UPDATE `sys`.`users` SET `password`= %s WHERE `username` ='%s'", newPassword,username);
				String site = new String("http://localhost:8080/com.airline.web.index/Account.jsp");
				out.println("Invalid login credentials - please go back and try again");
			}
		}
	} catch (Exception e) {
		out.println(e);
	}
%>