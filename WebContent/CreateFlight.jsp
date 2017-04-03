<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*"%>
<%
	String added_by = "";
	
	try{
		   
        String acc_type = session.getAttribute("Account_Type").toString();
        String date_of_departure = request.getParameter("date_of_departure").concat(" ");
        String time_of_departure = request.getParameter("time_of_departure");
     	//needs to be formatted YYYY-MM-DD HH:MM:SS
        String date_time = date_of_departure.concat(time_of_departure.concat(":00"));
        String destination = request.getParameter("destination");
        
        int Plane_ID = Integer.parseInt(request.getParameter("Plane_ID"));
        String sql1 = String.format("INSERT INTO `sys`.`flights` (`added_by`, 'destination', `date_of_departure`, `Plane_ID`)" + 
        		"VALUES ('%s', '%s', '%s', '%d')", added_by, destination, date_time, Plane_ID);
        if(!acc_type.equals("admin") && !acc_type.equals("manager")){
        	out.println("You dont have permission to add a flight!");
        }
        else{
	        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
	        Statement stmt = null;
	        stmt = conn.createStatement();
	        added_by = session.getAttribute("Username").toString();
	        String sql = String.format("INSERT INTO `sys`.`flights` (`added_by`, 'destination', `date_of_departure`, `Plane_ID`)" + 
	        		"VALUES ('%s', '%s', '%s', '%s')", added_by, destination, date_time, Plane_ID);
	        stmt.executeUpdate(sql);
	        out.print("Flight has been added! Redirecting you to your homepage");
	        response.setHeader("Refresh", "5;url=Account.jsp");
        }     
	}
	catch(Exception e) {
		String date_of_departure = request.getParameter("date_of_departure").concat(" ");
        String time_of_departure = request.getParameter("time_of_departure");
     	//needs to be formatted YYYY-MM-DD HH:MM:SS
        String date_time = date_of_departure.concat(time_of_departure.concat(":00"));
     	
		out.println("There was a problem adding the plane, please try again!" + date_time); 
		out.println(e.getMessage());
		//response.setHeader("Refresh", "5;url=NewFlight.jsp");
	}

%>