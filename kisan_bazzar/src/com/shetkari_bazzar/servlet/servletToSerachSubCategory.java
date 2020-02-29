package com.shetkari_bazzar.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class servletToSerachSubCategory
 */
@WebServlet("/servletToSerachSubCategory")
public class servletToSerachSubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    		
    		
    		int mainCatId=Integer.parseInt(request.getParameter("mainCatId"));
    		
    		
    		
    		
		doGet(request, response);
	}

}
