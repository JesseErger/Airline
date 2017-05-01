<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,org.joda.time.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {
   font-family: Verdana,sans-serif;
   background-image:url(createManager-B.PNG)

}

h1 {
	text-align: center;
	color: red;
}

td {
	font-weight: bold;
	font-style: center
}

#flight{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 50%;
    color:black;
  
    
}

#flight td, #flight th {
    border: 1px solid #ddd;
    padding: 10px;
    border: 5px;
}



#flight th {
    padding-top: 20px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #DAC2B2;
    color: black;
}

input[type=text], input[type=password] {
    width: 75%;
    padding: 10px 15px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}



h1 {
	text-align: center;
	color: red;
}

#sub{
  background-color: green;
    color: white;
    padding: 10px 15px;
    margin: 8px 0;
    border: none;
    width: 25%;
}

#res{
background-color: red;
    color: white;
    padding: 10px 15px;
    margin: 8px 0;
    border: none;
    width: 25%;

}
#left{
  text-align: right;
}

#right{
  text-align: left;
}


a:hover {
	background-color: blue;
	color: white;
	text_decoration: underline;
	font-weight: bold;
}

a:active {
	background-color: red;
}
</style>
<title>Add Flight</title>
</head>
<body>
	<form method="post" action="CreateFlight.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2" id="flight">
				<thead>
					<tr>
						<th colspan="2">Add Flight</th>
					</tr>
				</thead>
				<%
				String frequency = request.getParameter("frequency").toString();
				String origin = request.getParameter("origin").toString();
				String destination = request.getParameter("destination").toString();
				String date_of_departure = request.getParameter("date_of_departure").toString();
				String time_of_departure = request.getParameter("time_of_departure").toString();
				String arrival_date = request.getParameter("arrival_date").toString();
				String arrival_time = request.getParameter("arrival_time").toString();
				
				session.setAttribute("origin", origin);
				session.setAttribute("destination", destination);
				session.setAttribute("date_of_departure", date_of_departure);
				session.setAttribute("time_of_departure", time_of_departure);
				session.setAttribute("arrival_date", arrival_date);
				session.setAttribute("arrival_time", arrival_time);
				session.setAttribute("frequency", frequency);
				
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
		        DateTime depart_temp = new DateTime(year_d,  month_d,  day_d,  hour_d,  min_d);
		        DateTime arrival_temp = new DateTime(year_d,  month_d,  day_d,  hour_d,  min_d); 
		        DateTime arrive = new DateTime(year_a,  month_a,  day_a,  hour_a,  min_a);
		        //Interval intv = new Interval(depart, arrive);        
		        //String duration = Long.toString(dur.getStandardMinutes()); 
				
				
				
					/* try { */
						
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
						Statement stmt = null;
				        stmt = conn.createStatement();

						ArrayList<String> avail_planes = new ArrayList<String>();
						ArrayList<String> all_planes = new ArrayList<String>();
						ArrayList<String> not_avail_planes = new ArrayList<String>();
						boolean are_more_dates = true;
					while(arrival_temp.isBefore(arrive) ){
						if(frequency.equals("once")){
							arrival_temp = arrive.plusHours(5); //5 hour buffer
						}
						else if(frequency.equals("daily")){
							arrival_temp = arrival_temp.plusHours(29);//5 hour buffer
							depart_temp = depart_temp.plusHours(24);
						}
						else if(frequency.equals("weekly")){
							arrival_temp = arrival_temp.plusDays(7);//5 hour buffer
							arrival_temp = arrival_temp.plusHours(5);//5 hour buffer
							depart_temp = depart_temp.plusDays(7);
						}
						else if(frequency.equals("monthly")){
							arrival_temp = arrival_temp.plusMonths(1);//5 hour buffer
							arrival_temp = arrival_temp.plusHours(5);//5 hour buffer
							depart_temp = depart_temp.plusMonths(1);
						}
						
						PreparedStatement pst2 = conn.prepareStatement("Select plane_ID from plane");
						ResultSet resultset2 = pst2.executeQuery();
						PreparedStatement pst1 = conn.prepareStatement("Select plane_ID,departure_time,arrival_time from flight");
						ResultSet resultset1 = pst1.executeQuery();
						ResultSetMetaData resultsetmd1 = resultset1.getMetaData();
						int size1 = resultsetmd1.getColumnCount();	
						for(int z = 0; resultset2.next();z++){
							String p_id = resultset2.getString(1);
							all_planes.add(p_id);
						}
						for(int i = 0; resultset1.next();i++){
							String p_id1 = resultset1.getString(1);
							String doa = resultset1.getString(2).split(" ")[0];
							String toa = resultset1.getString(2).split(" ")[1];
							String [] dep_date_parts1 = doa.split("-");
							String [] dep_time_parts1 = toa.split(":");
					        int year_d1 = Integer.parseInt(dep_date_parts1[0]);
					        int month_d1 = Integer.parseInt(dep_date_parts1[1]);
					        int day_d1 = Integer.parseInt(dep_date_parts1[2]);
					        int hour_d1 = Integer.parseInt(dep_time_parts1[0]);
					        int min_d1 = Integer.parseInt(dep_time_parts1[1]);
							String doa1 = resultset1.getString(3).split(" ")[0];
							String toa1 = resultset1.getString(3).split(" ")[1];
							String [] arr_date_parts1 = doa1.split("-");
							String [] arr_time_parts1 = toa1.split(":");
					        int year_a1 = Integer.parseInt(arr_date_parts1[0]);
					        int month_a1 = Integer.parseInt(arr_date_parts1[1]);
					        int day_a1 = Integer.parseInt(arr_date_parts1[2]);
					        int hour_a1 = Integer.parseInt(arr_time_parts1[0]);
					        int min_a1 = Integer.parseInt(arr_time_parts1[1]);
					        DateTime depart1 = new DateTime(year_d1,  month_d1,  day_d1,  hour_d1,  min_d1);
					        DateTime arrive1 = new DateTime(year_a1,  month_a1,  day_a1,  hour_a1,  min_a1);
					        if( !arrival_temp.isBefore(depart1) && !depart_temp.isAfter(arrive1) ){
					        	not_avail_planes.add(p_id1);
					        }
					        
						}
						
					}//end while
						for(int y =0;y<all_planes.size();y++){
							if(!not_avail_planes.contains(all_planes.get(y))){
								avail_planes.add(all_planes.get(y));
							}
						}
						String get_models = "SELECT model,plane_ID FROM `sys`.`plane` where plane_ID = 0";//Not valid plane ID
						for(int x = 0; x<avail_planes.size();x++){
							get_models += " or plane_ID = " + avail_planes.get(x);	
						}
						ResultSet resultset = stmt.executeQuery(get_models);
						ResultSetMetaData resultsetmd = resultset.getMetaData();
						int size = resultsetmd.getColumnCount();
						session.setAttribute("available_plane", "True");
						if (size == 0){
							session.setAttribute("available_plane", "False");
						}
				%>
					Select from available planes
					<select name = 'model' id ='model'>
						<%
							while (resultset.next()) {
						%>
						<option><%=resultset.getString(1)+" ID:"+resultset.getString(2)%></option>
						<%
							}
						%>
						
					</select>
				<%-- <%
					} catch (Exception e) {
						out.println("INVALID ->" + e);
					}					
				%> --%>
				
				<tbody>					
					<tr >
						<td id="left">First Class Pricing</td>
						<td><input type="text" name="first_cost" required /></td>
					</tr>
					<tr>
						<td id="left">Business Class Pricing</td>
						<td><input type="text" name="business_cost" required /></td>
					</tr>
					<tr>
						<td id="left">Coach Pricing</td>
						<td><input type="text" name="coach_cost" required /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input id="sub" type="submit"
							value="Submit" /> &nbsp;&nbsp; <input id="res"  type="reset" value="Reset" />
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
</body>
</html>
