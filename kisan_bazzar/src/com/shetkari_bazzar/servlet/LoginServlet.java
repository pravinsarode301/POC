package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.ContextConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shetkari_bazzar.dao.db_utility;
import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;
import com.shetkari_bazzar.helper.SuperAdminHelper;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	CompanyHelper help = new CompanyHelperImpl();
	SuperAdminHelper SAH = new SuperAdminHelper();
	ResultSet rt;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=utf-8");

		LoginDTO LDTO = new LoginDTO();

		LDTO.setUsername(request.getParameter("userName"));
		LDTO.setPassword(request.getParameter("password"));

		System.out.println(LDTO.getUsername());
		System.out.println(LDTO.getPassword());

		try {
			LDTO = help.validateUser(LDTO);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		/* to get total register farmer */
		FarmerDTO FDTO = new FarmerDTO();
		FarmerHelper FHELP = new FarmerHelperImpl();
		FDTO = FHELP.totalRegistredFarmer();
		request.setAttribute("totalregistredfarmer", FDTO.getTotalFarmersRegistred());
		
		/* to get total Register companies */
		CompanyDTO CDTO = new CompanyDTO();
		CompanyHelper CHELP = new CompanyHelperImpl();
		CDTO = CHELP.totalRegistredCompanies();
		request.setAttribute("totalregistredcompanies", CDTO.getTotalCompniesRegistred());

		ServletContext context = getServletContext();
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");

		String AdminPanel = getServletContext().getInitParameter("AdminJsp");
		Connection con = null;
		String UserPanel = getServletContext().getInitParameter("UsersJsp");
		String dataFromAdminPanel = request.getParameter("dataFromAdminPanel");
		String dataFromUserPanel = request.getParameter("dataFromUserPanel");

		List<String> li = new ArrayList<String>();
		ObjectMapper mapper = new ObjectMapper();

		JSONArray array = new JSONArray();

		JSONObject obj = new JSONObject();

		try {
			if (!db_utility.isDbConnected()) {
			
			request.getRequestDispatcher(SuperAdminPanel + "/dbClosedError.jsp").forward(request, response);	
			}else{
				System.out.println("db open");
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

				rt = SAH.viewPortalProducts();

				request.setAttribute("productGrid", rt);

				if (LDTO.isLoginStatus() == true) {
					final String role = LDTO.getRole().trim();
					if ("FARMER-USER".equals(role) || "ADMIN(COMPANY)-USER".equals(role)) {

						session.setAttribute("welcomeName", LDTO.getWelcomeName());
						session.setAttribute("panel", "userPanel");
						session.setAttribute("userId", LDTO.getUserId());
						session.setAttribute("userName", LDTO.getUsername());
						session.setAttribute("userRole", LDTO.getRole());
						context.setAttribute("sessionUser", LDTO.getUsername());
						System.out.println("contextparam " + context.getAttribute("sessionUser"));
						session.setAttribute("special_auth_password", LDTO.getSpecialAuthPassword());
					
						// request.getRequestDispatcher(UserPanel +
						// "/index.jsp").forward(request, response);
						array.add("login successfully ...!");
						response.getWriter().write(array.toJSONString());

					} else {
						array.add("Access denied ..!");
					
						response.getWriter().print(array.toJSONString());
					}

				} else {

					request.setAttribute("loginFailedStatus",
							"Error while login creaditionals might be check your creditionlas");
					
					
					array.add("Error while login creaditionals might be check your creditionlas");
										
					response.getWriter().print(array.toJSONString());
					// request.getRequestDispatcher(UserPanel +
					// "/index.jsp").forward(request, response);

				}

			} 

		} catch (Exception e) {
			// TODO Auto-generated catch block

		}
	}

}
