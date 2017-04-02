<%@ 
page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*" import="classes.sendMail"
	import="java.io.*,java.util.*,javax.mail.*"
	import="javax.mail.internet.*,javax.activation.*"
	import="javax.servlet.http.*,javax.servlet.*"%>
<%
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
		//out.println("grabbed values" + username + email);

		if (newPassword.length() < 7 || (newPassword.toLowerCase() == newPassword)
				|| !newPassword.matches(".*\\d+.*")) {
			out.println(
					"Your password must contain at least 7 Characters, contain at least one upper case letter, and one number");
		} else if (!confirmNewPassword.equals(newPassword)) {
			out.println("Your password must match the confirm password!");
		} else {

			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root",
					"Pwtemp01!");
			PreparedStatement pst = conn.prepareStatement(
					"Select username,password from sys.users where username=? and password=?");
			pst.setString(1, username);
			pst.setString(2, currentPassword);
			out.println(pst);
			out.println(pst);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				//out.println("in the if");

				out.println(newPassword);

				//classes.sendMail.send("PASSWORD RESET", newPassword, email);
				sendMail.send("PASSWORD RESET", newPassword, email);
				out.println("emailing password");

				PreparedStatement passUpdate = conn
						.prepareStatement("UPDATE `sys`.`users` SET `password`=? WHERE `username`=?");
				passUpdate.setString(1, newPassword);
				passUpdate.setString(2, username);
				passUpdate.executeUpdate();
				String site = new String("http://localhost:8080/com.airline.web.index/Account.jsp");
				response.sendRedirect(site);
			} else {
				String site = new String("http://localhost:8080/com.airline.web.index/Account.jsp");
				out.println("Invalid login credentials - redirecting to Account page");
				response.sendRedirect(site);
			}
		}
	} catch (Exception e) {
		out.println(e);
	}
%>