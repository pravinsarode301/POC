<%@page import="com.hotel.Model.CaptainFormDaoImpl"%>
<%@page import="com.hotel.Model.OrderMenuDao"%>
<%@page import="com.hotel.Model.OrderFormDaoImpl"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Widgets</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/select2.css" rel="stylesheet">
<link href="css/select2-bootstrap.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<link href="css/site-demos.css" rel="stylesheet">
<script type="text/javascript" src="../script.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>



<SCRIPT language="javascript">
	function addRow(multiOrdersTable) {

		var table = document.getElementById(multiOrdersTable);
		var db_menus = document.getElementById('db_menus');
		var array_db_menus=$("#db_menus").val();
		
		//alert(xxx);	
//alert(db_menus.val());
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);
		var counts=rowCount-1;
		var cell1 = row.insertCell(0);
		
		var orderMenu = document.createElement("select");
		
		orderMenu.style.border = " 1px solid #eee";
		orderMenu.style.height = "34px";
		orderMenu.style.width = "100%";
		orderMenu.style.marginTop = "-19px";
		orderMenu.style.padding= "6px 12px";
        //var selectid=$(this).attr('id');
        //alert(selectid);
		 orderMenu.type = "optain";  
	//var cars=new Array();
	
	var res = array_db_menus.split(",");
	 	var options_str = "";	 	
	 	options_str += '<option value="" selected="" disabled="disabled" hidden >Select Menu</option>';
	 	res.forEach( function(res) {	 		
	 		  options_str += '<option value="' + res + '">' + res + '</option>';
	 		  
	 		});
	 	orderMenu.innerHTML = options_str;
		orderMenu.name="user.orders["+counts+"].orderMenu";
		orderMenu.id="orderMenu"+counts;
		
		orderMenu.setAttribute('required', ''); // works
		
		cell1.appendChild(orderMenu);
		orderMenu.id.className = "form-control";
		
		var cell2 = row.insertCell(1);
		var orderQuantity = document.createElement("input");
		
		orderQuantity.style.border = " 1px solid #eee";
		orderQuantity.style.height = "34px";
		orderQuantity.style.width = "100%";
		orderQuantity.style.marginTop = "5px";
		orderQuantity.style.marginLeft = "9px";
		orderQuantity.style.padding= "6px 12px";
		orderQuantity.setAttribute('required', ''); // works
		
		orderQuantity.type = "text";
		orderQuantity.name="user.orders["+counts+"].orderQuantity";		
	
		orderQuantity.id="orderQuantity"+counts;
		cell2.appendChild(orderQuantity);
		var idfordel=orderQuantity.getAttribute('id');
		
		var idfordelorder=orderMenu.getAttribute('id');
		
		var removebtn = document.createElement("span");
		removebtn.setAttribute('id',idfordel+"1");
		removebtn.setAttribute('id',idfordel+"1");
		
		var removebtnid=removebtn.getAttribute('id');
		
		
		removebtn.setAttribute('onclick', 'deleterow("'+idfordel+'","'+idfordelorder+'","'+removebtnid+'")');
		
		 removebtn.innerHTML = "Remove"; 
		 
		var div = document.getElementById(idfordel);
		insertAfter(div, removebtn);
		
		textBoxCount();
	}
</SCRIPT>
<script type="text/javascript">

function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}

	function textBoxCount(){
		var count=document.getElementById("count").value;
		count++;
		document.getElementById("count").value=count;
	//	alert(count);

}
	function deleterow(orderQuantityid,orderMenuid,removebtnid){
		document.getElementById(orderQuantityid).remove();
		document.getElementById(orderMenuid).remove();
		document.getElementById(removebtnid).remove();
	}
	
	function textBoxValues(){
		var finalString="";
		var count=document.getElementById("count").value;
	//	alert(count)
			
		for(var i=0;i<=count;i++){
			var hosue="orderMenu"+i;
			var orderQuantity="orderQuantity"+i;
			
			
			/* var country="country"+i; */

		var address=document.getElementById(hosue).value;
		var orderQuantity=document.getElementById(orderQuantity).value;
		/* var country=document.getElementById(country).value; */
		finalString=finalString+address+":"+orderQuantity+"#";
		}
		//	alert(finalString);
			document.getElementById("allVal").value=finalString;
		
}

</script>

<style type="text/css">


#order2-form .fieldgroup {
    background: url("form-divider.gif") repeat-x scroll left top transparent;
    display: inline-block;
    padding: 8px 10px;
    width: 340px;
}

#order2-form .fieldgroup label {
    float: left;
    padding: 15px 0 0;
    text-align: right;
    width: 110px;
}

#order2-form .fieldgroup input, #order2-form .fieldgroup textarea, #order2-form .fieldgroup select {
    float: right;
    margin: 10px 0;
    height: 25px;
}

#order2-form .submit {
    padding: 10px;
    width: 220px;
    height: 40px !important;
}

#order2-form .fieldgroup label.error {
    color: #FB3A3A;
    display: inline-block;
    margin: 4px 0 5px 125px;
    padding: 0;
    text-align: left;
    width: 220px;
}


</style>
<script type="text/javascript">
function nospaces(t){
if(t.value.match(/\s/g)){
alert('Sorry, you are not allowed to enter any spaces');
t.value=t.value.replace(/\s/g,'');
}
}
</script>
   <script type="text/javascript">

