<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>

<%@page import="java.util.Enumeration" %>
<%
String regsession1 =(String)session.getAttribute("userName");
System.out.println(regsession1); 



if(session.getAttribute("regsession")=="regsession")
	{
	Enumeration<String> av = session.getAttributeNames();
	while (av.hasMoreElements()) {
		System.out.println(av.nextElement());
		session.removeAttribute(av.nextElement());
	}
	request.setAttribute("LogOffStatus", "You are successfully log out !");
	
	}

String UsersPanel = getServletContext().getInitParameter("UsersJsp");
RequestDispatcher rd=request.getRequestDispatcher(UsersPanel+"/index.jsp");
rd.forward(request, response);

%>