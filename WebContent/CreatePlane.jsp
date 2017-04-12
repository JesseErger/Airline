<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,org.joda.time.*,java.text.*"%>
<%
	String added_by = "";
	String model = request.getParameter("model");
	try {
		String f_capacity = request.getParameter("f_capacity");
		String b_capacity = request.getParameter("b_capacity");
		String c_capacity = request.getParameter("c_capacity");
		String origin = request.getParameter("origin");
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
					"INSERT INTO `sys`.`plane` (`added_by`, `model`, `f_capacity`, `b_capacity`, `c_capacity`)" + "VALUES ('%s', '%s', '%s', '%s', '%s')",
					added_by, model, f_capacity, b_capacity, c_capacity);
			stmt.executeUpdate(sql);
			
			String sql2 = "SELECT MAX(plane_ID) from `sys`.`plane`";
			ResultSet resultset = null;
			resultset = stmt.executeQuery(sql2);
			resultset.next();
			String plane_id = resultset.getString(1);
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date date = new java.util.Date();
			String curtime = dateFormat.format(date);
			String sql3 = String.format(
					"INSERT INTO `sys`.`flight` (`added_by`, `origin`, `destination`, `departure_time`, `arrival_time`, `first_vacancy`, `coach_vacancy`, `business_vacancy`, `plane_ID`)" 
							+ "VALUES ('%s', '%s', '%s','%s', '%s', '%s','%s', '%s', '%s')", added_by, origin, origin, curtime, curtime, "0", "0", "0", plane_id);
			stmt.executeUpdate(sql3);
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