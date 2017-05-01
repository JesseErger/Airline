package classes;

import org.joda.time.DateTime;
import java.text.SimpleDateFormat;

public class FormatDate {
	public static String readable(DateTime date) {

		SimpleDateFormat formatter = new SimpleDateFormat("hh:mm MM/dd/yyyy");

		String dateString = formatter.format(date.toDate());

		return dateString;
	}
}