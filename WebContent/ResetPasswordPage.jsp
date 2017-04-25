<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reset Password</title>
</head>
<style>
/* Full-width input fields */

body{
  background-image: url(plane2.PNG);
  font-family: Verdana,sans-serif;
}

h1{
   text-align:center;
}
b{
  color:black;
  font:bold;
}
input[type=text], input[type=password] {
    width: 100%;
    padding: 10px 15px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: red;
    color: white;
    padding: 10px 15px;
    margin: 8px 0;
    border: 1px solid black;
    cursor: pointer;
    width: 80%;
}

.signupbtn{
   background-color: #318380;
}


/* Float cancel and signup buttons and add an equal width */
.cancelbtn,.signupbtn {
    float: center;
    width: 15%;
    margin:auto;
}

/* Add padding to container elements */
.container {
    padding: 10px;
}


/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
td{
  font-size: 20px;
  font-weight: bold;
  color:#060C18;
}
</style>
<body>
	<form method="post" action="ResetPassword.jsp" style="border:1px solid #ccc">
	<div class="container">
		<h1>Forget Password? Don't worry!!!</h1>
		<hr />
		<center>
			<table cellpadding="5" cellspacing="10">
				<thead>
					<tr>
						<th colspan="2">Reset Password</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>Username</td>
						<td><input type="text" name="username" required /></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="email" required /></td>
					</tr>
				</tbody>
			</table>
			
						<div class="clearfix">
                          <button type="reset" class="cancelbtn">Clear</button>
                            <button type="submit" class="signupbtn">Reset Password</button>
                        </div>
				
		</center>
		</div>
	</form>
</body>
</html>