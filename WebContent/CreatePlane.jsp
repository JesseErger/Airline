<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*"%>
<%
	String added_by = "";
	String model = request.getParameter("model");
	try {
		String capacity = request.getParameter("capacity");
		model = request.getParameter("model");
		String acc_type = session.getAttribute("Account_Type").toString();

		if (!acc_type.equals("admin") && !acc_type.equals("manager")) {
			out.println("You dont have permission to add a plane!");
		} else {
			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root",
					"Pwtemp01!");
			Statement stmt = null;
			stmt = conn.createStatement();
			added_by = session.getAttribute("Username").toString();
			String sql = String.format(
					"INSERT INTO `sys`.`plane` (`added_by`, `model`, `capacity`)" + "VALUES ('%s', '%s', '%s')",
					added_by, model, capacity);
			stmt.executeUpdate(sql);
			out.print("Plane has been added! Redirecting you to your homepage");

		}

	} catch (Exception e) {
		out.println("There was a problem adding the plane, please try again!");
	}
%>
<script>
	setTimeout(function() {
		document.location = "Account.jsp";
	}, 2000);
</script>