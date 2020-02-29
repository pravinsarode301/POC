package com.hotel.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hotel.Service.LoginformGetterSetter;
import com.hotel.Test.*;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
		PrintWriter out=response.getWriter();
		String user_name=request.getParameter("email");
		String user_password=request.getParameter("password");
		
		LoginformGetterSetter lform=new LoginformGetterSetter();
		 
		AuthTestInterface ATF=new AuthTest();
		HttpSession session=null;
		HttpSession oldsession=request.getSession(false);
	
	
		if(oldsession!=null)
		{
			
			oldsession.invalidate();
			session=request.getSession();
			
			session.setAttribute("username", user_name);
			session.setAttribute("regsession", "regsession");
			
		
		}else{
			session=request.getSession();
			
			session.setAttribute("username", user_name);
			session.setAttribute("regsession", "regsession");
		}
		
		
		try {
			lform=(LoginformGetterSetter)ATF.authenticate(user_name, user_password);
			if(lform.getUser_name()!=null){
				if(lform.getUser_name().equalsIgnoreCase(user_name))
				{
					session.setAttribute("user_role",lform.getAssignedRoll());
					
					session.setAttribute("user_name", user_name);
					session.setAttribute("user_id", lform.getRoll_id());
					session.setAttribute("regsession", "regsession");
					request.setAttribute("dashbordpage", "afterLoginDashboard");
				    RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
		                rd.forward(request, response);
		          } 
		            
				}else { 	
	            	 
		             String errStatus="Incorrect Username And Password";
	                request.setAttribute("errStatus",errStatus);
	                RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
		             rd.forward(request, response);
	            }
				
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
