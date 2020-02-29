package com.shetkari_bazzar.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shetkari_bazzar.dto.changePasswordDTO;
import com.shetkari_bazzar.helper.SuperAdminHelper;

/**
 * Servlet implementation class updatepass
 */
/*this class is by dnyaneswar narwade for forgot password */
@WebServlet("/updatepass")
public class forgotpassupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String  resultStatus =null;
		changePasswordDTO CPDTO=new changePasswordDTO();
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		
		CPDTO.setUserName(request.getParameter("UserName"));
		CPDTO.setNewPassword(request.getParameter("newPassword"));
		CPDTO.setReNewPassword(request.getParameter("reNewPassword"));
	
		if(request.getParameter("newPassword").equals(request.getParameter("reNewPassword")) && request.getParameter("newPassword")!=null &&request.getParameter("reNewPassword")!=null)
		{
		SuperAdminHelper SAH=new SuperAdminHelper();
		int result=SAH.changePassword(CPDTO);
		
		if(result==1){
			resultStatus="password change succesfully";
			request.setAttribute("resultStatus", resultStatus);
			SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
			request.getRequestDispatcher(SuperAdminPanel + "/superAdminLogin.jsp").forward(request, response);
			
		}
		}else{
			
			resultStatus="sry plz check newPassword and reNewPassword";
			request.setAttribute("resultStatus", resultStatus);
			SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
			request.getRequestDispatcher(SuperAdminPanel + "/forgotpass.html").forward(request, response);
			
		}
		
		request.getRequestDispatcher(SuperAdminPanel + "/changePassword.jsp").forward(request, response);
	}

}
