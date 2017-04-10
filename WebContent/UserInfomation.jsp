<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>
<%
	String username = "";
	String first_name = "";
	String last_name = "";
	String email = "";
	String acc_type = "";
	String password = "";
	try {
		username = session.getAttribute("Username2").toString();
		first_name = session.getAttribute("First_Name2").toString();
		last_name = session.getAttribute("Last_Name2").toString();
		email = session.getAttribute("Email2").toString();
		acc_type = session.getAttribute("Account_Type2").toString();
		password = session.getAttribute("Password2").toString();
	} catch (Exception e) {
		
		
		
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
 <div = "table1">
   <table>
   <tr>
   <td>Username: </td>
   <td><% out.println(username); %></td>
   </tr>
   <tr>
   <td>Password: </td>
   <td><% out.println(password); %></td>
   </tr>
   <tr>
   <td>Firstname: </td>
   <td><% out.println(first_name); %></td>
   </tr>
   <tr>
   <td>last_name</td>
   <td><% out.println(last_name); %></td>
   </tr>
   <tr>
   <td>email</td>
   <td><% out.println(email); %></td>
   </tr>
   
   
   </table>
 </div>
 </center>

</body>
</html>