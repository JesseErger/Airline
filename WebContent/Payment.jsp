<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*" import="classes.QuickEmail,classes.AuthEmail,javax.mail.Session"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>You will be automatically redirected when your order is processed</p>
</body>
<%
	String flightNumber = session.getAttribute("flightNumber").toString();
	List<String> flightList = Arrays.asList(flightNumber.split(","));
	String ticketClass = session.getAttribute("ticketClass").toString();
	Integer numberTickets = (Integer) session.getAttribute("numberTickets");
	Session emailSession = AuthEmail.Autenticate();

	for (int j = 0; j < numberTickets; j++) {
		for (int i = 0; i < flightList.size(); i++) {
			//String cost = session.getAttribute("cost").toString();
			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root",
					"Pwtemp01!");

			String sql = "Select * from flight where flight_id=?";
			PreparedStatement flights = conn.prepareStatement(sql);
			flights.setString(1, flightList.get(i));
			ResultSet rs = flights.executeQuery(); // flight being bought
			if (rs.next()) {
				Integer newCapacity;
				if (ticketClass.equals("coach")) {
					newCapacity = rs.getInt("coach_vacancy") - 1;
				} else if (ticketClass.equals("businesss")) {
					newCapacity = rs.getInt("business_vacancy") - 1;
				} else {
					newCapacity = rs.getInt("first_vacancy") - 1;
				}

				Statement updateCapacity = conn.createStatement();
				sql = "UPDATE `sys`.`flight` SET `" + ticketClass + "_vacancy`=" + newCapacity
						+ " WHERE `flight_ID`='" + flightList.get(i) + "'";
				updateCapacity.executeUpdate(sql);

				Statement createReservation = conn.createStatement();
				sql = String.format(
						"INSERT INTO `sys`.`reservations` (`username`, `date_of_depature`, `seating_class`, `flight_ID`,`amount`)"
								+ "VALUES ('%s', '%s', '%s', '%s', '%s')",
						session.getAttribute("Username").toString(), rs.getTimestamp("departure_time"),
						ticketClass, flightList.get(i), rs.getInt(ticketClass + "_cost"));
				createReservation.executeUpdate(sql);

				Statement createTransaction = conn.createStatement();
				sql = String.format(
						"INSERT INTO `sys`.`transaction` (`username`, `credit_card`, `cardholder_first`, `cardholder_last`, `exp_date`, `CVV`,`address_street`,`address_city`,`address_state`,`address_zipcode`,`amount`)"
								+ "VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')",
						session.getAttribute("Username").toString(), request.getParameter("credit_card"),
						request.getParameter("first_name"), request.getParameter("last_name"),
						request.getParameter("expiration"), request.getParameter("CVV"),
						request.getParameter("street_address"), request.getParameter("city"),
						request.getParameter("state"), request.getParameter("zip"),
						rs.getInt(ticketClass + "_cost"));
				createTransaction.executeUpdate(sql);

				sql = "SELECT * FROM reservations WHERE reservation_ID = (SELECT max(reservation_ID) from reservations)";
				PreparedStatement reservation = conn.prepareStatement(sql);
				ResultSet reservationResult = reservation.executeQuery(); // flight being bought
				reservationResult.next();
				out.println("<br>Processing ticket " + j + " of " + numberTickets);
				QuickEmail.send(emailSession, "Flight Booked", "Thank you for buying your flight\n" + "your flight number is: "
						+ rs.getString("flight_ID") + "\nLeaving at: " + rs.getTimestamp("departure_time")
						+ " Arriving at: " + rs.getTimestamp("arrival_time") + "\nCost: "
						+ rs.getInt(ticketClass + "_cost") + "\nFrom: " + rs.getString("Origin") + "\nTo: "
						+ rs.getString("destination") + "\nYour reservation number is: "
						+ reservationResult.getInt("reservation_ID"), session.getAttribute("Email").toString());

			}
		}
	}
	response.setHeader("Refresh", "3;url=Account.jsp");
%>
</html>
