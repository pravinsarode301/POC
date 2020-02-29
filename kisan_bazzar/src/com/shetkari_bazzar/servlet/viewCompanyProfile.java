package com.shetkari_bazzar.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class viewCompanyProfile
 */

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.ResultSet;
import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

/*
 * ***************************************************************
 * This class written for the voiw company profile 
 * 
 * auther : dnyaneshwar narwade
 * 
 * Date : 06/02/2016
 * 
 * request come from header.jsp
 * ***************************************************************
 * */

@WebServlet("/viewCompanyProfile")
public class viewCompanyProfile extends HttpServlet {

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String UsersPanel = getServletContext().getInitParameter("UsersJsp");
		CompanyHelper help = new CompanyHelperImpl();
		CompanyDTO CDTO = new CompanyDTO();
		HttpSession session = request.getSession(false);
		int abc = (Integer) session.getAttribute("userId");
		System.out.println("int" + abc);

		System.out.println("userId" + abc);
		CDTO.setCompanyId((Integer) session.getAttribute("userId"));
		CDTO.setStatus(request.getParameter("status"));
		ResultSet rt = (ResultSet) help.gridCompanyData(CDTO);
		request.setAttribute("rt", rt);
		request.setAttribute("status",CDTO.getStatus());
		
		try {
			if(rt!=null){
				while(rt.next()){
				session.setAttribute("companyName", rt.getString("company_name"));
				}
			System.out.println("ahe re");
			}else{
				System.out.println("nahi re");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 UsersPanel = getServletContext().getInitParameter("UsersJsp");
		request.getRequestDispatcher(UsersPanel + "/companyProfile.jsp").forward(request, response);

	}

}

	
	