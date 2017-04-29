<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String loged_out = "";
    
	try {
		loged_out = session.getAttribute("loged_out").toString();
	} catch (Exception e) {
		// Are not logged in/ invalid session
		String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
		response.sendRedirect(site);
		return;
	}
	if (loged_out.equals("")) {
		String site = new String("http://localhost:8080/com.airline.web.index/Login.jsp");
		response.sendRedirect(site);
		return;
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update your password!</title>
</head>
<style>
body{
  background-image: url(plane2.PNG);
  font-family: Verdana,sans-serif;
}

#flight{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 60%
}

#flight td, #flight th {
    border: 1px solid #ddd;
    padding: 10px;
    border: 5px;
}

#flight tr:hover {background-color: #ddd;}

#flight th {
    padding-top: 30px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #69C830;
    color: white;
}

input[type=text], input[type=password] {
    width: 80%;
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
  text-align: center;
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
<body>

	<form method="post" action="ChangePassword.jsp">
		<h1>Change Password</h1>
		<hr />
		<center>
			<table border="1" cellpadding="5" cellspacing="2" id="flight">
				<thead>
					<tr>
						<th colspan="2">Change Password</th>
					</tr>
				</thead>

				<tbody>
				 
					<tr>
						<td id="left">Verify current password</td>
						<td><input type="password" name="currentPassword" required /></td>
					</tr>
					<tr>
						<td id="left">New password</td>
						<td><input type="password" name="newPassword" required /></td>
					</tr>
					<tr>
						<td id="left">Confirm New password</td>
						<td><input type="password" name="confirmNewPassword" required /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input id="sub" type="submit"
							value="Submit" /> &nbsp;&nbsp; <input id="res" type="reset" value="Reset" />
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>

</body>
</html>