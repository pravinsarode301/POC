
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.hotel.Model.AlterOrderdetails"%>
<%@page import="com.hotel.Model.CaptainFormDaoImpl"%>
<%@page import="com.hotel.Model.OrderMenuDao"%>
<%@page import="com.hotel.Model.OrderFormDaoImpl"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>



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
<style type="text/css">
#orderupdate_form .fieldgroup {
	background: url("form-divider.gif") repeat-x scroll left top transparent;
	display: inline-block;
	padding: 8px 10px;
	width: 340px;
}

#orderupdate_form .fieldgroup label {
	float: left;
	padding: 15px 0 0;
	text-align: right;
	width: 110px;
}

#orderupdate_form .fieldgroup input, #orderupdate_form .fieldgroup textarea,
	#orderupdate_form .fieldgroup select {
	float: right;
	margin: 10px 0;
	height: 25px;
}

#orderupdate_form .submit {
	padding: 10px;
	width: 220px;
	height: 40px !important;
}

#orderupdate_form .fieldgroup label.error {
	color: #FB3A3A;
	display: inline-block;
	margin: 4px 0 5px 125px;
	padding: 0;
	text-align: left;
	width: 220px;
}
</style>
<script type="text/javascript">

(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#orderupdate_form").validate({
                rules: {
                	
                	Customer_Name:{ required: true },
                	table_no:{ required: true },
                	Captain_name:{ required: true },
                    
                
                },
                messages: {
                   
                
                	Customer_Name:  "<font color=red>Please enter the customer name</font>",
                	table_no:  "<font color=red>Please select table number from list</font>",
                	Captain_name:  "<font color=red>Please enter the captain name</font>",
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


<SCRIPT language="javascript">
	function addRow(multiOrdersTable) {

		var table = document.getElementById(multiOrdersTable);

		var db_menus = document.getElementById('db_menus');
		var array_db_menus=$("#db_menus").val();
		
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);
		var counts=rowCount-1;
		var cell1 = row.insertCell(0);
		var orderMenu = document.createElement("select");
		
		orderMenu.style.border = " 1px solid #eee";
		orderMenu.style.height = "34px";
		orderMenu.style.width = "100%";
		orderMenu.style.marginTop = "-36px";
		orderMenu.style.padding= "6px 12px";
		
		
		 orderMenu.type = "optain";  
			
		 var res = array_db_menus.split(",");
		 	var options_str = "";	 	
		 	options_str += '<option value="" selected="" disabled="disabled" hidden >Select Menu</option>';
		 	res.forEach( function(res) {	 		
		 		  options_str += '<option value="' + res + '">' + res + '</option>';
		 		  
		 		});
	 	
	 	orderMenu.innerHTML = options_str;
		orderMenu.name="user.orders["+counts+"].orderMenu";
		orderMenu.id="orderMenu"+counts;
		
		cell1.appendChild(orderMenu);
		
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
			
		for(var i=0;i<=count+1;i++){
			var hosue="orderMenu"+i;
			var orderQuantity="orderQuantity"+i;
			/* var country="country"+i; */

		var address=document.getElementById(hosue).value;
		var orderQuantity=document.getElementById(orderQuantity).value;
		/* var country=document.getElementById(country).value; */
		finalString=finalString+address+":"+orderQuantity+"#";
		//alert(finalString);
		document.getElementById("allVal").value=finalString;
		}
			//alert(finalString);
			//document.getElementById("allVal").value=finalString;
		
}

</script>


<script language="Javascript" type="text/javascript">
    function isNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if (iKeyCode < 48 || iKeyCode > 57)
      
    return false;
    return true;
}   
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
			<li class="active"><b>Order Form / Edit Details</b></li>
		</ol>
	</div>
	<!--/.row-->

	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				Order Details
				</h1>
		</div>
	</div>
	<!--/.row-->

	<div class="row">
		<div class="col-md-11" style="margin-left: 30px">
			<div class="panel panel-default" style="margin-top: 20px;">

				<div class="panel-body">
					<p></p>
					<%!static String customer_name;
	static String c_date;
	static String table_no;
	static String order_no;
	static String captain_name;%>
					<%
						String Order_ID;

							if (request.getAttribute("Order_ID") != null) {

								Order_ID = (String) request.getAttribute("Order_ID");
							} else if (request.getAttribute("updateOrderId") != null) {
								Order_ID = (String) request.getAttribute("updateOrderId");
							} else {
								Order_ID = (String) request.getAttribute("OrderNoFromServlet");
							}

							ResultSet rt = AlterOrderdetails.getOrderdetails(Order_ID);
							if (request.getAttribute("Success_Status_Order") != null) {
								out.println("<div class='alert alert-success'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+request.getAttribute("Success_Status_Order")+"</div>");
							}

							ArrayList abc = new ArrayList();
							while (rt.next()) {

								customer_name = rt.getString("customer_name");
								c_date = rt.getString("c_date");
								table_no = rt.getString("table_no");
								order_no = rt.getString("order_no");
								captain_name = rt.getString("captain_name");

								abc.add(rt.getString("ord_menu") + "_" + rt.getString("quantity"));
							}

							String order = abc.toString();
					%>
					<form class="form-horizontal" action="Controller" method="POST"
						name="orderupdate_form" id="orderupdate_form"
						novalidate="novalidate">
						<input type="hidden" name="updateOrderform"
							value="updateOrderform"> <input type="hidden"
							name="countOrders" id="count" value="1" /> <input type="hidden"
							name="allValues" id="allVal">
						<fieldset>
							<!-- Customer ID -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Customer
									Name</label>
								<div class="col-md-9">
									<input name="Customer_Name" type="text"
										onkeypress="return onlyAlphabets(event,this);"readonly="readonly"
										placeholder="<%=customer_name%>" value="<%=customer_name.trim()%>"
										class="form-control">
								</div>
							</div>

							<!-- Date & Time--->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Order
									date</label>
								<div class="col-md-9">

									<input name="Order_Date" type="date" placeholder="<%=c_date%>"
										value="<%=c_date%>" class="form-control" readonly="readonly">
								</div>
							</div>

							<!-- Table No -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Table
									No</label>
								<div class="col-md-9">
									<%
										int value = Integer.parseInt(table_no);
										int backup_tableno=Integer.parseInt(table_no);
										
									%>
									<input type="hidden" name="backup_tableno" value=<%=backup_tableno %>>
									<select class="form-control" name="table_no" readonly="readonly"
										placeholder="<%=value%>" value="<%=value%>">

										<option value="1"
											<%if (value == 1) {
					out.println("selected");
				} else {
					out.println("");
				}%>>Table
											No-1</option>
										<option value="2"
											<%if (value == 2) {
					out.println("selected");
				} else {
					out.println("");
				}%>>Table
											No-2</option>
										<option value="3"
											<%if (value == 3) {
					out.println("selected");
				} else {
					out.println("");
				}%>>Table
											No-3</option>
										<option value="4"
											<%if (value == 4) {
					out.println("selected");
				} else {
					out.println("");
				}%>>Table
											No-4</option>
										<option value="5"
											<%if (value == 5) {
					out.println("selected");
				} else {
					out.println("");
				}%>>Table
											No-5</option>
										<option value="6"
											<%if (value == 6) {
					out.println("selected");
				} else {
					out.println("");
				}%>>Table
											No-6</option>
										<option value="7"
											<%if (value == 7) {
					out.println("selected");
				} else {
					out.println("");
				}%>>Table
											No-7</option>
										<option value="8"
											<%if (value == 8) {
					out.println("selected");
				} else {
					out.println("");
				}%>>Table
											No-8</option>
										<option value="9"
											<%if (value == 9) {
					out.println("selected");
				} else {
					out.println("");
				}%>>Table
											No-9</option>

									</select>

									<%-- <input  name="table_no" type="text" placeholder="<%=rt.getString("table_no") %>" value="<%=rt.getString("table_no") %>" class="form-control"  > --%>
								</div>
							</div>

							<!-- Order Number -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Order
									Number</label>
								<div class="col-md-9">
									<input name="Order_no" type="text" placeholder="<%=order_no%>"
										value="<%=order_no%>" class="form-control" readonly="readonly">
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

										<%
											while (CFDIGCD.next()) {
										%>

										<option
											<%if (captain_name.equals(CFDIGCD.getString("cap_name"))) {%>
											<%="selected"%> <%}%>
											value="<%=CFDIGCD.getString("cap_name")%>"><%=CFDIGCD.getString("cap_name")%></option>
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
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Orders</label>
								<div class="col-md-9">
									<TABLE id="multiOrdersTable">
										<TR>
											<TD>&nbsp;Order Menu</TD>
											<TD>&nbsp;&nbsp;&nbsp;&nbsp;Quantity</TD>

										</TR>
										<%-- <%!static String active="selected"; %> --%>
										<%
											//out.println(order);
												order = order.replace("[", "");
												order = order.replace("]", "");
												order = order.replace(" ", "");
												String[] order1 = order.split("_|,");

												int i = 0;
												int j = 0;

											//	 while (i < order1.length) {
												//	 ForEach(order1 order1){
										try{		 
												 while(order1[i]!=null){
												
										%>
										<TR>
											<TD><select class="form-control"
												name="user.orders[<%=j%>].orderMenu" id="orderMenu<%=j%>">

													<option value="0">Select Menu</option>
													<%
													String dbstring="";
														try {
																	ResultSet OMDGOM = OrderMenuDao.GridOrderMenu_detail();

																	while (OMDGOM.next()) {
																		
																		dbstring=dbstring +","+OMDGOM.getString("item_name");
																		System.out.println();
													%>

													<option value="<%=OMDGOM.getString("item_name")%>"
														<%if (order1[i].equals(OMDGOM.getString("item_name"))) {%>
														<%="selected"%> <%}%>><%=OMDGOM.getString("item_name")%></option>
													<%
														}
													%>
											</select> 
											<%	i += 1;%>
											</TD>
										
												 <%
												 String nwdbstring=dbstring.replaceFirst(",", "");
												 %>
												 
											<input type="hidden" value="<%=nwdbstring %>" id="db_menus">
											
											<TD><INPUT type="text"	value="<%=order1[i]%>" class="form-control" style="margin-left: 10px; margin-top: 0px;"
												onkeypress="javascript:return isNumber (event)" name="user.orders[<%=j%>].orderQuantity" id="orderQuantity<%=j%>" /></TD>
											<%	i++;
												j++;
														} catch (ArrayIndexOutOfBoundsException e) {
															System.out.println(e);
														}

													}}catch(Exception e){}
											%>
										</TR>
									</TABLE>
									<INPUT type="button" value="Add More" class="btn btn-primary"
										onclick="addRow('multiOrdersTable')" />
								</div>
							</div>

							<%-- <div class="col-md-9">
									<input name="Captain_name" type="text"
										placeholder="<%=captain_name%>"
										value="<%=captain_name%>"
										class="form-control">
								</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Order
									Menu</label>
								<div class="col-md-9">
									<input name="Order_Menu_Name" type="text"
										placeholder="<%=ord_menu%>"
										value="<%=rt.getString("ord_menu")%>" class="form-control">
									<option value="<%= rt.getString("ord_menu") %>" placeholder="<%=rt.getString("ord_menu") %>>"><%= rt.getString("ord_menu") %></option>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Quantity</label>
								<div class="col-md-9">
									<input  name="item_Quantity" type="text" placeholder="<%=rt.getString("quantity") %>" value="<%=rt.getString("quantity") %>" class="form-control">
									<%
										int value1 = Integer.parseInt(rt.getString("quantity"));
												/* System.out.println(value1); */
									%>
									<select class="form-control" name="item_Quantity">

										<option value="0">Select Quantity</option>
										<option value="1"
											<%if (value1 == 1) {
						out.println("selected");
					} else {
						out.println("");
					}%>>1</option>
										<option value="2"
											<%if (value1 == 2) {
						out.println("selected");
					} else {
						out.println("");
					}%>>2</option>
										<option value="3"
											<%if (value1 == 3) {
						out.println("selected");
					} else {
						out.println("");
					}%>>3</option>
										<option value="4"
											<%if (value1 == 4) {
						out.println("selected");
					} else {
						out.println("");
					}%>>4</option>
										<option value="5"
											<%if (value1 == 5) {
						out.println("selected");
					} else {
						out.println("");
					}%>>5</option>
										<option value="6"
											<%if (value1 == 6) {
						out.println("selected");
					} else {
						out.println("");
					}%>>6</option>
										<option value="7"
											<%if (value1 == 7) {
						out.println("selected");
					} else {
						out.println("");
					}%>>7</option>
										<option value="8"
											<%if (value1 == 8) {
						out.println("selected");
					} else {
						out.println("");
					}%>>8</option>
										<option value="9"
											<%if (value1 == 9) {
						out.println("selected");
					} else {
						out.println("");
					}%>>9</option>
										<option value="10"
											<%if (value1 == 10) {
						out.println("selected");
					} else {
						out.println("");
					}%>>10</option>
									</select>
								</div> --%>
				</div>
				<center>
					<button type="submit" class="btn btn-primary"
						onclick="textBoxValues();">Update</button>
					<button type="button" class="btn btn-default  "
						onclick="window.location.href='Controller?gobacktoOrderPage=gobacktoOrderPage'">Close</button>
					<!--<button type="Reset" class="btn btn-default  ">Reset</button>-->
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