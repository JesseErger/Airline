<%@ 
page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*" import="classes.sendMail"%>

<%
	try {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		//out.println("grabbed values" + username + email);
		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
		PreparedStatement pst = conn
				.prepareStatement("Select username,email from sys.users where username=? and email=?");
		pst.setString(1, username);
		pst.setString(2, email);
		out.println(pst);
		out.println(pst);
		ResultSet rs = pst.executeQuery();
		if (rs.next()) {
			out.println("in the if");

			String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
			StringBuilder salt = new StringBuilder();
			Random rnd = new Random();
			while (salt.length() < 10) {
				int index = (int) (rnd.nextFloat() * SALTCHARS.length());
				salt.append(SALTCHARS.charAt(index));
			}
			String newPassword = salt.toString();
			out.println(newPassword);

			//classes.sendMail.send("PASSWORD RESET", newPassword, email);
			sendMail.send("PASSWORD RESET", newPassword, email);
			out.println("emailing password");

			PreparedStatement passUpdate = conn
					.prepareStatement("UPDATE `sys`.`users` SET `password`=? WHERE `username`=?");
			passUpdate.setString(1, newPassword);
			passUpdate.setString(2, username);
			passUpdate.executeUpdate();
			String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
			response.sendRedirect(site);
		} else {
			String site = new String("http://localhost:8080/Airline/ResetPasswordPage.jsp");
			out.println("Invalid login credentials - redirecting to hompeage");
			response.sendRedirect(site);
		}
	} catch (Exception e) {
		out.println(e);
	}
%>