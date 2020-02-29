package com.hotel.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
 * Servlet implementation class UpdateOrderDetails
 */
@WebServlet("/UpdateOrderDetailsServlet")
public class UpdateOrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		String customer_name=request.getParameter("Customer_Name");
		String Order_Date=request.getParameter("Order_Date");

		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		SimpleDateFormat sdfmt1 = new SimpleDateFormat("dd/MM/yyyy");
		
		Date captains_jdt;
		String result_Order_Date="";
		try {
			captains_jdt = formatter.parse(Order_Date);
			java.sql.Date sqlDate = new java.sql.Date(captains_jdt.getTime());
			result_Order_Date=sdfmt1.format(sqlDate);
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String table_no=request.getParameter("table_no");
		String backup_tableno=request.getParameter("backup_tableno");
		String Order_no=request.getParameter("Order_no");
		String Captain_name=request.getParameter("Captain_name");
		String Order_Menu_Name=request.getParameter("Order_Menu_Name");
		String item_Quantity=request.getParameter("item_Quantity");


		int count=Integer.parseInt(request.getParameter("countOrders"));
		String allValues=request.getParameter("allValues");
		
		 
		OrderDetailGetterSetter ODGS=new OrderDetailGetterSetter();
		
		ODGS.setCustomerNname(customer_name);
		ODGS.SetOrderDate(result_Order_Date);
		ODGS.setTableNo(table_no);
		ODGS.setBackup_tableno(backup_tableno);
		ODGS.setOrderNo(Order_no);
		ODGS.setCaptainName(Captain_name);
		ODGS.setOrderMenuName(allValues);
		ODGS.setItemQuantity(item_Quantity);
		
	
		
		
		
		AuthTestInterface ATF=new AuthTest();
		try {
			int s=ATF.updateOrderFormDetails(ODGS);
			if(s==1){
				request.setAttribute("OrderNoFromServlet", ODGS.getOrderNo());
				request.setAttribute("Success_Status_Order", "Order data has been successfully updated!");
			}else{
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("OrderEditData.jsp");
		rd.include(request, response);
		
	}

}
