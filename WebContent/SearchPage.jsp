<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
  background-image: url(plane2.PNG);
  font-family: Verdana,sans-serif;
}

#flight{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 50%;
  
    
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
    width: 25%;
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
<title>Search</title>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/cupertino/jquery-ui.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
</script>
</head>
<body>
	<form method="post" action="Search.jsp">
		<center>
			<table border="1" cellpadding="5" cellspacing="2" id="flight">
				<thead>
					<tr>
						<th colspan="2">Search your flight</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td id="left">From</td>
						<td id="right"><select name="from">
								<option value="Chicago">Chicago</option>
								<option value="New York">New York</option>
								<option value="Iowa City">Iowa City</option>
								<option value="Des Moines">Des Moines</option>
								<option value="San Franscisco">San Franscisco</option>
						</select></td>
					</tr>
					<tr>
						<td id="left">To</td>
						<td id="right"><select name="to">
								<option value="Chicago">Chicago</option>
								<option value="New York" selected>New York</option>
								<option value="Iowa City">Iowa City</option>
								<option value="Des Moines">Des Moines</option>
								<option value="San Franscisco">San Franscisco</option>
						</select></td>
					</tr>
					<tr>
						<td id="left">Class</td>
						<td id="right"><select name="class">
								<option value="coach">Coach</option>
								<option value="business">Business</option>
								<option value="first">First</option>
						</select></td>
					</tr>
					<tr>
						<td id="left">Date</td>
						<td><input type="text" name="date" id="datepicker" required /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input id="sub" type="submit"
							value="Search" /> &nbsp;&nbsp; <input id ="res" type="reset" value="Reset" />
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
</body>
</html>