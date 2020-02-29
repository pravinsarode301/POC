<%@include file="common/header.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Sub-SuperAdmin Authorisation Form</li>
	</ol>
</div>
<!--/.row-->



<div class="row">
	<div class="col-md-12">


		<div class="panel panel-default">
			<div class="panel-heading">Sub-SuperAdmin Authorisation Form</div>
			<%
				if (request.getAttribute("authErrorStatus") != null) {
			%>
			<div class="panel-body">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong> <%=request.getAttribute("authErrorStatus")%></strong>
				</div>
				<%
					}
				%>


				<div class="panel-body">
					<form role="form" action="SpecialAuthSubAdmin" method="post">
						<!-- //<input type="hidden" name="customParameterString" value="superAdminLogin" class="form-control"> -->
						<p>Enter password to Proceed</p>
						<fieldset>

							<div class="form-group">
								<input class="form-control" placeholder="password"
									name="passwordSpecialAuthSubAdmin" type="password" required>
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!--/.main-->



<%@include file="common/footer.jsp"%>