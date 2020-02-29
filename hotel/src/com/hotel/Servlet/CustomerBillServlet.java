package com.hotel.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.Model.AlterOrderdetails;
import com.hotel.Service.OrderDetailGetterSetter;

/**
 * Servlet implementation class Customer_bill
 */
@WebServlet("/CustomerBillServlet")
public class CustomerBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerBillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		RequestDispatcher rd;
		String order_no_payment_done=request.getParameter("order_no_payment_done");
		String total_amount_payment_done=request.getParameter("total_amount_payment_done");
		String table_no_payment_done=request.getParameter("table_no_payment_done");
		
		com.hotel.Service.OrderDetailGetterSetter ODGTS= new OrderDetailGetterSetter();
		ODGTS.setTotal_bill_amount_done(total_amount_payment_done);
		ODGTS.setOrderNo(order_no_payment_done);
		ODGTS.setTableNo(table_no_payment_done);
		
		//update in backup table
		try {
		int i=AlterOrderdetails.update_bill_amount_backup_orders_details(ODGTS);
		AlterOrderdetails.deleteOrder(table_no_payment_done, order_no_payment_done);
		
		if(i==1){
			request.setAttribute("payment_success_message", "Thank You! You have successfully done wih payment.");
		}
		
		rd = request.getRequestDispatcher("OrderBill.jsp");
		rd.include(request, response);		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
