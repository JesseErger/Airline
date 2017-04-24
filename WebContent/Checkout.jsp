<%@ 
page import="java.sql.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"
	import="java.io.*,java.util.*" import="classes.sendMail"%>

<%
	//very simple version of checking out, probably will crash
	//must be signed in
	//String flightNumber = session.getAttribute("flightNumber").toString();
	String flightNumber = request.getParameter("flightNumber");
	session.setAttribute("flightNumber", flightNumber);
	List<String> flightList = Arrays.asList(flightNumber.split(","));
	int cost = 0;
	for (int i = 0; i < flightList.size(); i++) {
		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");

		// gets direct flights
		String sql = "Select * from flight where flight_id=?";
		PreparedStatement flights = conn.prepareStatement(sql);
		flights.setString(1, flightList.get(i));
		ResultSet rs = flights.executeQuery(); // all direct flights
		if (rs.next()) {
			cost += rs.getInt("coach_cost");
		}
	}
	session.setAttribute("totalCost", cost);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkout</title>
</head>
<body>
	<form method="post" action="Payment.jsp">
		<table border="1" cellpadding="5" cellspacing="2">
			<thead>
				<tr>
					<th colspan="2">Payment Info</th>
				</tr>
				<tr>
					<th colspan="2">Your total is: $<%
						out.print(cost);
					%></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>Card Number</td>
					<td><input type="text" name="credit_card" required /></td>
				</tr>
				<tr>
					<td>First</td>
					<td><input type="text" name="first_name" required /></td>
				</tr>
				<tr>
					<td>Last</td>
					<td><input type="text" name="last_name" required /></td>
				</tr>
				<tr>
					<td>Expiration Date(MM/YY)</td>
					<td><input type="text" name="expiration" required /></td>
				</tr>
				<tr>
					<td>CVV</td>
					<td><input type="text" name="CVV" required /></td>
				</tr>
				<tr>
					<td>Street Address</td>
					<td><input type="text" name="street_address" required /></td>
				</tr>
				<tr>
					<td>City</td>
					<td><input type="text" name="city" required /></td>
				</tr>
				<tr>
					<td>State</td>
					<td><input type="text" name="State" required /></td>
				</tr>
				<tr>
					<td>Zip</td>
					<td><input type="text" name="zip" required /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Confirm Payment" /> &nbsp;&nbsp; <input type="reset"
						value="Reset" /></td>
				</tr>


				<tr>
					<td><a href="ResetPasswordPage.jsp" title="reset password">forget
							password?</a></td>
					<td><a href="ForgetUsernamePage.jsp" title="forget username">forget
							username?</a></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>