<%@include file="common/header.jsp"%>

<!-- //created by Nilesh T.Kashid for Upload Home page Image -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>


<%
	String JspPagePath1 = getServletContext().getInitParameter("SuperAdminResources");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>

<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home">
					<use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Home Page Image Upload</li>
	</ol>
</div>
<!--/.row-->


<div class="row">
	<div class="col-md-12">


		<div class="panel panel-default" style="margin-top: 30px;">

			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">Add
						Main Product </a></li>
				<li><a data-toggle="tab" href="#menu1">Add Sub Product</a></li>

			</ul>

			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<%
						if (request.getAttribute("addProductsStatus") != null) {
					%>

					<div class="panel-body">
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong> <%=request.getAttribute("addProductsStatus")%>
							</strong>
						</div>
					</div>
					<%
						}
					%>

<script type="text/javascript">

 function addCategoryFun(){
	
	 $("#addCategory").ajaxForm({
			dataType: 'json',			
			success: function(response) 
			{	
				
				if(response){
					$('#categoryUpdateFormStatus').text('');
					$('#categoryUpdateFormStatus').text(response);
					$('#categoryUpdateFormStatus').hide();
					$('#categoryUpdateForm').hide();
					$('#categoryUpdateForm').show();
					$('#categoryUpdateFormStatus').show();
					$('#categoryUpdateForm').fadeOut(10000);
					//$("#loginStatus").html(data);
		}		
			}	 
	 });
		
		
		
 }
</script> 

<!-- to show update status -->
					<div class="panel-body" id="categoryUpdateForm" style="display:none;">
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong><div id="categoryUpdateFormStatus" style="display:none;"></div></strong>
							
							</strong>
						</div>
					</div>

<!-- end of show update status -->

					<div class="panel-body">

						<form class="form-horizontal" action="AddPortalProducts" enctype="multipart/form-data"
							method="post"  id="addCategory">

							<fieldset>
								<input type="hidden" name="customParameterString"
									value="addCompanyDetails" class="form-control"> <input
									type="hidden" name="sessionUser"
									value="<%=session.getAttribute("userName")%>">
								<!-- Image name input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">Product
										Name</label>
									<div class="col-md-4">
										<input id="name" name="productName" type="text"
											placeholder="Product Name" class="form-control">
									</div>

									<label class="col-md-2 control-label" for="name">Description</label>
									<div class="col-md-4">
										<input id="name" name="productDescription" type="textarea"
											cols="5" row="4" placeholder="Enter Description"
											class="form-control">
									</div>

								</div>
								<!--End Image Name-->

								<!-- Upload Image -->
								<div class="form-group">
									<!-- Re-password input-->
									<label class="col-md-2 control-label" for="image">Upload
										Image</label>
									<div class="col-md-4">
										<input id="Sucribtion Plan" type="file"
											placeholder="Upload Image" name="imageName" size="50"
											class="form-control">

									</div>
									
								</div>
								<!-- End Upload Image -->
								<button class="btn btn-default" type="submit" onclick="addCategoryFun()">upload</button>
							</fieldset>
						</form>
					</div>
				</div>
				<div id="menu1" class="tab-pane fade">
					<%
						if (request.getAttribute("addSubProductsStatus") != null) {
					%>

					<div class="panel-body">
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong> <%=request.getAttribute("addSubProductsStatus")%>
							</strong>
						</div>
					</div>
					<%
						}
					%>

 <script type="text/javascript">

 function addSubCategoryFun(){
	
	 $("#addSubCategory").ajaxForm({
			dataType: 'json',			
			success: function(response) 
			{	
				
				if(response){
					$('#subcategoryUpdateFormStatus').text('');
					$('#subcategoryUpdateFormStatus').text(response);
					$('#subcategoryUpdateFormStatus').hide();
					$('#subcategoryUpdateForm').hide();
					$('#subcategoryUpdateForm').show();
					$('#subcategoryUpdateFormStatus').show();
					$('#subcategoryUpdateForm').fadeOut(10000);
					//$("#loginStatus").html(data);
		}		
			}	 
	 });
		
		
		
 }
</script> 

<!-- to show update status -->
					<div class="panel-body" id="subcategoryUpdateForm" style="display:none;">
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong><div id="subcategoryUpdateFormStatus" style="display:none;"></div></strong>
							
							</strong>
						</div>
					</div>

<!-- end of show update status -->
					<div class="panel-body">

						<form  method="POST" action="AddSubPortalProducts" id="addSubCategory" class="form-horizontal"> 

							<fieldset>
								
								<!-- Image name input-->
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">Product
										Name</label>
									<div class="col-md-4">

										<select class="form-control" name="mainProductId">
											<%
														if (request.getAttribute("productGrid") != null) {
															ResultSet rt = (ResultSet) request.getAttribute("productGrid");
															while (rt.next()) {
													%>
											<option	value="<%=rt.getString("product_id")%>" > <%=rt.getString("product_name")%> </option>
											<%
														}

														} else {
													%><option value="">No product available</option>
											<%
														}
													%>

										</select>




									</div>

									<label class="col-md-2 control-label" for="name">Sub
										Product Name</label>
									<div class="col-md-4">
										<input id="name" name="subProductName" type="text"
											placeholder="Sub Product Name" class="form-control">
									</div>

								</div>
								<!--End Image Name-->

								<!-- Upload Image -->
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">Description</label>
									<div class="col-md-4">
										<input id="name" name="subProductDescription" type="textarea"
											cols="5" row="4" placeholder="Enter Description"
											class="form-control">
									</div>
									<!-- Re-password input-->
									<label class="col-md-2 control-label" for="image">Upload
										Image</label>
									<div class="col-md-4">
										<input id="Sucribtion Plan" type="file"
											placeholder="Upload Image" name="subProductImageName"
											size="50" class="form-control">

									</div>
									
								</div>
								<button type="submit" class="btn btn-default" onclick="addSubCategoryFun()">upload</button>
								<!-- End Upload Image -->

							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>







<%@include file="common/footer.jsp"%>