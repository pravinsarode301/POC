package com.hotel.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hotel.Model.AlterItemDetails;
import com.hotel.Model.AlterOrderdetails;
import com.hotel.Model.OrderFormDaoImpl;
import com.hotel.Service.OrderDetailGetterSetter;

@WebServlet("/Controller")
// @WebServlet(urlPatterns="/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		PrintWriter out=response.getWriter();
		
		
		String linkQueryString = request.getQueryString();

		String loginlink = request.getParameter("loginlink");
		String CaptionFormDetails = request.getParameter("CaptionFormDetails");
		String placeOrderDetails = request.getParameter("placeOrderDetails");
		String orderMenuFormContent = request.getParameter("orderMenuFormContent");
		String addItems = request.getParameter("addItems");
		
		/* captain details view edit delete parameters */

		String CaptainViewEditTrash = request
				.getParameter("CaptainViewEditTrash");
		String updateCaptainForm = request.getParameter("updateCaptainForm");
		String captain_idFromViewData = request
				.getParameter("captain_idFromViewData");
		String CaptaintViewId = request.getParameter("CaptaintViewId");
		String CaptaintEditId = request.getParameter("CaptaintEditId");
		String CaptaintTrashId = request.getParameter("CaptaintTrashId");

		/* item details view edit delete paramters */

		String ItemViewEditTrash = request.getParameter("ItemViewEditTrash");
		String ItemViewID = request.getParameter("ItemViewID");
		String ItemEditID = request.getParameter("ItemEditID");
		String ItemTrashID = request.getParameter("ItemTrashID");
		String addItemsEditLink = request.getParameter("addItemsEditLink");
		String updateItemFormId = request.getParameter("updateItemFormId");
		String updateItemform = request.getParameter("updateItemform");

		/* order details view edit trash parameter */
		String OrderViewEditTrash = request.getParameter("OrderViewEditTrash");
		String OrderViewID = request.getParameter("OrderViewID");
		String OrderEditID = request.getParameter("OrderEditID");
		String OrderTrashID = request.getParameter("OrderTrashID");
		String OrderEditLink = request.getParameter("OrderEditLink");
		String updateOrderId = request.getParameter("updateOrderId");
		String updateOrderform = request.getParameter("updateOrderform");
		String OrderID=request.getParameter("OrderID");

		/*notification table info*/
		
		String table=request.getParameter("table"); 
		/*back to links*/
		
		String gobacktoAddItoms=request.getParameter("gobacktoAddItoms");
		String gobacktoOrderPage=request.getParameter("gobacktoOrderPage");
		String gobacktoCaptain=request.getParameter("gobacktoCaptain");
		
		
		// payment done
		String payment_done=request.getParameter("payment_done");
		
		//forgot password link 
		String forgotpasswordlink=request.getParameter("forgotpasswordlink");
		
		// report generator
		String reportmodule=request.getParameter("reportmodule");
		
		
		
		if (linkQueryString != null) {
			try {
				switch (linkQueryString) {

				case "Dashboard": /* Home page link before login */
					request.setAttribute("Dashboard", "Dashboard");
					rd = request.getRequestDispatcher("Home.jsp");
					rd.include(request, response);
					
					break;
				case "afterLoginDashboard": /* Home page link after login */
					request.setAttribute("afterLoginDashboard", "afterLoginDashboard");
					rd = request.getRequestDispatcher("Home.jsp");
					rd.forward(request, response);
					break;

				case "Captain": /* Captain page link */
					request.setAttribute("Captain", "Captain");
					rd = request.getRequestDispatcher("Captain.jsp");
					rd.forward(request, response);
					break;
				case "OrderForms": /* Caporder page link */
					request.setAttribute("OrderForms", "OrderForms");
					rd = request.getRequestDispatcher("Orders.jsp");
					rd.forward(request, response);
					break;
				case "Alert": /* Alert/notification page link */
					request.setAttribute("Alert", "Alert");
					rd = request.getRequestDispatcher("Alert.jsp");
					rd.include(request, response);
					break;
				case "AddItoms": /* Additem page link */
					request.setAttribute("AddItoms", "AddItoms");
					rd = request.getRequestDispatcher("Additem.jsp");
					rd.include(request, response);
					break;
				case "PerdayReports": /* PerdayReports page link */
					request.setAttribute("PerdayReports", "PerdayReports");
					rd = request.getRequestDispatcher("Perday.jsp");
					rd.include(request, response);
					break;
				case "MonthReports": /* Monwise page link */
					request.setAttribute("MonthReports", "MonthReports");
					rd = request.getRequestDispatcher("Monwise.jsp");
					rd.include(request, response);
					break;
				case "HalfyearReports": /* Halfyear page link */
					request.setAttribute("HalfyearReports", "HalfyearReports");
					rd = request.getRequestDispatcher("Halfyear.jsp");
					rd.include(request, response);
					break;
				case "user_profile": /* user profile */
					rd = request.getRequestDispatcher("User_profile.jsp");
					rd.include(request, response);
					break;
						
				case "ajaxemailretrive": /* ajaxemailretrive */
					rd = request.getRequestDispatcher("/ForgotPasswordServlet");
					rd.include(request, response);
					break;
			
				case "LogOut": /* logout page link */
					rd = request.getRequestDispatcher("logout.jsp");
					rd.include(request, response);
					break;
				default:
					/*
					 * no required to add default page,and of it is then it will
					 * effect
					 * CaptainViewEditTrash,ItemViewEditTrash,OrderViewEditTrash
					 * pages
					 */
					break;
				}
			} catch (NullPointerException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();

			}
		}
		try {
			if ("loginlink".equals(loginlink) && loginlink != null) {

				rd = request.getRequestDispatcher("/ServletLogin");
				rd.include(request, response);

			} else if ("CaptionFormDetails".equals(CaptionFormDetails)
					&& CaptionFormDetails != null) {

				rd = request.getRequestDispatcher("/CaptainDetailsServlet");
				rd.include(request, response);

			} else if ("placeOrderDetails".equals(placeOrderDetails)
					&& placeOrderDetails != null) {
				request.setAttribute("OrderForms", "OrderForms");
				rd = request.getRequestDispatcher("OrderMenu.jsp");
				rd.include(request, response);

			} else if ("orderMenuFormContent".equals(orderMenuFormContent)
					&& orderMenuFormContent != null) {
				request.setAttribute("OrderForms", "OrderForms");
				rd = request.getRequestDispatcher("/OrdersPlaceDetailsServlet");
				rd.include(request, response);

			} else if ("addItems".equals(addItems) && addItems != null) {
				request.setAttribute("AddItoms", "AddItoms");
				rd = request.getRequestDispatcher("/AddNewItemsServlet");
				rd.include(request, response);

			} else if ("CaptainViewEditTrash".equals(CaptainViewEditTrash)
					&& CaptainViewEditTrash != null) {
				/* edit update view link for captin */
				request.setAttribute("Captain", "Captain");
				String captain_id = request.getParameter("captain_id");
				request.setAttribute("captain_id", captain_id);

				if ("CaptaintViewId".equals(CaptaintViewId)
						&& CaptaintViewId != null) {
					request.setAttribute("Captain", "Captain");
					rd = request.getRequestDispatcher("captainViewData.jsp");
					rd.include(request, response);
				} else if ("CaptaintEditId".equals(CaptaintEditId)
						&& CaptaintEditId != null) {
					request.setAttribute("Captain", "Captain");
					rd = request.getRequestDispatcher("captainEditData.jsp");
					rd.include(request, response);
				} else if ("CaptaintTrashId".equals(CaptaintTrashId)
						&& CaptaintTrashId != null) {
					request.setAttribute("Captain", "Captain");
					int i = com.hotel.Model.AlterCaptaindetails
							.deleteCaptain(captain_id);
					if (i == 1) {
						request.setAttribute("deleteCaptainStatus",
								"Captain has been deleted successfully!");
					}
					rd = request.getRequestDispatcher("Captain.jsp");
					rd.include(request, response);
				}

			} else if ("ItemViewEditTrash".equals(ItemViewEditTrash)
					&& ItemViewEditTrash != null) {
				request.setAttribute("AddItoms", "AddItoms");
				String Item_ID = request.getParameter("Item_ID");
				request.setAttribute("Item_ID", Item_ID);

				if ("ItemViewID".equals(ItemViewID) && ItemViewID != null) {
					request.setAttribute("AddItoms", "AddItoms");
					rd = request.getRequestDispatcher("AdditemViewData.jsp");
					rd.include(request, response);

				} else if ("ItemEditID".equals(ItemEditID)
						&& ItemEditID != null) {
					request.setAttribute("AddItoms", "AddItoms");
					rd = request.getRequestDispatcher("AdditemEditData.jsp");
					rd.include(request, response);
				} else if ("ItemTrashID".equals(ItemTrashID)
						& ItemTrashID != null) {
					int i = AlterItemDetails.deleteItem(Item_ID);
					if (i == 1) {
						request.setAttribute("deleteItemStatus",
								"Item has been deleted successfully!");
					}
					request.setAttribute("AddItoms", "AddItoms");
					rd = request.getRequestDispatcher("Additem.jsp");
					rd.include(request, response);
				}
			} else if ("OrderViewEditTrash".equals(OrderViewEditTrash)
					&& OrderViewEditTrash != null) {
				request.setAttribute("OrderForms", "OrderForms");
				String Order_ID = request.getParameter("Order_ID");
				request.setAttribute("Order_ID", Order_ID);
				String orderDeleteTable_no=request.getParameter("orderDeleteTable_no");
				

				if ("OrderViewID".equals(OrderViewID) && OrderViewID != null) {
					request.setAttribute("OrderForms", "OrderForms");
					rd = request.getRequestDispatcher("OrderViewData.jsp");
					rd.include(request, response);

				} else if ("OrderEditID".equals(OrderEditID)
						&& OrderEditID != null) {
					request.setAttribute("OrderForms", "OrderForms");
					rd = request.getRequestDispatcher("OrderEditData.jsp");
					rd.include(request, response);
				} else if ("OrderTrashID".equals(OrderTrashID)
						& OrderTrashID != null) {
					//String orderDeleteTable_no=request.getParameter("orderDeletetable_no");
					//out.println("table no for delete in controller "+orderDeleteTable_no);
					int i = AlterOrderdetails.deleteOrder(orderDeleteTable_no,Order_ID);
					//if (i == 1) {
						request.setAttribute("deleteOrderStatus",
								"Order has been deleted successfully!");
				//	}
					rd = request.getRequestDispatcher("Orders.jsp");
					rd.include(request, response);

				}else if("OrderID".equals(OrderID)&& OrderID!=null){
					request.setAttribute("OrderForms", "OrderForms");
					String table_no=request.getParameter("table_no");
					request.setAttribute("table_no1", table_no);
					rd = request.getRequestDispatcher("OrderBill.jsp");
					rd.include(request, response);

				}

			} else if ("updateCaptainForm".equals(updateCaptainForm)
					&& updateCaptainForm != null) {
				request.setAttribute("Captain", "Captain");
				rd = request.getRequestDispatcher("/UpdateCaptaindetailsServlet");
				rd.include(request, response);

			} else if ("captain_idFromViewData".equals(captain_idFromViewData)
					&& captain_idFromViewData != null) {
				request.setAttribute("Captain", "Captain");
				request.setAttribute("updateCaptainFormId", updateCaptainForm);
				rd = request.getRequestDispatcher("captainEditData.jsp");
				rd.include(request, response);
			} else if ("addItemsEditLink".equals(addItemsEditLink)
					&& addItemsEditLink != null) {
				request.setAttribute("AddItoms", "AddItoms");
				request.setAttribute("updateItemFormId", updateItemFormId);
				rd = request.getRequestDispatcher("AdditemEditData.jsp");
				rd.include(request, response);
			} else if ("OrderEditLink".equals(OrderEditLink)
					&& OrderEditLink != null) {
				request.setAttribute("OrderForms", "OrderForms");
				request.setAttribute("updateOrderId", updateOrderId);
				rd = request.getRequestDispatcher("OrderEditData.jsp");
				rd.include(request, response);

			} else if ("updateItemform".equals(updateItemform)
					&& updateItemform != null) {

				rd = request.getRequestDispatcher("/UpdateItemDetailsServlet");
				rd.include(request, response);

			} else if ("updateOrderform".equals(updateOrderform)
					&& updateOrderform != null) {
				request.setAttribute("OrderForms", "OrderForms");
				rd = request.getRequestDispatcher("/UpdateOrderDetailsServlet");
				rd.include(request, response);

			} else if("table".equals(table)&& table!=null){
				String tbl_no=request.getParameter("table_no");
				request.setAttribute("tbl_no", tbl_no);
				request.setAttribute("OrderForms", "OrderForms");
				rd = request.getRequestDispatcher("/OrderBill.jsp");
				rd.include(request, response);
			}else if("gobacktoAddItoms".equals(gobacktoAddItoms)&&gobacktoAddItoms!=null){
				request.setAttribute("AddItoms", "AddItoms");
				rd = request.getRequestDispatcher("/Additem.jsp");
				rd.include(request, response);
			}else if("gobacktoOrderPage".equals(gobacktoOrderPage)&& gobacktoOrderPage!=null){
				request.setAttribute("OrderForms", "OrderForms");
				rd = request.getRequestDispatcher("/Orders.jsp");
				rd.include(request, response);
			}else if("gobacktoCaptain".equals(gobacktoCaptain)&&gobacktoCaptain!=null){
				request.setAttribute("Captain", "Captain");
				rd = request.getRequestDispatcher("/Captain.jsp");
				rd.include(request, response);				
			}else if("payment_done".equals(payment_done)&&payment_done!=null){
				
				rd = request.getRequestDispatcher("/CustomerBillServlet");
				rd.include(request, response);			
			}else if("forgotpasswordlink".equals(forgotpasswordlink)&&forgotpasswordlink!=null){
				
				rd = request.getRequestDispatcher("/ForgotPasswordServlet");
				rd.include(request, response);			
			}else if("reportmodule".equals(reportmodule) && reportmodule !=null)
			{
				rd = request.getRequestDispatcher("/ReportServlet");
				rd.include(request, response);	
				
			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
