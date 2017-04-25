<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
/* Full-width input fields */

body{
  background-image: url(plane2.PNG);
}

h2{
   color:orange;
}
b{
  color:black;
  font:bold;
}
input[type=text], input[type=password] {
    width: 250%;
    padding: 10px 15px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: green;
    color: white;
    padding: 10px 15px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 80%;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 10px 15px;
    background-color: red;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn,.signupbtn {
    float: left;
    width: 25%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
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
       width: 25%;
    }
}
</style>
<body>

<h2><center>Customer sign up</center></h2>
<hr />

<form action="CreateUser.jsp" style="border:1px solid #ccc">
  <div class="container">
  <table>
  <tr>
   <td> <label><b>Email</b></label></td>
    <td><input type="text" placeholder="Enter Email" name="email" required></td>
</tr>
<tr>
   <td> <label><b>Password</b></label></td>
   <td> <input type="password" placeholder="Enter Password" name="password" required></td>
</tr>
<tr>
   <td> <label><b>Repeat Password</b></label></td>
   <td> <input type="password" placeholder="Repeat Password" name="ConfirmPassword" required></td>
</tr>   
<tr>    
   <td> <label><b>Username</b></label></td>
    <td><input type="text"  placeholder="Enter username" name = "username" required></td>
</tr>   
<tr> 
    <td><label><b>First Name</b></label></td>
    <td><input type="text"  placeholder="Enter First Name" name = "first" required></td>
    </tr>
<tr >  
  <td>  <label><b>Lirst Name</b></label></td>
  <td>  <input type="text"  placeholder="Enter Last Name" name = "last" required></td></tr>
  </table>
    <input type="checkbox" checked="checked"> Remember me
   
   
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

    <div class="clearfix">
      <button type="reset" class="cancelbtn">Clear All</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>

</body>
</html>