<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {

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
<title>Create user</title>
</head>
<body>
	<form method="post" action="CreateUser.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2">
				<thead>
					<tr>
						<th colspan="2">Create Account</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>First Name</td>
						<td><input type="text" name="first" required /></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="last" required /></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="email" required /></td>
					</tr>
					<tr>
						<td>Username</td>
						<td><input type="text" name="username" required /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" required /></td>
					</tr>
					<tr>
						<td>Confirm Password</td>
						<td><input type="password" name="ConfirmPassword" required /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Submit" /> &nbsp;&nbsp; <input type="reset" value="Reset" />
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
</body>
</html>