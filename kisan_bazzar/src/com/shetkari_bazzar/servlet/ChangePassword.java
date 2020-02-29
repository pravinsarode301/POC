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
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	
	String resultStatus;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		changePasswordDTO CPDTO=new changePasswordDTO();
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		
		CPDTO.setOldPassword(request.getParameter("oldPassword"));
		CPDTO.setNewPassword(request.getParameter("newPassword"));
		CPDTO.setReNewPassword(request.getParameter("reNewPassword"));
		CPDTO.setUserName(request.getParameter("userName"));
		if(request.getParameter("newPassword").equals(request.getParameter("reNewPassword")) && request.getParameter("newPassword")!=null &&request.getParameter("reNewPassword")!=null)
		{
		SuperAdminHelper SAH=new SuperAdminHelper();
		int result=SAH.changePassword(CPDTO);
		
		if(result==1){
			resultStatus="password change succesfully";
			request.setAttribute("resultStatus", resultStatus);
			
		}
		}else{
			
			resultStatus="sry plz check newPassword and reNewPassword";
			request.setAttribute("resultStatus", resultStatus);
			
		}
		
		request.getRequestDispatcher(SuperAdminPanel + "/changePassword.jsp").forward(request, response);
	}

}
