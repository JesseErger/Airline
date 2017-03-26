<%-- 
    Document   : Create User
    Created on : 15 March, 2017

--%>
 
<%@ page import ="java.sql.*"  language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.io.*,java.util.*" %>
<%
	try{
		String first = request.getParameter("first");   
        String last = request.getParameter("last");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(first.length()>0){
	        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");
	        Statement stmt = null;
	        stmt = conn.createStatement();
	        
	        String sql = String.format("INSERT INTO `sys`.`users` (`first`, `last`, `username`, `password`, `acc_type`, `email`)" + 
	        		"VALUES ('%s', '%s', '%s', '%s', '%s', '%s')", first, last, username, password, "customer", email);
	        
	        
	        stmt.executeUpdate(sql);
        }
        
        
	}
	catch(Exception e) {
		
	}

%>