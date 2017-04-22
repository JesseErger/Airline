<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*" %>



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
					String f_name = "";
					String l_name = "";
					String reservationID = "";
					Boolean by_name = false;
					try{
						f_name = request.getParameter("f_name");
						l_name = request.getParameter("l_name");
						by_name = true;
					}
					catch (Exception e){
						reservationID = request.getParameter("res_num");
					}
					out.println(reservationID);

					/* if (!rs.next()) {
						out.println("No Reservations found");
						
					} else {
						out.println("<tr><td>Departure Time</td>
								+ "<td><form method='post' action='CheckinCustomer.jsp'><input type='submit' name='check_in' value='" + "RESERVATION_ID"
								+ "'></td></form></tr>");
						while (rs.next()) {
							//out.println(rs.getInt("plane_ID"));
							out.println(
									"<tr><td>Departure Time</td><td>" + rs.getTimestamp("departure_time") + "</td></tr>");
						}
					} */

				} catch (Exception e) {
					out.println(e.toString());
				}
			%>
		</td>

	</tbody>
</table>