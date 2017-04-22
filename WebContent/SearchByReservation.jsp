<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*" %>



<table border="1" cellpadding="5" cellspacing="2">
	<thead>
		<tr>
			<th colspan="4">Results</th>
		</tr>
	</thead>

	<tbody>


			<%
				Boolean iscust = false;
				try {
					String f_name = "";
					String l_name = "";
					String reservationID = "5";
					
					
					try{
						f_name = request.getParameter("f_name");
						l_name = request.getParameter("l_name");
					}
					catch (Exception e){
					}
					try{
						reservationID = request.getParameter("res_num");
					}
					catch (Exception e){
					}

					Boolean by_name = false;
					if(!f_name.equals("")){
						by_name = true;
					}
					
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
					
			        Statement stmt = null;
			        stmt = conn.createStatement();
			        ResultSet rs = null;
			        if(by_name){
			        	String get_user = String.format("SELECT username FROM `sys`.`users` where firstname = '%s' and lastname = '%s'",f_name,l_name);
			        	rs = stmt.executeQuery(get_user);
			        	rs.next();
			        	String username = rs.getString("username");
			        	String get_reservations_byusername = String.format("SELECT * FROM `sys`.`reservations` where username = '%s'",username);
			        	rs = stmt.executeQuery(get_reservations_byusername);
			        }
			        else{
			        	String get_reservations = String.format("SELECT * FROM `sys`.`reservations` where reservation_ID = '%s'",reservationID);
			        	rs = stmt.executeQuery(get_reservations);
			        }
			        

			      

					if (!rs.next()) {
						out.println("No Reservations found");
						out.println(by_name);
						
					} else {
						out.println("<tr><td>Reservation ID</td><td>Date of Departure</td><td>Check In</td><td>Cancel Res</td></tr>");
						boolean tf = true;

						while (tf) {
							String res_id = rs.getString("reservation_ID");
							String cancel_button = "<td><form method='post' action='CancelReservation.jsp'><input type='submit' name='cancel_res' value='" +res_id + "'></td>";
							String checkin_button = "<td><form method='post' action='CheckIn.jsp'><input type='submit' name='checkin_res' value='" +res_id + "'></td>";
							out.println(
									"<tr><td>"+res_id+"</td><td>" + rs.getTimestamp("date_of_depature") + "</td>" +cancel_button + checkin_button + "</tr>");
						tf = rs.next();
						}
					} 

				} catch (Exception e) {
					out.println(e.toString());
				}
			%>
		

	</tbody>
</table>