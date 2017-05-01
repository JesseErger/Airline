package classes;

import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;

public class AuthEmail {
	public static Session Autenticate(){
		final String username = "cs5800airline@gmail.com";
		final String password = "Pwtemp01!";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
		return session;
	}
}
