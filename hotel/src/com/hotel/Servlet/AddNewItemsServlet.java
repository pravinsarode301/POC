package com.hotel.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.Service.AddItemGetterSetter;
import com.hotel.Test.AuthTest;
import com.hotel.Test.AuthTestInterface;

/**
 * Servlet implementation class AddNewItemsServlet
 */
@WebServlet("/AddNewItemsServlet")
public class AddNewItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewItemsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 PrintWriter out=response.getWriter();
		String item_name=request.getParameter("item_name");
		String item_id=request.getParameter("item_id");
		String item_cost=request.getParameter("item_cost");
		String item_add_timedate=request.getParameter("item_add_timedate");
		
		AddItemGetterSetter AIGS=new AddItemGetterSetter();
		AIGS.setItem_name(item_name);
		AIGS.setItem_id(item_id);
		AIGS.setItem_cost(item_cost);
		AIGS.setItem_add_timedate(item_add_timedate);
		
		AuthTestInterface ATIS=new AuthTest();
		try {
			int result=ATIS.AddNewItemDetails(AIGS);
			if (result==1) {
				RequestDispatcher rd;
				request.setAttribute("insert_item_success", "Thanks ! your item has been inserted Successfully !");
				rd = request.getRequestDispatcher("Additem.jsp");
				rd.include(request, response);
			} else {
				System.out.println("not inserted");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
