<%@ 
page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*" import="classes.sendMail"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
    try{
    	String email = request.getParameter("email");
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
    	PreparedStatement pst = conn
				.prepareStatement("Select email from sys.users where and email=?");
    }
%>