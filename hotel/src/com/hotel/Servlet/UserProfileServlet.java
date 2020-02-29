package com.hotel.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.Service.ContactFormGetterSetter;
import com.hotel.Test.AuthTest;
import com.hotel.Test.AuthTestInterface;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cap_name=request.getParameter("cname");
		String cap_id=request.getParameter("cid");
		String cap_dob=request.getParameter("dob");
		String cap_mob=request.getParameter("mob");
		String cap_email=request.getParameter("email");
		
		String cap_addr=request.getParameter("address");
		
		
		ContactFormGetterSetter CfGS=new ContactFormGetterSetter();
		CfGS.setCaptain_name(cap_name);
		CfGS.setCaptain_id(cap_id);
		CfGS.setCaptain_dob(cap_dob);
		CfGS.setCaptain_mobile(cap_mob);
		CfGS.setCap_email(cap_email);
		
		CfGS.setCaptain_address(cap_addr);
		
		AuthTestInterface ATF=new AuthTest();
		
		
		try {
		int s=ATF.updateUserProfile(CfGS);
		
		if(s==1){
			request.setAttribute("status_code_captain", "Captain details has been successfully updated !");
		 
		}else{
			request.setAttribute("status_code_captain", "Error occured ! try Again later.");
		}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("captainIdFromServlet", CfGS.getCaptain_id());
		RequestDispatcher rd=request.getRequestDispatcher("captainEditData.jsp");
		rd.include(request,response); 
		
		
		
		
		
		
	}

}
