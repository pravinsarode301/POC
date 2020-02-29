<%@page import="java.sql.ResultSet"%>
<%@include file="common/header.jsp"%>
am in errpage
	<%
ResultSet rt=(ResultSet)request.getAttribute("rt1");
while(rt.next()){
	
	out.println(rt.getString("first_name"));
}
	%> 

<%@include file="common/footer.jsp"%>