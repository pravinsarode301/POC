package com.shetkari_bazzar.servlet;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.model.check_login;
import com.shetkari_bazzar.model.check_login_impl;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class AddCompanyData
 */
/*this class written by the dnyaneshwar narwade 03/02/2016
 * the purpose of this class is check the authontication when username and password come from the mail then this class 
 * take 2 feild emailid  and random password
 * if it is correct then it send to the directoly to the change forgotten password jsp page
 * */
@WebServlet("/checkOTP")
public class checkOTP extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	LoginDTO  dto = new LoginDTO();
	check_login cl = new check_login_impl();
	String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
	System.out.println("U ARE HERE");
	
	String username=request.getParameter("emailid");
	String ranpassword=request.getParameter("pass");
	System.out.println(username);
	System.out.println(ranpassword);
	dto.setUsername(username);
	dto.setRandompass(ranpassword);
	boolean check = cl.checkAuthontication(dto);
	if(check){
		
		request.setAttribute("validEmailStatus", "Valid email");
		request.getRequestDispatcher(SuperAdminPanel+"/changeForgottenPass.jsp").forward(request, response);
	}else{
		System.out.println("faillllllllllllllllllllllillllllllllll");
		request.setAttribute("IlligalMassage", "Your are not valid Your");
		request.getRequestDispatcher(SuperAdminPanel+"/IlligalWork.jsp").forward(request, response);
	}
	
	
	
	
	}			
	}