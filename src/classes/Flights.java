package classes;

import org.joda.time.DateTime;

public class Flights {
	public int plane_ID;
	public String origin;
	public String destination;
	public DateTime departure_time;
	public DateTime arrival_time;
	public int first_cost;
	public int business_cost;
	public int coach_cost;
	public int flight_ID;
	public String added_by;
	public int coach_vacancy;
	public int business_vacancy;
	public int first_vacancy;

	public Flights(int start_plane_ID, String start_origin, String start_destination, DateTime start_departure_time,
			DateTime start_arrival_time, int start_first_cost, int start_business_cost, int start_coach_cost,
			int start_flight_ID, String start_added_by, int start_coach_vacancy, int start_business_vacancy,
			int start_first_vacancy) {

		plane_ID = start_plane_ID;
		origin = start_origin;
		destination = start_destination;
		departure_time = start_departure_time;
		arrival_time = start_arrival_time;
		first_cost = start_first_cost;
		business_cost = start_business_cost;
		coach_cost = start_coach_cost;
		flight_ID = start_flight_ID;
		added_by = start_added_by;
		coach_vacancy = start_coach_vacancy;
		business_vacancy = start_business_vacancy;
		first_vacancy = start_first_vacancy;

	}
}
