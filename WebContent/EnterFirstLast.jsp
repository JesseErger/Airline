<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Please Enter customer's firstname and lastname</h1>
<hr />
<form method="post" action="SearchByName.jsp">
<center>
           <%
				try {
					if ("True".equals(session.getAttribute("Cant_find").toString()))
						out.println("Cannot find the customer! Please try again.");
				} catch (Exception e) {
				}
			%>


 <div  class = "table1">
 <table>
 <tr>
						<td>Enter Customer's firstname: </td>
						<td><input type="text" name="firstname" required /></td>
					</tr>
					<tr>
						<td>Enter Customer's lastname:</td>
						<td><input type="text" name="lastname" required /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Enter" /> &nbsp;&nbsp; <input type="reset" value="Reset" />
						</td>
					</tr>
</table>					
 
 </div>
 </center>
 </form>

</body>
</html>