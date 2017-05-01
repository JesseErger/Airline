package classes;

import java.io.*;
import java.util.*;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.sql.*;

public class SearchFlights {
	public static ArrayList<Flights> search(String to, String from, String date, String ticketClass,
			Integer numberTickets) throws ClassNotFoundException, SQLException {

		ArrayList<Flights> flightList = new ArrayList<Flights>();

		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Pwtemp01!");

		// gets direct flights
		String sql = "Select * from flight where origin=? and destination=? and departure_time BETWEEN '" + date
				+ " 00:00:00' AND '" + date + " 23:59:59' and ";
		sql = addClass(sql, ticketClass, numberTickets);
		PreparedStatement flights = conn.prepareStatement(sql);
		flights.setString(1, from);
		flights.setString(2, to);
		ResultSet rs = flights.executeQuery(); // all direct flights

		DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
		DateTime dt;
		DateTime at;
		String dts;
		String ats;
		while (rs.next()) {
			dts = rs.getTimestamp("departure_time").toString();
			dt = formatter.parseDateTime(dts.substring(0, dts.length() - 2));
			ats = rs.getTimestamp("arrival_time").toString();
			at = formatter.parseDateTime(ats.substring(0, ats.length() - 2));
			flightList.add(new Flights(rs.getInt("plane_ID"), rs.getString("origin"), rs.getString("destination"), dt,
					at, rs.getInt("first_cost"), rs.getInt("business_cost"), rs.getInt("coach_cost"),
					rs.getInt("flight_ID"), rs.getString("added_by"), rs.getInt("coach_vacancy"),
					rs.getInt("business_vacancy"), rs.getInt("first_vacancy"), 0));
		}

		// searches for connecting flights to the destination
		sql = "Select * from flight where origin=? and destination<>? and " + "departure_time BETWEEN '" + date
				+ " 00:00:00' AND '" + date + " 23:59:59' and ";
		sql = addClass(sql, ticketClass, numberTickets);
		flights = conn.prepareStatement(sql);
		flights.setString(1, from);
		flights.setString(2, to);
		ResultSet rs1 = flights.executeQuery();

		while (rs1.next()) {
			if (rs1.getString("destination").equals(to)) {
				dts = rs1.getTimestamp("departure_time").toString();
				dt = formatter.parseDateTime(dts.substring(0, dts.length() - 2));
				ats = rs1.getTimestamp("arrival_time").toString();
				at = formatter.parseDateTime(ats.substring(0, ats.length() - 2));
				flightList.add(new Flights(rs1.getInt("plane_ID"), rs1.getString("origin"),
						rs1.getString("destination"), dt, at, rs1.getInt("first_cost"), rs1.getInt("business_cost"),
						rs1.getInt("coach_cost"), rs1.getInt("flight_ID"), rs1.getString("added_by"),
						rs1.getInt("coach_vacancy"), rs1.getInt("business_vacancy"), rs1.getInt("first_vacancy"), 0));
				System.out.println("added a flight");
			}
			sql = "Select * from flight where origin=? and " + "departure_time BETWEEN '" + date + " 00:00:00' AND '"
					+ date + " 23:59:59' and ";
			sql = addClass(sql, ticketClass, numberTickets);
			PreparedStatement connections = conn.prepareStatement(sql);
			connections.setString(1, rs1.getString("destination"));
			ResultSet rs2 = connections.executeQuery();
			while (rs2.next()) {
				if (rs2.getString("destination").equals(to)) {
					dts = rs1.getTimestamp("departure_time").toString();
					dt = formatter.parseDateTime(dts.substring(0, dts.length() - 2));
					ats = rs1.getTimestamp("arrival_time").toString();
					at = formatter.parseDateTime(ats.substring(0, ats.length() - 2));
					
					flightList.add(new Flights(rs1.getInt("plane_ID"), rs1.getString("origin"),
							rs1.getString("destination"), dt, at, rs1.getInt("first_cost"), rs1.getInt("business_cost"),
							rs1.getInt("coach_cost"), rs1.getInt("flight_ID"), rs1.getString("added_by"),
							rs1.getInt("coach_vacancy"), rs1.getInt("business_vacancy"), rs1.getInt("first_vacancy"),
							1));

					dts = rs2.getTimestamp("departure_time").toString();
					dt = formatter.parseDateTime(dts.substring(0, dts.length() - 2));
					ats = rs2.getTimestamp("arrival_time").toString();
					at = formatter.parseDateTime(ats.substring(0, ats.length() - 2));
					
					flightList.add(new Flights(rs2.getInt("plane_ID"), rs2.getString("origin"),
							rs2.getString("destination"), dt, at, rs2.getInt("first_cost"), rs2.getInt("business_cost"),
							rs2.getInt("coach_cost"), rs2.getInt("flight_ID"), rs2.getString("added_by"),
							rs2.getInt("coach_vacancy"), rs2.getInt("business_vacancy"), rs2.getInt("first_vacancy"),
							2));

				}
			}
		}

		return flightList;

	}

	public static String addClass(String sql, String ticketClass, Integer numberOfTickets) {
		if (ticketClass.equals("first")) {
			sql += "first_vacancy > " + numberOfTickets;
		} else if (ticketClass.equals("business")) {
			sql += "business_vacancy > 0" + numberOfTickets;
		} else {
			sql += "coach_vacancy > 0" + numberOfTickets;
		}
		return sql;
	}
}
