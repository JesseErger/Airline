<%-- 
    Document   : validate
    Created on : 15 March, 2017
    Author     : Chris Boswell
--%>
 
<%@ page import ="java.sql.*"  language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.io.*,java.util.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");    
        PreparedStatement pst = conn.prepareStatement("Select username,password from user where username=? and password=?");
        PreparedStatement account = conn.prepareStatement("Select * from user where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        account.setString(1, username);
        account.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) { 
        	session.setAttribute("logged in", "yes");
        	rs = account.executeQuery();
        	rs.next();
           out.println("Welcome " + rs.getNString("first"));
           out.println("Currently logged in as a " + rs.getNString("acc_type"));
           String site = new String("http://localhost:8080/com.ariline.web.index/Account.jsp");
           response.setHeader("Location", site); 
           response.sendRedirect(site);
        }        	
        else{
        	String site = new String("http://localhost:8080/com.ariline.web.index/Login.jsp");
        	response.sendRedirect(site);
           out.println("Invalid login credentials"); 
        }
        
           
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again" + e.getMessage());       
   }

%>