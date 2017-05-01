<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Flight Pricing</title>
</head>
<style>
body{
background-image:url(Signup-B.jpg);
  font-family: Verdana,sans-serif;
  }
  
  #flight{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 80%;
    color:black;
    text-alian:center;
  
    
}

#flight td, #flight th {
    border: 1px solid #ddd;
    padding: 10px;
    border: 5px;
}

#flight tr:hover {background-color: #CCB3D3;}

#flight th {
    padding-top: 20px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #DAC2B2;
    color: black;
}
</style>
<body>


<table border="1" cellpadding="5" cellspacing="2" id=flight>
	<thead>
		<tr>
			<th colspan="9">Flights Available To Update</th>
		</tr>
	</thead>

	<tbody>


			<%
				try {
					
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
					
			        Statement stmt = null;
			        Statement stmt2 = null;
			        stmt = conn.createStatement();
			        stmt2 = conn.createStatement();
			        ResultSet rs = null;
			        ResultSet rs1 = null;
			        ArrayList <String> f_ids = new ArrayList();
			        ArrayList <String> fp_ids = new ArrayList();
		        	String get_flights = String.format("SELECT flight_ID FROM `sys`.`reservations`");
		        	String get_planes = String.format("SELECT plane_ID,flight_ID FROM `sys`.`flight`");
		        	rs = stmt.executeQuery(get_flights);
		        	rs1 = stmt2.executeQuery(get_planes);
		        	
			        	while(rs.next()){
			        		f_ids.add(rs.getString("flight_ID").toString());
			        	}
			        	while(rs1.next()){
			        		fp_ids.add(rs1.getString("flight_ID").toString()+"_"+rs1.getString("plane_ID").toString());	
			        	}
			        	ArrayList <String> avail_flight = new ArrayList();
			        	ArrayList <String> not_avail_flight = new ArrayList();
				        for(int x = 0; x<fp_ids.size();x++){
				        	String flight_fid = fp_ids.get(x).toString().split("_")[0];
				        	String flight_pid = fp_ids.get(x).toString().split("_")[1];
				        	if(!f_ids.contains(flight_fid)){
				        		avail_flight.add(flight_fid);
				        	}
				        	
				        }
				        Statement stmt3 = null;
				        stmt3 = conn.createStatement();
						ResultSet rs3 = null;
						String get_avail_updates = "Select * FROM `sys`.`flight` WHERE flight_ID = -1 ";
						for(int y = 0; y<avail_flight.size();y++){
							get_avail_updates = get_avail_updates + " or flight_ID = " +avail_flight.get(y);
						}
				        rs3 = stmt2.executeQuery(get_avail_updates);
						out.println("<tr><td>Flight ID</td><td>Origin</td><td>Destination</td><td>Departure</td><td>Arrival</td><td>First Class Pricing</td><td>Business Class Pricing</td><td>Coach Class Pricing</td><td>Update Pricing</td></tr>");
						while (rs3.next()) {
							String flight_id = rs3.getString("flight_ID");
							String plane_id = rs3.getString("plane_ID");
							String origin = rs3.getString("origin");
							String dest = rs3.getString("destination");
							String dep_time = rs3.getTimestamp("departure_time").toString();
							String arr_time = rs3.getTimestamp("arrival_time").toString();
							String first_cost = rs3.getString("first_cost").toString();
							String business_cost = rs3.getString("business_cost").toString();
							String coach_cost = rs3.getString("coach_cost").toString();
							String nextpage = "SelectNewPricing.jsp";
							
							String updateprice_button = "<td><form method='post' action='" + nextpage + "'><input type='submit' name='flight_id' value='" + "Flight_"+flight_id + "'></td>";
							String row = "";
							
							row = "<tr><td>"+flight_id+"</td><td>"+origin+"</td><td>"+dest+"</td><td>"+dep_time+"</td>"+"<td>"+arr_time+"</td>"+"<td>"+first_cost+"</td>"+"<td>"+business_cost+"</td>"+"<td>"+coach_cost+"</td>"+  updateprice_button  +  "</tr>";
							
							out.println(row);
						}
				} catch (Exception e) {
					out.println("No available flights to update!");
				} 
			%>
		

	</tbody>
</table>
</body>
</html>
