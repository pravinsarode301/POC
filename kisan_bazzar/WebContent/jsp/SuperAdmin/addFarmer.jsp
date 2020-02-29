<%@include file="common/header.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Add New Farmer</li>
	</ol>
</div>
<!--/.row-->



	
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading"><!-- <svg class="glyph stroked email"><use xlink:href="#stroked-email"></use></svg> -->Farmer Registration Form</div>
				    <div class="panel-body">
				 
						<form class="form-horizontal" action="/application/update_company.html" method="post">
						<input type="hidden" name="company_id" value=""> 
							<fieldset>
								<!--Farmer Name-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="name" >Farmer Name</label>
									<div class="col-md-4">
									<input value=""  name="farmerName"  type="text" placeholder="Please enter your name" class="form-control" >
									</div>
								
							
								<!-- Farmer Email ID-->
								
									<label class="col-md-2 control-label" for="text">Farmer Email ID</label>
									<div class="col-md-4">
										<input value="" name="farmerEmailid" type="text" placeholder="Please enter your Email ID" class="form-control" >
									</div>
								</div>
								<!-- Farmer Contact Number-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="text">Contact Number</label>
									<div class="col-md-4">
										<input value="" name="contactNumber" type="text" placeholder="Please enter contact number" class="form-control" >
									</div>
								
								<!-- Farmer Address-->
								
									<label class="col-md-2 control-label" for="text">Address</label>
									<div class="col-md-4">
										<input value="" name="Address " type="text" placeholder="Please enter your Address" class="form-control" >
									</div>
								
								</div>
										<!-- Farmer Country-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="text">Country</label>
									<div class="col-md-4">
										<input value="" name="Country " type="text" placeholder="Please enter your Country" class="form-control" >
									</div>
							
								<!-- Farmer State-->
								
									<label class="col-md-2 control-label" for="text">State</label>
										<div class="col-md-4">
											 <select class="form-control" name="state"> 
												<option value="">Please select state </option>
												<option value="AP">AP</option>
												<option value="Maharastra">Maharastra</option>
												<option value="MP">MP</option>
												<option value="Gujrat">Gujrat</option>
												<option value="Goa">Goa</option>	
												<option value="Kerala">Kerala</option>
											</select>
										</div>	
								</div>
								
								<!-- Farmer City-->
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="text">City</label>
										<div class="col-md-4">
											 <select class="form-control" name="City"> 
												<option value="">Please select City </option>
												<option value="Nagpur">Nagpur</option>
												<option value="Wardha">Wardha</option>
												<option value="Pune">Pune</option>
												<option value="Mumbai">Mumbai</option>
												<option value="Gondia">Gondia</option>	
												<option value="Chandrapur">Chandrapur</option>
											</select>
										</div>		
										<label class="col-md-2 control-label" for="text">Pin Code</label>
										<div class="col-md-4">
											<input value="" name="pinCode" type="text" placeholder="Please enter your Pin Code" class="form-control" >
										</div>	
								</div>
							<!-- Farmer Product Name-->							
								<div class="form-group">
									<label class="col-md-2 control-label" for="text">Product Name</label>
										<div class="col-md-4">
											 <select class="form-control"> 
												<option value="">Please select your choice </option>
												<option value="1">Wheat</option>
												<option value="2">Rice</option>
												<option value="3">Cotton</option>
												<option value="4">Sugarcane</option>
												<option value="5">Bajra</option>	
												<option value="6">Cereals</option>
											</select>
										</div>	
									 
							<!-- Farmer Product Type-->		 
											
									<label class="col-md-2 control-label" for="name" >Product Type</label>
									<div class="col-md-4">
									<input value=""  name="ProductType"  type="text" placeholder="Please enter your name" class="form-control" >
									</div>
								</div>	
							
								
								
							<!--Product Quantity-->	
								<div class="form-group">
									<label class="col-md-2 control-label" for="text">Product Quantity</label>
										<div class="col-md-4">
											<div class="row">
												<div class="col-md-2" >
													<select class="form-control" style="width:130px; " > 
														<option value=""> Quantity </option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
														<option value="9">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
														<option value="13">13</option>
														<option value="14">14</option>
														
													</select>
												</div>
												<div class="col-md-2">
													<select class="form-control"  style="width:130px; margin-left:125px;"> 
														<option value="">Unit </option>
														<option value="1">kg</option>
														<option value="2">ton</option>
													</select>
												</div>	
											</div>
											
										</div>
								</div>							

											
								
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right" name="submit" value="Submit" style="margin-left:10px;" >Submit</button>
										
										<button and type="Reset" class="btn btn-default btn-md pull-right" name="Reset" value="Submit" style="margin-right:10px;" >Reset</button>
										
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				</div>
				</div>
				
<%@include file="common/footer.jsp"%>