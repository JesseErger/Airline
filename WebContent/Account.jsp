 
<%@ page import ="java.sql.*"  language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" import="java.io.*,java.util.*" %>
<%
String username = session.getAttribute("Username").toString();
String first_name = session.getAttribute("First_Name").toString();
String last_name = session.getAttribute("Last_Name").toString();
String email = session.getAttribute("Email").toString();
String acc_type = session.getAttribute("Account_Type").toString();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCOUNT PAGE</title>
    </head>
    <body>
    		<center>
    		Welcome,
			<% 
			out.println(first_name); 
			%>
			</center>
    </body>
</html>