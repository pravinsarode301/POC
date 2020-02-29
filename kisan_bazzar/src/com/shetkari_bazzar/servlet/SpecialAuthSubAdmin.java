package com.shetkari_bazzar.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SpecialAuthSubAdmin
 */
@WebServlet("/SpecialAuthSubAdmin")
public class SpecialAuthSubAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpecialAuthSubAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		//System.out.println("am here in special auth servlet");
		//final String SpclAuthPswd =  (String) session.getAttribute("special_auth_password");
		//session.removeAttribute("special_auth_password");
		String passwordSpecialAuthSubAdmin=request.getParameter("passwordSpecialAuthSubAdmin");
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		
		
		/*System.out.println(passwordSpecialAuthSubAdmin);
		System.out.println(session.getAttribute("special_auth_password"));*/
		
		if(session.getAttribute("special_auth_password").equals(passwordSpecialAuthSubAdmin)){
		//if(SpclAuthPswd.equals(passwordSpecialAuthSubAdmin)){
		
		
			request.getRequestDispatcher(SuperAdminPanel + "/subAdmin.jsp").forward(request, response);
		}else{
			request.setAttribute("authErrorStatus", "You are not authorised to access subadmin resources !");
			request.getRequestDispatcher(SuperAdminPanel + "/subAdminAuth.jsp").forward(request, response);
		}
		
		
		
		
		
	}

}
