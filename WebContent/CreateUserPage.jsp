<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
/* Full-width input fields */

body{
  background-image: url(Signup-B.PNG);
  font-family: Verdana,sans-serif;
}

h2{
   color:orange;
}
b{
  color:black;
  font:bold;
}
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 50%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
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

#myBtn{
  background-color:grey;
  width: 15%;
}

#pic{
  width:400px;
  height:300px;
}

.modal-header {
    padding: 2px 16px;
    background-color: #ADC2CA;
    color: black;
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
  <td>  <label><b>Last Name</b></label></td>
  <td>  <input type="text"  placeholder="Enter Last Name" name = "last" required></td></tr>
  </table>
    <input type="checkbox" checked="checked"> Remember me
   
   
    <p>By creating an account you agree to our <button id="myBtn">Terms & Privacy</button>.</p>
    <div id="myModal" class="modal">

  
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h3>Please read carefully!</h3>
      </div>
    <p><img src="Terms_P.PNG" id="pic"></p>
    
  </div>

</div>
    <div class="clearfix">
      <button type="reset" class="cancelbtn">Clear All</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
  
  <script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</form>

</body>
</html>