<%@page import="java.sql.ResultSet"%>
<%@ include file="common/header.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>


<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Change Password</li>
	</ol>
</div>
<!--/.row-->

<!--/.row-->

<%-- <%-- <%  ResultSet rt=(ResultSet)request.getAttribute("rt");
				
				while(rt.next()){
					
					out.println(rt.getString(16));
				} --%>

<script language="javascript" type="text/javascript">
	function checkPass() {
		//Store the password field objects into variables ...
		var pass1 = document.getElementById('dbPassword');
		var pass2 = document.getElementById('oldPassword');
		//Store the Confimation Message Object ...
		var message = document.getElementById('confirmMessage');
		//Set the colors we will be using ...
		var goodColor = "#66cc66";
		var badColor = "#ff6666";
		//Compare the values in the password field 
		//and the confirmation field
		if (pass1.value == pass2.value) {
			//The passwords match. 
			//Set the color to the good color and inform
			//the user that they have entered the correct password
			alert("Hello! I am an alert box!!");
			alert("hlo");
			/*  pass2.style.backgroundColor = goodColor;
			 message.style.color = goodColor;
			 message.innerHTML = "Passwords Match!" */
		} else {
			//The passwords do not match.
			//Set the color to the bad color and
			//notify the user.
			/*  pass2.style.backgroundColor = badColor;
			 message.style.color = badColor;
			 message.innerHTML = "Passwords Do Not Match!" */
		}
	}
</script>

<script type="text/javascript">
					function testOldPassword(){
						var MainCatVal=$('#oldPassword').val();
						 $.ajax({
						        url: 'CheckByAjaxCall',
						        type: 'post',
						        data: {customQueryString:'AdminPanelCheckOldPassword',oldPassword: MainCatVal},
						        dataType:'json',
						        success:function(response){
						        	
						        	if(response){
						        		$('#companyRegIdexiststatus').html("<span style='color: red; align-self: center; font-weight: bold; padding-left: 57%; font-size: 16px;'>Registration id already in used , try another one ....!</span>");
						        		
						        	}else{
						        		$('#companyRegIdexiststatus').html("<span style='display:none;'></span>");
						        	}
						        }
						 });
					}
</script>

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading"> Reset password Form	</div>
			
				<%
					if (request.getAttribute("resultStatus") != null) {
				%>
				<div class="panel-body">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong> <%=request.getAttribute("resultStatus")%>
					</strong></div>
					<%
						}
					%>

				<div id="companyRegIdexiststatus"></div>
 		<div class="panel-body">
				<form class="form-horizontal" action="ChangePassword" method="post">
					<input type="hidden" name="customParameterString"
						value="changePasswordDetails" class="form-control"><input
						type="hidden" name="userName"
						value="<%=session.getAttribute("userName")%>" id="Username">
					<input type="hidden" name="dbPassword"
						value="<%=session.getAttribute("password")%>" id="dbPassword">
					<fieldset>
						<!-- Name input-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="text">Old
								Password</label>
							<div class="col-md-4">
								<input id="oldPassword" name="oldPassword" type="Password"
									placeholder="Enter Old Password" class="form-control"
									onblur="testOldPassword()">
							</div>


							<!-- Email input-->

							<label class="col-md-2 control-label" for="name">New
								Password</label>
							<div class="col-md-4">
								<input id="name" name="newPassword" type="password"
									placeholder="Enter New Password" class="form-control">
							</div>
						</div>
						<!-- Mobile input-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="Mobile">Confirm
								Password</label>
							<div class="col-md-4">
								<input id="Mobile" name="reNewPassword" type="password"
									placeholder="Re-enter New Password" class="form-control">
							</div>

						</div>

						<!-- Form actions -->
						<div class="form-group">
							<div class="col-md-12 right">
								<button type="submit" class="btn btn-default btn-md pull-right">Submit</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>

	</div>
</div>
</div>
<!--/.main-->

<%@ include file="common/footer.jsp"%>