package com.hotel.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.Service.ContactFormGetterSetter;
import com.hotel.Test.AuthTest;
import com.hotel.Test.AuthTestInterface;

/**
 * Servlet implementation class UpdateCaptaindetailsServlet
 */
@WebServlet("/UpdateCaptaindetailsServlet")
public class UpdateCaptaindetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCaptaindetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
   @Override
public void service(ServletRequest request, ServletResponse response)
		throws ServletException, IOException {
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
		int s=ATF.updateCaptainDetails(Iform);
		
		if(s==1){
			request.setAttribute("status_code_captain", "Captain details has been successfully updated !");
		 
		}else{
			request.setAttribute("status_code_captain", "Error occured ! try Again later.");
		}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("captainIdFromServlet", Iform.getCaptain_id());
		RequestDispatcher rd=request.getRequestDispatcher("captainEditData.jsp");
		rd.include(request,response); 
		
} 
    
}