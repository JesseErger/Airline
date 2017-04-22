<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.* ,org.joda.time.*"
%>
<%
	String added_by = "";
	String model = "";
	String plane_ID = "";
	boolean err = false;
	try{
		model = request.getParameter("model").toString().split(" ")[0];
		plane_ID = request.getParameter("model").toString().split(":")[1];
		
	}
	catch (Exception e){
    	out.print("There were no abailable planes for your selection, please try again");
        response.setHeader("Refresh", "5;url=FlightInfo.jsp");
    	err = true;
	}
	
	try{
		int first_cost = Integer.parseInt(request.getParameter("first_cost"));
		int business_cost = Integer.parseInt(request.getParameter("business_cost"));  
		int coach_cost = Integer.parseInt(request.getParameter("coach_cost"));		
        String acc_type = session.getAttribute("Account_Type").toString();
        added_by = session.getAttribute("Username").toString();
        String date_of_departure = session.getAttribute("date_of_departure").toString().concat(" ");
	    String time_of_departure =  session.getAttribute("time_of_departure").toString();
        String arrival_date = session.getAttribute("arrival_date").toString().concat(" ");
        String arrival_time = session.getAttribute("arrival_time").toString();
        String destination = session.getAttribute("destination").toString();
        String origin = session.getAttribute("origin").toString();
        
        //out.println(first_cost+ destination +arrival_time +arrival_date +time_of_departure+ business_cost+ coach_cost +acc_type +added_by + date_of_departure);
	    /*
        String [] dep_date_parts =session.getAttribute("date_of_departure").toString().split("-");
        String [] dep_time_parts = time_of_departure.split(":");
        int year_d = Integer.parseInt(dep_date_parts[0]);
        int month_d = Integer.parseInt(dep_date_parts[1]);
        int day_d = Integer.parseInt(dep_date_parts[2]);
        int hour_d = Integer.parseInt(dep_time_parts[0]);
        int min_d = Integer.parseInt(dep_time_parts[1]);
        String [] arr_date_parts =session.getAttribute("arrival_date").toString().split("-");
        String [] arr_time_parts = arrival_time.split(":");
        int year_a = Integer.parseInt(arr_date_parts[0]);
        int month_a = Integer.parseInt(arr_date_parts[1]);
        int day_a= Integer.parseInt(arr_date_parts[2]);
        int hour_a = Integer.parseInt(arr_time_parts[0]);
        int min_a = Integer.parseInt(arr_time_parts[1]);      
        DateTime depart = new DateTime(year_d,  month_d,  day_d,  hour_d,  min_d);
        DateTime arrive = new DateTime(year_a,  month_a,  day_a,  hour_a,  min_a);
        Interval intv = new Interval(depart, arrive);
        Duration dur = new Duration(intv);
        String duration = Long.toString(dur.getStandardMinutes());
        */
     	//needs to be formatted YYYY-MM-DD HH:MM:SS
        String date_time = date_of_departure.concat(time_of_departure.concat(":00"));
        String date_time_arrival = arrival_date.concat(arrival_time.concat(":00"));         
                  
        if(!acc_type.equals("admin")){
        	out.println("You dont have permission to add a flight!");
        }
        else if (session.getAttribute("available_plane").equals("True")){
        	Statement stmt = null;  
        	ResultSet resultset_ids = null;
        	ResultSet rs = null;
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
        	stmt = conn.createStatement();
        	String get_caps = String.format("SELECT f_capacity, b_capacity, c_capacity FROM `sys`.`plane` where plane_ID = '%s'",plane_ID);
	        rs = stmt.executeQuery(get_caps);
        	rs.next();
        	
        	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	        added_by = session.getAttribute("Username").toString();
	        String sql = String.format("INSERT INTO `sys`.`flight` (`added_by`, `destination`, `departure_time`, `arrival_time`,`origin`, `first_cost`,`business_cost`,`coach_cost`, `plane_ID`,`business_vacancy`,`coach_vacancy`, `first_vacancy` )" + 
	        		"VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')", added_by, destination, date_time, date_time_arrival, origin, first_cost, business_cost, coach_cost, plane_ID, rs.getString("b_capacity"), rs.getString("c_capacity"), rs.getString("f_capacity") );
	        stmt.executeUpdate(sql);
	        out.print("Flight has been added! Redirecting you to your homepage");
	        response.setHeader("Refresh", "5;url=Account.jsp");

        }
	}
	catch(Exception e) {
		if(!err){
		out.println("There was a problem adding the plane, please try again!"); 
		out.println(e);
		response.setHeader("Refresh", "5;url=NewFlight.jsp");
		}
	} 
	

%>