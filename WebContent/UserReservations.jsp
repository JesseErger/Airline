<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*" %>



<table border="1" cellpadding="5" cellspacing="2">
	<thead>
		<tr>
			<th colspan="5">Results</th>
		</tr>
	</thead>

	<tbody>


			<%
				
				try{	
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
					
			        Statement stmt = null;
			        stmt = conn.createStatement();
			        ResultSet rs = null;
			        String username = session.getValue("Username").toString();
			        	String get_reservations = String.format("SELECT * FROM `sys`.`reservations` where username = '%s'",username);
			        	rs = stmt.executeQuery(get_reservations);
	        
			      
					if (!rs.next()) {
						out.println("No Reservations found");
						
					} else {
						out.println("<tr><td>Reservation ID</td><td>Seating Class</td><td>Date of Departure</td><td>Checked In</td><td>Cancel Reservation</td></tr>");
						boolean tf = true;

						while (tf) {
							String res_id = rs.getString("reservation_ID");
							String seating_class = rs.getString("seating_class");
							String checked_in = rs.getString("checked_in").toString();
							String nextpage = "RefundReservation.jsp";
							String cancel_button = "<td><form method='post' action='" + nextpage + "'><input type='submit' name='res' value='" + "Reservation_"+res_id + "'></td>";
							String row = "";
							if(checked_in.equals("0")){
								row = "<tr><td>"+res_id+"</td><td>"+seating_class+"</td><td>" + rs.getTimestamp("date_of_depature") + "</td>"+ "<td>No</td>" +  cancel_button  +  "</tr>";
							}
							else{
								row = "<tr><td>"+res_id+"</td><td>"+seating_class+"</td><td>" + rs.getTimestamp("date_of_depature") + "</td>"+ "<td>Yes</td>" + "<td>Not avaialable</td>" +"</tr>";
							}
							out.println(row);
									
						tf = rs.next();
						}
					} 

				} catch (Exception e) {
					out.println(e.toString());
				}
			%>
		

	</tbody>
</table>
