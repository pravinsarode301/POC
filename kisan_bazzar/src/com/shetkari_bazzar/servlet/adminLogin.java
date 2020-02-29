package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shetkari_bazzar.dao.db_utility;
import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;
import com.shetkari_bazzar.helper.SuperAdminHelper;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		CompanyHelper help = new CompanyHelperImpl();
		SuperAdminHelper SAH = new SuperAdminHelper();
		ResultSet rt;
		LoginDTO LDTO = new LoginDTO();
		
		Connection con = null;
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		ServletContext context = getServletContext();

		LDTO.setUsername(request.getParameter("userName"));
		LDTO.setPassword(request.getParameter("password"));
		
		
		
		/* to get total register farmer 
			FarmerDTO FDTO = new FarmerDTO();
			FarmerHelper FHELP = new FarmerHelperImpl();
			FDTO =FHELP.totalRegistredFarmer();
			request.setAttribute("totalregistredfarmer", FDTO.getTotalFarmersRegistred());
			
			 to get total Register companies 
			CompanyDTO CDTO = new CompanyDTO();
			CompanyHelper CHELP = new CompanyHelperImpl();
			CDTO = CHELP.totalRegistredCompanies();
			request.setAttribute("totalregistredcompanies", CDTO.getTotalCompniesRegistred());
		*/

		try {
			LDTO = help.validateUser(LDTO);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			if (db_utility.isDbConnected()) {

				HttpSession session = null;
				HttpSession oldsession = request.getSession(false);

				if (oldsession != null) {

					oldsession.invalidate();
					session = request.getSession();

					session.setAttribute("userName", LDTO.getUsername());
					session.setAttribute("regsession", "regsession");

				} else {
					session = request.getSession();

					session.setAttribute("userName", LDTO.getUsername());
					session.setAttribute("regsession", "regsession");
				}

				if (LDTO.isLoginStatus() == true) {
					final String role = LDTO.getRole().trim();

					/* FOR ADMIN */

					if ("SUPERADMIN".equals(role) || "SUB-SUPERADMIN".equals(role)) {

						session.setAttribute("panel", "adminPanel");
						session.setAttribute("adminId", LDTO.getUserId());
						session.setAttribute("userName", LDTO.getUsername());
						session.setAttribute("userRole", LDTO.getRole());
						context.setAttribute("sessionUser", LDTO.getUsername());
						System.out.println("contextparam " + context.getAttribute("sessionUser"));
						session.setAttribute("special_auth_password", LDTO.getSpecialAuthPassword());
						request.getRequestDispatcher(SuperAdminPanel + "/index.jsp").forward(request, response);

					}else{
						request.setAttribute("loginErrorStatus","Access Denied");
						request.getRequestDispatcher(SuperAdminPanel + "/superAdminLogin.jsp").forward(request, response);
					}

				} else {
					request.setAttribute("loginErrorStatus",
							"Error while login creaditionals might be check your creditionlas");
					request.getRequestDispatcher(SuperAdminPanel + "/superAdminLogin.jsp").forward(request, response);
				}
			} else {
				request.getRequestDispatcher(SuperAdminPanel + "/dbClosedError.jsp").forward(request, response);

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block

		}
	}
}
