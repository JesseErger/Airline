<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*" import="classes.sendMail"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String flightNumber = session.getAttribute("flightNumber").toString();
	List<String> flightList = Arrays.asList(flightNumber.split(","));

	for (int i = 0; i < flightList.size(); i++) {
		String cost = session.getAttribute("cost").toString();
		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");

		// gets direct flights
		String sql = "Select * from flight where flight_id=?";
		PreparedStatement flights = conn.prepareStatement(sql);
		flights.setString(1, flightList.get(i));
		ResultSet rs = flights.executeQuery(); // all direct flights
		if (rs.next()) {
			Integer newCapacity = rs.getInt("coach_vacancy") - 1;
			Statement updateCapacity = conn.createStatement();
			sql = "UPDATE `sys`.`flight` SET `coach_vacancy`=" + newCapacity + " WHERE `flight_ID`='"
					+ flightList.get(i) + "'";
			updateCapacity.executeUpdate(sql);

			Statement createReservation = conn.createStatement();
			sql = String.format(
					"INSERT INTO `sys`.`reservations` (`username`, `date_of_depature`, `seating_class`, `flight_ID`,`amount`)"
							+ "VALUES ('%s', '%s', '%s', '%s', '%s')",
					session.getAttribute("Username").toString(), rs.getDate("departure_time"), "coach",
					flightList.get(i), rs.getInt("coach_cost"));
			createReservation.executeUpdate(sql);

			Statement createTransaction = conn.createStatement();
			sql = String.format(
					"INSERT INTO `sys`.`transaction` (`username`, `credit_card`, `cardholder_first`, `cardholder_last`,`CVV`,`address_street`,`address_city`,`address_state`,`address_zipcode`,`amount`)"
							+ "VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')",
					session.getAttribute("Username").toString(), request.getParameter("credit_card"),
					request.getParameter("first_name"), request.getParameter("last_name"),
					request.getParameter("CVV"), request.getParameter("street_address"),
					request.getParameter("city"), request.getParameter("state"), request.getParameter("zip"),
					cost);
			createTransaction.executeUpdate(sql);

		}
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>