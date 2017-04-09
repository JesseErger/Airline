<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*"%>
<%
	String added_by = "";
	try{
		String model = request.getParameter("model");
		int first_class = Integer.parseInt(request.getParameter("first_class"));
		int business_class = Integer.parseInt(request.getParameter("business_class"));  
		int coach_class = Integer.parseInt(request.getParameter("coach_class"));
		String model = request.getParameter("model").toString();
        String acc_type = session.getAttribute("Account_Type").toString();
        added_by = session.getAttribute("Username").toString();
        String date_of_departure = session.getAttribute("date_of_departure").toString().concat(" ");
        String time_of_departure =  session.getAttribute("time_of_departure").toString();
        String arrival_date = session.getAttribute("arrival_date").toString().concat(" ");
        String arrival_time = session.getAttribute("arrival_time").toString();
     	//needs to be formatted YYYY-MM-DD HH:MM:SS
        String date_time = date_of_departure.concat(time_of_departure.concat(":00"));
        String date_time_arrival = arrival_date.concat(arrival_time.concat(":00"));        
        String destination = request.getParameter("destination");
        String origin = request.getParameter("origin");
        
        //String plane_ID = request.getParameter("plane_ID");
        if(!acc_type.equals("admin"))){
        	out.println("You dont have permission to add a flight!");
        }
        else{
        	Statement stmt = null;  
        	ResultSet resultset_ids = null;
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
        	stmt = conn.createStatement();
        	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        	
			String sql_ids = String.format("SELECT plane_ID FROM `sys`.`plane` WHERE model = '%s'", model);
			resultset_ids = stmt.executeQuery(sql_ids);
			resultset_ids.next();
        	String plane_ID = resultset_ids.getString(1);
        	
        	
        	//

	        added_by = session.getAttribute("Username").toString();
	        String sql = String.format("INSERT INTO `sys`.`flight` (`added_by`, `destination`, `departure_time`, `arrival_time`,`origin`)" + 
	        		"VALUES ('%s', '%s', '%s', '%s', '%s')", added_by, destination, date_time, date_time_arrival, origin);
	        stmt.executeUpdate(sql);
	        out.print("Flight has been added! Redirecting you to your homepage");
	        response.setHeader("Refresh", "5;url=Account.jsp");

        }     
	}
	catch(Exception e) {
		out.println("There was a problem adding the plane, please try again!"); 
		out.println(e);
		response.setHeader("Refresh", "5;url=NewFlight.jsp");
	} 

%>