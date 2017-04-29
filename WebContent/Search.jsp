<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,classes.SearchFlights,classes.Flights"%>



<table border="1" cellpadding="5" cellspacing="2">
	<thead>
		<tr>
			<th colspan="3">Results</th>
		</tr>
	</thead>

	<tbody>


		<%
			Boolean iscust = false;
			try {
				String to = request.getParameter("to");
				String from = request.getParameter("from");
				String date = request.getParameter("date");
				String ticketClass = request.getParameter("class");
				session.setAttribute("ticketClass", ticketClass);

				ArrayList<Flights> returnedFlights = SearchFlights.search(to, from, date, ticketClass);
				if (returnedFlights.isEmpty()) {
					out.println("No results, please search again");
					response.setHeader("Refresh", "5;url=SearchPage.jsp");
				} else {
					for (int i = 0; i < returnedFlights.size(); i++) {
						if (returnedFlights.get(i).is_connection == 0) {
							out.println("<tr><td>Flight Number: "+returnedFlights.get(i).flight_ID.toString()+"</td><td>" + " leaves " + returnedFlights.get(i).origin
									+ " at " + returnedFlights.get(i).departure_time + " arrives at "
									+ returnedFlights.get(i).destination + " at "
									+ returnedFlights.get(i).departure_time
									+ "<td><form method='post' action='Checkout.jsp'><input id='flightNumber' type='hidden' name='flightNumber' value="
									+ returnedFlights.get(i).flight_ID
									+ "><input type='submit' name='Buy' value='Buy'></td></form>");
						} else {
							if (returnedFlights.get(i).is_connection > 0) {
								out.println("<tr><td>Flight Numbers: "+returnedFlights.get(i).flight_ID.toString()+", "+returnedFlights.get(i+1).flight_ID.toString()+"</td><td>" + " leaves "
										+ returnedFlights.get(i).origin + " at " + returnedFlights.get(i).departure_time
										+ " arrives at " + returnedFlights.get(i).destination + " at "
										+ returnedFlights.get(i).departure_time + "</br>leaves "
										+ returnedFlights.get(i + 1).origin + " at "
										+ returnedFlights.get(i + 1).departure_time + " arrives at "
										+ returnedFlights.get(i + 1).destination + " at "
										+ returnedFlights.get(i + 1).departure_time
										+ "<td><form method='post' action='Checkout.jsp'><input id='flightNumber' type='hidden' name='flightNumber' value="
										+ returnedFlights.get(i).flight_ID.toString() + ","
										+ returnedFlights.get(i + 1).flight_ID.toString()
										+ "><input type='submit' name='Buy' value='Buy'></td></form>");
								i++;
							}

						}
					}
				}

			} catch (Exception e) {
				out.println(e.toString());
			}
		%>


	</tbody>
</table>