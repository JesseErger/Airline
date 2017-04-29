<%-- 
    Document   : Create User
    Created on : 15 March, 2017

--%>
<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*" import="classes.sendMail"%>
<%
	//Run this query to add an admin account to the database -> INSERT INTO users VALUES('F_Name', 'L_Name','admin',AES_ENCRYPT('password_here','_KEY_'),'username_here','email@email.com'); 
	Boolean iscust = false;
	try {
		String first = request.getParameter("first");
		String last = request.getParameter("last");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = "AES_ENCRYPT('";
		password += request.getParameter("password")+ "','_KEY_')";
		String conf_password = "AES_ENCRYPT('";
		conf_password += request.getParameter("ConfirmPassword")+ "','_KEY_')";
		if (first.length() == 0 || first.matches(".*\\d+.*")) {
			out.println("You must enter a valid First name!");
		} else if (last.length() == 0 || !last.matches("[a-zA-Z ]*")) {
			if (last.length() > 0) {
				out.println("A last name cannot contain non letter characeters");
			} else {
				out.println("You must enter a Last name!");
			}

		} else if (username.length() < 6) {
			out.println("Your username must contain at least 6 digits!");
		} else if (password.length() < 7 || (password.toLowerCase() == password)
				|| !password.matches(".*\\d+.*")) {
			out.println(
					"Your password must contain at least 7 Characters, contain at least one upper case letter, and one number");
		} else if (!conf_password.equals(password)) {
			out.println("Your password must match the confirm password!");
		} else {
			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root",
					"Pwtemp01!");
			Statement stmt = null;
			stmt = conn.createStatement();
			String acc_type = "customer";

			try {
				if (session.getAttribute("Account_Type").equals("admin")) {
					acc_type = "manager";
				}
			} catch (Exception e) {
				iscust = true;
			}
			String sql = String.format(
					"INSERT INTO `sys`.`users` (`password`, `lastname`, `username`, `firstname`, `acc_type`, `email`)"
							+ "VALUES (%s, '%s', '%s', '%s', '%s', '%s')",
					password, last, username, first, acc_type, email);
			stmt.executeUpdate(sql);
			out.print("Your account has been succesfully created!");
			sendMail.send("New account", "Your account is " + username + "\n your password is " + request.getParameter("ConfirmPassword")
					+ "\n please change your password in your account settings", email);
			if (iscust) {
				response.setHeader("Refresh", "5;url=Login.jsp");
			} else {
				response.setHeader("Refresh", "5;url=Account.jsp");
			}
		}

	} catch (Exception e) {
		if (e.getMessage().contains("Duplicate") && e.getMessage().contains("key"))
			out.println("This username has already been selected, please choose a different username");
		else
			out.println("There has been a problem creating the account, please try again!");
	}
%>

