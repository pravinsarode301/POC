package com.shetkari_bazzar.dao;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.shetkari_bazzar.dto.EmailDTO;

/**
 * A utility class for sending e-mail messages
 * @author www.codejava.net
 *
 */
public class EmailUtility {
	public static void sendEmail(EmailDTO EDTO) throws AddressException,
			MessagingException {

		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", EDTO.getHostName());
		properties.put("mail.smtp.port", EDTO.getPortNumber());
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(EDTO.getUserName(), EDTO.getPassword());
			}
		};

		Session session = Session.getInstance(properties, auth);

		// creates a new e-mail message
		Message msg = new MimeMessage(session);

		msg.setFrom(new InternetAddress(EDTO.getUserName()));
		InternetAddress[] toAddresses = { new InternetAddress(EDTO.getRecipient()) };
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
		msg.setSubject(EDTO.getSubject());
		msg.setSentDate(new Date());
		 msg.setContent(EDTO.getContent(), "text/html");
		//msg.setText(EDTO.getContent());

		// sends the e-mail
		Transport.send(msg);

	}
}
