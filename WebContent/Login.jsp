
<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {
	background-image: url(plane2.PNG);
}

h1 {
	text-align: center;
	color: red;
}

td {
	font-weight: bold;
	font-style: center
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
<title>Login</title>

</head>
<body>
	<form method="post" action="validate.jsp">
		<h1>Welcome to Iowa Airline!!</h1>
		<hr />
		<center>
			<%
			try{
			if("True".equals(session.getAttribute("Invalid_Login").toString()))
        	out.println("Invalid Login, please try again!");
			}
			catch(Exception e){
			}
			
        	%>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Login Here</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>Username</td>
						<td><input type="text" name="username" required /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" required /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Login" /> &nbsp;&nbsp; <input type="reset" value="Reset" />
						</td>
					</tr>
				
				
					<tr>
					<td>
					<a href = "ResetPasswordPage.jsp" title ="reset password">forget password?</a>
					
					</td>
					<td>
					<a href = "ForgetUsernamePage.jsp" title = "forget username">forget username?</a>
					</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
	<div>
		<table>
			<tr>
				<td>Don't have an account?</td>
				<td><a href="NewUserPage.jsp" title="create a new account">click
						here</a></td>
			</tr>
		</table>
	</div>
</body>
</html>