<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {
   font-family: Verdana,sans-serif;
   background-image:url(createManager-B.PNG)

}

h1 {
	text-align: center;
	color: red;
}

td {
	font-weight: bold;
	font-style: center
}

#flight{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 50%;
    color:black;
  
    
}

#flight td, #flight th {
    border: 1px solid #ddd;
    padding: 10px;
    border: 5px;
}

#flight tr:hover {background-color: #CCB3D3;}

#flight th {
    padding-top: 20px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #DAC2B2;
    color: black;
}

input[type=text], input[type=password] {
    width: 75%;
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
  text-align: right;
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
<title>Create manager</title>
</head>
<body>
	<form method="post" action="CreateUser.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2" id="flight">
				<thead>
					<tr>
						<th colspan="2">Create Manager Account</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td id="left">First Name</td>
						<td><input type="text" name="first" required /></td>
					</tr>
					<tr>
						<td id="left">Last Name</td>
						<td><input type="text" name="last" required /></td>
					</tr>
					<tr>
						<td id="left">Email</td>
						<td><input type="text" name="email" required /></td>
					</tr>
					<tr>
						<td id="left">Username</td>
						<td><input type="text" name="username" required /></td>
					</tr>
					<tr>
						<td id="left">Password</td>
						<td><input type="password" name="password" required /></td>
					</tr>
					<tr>
						<td id="left">Confirm Password</td>
						<td><input type="password" name="ConfirmPassword" required /></td>
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