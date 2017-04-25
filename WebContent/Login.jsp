
<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

button {
    background-color: grey;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}
body {
	background-image: url(plane2.PNG);
}

h1 {
	text-align: center;
	color: white;
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

.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: ;
    margin: 5% auto 5% auto; /* 5% from the top, 15% from the bottom and centered */
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

.imgcontainer {
    text-align: center;
    margin: 12px 0 12px 0;
    position: relative;
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}

.createAccount{
   position: absolute;
   top: 30px;
   right: 30px
}

.login{
position: absolute;
top :20px;
left: 20px;
}


</style>
<title>Login</title>

</head>
<body>
	<form method="post" action="validate.jsp">
	
		<h1>Welcome to Iowa Airline</h1>
		<div class ="createAccount">
		<table>
			<tr>
				<td>Don't have an account?</td>
				<td><a href="CreateUserPage.jsp" title="create a new account">click
						here</a></td>
			</tr>
		</table>
	</div>
		<div class="login"><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button></div>
		<hr />
		   <%
				try {
					if ("True".equals(session.getAttribute("Invalid_Login").toString()))
						out.println("<center>Invalid Login, please try again!</center>");
				} catch (Exception e) {
				}
			%>
		<div id="id01" class = "modal">
		<center>
		 <div class="modal-content animate" >
			
			<p><center><img id="myImg" src="plane.PNG" width="300" height="200" ></center></p>
			<table border="1" cellspacing="2">
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
						<td><a href="ResetPasswordPage.jsp" title="reset password">forget
								password?</a></td>
						<td><a href="ForgetUsernamePage.jsp" title="forget username">forget
								username?</a></td>
					</tr>
				</tbody>
			</table>
			</div>
		</center>
		</div>
	</form>
	
	<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>

