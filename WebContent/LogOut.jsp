<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*"%>


<%try{
	session.invalidate();
	response.setHeader("Location", "http://localhost:8080/com.airline.web.index/Login.jsp");
	response.sendRedirect("http://localhost:8080/com.airline.web.index/Login.jsp");
	
}
catch(Exception e){
	
}
%>
