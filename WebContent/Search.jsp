<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,classes.SearchFlights,classes.Flights,classes.FormatDate"%>



<table class="sortable" border="1" cellpadding="5" cellspacing="2">
	<thead>
		<tr>
			<th>Flight Number</th>
			<th>Cost</th>
			<th>Departing</th>
			<th>Arriving</th>
			<th>Purchase</th>
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
						Integer cost;
						if (returnedFlights.get(i).is_connection == 0) {

							if (ticketClass.equals("coach")) {
								cost = returnedFlights.get(i).coach_cost;
							} else if (ticketClass.equals("businesss")) {
								cost = returnedFlights.get(i).business_cost;
							} else {
								cost = returnedFlights.get(i).first_cost;
							}

							out.println("<tr><td>" + returnedFlights.get(i).flight_ID.toString() + "</td><td>$" + cost
									+ "</td><td>"

									+ returnedFlights.get(i).origin + " at "
									+ FormatDate.readable(returnedFlights.get(i).departure_time) + "</td><td>"

									+ returnedFlights.get(i).destination + " at "
									+ FormatDate.readable(returnedFlights.get(i).departure_time)
									+ "</td><td><form method='post' action='Checkout.jsp'><input id='flightNumber' type='hidden' name='flightNumber' value="
									+ returnedFlights.get(i).flight_ID
									+ "><input type='submit' name='Buy' value='Buy'></td></form>");
						} else if (returnedFlights.get(i).is_connection > 0) {

							if (ticketClass.equals("coach")) {
								cost = returnedFlights.get(i).coach_cost + returnedFlights.get(i + 1).coach_cost;
							} else if (ticketClass.equals("businesss")) {
								cost = returnedFlights.get(i).business_cost + returnedFlights.get(i + 1).business_cost;
							} else {
								cost = returnedFlights.get(i).first_cost + returnedFlights.get(i + 1).first_cost;
							}

							out.println("<tr><td>" + returnedFlights.get(i).flight_ID.toString() + "<br>"
									+ returnedFlights.get(i + 1).flight_ID.toString() + "</td><td>$"
											+ cost.toString() + "</td><td>"
									
									+ returnedFlights.get(i).origin + " at "
									+ FormatDate.readable(returnedFlights.get(i).departure_time) + "<br>"
									+ returnedFlights.get(i + 1).origin + " at "
									+ FormatDate.readable(returnedFlights.get(i + 1).departure_time) + "</td><td>"

									+ returnedFlights.get(i).destination + " at "
									+ FormatDate.readable(returnedFlights.get(i).departure_time) + "<br>"
									+ returnedFlights.get(i + 1).destination + " at "
									+ FormatDate.readable(returnedFlights.get(i + 1).departure_time)
									+ "</td><td><form method='post' action='Checkout.jsp'><input id='flightNumber' type='hidden' name='flightNumber' value="
									+ returnedFlights.get(i).flight_ID.toString() + ","
									+ returnedFlights.get(i + 1).flight_ID.toString()
									+ "><input type='submit' name='Buy' value='Buy'></td></form>");
							i++;

						}
					}
				}

			} catch (Exception e) {
				out.println(e.toString());
			}
		%>


	</tbody>
</table>