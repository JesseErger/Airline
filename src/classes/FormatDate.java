package classes;

import org.joda.time.DateTime;
import java.text.SimpleDateFormat;

public class FormatDate {
	public static String readable(DateTime date) {

		SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy hh:mm");

		String dateString = formatter.format(date.toDate());

		return dateString;
	}
}