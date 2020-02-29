package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.buf.UEncoder;

import com.shetkari_bazzar.dao.EmailUtility;
import com.shetkari_bazzar.dto.EmailDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.helper.SuperAdminHelper;

/*This class is written by dnyaneshwar function of this class is send mail on the gmail if your password is forgotten */
@WebServlet("/ForgotpassSendMail")
public class ForgotpassSendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*
	 * private String host="smtp.gmail.com"; private String port="587"; private
	 * String user="sagarraut001@gmail.com"; private String pass="SAgar@12";
	 */
	private String host;
	private String port;
	private String user;
	private String pass;

	public ForgotpassSendMail() {
		super();

	}

	public void init() {
		// reads SMTP server setting from web.xml file
		/*
		 * ServletContext context = getServletContext(); host =
		 * context.getInitParameter("host"); port =
		 * context.getInitParameter("port"); user =
		 * context.getInitParameter("user"); pass =
		 * context.getInitParameter("pass");
		 */
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*for get root path*/
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");	
		
		/*required object*/
		PrintWriter out = response.getWriter();
		ServletContext context = getServletContext();
		EmailUtility Email = new EmailUtility();
		LoginDTO LDTO = new LoginDTO();
		EmailDTO EDTO = new EmailDTO();
		CompanyHelper help = new CompanyHelperImpl();
		
		/* for send mail */
		
		EDTO.setHostName(context.getInitParameter("host"));
		EDTO.setPortNumber(context.getInitParameter("port"));
		EDTO.setUserName(context.getInitParameter("user"));
		EDTO.setPassword(context.getInitParameter("pass"));
		EDTO.setSubject(" !! Welcome to Shetkari Bazzar Portal !! ");

		/*requiired variable*/
		boolean validEmailCheckStatus=false;
		
		int i = 0;
		/*for generate random string*/
		
		Random r = new Random();
		
		String username = request.getParameter("recoveryEmailAddress");
	
		LDTO.setUsername(username);
		
		
		 validEmailCheckStatus = help.forgotpass(LDTO);
		if(validEmailCheckStatus==true)
		{
			
			
			
			
			
			System.out.println("email is valid");
		}else{
			
			request.setAttribute("EmailPasswordStatus", "Sorry ,This email id is not registred with our shetkari_bazzar poratl");
			request.getRequestDispatcher(SuperAdminPanel + "/forgotPassword.jsp").forward(request, response);
		}
		
		/*
		
		System.out.println("usernametrue"+validEmailCheckStatus);
		
		System.out.println("///////////////////////");
		
		String company_password = null;

		if (validEmailCheckStatus) {

			String alphabet = "ygrdews34@123xyznbjcjnkjygrufs";

			char c[] = new char[alphabet.length()];

			for (int p = 0; p < 7; p++) {
				c[p] = alphabet.charAt(r.nextInt(alphabet.length()));
				company_password = String.copyValueOf(c);
			}
				LDTO.setRandompass(company_password);
				i = help.storeRandompass(LDTO);
				System.out.println(company_password);

				
				String subject = "please click here to verify your password";
				String content = "http://localhost:8090/kisan_bazzar/SuperAdmin?customParameterString=checkOTP&emailid="
						+ username + "&pass=" + company_password + "";
				EDTO.setContent(content);
				String recipient = "dnyanesharwar24narwade91@gmail.com";
				boolean resultStatus=false;
			try {
				
				EDTO.setRecipient(recipient);
				EmailUtility.sendEmail(EDTO);
				//EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
				resultStatus=true;
			} catch (Exception ex) {
				ex.printStackTrace();
				
				resultStatus = false;
			} finally {
				System.out.println(" mail sened successful ");
				// request.setAttribute("Message", resultMessage);
				request.getRequestDispatcher(SuperAdminPanel + "/checkemail.jsp").forward(request, response);
			}
		
			// request.getRequestDispatcher(SuperAdminPanel+"/checkemail.jsp").forward(request,
			// response);

		}
*/
	}

}
