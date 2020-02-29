<%-- <%@page import="org.apache.catalina.startup.ContextConfig"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>

<%


 if(session != null){
 if(session.getAttribute("regsession")=="regsession")
	{
	session.removeAttribute("userName");
	session.removeAttribute("regsession");
	session.setMaxInactiveInterval(0);
	session.invalidate();
	request.setAttribute("LogOffStatus", "You are successfully log out !");
	
	}
 }
 String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
//response.sendRedirect(SuperAdminPanel+"/superAdminLogin.jsp");
RequestDispatcher rd=request.getRequestDispatcher("superAdminLogin.jsp");
rd.include(request, response);

 %> --%>