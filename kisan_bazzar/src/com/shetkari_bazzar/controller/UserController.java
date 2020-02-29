package com.shetkari_bazzar.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shetkari_bazzar.helper.SuperAdminHelper;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String UsersPanel = getServletContext().getInitParameter("UsersJsp");
		/*required object*/
		
		SuperAdminHelper SAH=new SuperAdminHelper();
		ResultSet rt;
		
		
		RequestDispatcher rd = null;
		String CustomQueryString = request.getQueryString();
		System.out.println();

		try {
			if (CustomQueryString != null) {
				switch (CustomQueryString) {
				case "userLogout":
					
					/*rd = request.getRequestDispatcher("/UserLogout");
					rd.forward(request, response);*/
					request.getRequestDispatcher(UsersPanel+"/userLogout.jsp").forward(request, response);
					break;

				case "postCompReq":
					rt=SAH.viewPortalProducts();
					request.setAttribute("productGrid", rt);
					rd = request.getRequestDispatcher(UsersPanel+"/postCompanyRequirement.jsp");
					rd.forward(request, response);
					break;
					
					
				case "welcomePage":
					rd = request.getRequestDispatcher(UsersPanel+"/index.jsp");
					rd.forward(request, response);
					
					break;
				case "CommingSoon":
					rd = request.getRequestDispatcher(UsersPanel+"/comingsoon.jsp");
					rd.forward(request, response);
					break;
				default:
					break;

				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		String customParameterString = request.getParameter("customParameterString");
		
		try {
			if (customParameterString != null) {
				switch (customParameterString) {
				
				case "farmerProfile":
					System.out.println("am here in farmerProfile");
					// rd = request.getRequestDispatcher(UsersPanel + "/viewFarmerProfile.jsp");
					rd = request.getRequestDispatcher("/ViewFarmerProfile");
					rd.forward(request, response);
					break;
					
				case "editFarmerData":
					rd = request.getRequestDispatcher("/EditFarmerProfile");
					rd.forward(request, response);
					break;
				case "searchFor":
					rd = request.getRequestDispatcher("/SearchForCompanies");
					rd.forward(request, response);
					break;
					
				default:
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
