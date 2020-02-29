package com.hotel.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.Service.OrderDetailGetterSetter;
import com.hotel.Test.AuthTest;
import com.hotel.Test.AuthTestInterface;

/**
 * Servlet implementation class OrdersPlaceDetailsServlet
 */
@WebServlet("/OrdersPlaceDetailsServlet")
public class OrdersPlaceDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersPlaceDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		PrintWriter out=response.getWriter();	
		int count=Integer.parseInt(request.getParameter("countOrders"));
		 String allValues=request.getParameter("allValues");
		 int i=count+1;
		
		 
		 String customer_name=request.getParameter("Customer_Name");
		String Order_Date=request.getParameter("Order_Date");
		String table_no=request.getParameter("table_no");
		String Order_no=request.getParameter("Order_no");
		String Captain_name=request.getParameter("Captain_name");
		String Order_Menu_Name=request.getParameter("allValues");
		String countOrders=request.getParameter("countOrders");
		
		OrderDetailGetterSetter ODGS=new OrderDetailGetterSetter();
		
		ODGS.setCustomerNname(customer_name);
		ODGS.SetOrderDate(Order_Date);
		ODGS.setTableNo(table_no);
		ODGS.setOrderNo(Order_no);
		ODGS.setCaptainName(Captain_name);
		
		ODGS.setOrderMenuName(Order_Menu_Name);
		ODGS.setCountOrders(countOrders);
	
		AuthTestInterface ATF=new AuthTest();
		
		try {
			
			int result=ATF.OrdersPlaceDetails(ODGS);
			if (result==1) {
				
				request.setAttribute("ordermsg", "Thanks ! your order has been placed!");
				
			} else {
				request.setAttribute("ordermsg", "Your order has not been placed! Try again.");
				
			}
			RequestDispatcher rd;
			rd = request.getRequestDispatcher("Orders.jsp");
			rd.include(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
