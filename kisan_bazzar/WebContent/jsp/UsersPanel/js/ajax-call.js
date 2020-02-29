/*section for login check ;*/

function Redirect() {
	window.location = "http://localhost:8081/kisan_bazzar/";
}

function checkLogin() {

	$("#verifylogin").ajaxForm({
		dataType : 'json',
		success : function(data) {
			if (data) {
				$('#loginStatus').text('');
				$('#loginStatus').text(data);
				$('#loginStatus').hide();
				$('#xx').hide();
				$('#xx').show();
				$('#loginStatus').show();

				/* 		$('#p1').html("You will be redirected to main page in 5 sec."); */
				$('#xx').fadeOut(5000);
				setTimeout('Redirect()', 5000);

				//$("#loginStatus").html(data);
			}
		},
	});

}

/* end of section for login check ;*/

/*section to check to user email id  for sign up*/

function testFarmerEmailId() {
	var MainCatVal = $('#farmerEmailId').val();
	
			$.ajax({
				url : 'CheckByAjaxCall',
				type : 'post',
				data : {
					customQueryString : 'userEmailIdForSignUp',
					EmailId : MainCatVal
				},
				dataType : 'json',
				success : function(response) {

					if (response) {
						$('#emailexiststatus')
								.html(
										"<span style='color: red; align-self: center; padding-left: 18%; font-size: 18px; font-weight: bold;'>Email Id already in used, try another one .!</span>");

					} else {
						$('#emailexiststatus').html(
								"<span style='display: none;'></span>");
					}
				}
			});
}

/* end of the section to check to user email id  for sign up*/

/*the section to check to user email id exist or not  for forgot password*/

function userForgetPasswordCheck() {
	var MainCatVal = $('#userForgetPasswordEmail').val();

	
			$.ajax({
				url : 'CheckByAjaxCall',
				type : 'post',
				data : {
					customQueryString : 'userEmailIdForPasswordRecovery',
					EmailId : MainCatVal
				},
				dataType : 'json',
				success : function(response) {

					if (!response) {
						$('#emailExistForForgotPswdstatus')
								.html(
										"<span style='font-weight: bold;display: block;color: red; font-size: 16px; padding-left: 9%;'>Sorry,Your Email Id is not registred with Shetkari Bazzar Portal..</span>");

					} else {
						$('#emailExistForForgotPswdstatus').html(
								"<span style='display: none;'></span>");
					}

				}
			});
}

/*end of the section to check to user email id exist or not  for forgot password*/

