package classes;

import java.io.*;
import java.util.*;
import java.sql.*;

public class SearchFlights {
	public static ResultSet search(String to, String from, String date, String ticketClass)
			throws ClassNotFoundException, SQLException {
		// String to = request.getParameter("to");
		// String from = request.getParameter("from");
		// String date = request.getParameter("date");
		// String ticketClass = request.getParameter("class");

		ResultSet rs;

		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");
		String sql = "Select * from flight where origin=? and destination=? and " + "departure_time BETWEEN '" + date
				+ " 00:00:00' AND '" + date + " 23:59:59' and ";
		if (ticketClass.equals("first")) {
			sql += "first_vacancy > 0";
		} else if (ticketClass.equals("business")) {
			sql += "business_vacancy > 0";
		} else {
			sql += "coach_vacancy > 0";
		}
		PreparedStatement flights = conn.prepareStatement(sql);
		flights.setString(1, from);
		flights.setString(2, to);
		rs = flights.executeQuery();

		return rs;

	}
}
