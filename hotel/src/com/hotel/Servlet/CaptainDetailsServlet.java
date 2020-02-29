package com.hotel.Servlet;

import java.awt.List;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;


import com.hotel.Model.CaptainFormDaoImpl;
import com.hotel.Service.ContactFormGetterSetter;
import com.hotel.Test.AuthTest;
import com.hotel.Test.AuthTestInterface;

/**
 * Servlet implementation class CaptainDetailsServlet
 */
@WebServlet("/CaptainDetailsServlet")
public class CaptainDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cap_name=request.getParameter("cname");
		String cap_id=request.getParameter("cid");
		String cap_dob=request.getParameter("dob");
		String cap_mob=request.getParameter("mob");
		String cap_email=request.getParameter("email");
		String cap_jdt=request.getParameter("jdate");
		String cap_addr=request.getParameter("address");
		
		
		ContactFormGetterSetter Iform=new ContactFormGetterSetter();
		Iform.setCaptain_name(cap_name);
		Iform.setCaptain_id(cap_id);
		Iform.setCaptain_dob(cap_dob);
		Iform.setCaptain_mobile(cap_mob);
		Iform.setCap_email(cap_email);
		Iform.setCaptain_JoingDate(cap_jdt);
		Iform.setCaptain_address(cap_addr);
		
		AuthTestInterface ATF=new AuthTest();
		
		
		try {
		int s=ATF.InsertCaption(Iform);
		
		if(s==1){
		request.setAttribute("Code", "Your details has been successfully saved.");
		}
		RequestDispatcher rd=request.getRequestDispatcher("Captain.jsp");
		rd.include(request,response); 
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
	}


}
