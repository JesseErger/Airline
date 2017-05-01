<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,classes.SearchFlights,classes.Flights,classes.FormatDate"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Results</title>
<script>
	function sortTable(n) {
		var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
		table = document.getElementById("myTable2");
		switching = true;
		//Set the sorting direction to ascending:
		dir = "asc";
		/*Make a loop that will continue until
		no switching has been done:*/
		while (switching) {
			//start by saying: no switching is done:
			switching = false;
			rows = table.getElementsByTagName("TR");
			/*Loop through all table rows (except the
			first, which contains table headers):*/
			for (i = 1; i < (rows.length - 1); i++) {
				//start by saying there should be no switching:
				shouldSwitch = false;
				/*Get the two elements you want to compare,
				one from current row and one from the next:*/
				x = rows[i].getElementsByTagName("TD")[n];
				y = rows[i + 1].getElementsByTagName("TD")[n];
				/*check if the two rows should switch place,
				based on the direction, asc or desc:*/
				if (dir == "asc") {
					if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
						//if so, mark as a switch and break the loop:
						shouldSwitch = true;
						break;
					}
				} else if (dir == "desc") {
					if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
						//if so, mark as a switch and break the loop:
						shouldSwitch = true;
						break;
					}
				}
			}
			if (shouldSwitch) {
				/*If a switch has been marked, make the switch
				and mark that a switch has been done:*/
				rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
				switching = true;
				//Each time a switch is done, increase this count by 1:
				switchcount++;
			} else {
				/*If no switching has been done AND the direction is "asc",
				set the direction to "desc" and run the while loop again.*/
				if (switchcount == 0 && dir == "asc") {
					dir = "desc";
					switching = true;
				}
			}
		}
	}
</script>
</head>
<body>
	<table id="myTable2" border="1" cellpadding="5" cellspacing="2"
		class="tablesorter">
		<thead>
			<tr>
				<th>Flight Number</th>
				<th onclick="sortTable(1)"><u>Cost</u></th>
				<th>Departing</th>
				<th>Arriving</th>
				<th>Map</th>
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
					String numberTicketsString = request.getParameter("numberTickets");
					Integer numberTickets = Integer.parseInt(numberTicketsString);
					session.setAttribute("numberTickets", numberTickets);

					ArrayList<Flights> returnedFlights = SearchFlights.search(to, from, date, ticketClass, numberTickets);
					if (returnedFlights.isEmpty()) {
						out.println("No results, please search again");
						response.setHeader("Refresh", "5;url=SearchPage.jsp");
					} else {
						for (int i = 0; i < returnedFlights.size(); i++) {
							Integer cost;
							if (returnedFlights.get(i).is_connection == 0) {

								if (ticketClass.equals("coach")) {
									cost = returnedFlights.get(i).coach_cost * numberTickets;
								} else if (ticketClass.equals("businesss")) {
									cost = returnedFlights.get(i).business_cost * numberTickets;
								} else {
									cost = returnedFlights.get(i).first_cost * numberTickets;
								}

								out.println("<tr><td>" + returnedFlights.get(i).flight_ID.toString() + "</td><td>$" + cost
										+ "</td><td>"

										+ returnedFlights.get(i).origin + " at "
										+ FormatDate.readable(returnedFlights.get(i).departure_time) + "</td><td>"

										+ returnedFlights.get(i).destination + " at "
										+ FormatDate.readable(returnedFlights.get(i).arrival_time) + "</td><td>"
										+ "<form method='push' action='MapPage.jsp'><input id='from' type='hidden' name='from' value='"
										+ returnedFlights.get(i).origin + "'><input id='to' type='hidden' name='to' value='"
										+ returnedFlights.get(i).destination
										+ "'><input type='submit' name='Map' value='Map'></form>"
										+ "</td><td><form method='post' action='Checkout.jsp'><input id='flightNumber' type='hidden' name='flightNumber' value="
										+ returnedFlights.get(i).flight_ID
										+ "><input type='submit' name='Buy' value='Buy'></form></td>");
							} else if (returnedFlights.get(i).is_connection > 0) {

								if (ticketClass.equals("coach")) {
									cost = (returnedFlights.get(i).coach_cost + returnedFlights.get(i + 1).coach_cost)
											* numberTickets;
								} else if (ticketClass.equals("businesss")) {
									cost = (returnedFlights.get(i).business_cost + returnedFlights.get(i + 1).business_cost)
											* numberTickets;
								} else {
									cost = (returnedFlights.get(i).first_cost + returnedFlights.get(i + 1).first_cost)
											* numberTickets;
								}

								out.println("<tr><td>" + returnedFlights.get(i).flight_ID.toString() + "<br>"
										+ returnedFlights.get(i + 1).flight_ID.toString() + "</td><td>$" + cost.toString()
										+ "</td><td>"

										+ returnedFlights.get(i).origin + " at "
										+ FormatDate.readable(returnedFlights.get(i).departure_time) + "<br>"
										+ returnedFlights.get(i + 1).origin + " at "
										+ FormatDate.readable(returnedFlights.get(i + 1).departure_time) + "</td><td>"

										+ returnedFlights.get(i).destination + " at "
										+ FormatDate.readable(returnedFlights.get(i).arrival_time) + "<br>"
										+ returnedFlights.get(i + 1).destination + " at "
										+ FormatDate.readable(returnedFlights.get(i + 1).arrival_time) + "</td><td>"
										+ "<form method='push' action='MapPage.jsp'><input id='from' type='hidden' name='from' value='"
										+ returnedFlights.get(i).origin + "'><input id='to' type='hidden' name='to' value='"
										+ returnedFlights.get(i).destination
										+ "'>"
										+ "<form method='push' action='MapPage.jsp'><input id='from1' type='hidden' name='from1' value='"
										+ returnedFlights.get(i+1).origin + "'><input id='to1' type='hidden' name='to1' value='"
										+ returnedFlights.get(i+1).destination
										+ "'><input type='submit' name='Map' value='Map'></form>"
										+ "</td><td><form method='post' action='Checkout.jsp'><input id='flightNumber' type='hidden' name='flightNumber' value="
										+ returnedFlights.get(i).flight_ID.toString() + ","
										+ returnedFlights.get(i + 1).flight_ID.toString()
										+ "><input type='submit' name='Buy' value='Buy'></form></td>");
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
</body>
</html>