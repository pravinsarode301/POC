<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="common/header.jsp"%>


<!-- <script type="text/javascript">

function checkAjaxCall(){

	  $("#registrationForm").ajaxForm({  

		dataType : 'json',
        type: 'POST',
        beforeSend: function(xhr) {  
            xhr.setRequestHeader("Content-Type", "text/html");  
        },
        success:function(response){
        	alert("Validation: "+response.validation+"   Name: "+response.firstName+"  Location: "+response.lastName);
        },
        error:function(jqXhr, textStatus, errorThrown){
        	alert(textStatus);
        }
    });
	return true;
}


</script>
    -->
<section id="form" >
	<!--form-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">
				<div class="login-form">
					<!--login form-->
					<h2>Login to your account</h2>
					<form action="<c:url value='j_spring_security_check'/>">
						<input type='text' name='j_username' value='' placeholder="Name">
						<input type='password' name='j_password' placeholder="Password">
						<span> <input type="checkbox" class="checkbox">
							Keep me signed in
						</span>
						<button type="submit" class="btn btn-default">Login</button>
					</form>
				</div>
				<!--/login form-->
			</div>
			<div class="col-sm-1">
				<h2 class="or">OR</h2>
			</div>
			
			<div class="col-sm-4" ng-app="myApp">
				<div class="signup-form" ng-controller="UserController as ctrl">
				<p ng-model="errField"></p>
					<!--sign up form-->
					<h2>New User Signup!</h2>
					<form  ng-submit="ctrl.submit()">
							<input type="text" ng-model="ctrl.user.firstName"   name="firstName" placeholder="enter first name"/>
							<input type="text" ng-model="ctrl.user.lastName" name="lastName" placeholder="enter last name"/>
							<input type="text" ng-model="ctrl.address.email" name="address.email" placeholder="enter email"/>
							<input  type="text"  ng-model="ctrl.address.contactNumber" name="address.contactNumber"  placeholder="enter email"/>
							<input type="password"  ng-model="ctrl.login.password" name="login.password" placeholder="enter password"/>
							<input type="password" ng-model="ctrl.login.rePassword" name="login.rePassword"  placeholder="re-enter password"/>
							<button type="submit" class="btn btn-default">Signup</button>
					<form>
				</div>
				<!--/sign up form-->
			</div>
		</div>
	</div>
</section>
<!--/form-->
<%@include file="common/footer.jsp"%>