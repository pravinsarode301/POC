package com.shetkari_bazzar.servlet;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 * 
 * @author www.codejava.net
 * 
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// reads form fields
		String recipient = request.getParameter("dnyaneshwar24narwade91@gmail.com");
		String subject = request.getParameter("hi dnyanendndn");
		String content = request.getParameter("please send me on the ");

		String resultMessage = "";

		try {
			EmailUtility.sendEmail(host, port, user, pass, recipient , subject,
					content);
			resultMessage = "The e-mail was sent successfully";
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} finally {
			System.out.println("mail send from emailsendclass");
			/*request.setAttribute("Message", resultMessage);
			getServletContext().getRequestDispatcher("/checkemail.jsp").forward(
					request, response);*/
		}
	}
}