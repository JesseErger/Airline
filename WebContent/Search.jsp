<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*"%>



<table border="1" cellpadding="5" cellspacing="2">
	<thead>
		<tr>
			<th colspan="3">Results</th>
		</tr>
	</thead>

	<tbody>

		<td>
			<%
				Boolean iscust = false;
				try {
					String to = request.getParameter("to");
					String from = request.getParameter("from");
					String date = request.getParameter("date");
					String ticketClass = request.getParameter("class");

					Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
					String sql = "Select * from flight where origin=? and destination=? and " + "departure_time BETWEEN '"
							+ date + " 00:00:00' AND '" + date + " 23:59:59' and ";
					if (ticketClass.equals("first")) {
						sql += "first_vacancy > 0";
					} else if (ticketClass.equals("business")) {
						sql += "business_vacancy > 0";
					} else {
						sql += "coach_vacancy > 0";
					}
					PreparedStatement flights = conn.prepareStatement(sql);
					flights.setString(1, from);
					flights.setString(2, to);
					ResultSet rs = flights.executeQuery();
					if (!rs.next()) {
						out.println("No results, please search again");
						response.setHeader("Refresh", "5;url=SearchPage.jsp");
					} else {
						out.println("<tr><td>Departure Time</td><td>" + rs.getTimestamp("departure_time") + "</td>"
								+ "<td><form method='post' action='Checkout.jsp'><input type='submit' name='Buy' value='" + rs.getInt("flight_ID")
								+ "'></td></form></tr>");
						while (rs.next()) {
							//out.println(rs.getInt("plane_ID"));
							out.println(
									"<tr><td>Departure Time</td><td>" + rs.getTimestamp("departure_time") + "</td></tr>");
						}
					}

				} catch (Exception e) {
					out.println(e.toString());
				}
			%>
		</td>

	</tbody>
</table>