<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>

<%

 String regsession1 =(String)session.getAttribute("user_name");
System.out.println(regsession1); 



if(session.getAttribute("regsession")=="regsession")
	{
	session.removeAttribute("user_name");
	session.invalidate();
	request.setAttribute("LogOffStatus", "You are successfully log out !");
	
	}
RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
rd.forward(request, response);
 %>