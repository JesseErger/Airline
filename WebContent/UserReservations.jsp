<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,org.joda.time.*"%>



<table border="1" cellpadding="5" cellspacing="2">
	<thead>
		<tr>
			<th colspan="7">Results</th>
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
						out.println("<tr><td>Reservation ID</td><td>Cost</td><td>Origin</td><td>Destination</td><td>Seating Class</td><td>Date of Departure</td><td>Cancel Reservation</td></tr>");
						boolean tf = true;

						while (tf) {
							
							String res_id = rs.getString("reservation_ID");
							String f_id = rs.getString("flight_ID");
							String cost = rs.getString("amount");
							String seating_class = rs.getString("seating_class");
							String checked_in = rs.getString("checked_in").toString();
							
							
							String get_dest_dep = String.format("SELECT * FROM `sys`.`flight` where flight_ID = '%s'",f_id);
							Statement stmt1 = null;
					        stmt1 = conn.createStatement();
					        ResultSet rs1 = null;
							rs1 = stmt1.executeQuery(get_dest_dep);
							rs1.next();
							String origin = rs1.getString("origin");
							String dest = rs1.getString("destination");
							
							
							
							String nextpage = "RefundReservation.jsp";
							String cancel_button = "<td><form method='post' action='" + nextpage + "'><input type='submit' name='res' value='" + "Reservation_"+res_id + "'></td>";
							String row = "";
							DateTime cur = new DateTime();
							
							DateTime depart = new DateTime(rs.getTimestamp("date_of_depature"));
					        DateTime limit = cur.plusHours(24);
							if(checked_in.equals("0") && limit.isBefore(depart) ){
								row = "<tr><td>"+res_id+"</td><td>"+cost+"</td><td>"+origin+"</td><td>"+dest+"</td><td>"+seating_class+"</td><td>" + rs.getTimestamp("date_of_depature") + "</td>" +  cancel_button  +  "</tr>";
							}
							else{
								row = "<tr><td>"+res_id+"</td><td>"+cost+"</td><td>"+origin+"</td><td>"+dest+"</td><td>"+seating_class+"</td><td>" + rs.getTimestamp("date_of_depature") + "</td>"+ "<td>Not avaialable</td>" +"</tr>";
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
