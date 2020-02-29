package com.shetkari_bazzar.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shetkari_bazzar.helper.SuperAdminHelper;

/**
 * Servlet implementation class portal
 */		
@WebServlet("/portal")
public class portal extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		String UserPanel = getServletContext().getInitParameter("UsersJsp");
		String QueryString =request.getQueryString();
		System.out.println(request.getRequestURL());
		
		System.out.println(request.getRequestURI());
		System.out.println(QueryString);
		HttpSession session=request.getSession(true);
		 if(QueryString.endsWith("admin")){
			session.setAttribute("panel", "adminPanel");
			request.getRequestDispatcher(SuperAdminPanel + "/superAdminLogin.jsp").forward(request, response);
		}else { 
			session.setAttribute("panel", "userPanel");
			request.getRequestDispatcher(UserPanel + "/index.jsp").forward(request, response);
		
	}
}
}