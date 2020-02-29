package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLogout
 */
@WebServlet("/UserLogout")
public class UserLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLogout() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		
		
		
		HttpSession session = request.getSession(false);

	      if (session != null) {
	          
	          
	          Enumeration<String> av=session.getAttributeNames();
	          while(av.hasMoreElements()){
	              System.out.println(av.nextElement());
	              
	              //session.removeAttribute(av.nextElement());
	          }
	          session.removeAttribute("welcomeName");
	          session.removeAttribute("userName");
	          session.removeAttribute("userId");
	          session.removeAttribute("regsession");
	          session.invalidate();
	          session=null;
	          
	          }
	          
	          
	          if(null!=session?(null!=session.getAttribute("userId")?false:true):true){
	              request.setAttribute("LogOffStatus", "You are successfully log out !");
	              String UsersPanel = getServletContext().getInitParameter("UsersJsp");
	              System.out.println("UsersPanel "+UsersPanel);
	      		request.getRequestDispatcher(UsersPanel + "/index.jsp").forward(request, response);;
	      		
	      		
	          }
	          
	          
	}

}
