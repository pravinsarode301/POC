<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script></script>
</head>
<body>
	<%
	List<String> list = new ArrayList<String>();
		 list.add("first1");
		 list.add("first2");
		 list.add("first3");
		 list.add("first4");
		 list.add("first5");
		 out.println(list);
		 String newlist = list.toString().replace("[", "['").replace("]", "']").replace(", ", "','");
			
		 
		 out.println(newlist);
		 String data  = list.toString();
		 out.println(data);
	%>
</body>
</html>