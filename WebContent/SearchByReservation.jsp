<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*" %>



<table border="1" cellpadding="5" cellspacing="2">
	<thead>
		<tr>
			<th colspan="7">Results</th>
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
						Statement stmt1 = null;
				        stmt1 = conn.createStatement();
						ResultSet rs1 = null;
				        String get_name = String.format("SELECT * FROM `sys`.`users` where username = '%s'",rs.getString("username"));
				        rs1 = stmt1.executeQuery(get_name);
						rs1.next();
						out.println("<tr><td>Reservation ID</td><td>First Name</td><td>Last Name</td><td>Seating Class</td><td>Date of Departure</td><td>Checked In</td><td>Check In</td></tr>");
						boolean tf = true;

						while (tf) {
							String res_id = rs.getString("reservation_ID");
							String seating_class = rs.getString("seating_class");
							String firstname = rs1.getString("firstname");
							String lastname = rs1.getString("lastname");
							String checked_in = rs.getString("checked_in").toString();
							String cancel_button = "<td><form method='post' action='EditReservation.jsp'></td>";
							String checkin_button = "<td><form method='post' action='EditReservation.jsp'><input type='submit' name='checkin_res' value='" +res_id + "'></td>";
							String row = "";
							if(checked_in.equals("0")){
								row = "<tr><td>"+res_id+"</td><td>"+firstname+"</td><td>"+lastname+"</td><td>"+seating_class+"</td><td>" + rs.getTimestamp("date_of_depature") + "</td>"+ "<td>No</td>" +  checkin_button + "</tr>";
							}
							else{
								row = "<tr><td>"+res_id+"</td><td>"+firstname+"</td><td>"+lastname+"</td><td>"+seating_class+"</td><td>" + rs.getTimestamp("date_of_depature") + "</td>"+ "<td>Yes</td>" + "<td></td>" + "</tr>";
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