(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#order2-form").validate({
                rules: {
                	Customer_Name:{ required: true },
                	Captain_name:{ required: true },
                	orderMenu:{ required: true }
                   
                },
                messages: {
                   
                
                	Customer_Name:  "<font color=red>Please enter customer name</font>",
                	Captain_name: { required: "<font color=red>Please select captain name</font>"},
                orderMenu0: { required: "<font color=red>Please select captain name</font>"}
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });
        }
    }

    //when the dom has loaded setup form validation rules
    $(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
    });

})(jQuery, window, document);
</script>




</head>
<body>
	<%
		if (session == null) {
			response.sendRedirect("login.jsp");
		} else {
	%>
	<%@include file="Common/header.jsp"%>


	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active"><b>Order Form</b></li>
		</ol>
	</div>
	<!--/.row-->

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Order</h1>
		</div>
	</div>
	<!--/.row-->


	<div class="row">
		<div class="col-md-11" style="margin-left: 30px">
			<div class="panel panel-default" style="margin-top: 20px;">

				<div class="panel-body">
					
					<form  class="form-horizontal" action="Controller" method="get" name="order2-form" id="order2-form" novalidate="novalidate">
						<input type="hidden" name="orderMenuFormContent" value="orderMenuFormContent">
						<input type="hidden" name="countOrders"	id="count" value="0"/>
<input type="hidden" name="allValues" id="allVal"/>

						<fieldset>
							<!-- Customer ID -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Customer
									Name</label>
								<div class="col-md-9">
									<input name="Customer_Name" type="text"
										placeholder="Customer Name" class="form-control">
								</div>
							</div>

							<!-- Date & Time--->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Order
									Date</label>
								<div class="col-md-9">
									<input name="Order_Date" type="text"
										placeholder="<%=request.getParameter("tdate")%>"
										class="form-control"
										value="<%=request.getParameter("tdate")%>" readonly="readonly">
								</div>
							</div>

							<!-- Table No -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Table
									No</label>
								<div class="col-md-9">
									<input name="table_no" type="text"
										placeholder="<%=request.getParameter("t_no")%>"
										class="form-control" value="<%=request.getParameter("t_no")%>"
										readonly="readonly">
								</div>
							</div>

							<!-- Order Number -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Order
									Number</label>
								<div class="col-md-9">
									<input name="Order_no" type="text"
										placeholder="<%=request.getParameter("ordno")%>"
										class="form-control"
										value="<%=request.getParameter("ordno")%>" readonly="readonly">
								</div>
							</div>
							<!-- Captain Name -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Captain
									Name</label>
								<div class="col-md-9">
									<%
										try {
												ResultSet CFDIGCD = CaptainFormDaoImpl.GridCaptain_detail();
									%>


									<select class="form-control" name="Captain_name">
										
										<option disabled selected hidden value="">-- select captain name --</option>
										<%
											while (CFDIGCD.next()) {
										%>

										<option value="<%=CFDIGCD.getString("cap_name")%>"><%=CFDIGCD.getString("cap_name")%></option>
										<%
											}
										%>
									</select>
									<%
										} catch (Exception e) {
												System.out.println(e);
											}
									%>
								</div>
							</div>

							<!--Item Cost-->

						<div class="form-group">
								<label class="col-md-3 control-label" for="name"></label>
								<div class="col-md-9">
									<TABLE id="multiOrdersTable" >
										<TR>
											<TD >Order Menu</TD>
											<TD >&nbsp;&nbsp;&nbsp;Quantity</TD>

										</TR>
										<TR>
											<TD><select class="form-control"  name="user.orders[0].orderMenu" id="orderMenu0" required >
													<option  disabled selected hidden value="">Select Menu</option>
													
													<%
													String dbstring="";
														try {
																ResultSet OMDGOM = OrderMenuDao.GridOrderMenu_detail();

																while (OMDGOM.next()) {
																	
																	dbstring=dbstring +","+OMDGOM.getString("item_name");
																	
													%>
					<option value="<%=OMDGOM.getString("item_name")%>"><%=OMDGOM.getString("item_name")%></option>
													
													<%
														}
																
													%>
											</select> <%
												 	} catch (Exception e) {
												 			System.out.println(e);
												 		}
														
														
														//out.println("dbstring :--"+dbstring);
												 %>
												 <%
												 String nwdbstring=dbstring.replaceFirst(",", "");
												 %>
												 
												 <input type="hidden" value="<%=nwdbstring %>" id="db_menus">
												 </TD>
&nbsp;
&nbsp;
&nbsp;
											<TD><INPUT type="text" class="form-control" name="user.orders[0].orderQuantity" style="margin-left: 10px; margin-top: 7px;" id="orderQuantity0"required/></TD>
										</TR>
									</TABLE>
									<INPUT type="button" value="Add More" class="btn btn-primary" onclick="addRow('multiOrdersTable')" />
									
								</div>
							</div>

				
				<center>
					<button type="submit" class="btn btn-primary" onclick="textBoxValues();">Submit</button>
					<button type="reset" class="btn btn-default  ">Clear</button>
				</center>
				</fieldset>
				</form>
			</div>
		</div>


	</div>
	<!--/.col-->

	</div>
	<!--/.col-->

	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/select2.js"></script>
	<script src="js/select2.min.js"></script>
	<%@include file="Common/footer.jsp"%>
	<%
		}
	%>

</body>
</html>
