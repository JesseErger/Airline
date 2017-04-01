<%-- 
    Document   : validate
    Created on : 15 March, 2017
--%>

<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");    
        PreparedStatement pst = conn.prepareStatement("Select username,password from users where username=? and password=?");
        PreparedStatement account = conn.prepareStatement("Select * from users where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        account.setString(1, username);
        account.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) { 
        	session.setAttribute("Invalid_Login", "False");
        	session.setAttribute("logged_in", "yes");
        	rs = account.executeQuery();
        	rs.next();
        	session.setAttribute("Username", rs.getNString("username"));
        	session.setAttribute("First_Name", rs.getNString("firstname"));
        	session.setAttribute("Last_Name", rs.getNString("lastname"));
        	session.setAttribute("Email", rs.getNString("email"));
        	session.setAttribute("Account_Type", rs.getNString("acc_type"));
        	session.setAttribute("loged_out", "false");
           String site = new String("http://localhost:8080/com.airline.web.index/Account.jsp");
           response.setStatus(response.SC_MOVED_TEMPORARILY);
           response.setHeader("Location", site); 
            
           //response.sendRedirect(site);
        }        	
        else{
        	String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
           //out.println("Invalid login credentials - redirecting to hompeage"); 
           session.setAttribute("Invalid_Login", "True");
           session.invalidate();
           response.sendRedirect(site);
        }
        
           
   }
   catch(Exception e){
	         
   }
%>