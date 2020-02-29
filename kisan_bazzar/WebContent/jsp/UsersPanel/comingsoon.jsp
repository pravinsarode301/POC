<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration" %>

<%
Enumeration<String> av = session.getAttributeNames();
ArrayList arr=new ArrayList();
	while (av.hasMoreElements()) {
		arr.add(av.nextElement());
	}
	if (arr.contains("userId")) {
%>
<%@include file="common/header.jsp"%>
<%
	} else {
%>
<%@include file="common/headerBeforeSession.jsp"%>
<%
	}
	
%>

<div class="container-fluid" style="background: #01b200 none repeat scroll 0 0; height:7px;"> </div>
<div class="container-fluid header-color">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="col-md-2" style="padding:1px;"> <img style="width: 170px; height: 85px;" src="img/logo-shetkari-bazaar.png" class="img-responsive"> </div>
        <div class="col-md-10">
          <div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body info">
								<h1 style="margin-top: 170px; font-size: 76px;"> Comming Soon...<h1>
							</div>
						</div>
					</div>

        </div>
      </div>
    </div>
  </div>
</div>


<%@include file="common/footerBeforeSession.jsp"%>