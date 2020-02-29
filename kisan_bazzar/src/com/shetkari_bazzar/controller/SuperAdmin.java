package com.shetkari_bazzar.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;
import com.sun.org.apache.xml.internal.security.utils.HelperNodeList;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/SuperAdmin")
@MultipartConfig
public class SuperAdmin extends HttpServlet {

	FarmerDTO FDTO = new FarmerDTO();
	FarmerHelper FHELP = new FarmerHelperImpl();
	CompanyDTO CDTO = new CompanyDTO();
	CompanyHelper CHELP = new CompanyHelperImpl();
	ResultSet rt = null;
	RequestDispatcher rd;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		String CustomQueryString = request.getQueryString();

		try {
			if (CustomQueryString != null) {
				switch (CustomQueryString) {

				case "superAdminIndex":
					/* to get total register farmer */

					FDTO = FHELP.totalRegistredFarmer();
					request.setAttribute("totalregistredfarmer", FDTO.getTotalFarmersRegistred());

					/* to get total Register companies */

					CDTO = CHELP.totalRegistredCompanies();
					request.setAttribute("totalregistredcompanies", CDTO.getTotalCompniesRegistred());

					rd = request.getRequestDispatcher(SuperAdminPanel + "/index.jsp");
					rd.forward(request, response);
					break;

				case "addCompanyData":
					rd = request.getRequestDispatcher(SuperAdminPanel + "/addCompanies.jsp");
					rd.forward(request, response);
					break;
					
				case "forgotPassword":
					rd = request.getRequestDispatcher(SuperAdminPanel + "/forgotPassword.jsp");
					rd.forward(request, response);
					break;
				case "changePassword":

					rd = request.getRequestDispatcher(SuperAdminPanel + "/changePassword.jsp");
					rd.forward(request, response);
					break;

				case "superAdminLogout":
					// rd = request.getRequestDispatcher(SuperAdminPanel +
					// "/logout.jsp");
					rd = request.getRequestDispatcher("/SuperAdminLogout");
					rd.forward(request, response);
					break;
				case "createAdmin":
					rd = request.getRequestDispatcher(SuperAdminPanel + "/subAdminAuth.jsp");
					rd.forward(request, response);
					break;

				case "serverDownBackLoginLink":
					rd = request.getRequestDispatcher(SuperAdminPanel + "/superAdminLogin.jsp");
					rd.forward(request, response);
					break;

				case "addFarmerData":

					 rd = request.getRequestDispatcher(SuperAdminPanel + "/addFarmer.jsp");
					rd.forward(request, response);

					break;
					
					/*danny code*/
				case "updateforgotpass":
                    rd = request.getRequestDispatcher("/forgotpassupdate");
                    rd.forward(request, response);
                    break;
                    /*written by ddn*/
                case "forgotpass":
                    rd = request.getRequestDispatcher("/forgotpass_send_mail");
                    System.out.println("IN THE SUPER ADMIN CONTROLLER forgotpass");
                    rd.forward(request, response);
                    break;
                case "addProducts":
                	 rd = request.getRequestDispatcher(SuperAdminPanel + "/addProducts.jsp");
                    rd.forward(request, response);
                    break;
                   
				
				default:

					break;
				}
			}
		} catch (NullPointerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String customParameterString = request.getParameter("customParameterString");

		try {
			if (customParameterString != null) {
				switch (customParameterString) {
				case "gridCompanyData":
					rd = request.getRequestDispatcher("/GridCompanyData");
					rd.forward(request, response);
					break;
				case "gridFarmerData":

					rd = request.getRequestDispatcher("/GridFarmer");
					rd.forward(request, response);
					break;
				case "viewCompany":
					rd = request.getRequestDispatcher("/ViewCompanyData");
					rd.forward(request, response);
					break;
				case "editCompanyData":
					rd = request.getRequestDispatcher("/EditCompanyData");
					rd.forward(request, response);
					break;
				case "removeCompany":
					rd = request.getRequestDispatcher("/DeleteCompanyInfo");
					rd.forward(request, response);
					break;
				case "viewFarmerData":
					rd = request.getRequestDispatcher("/ViewFarmerData");
					rd.forward(request, response);
					break;
				case "editFarmerData":

					rd = request.getRequestDispatcher("/EditFarmerData");
					rd.forward(request, response);
					break;
				case "removeFarmerData":
					rd = request.getRequestDispatcher("/TrashFarmerData");
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

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String AdminPanel = getServletContext().getInitParameter("AdminJsp");

		response.setContentType("text/html");

		String customParameterString = request.getParameter("customParameterString");

		/*
		 * String gridCompany = request.getParameter("view");
		 * 
		 * String addCompanyData = request.getParameter("addCompanyData");
		 */

		// System.out.println("CustomQueryString" + CustomQueryString);

		try {
			if (customParameterString != null) {
				switch (customParameterString) {
				case "superAdminLogin":

					rd = request.getRequestDispatcher("/LoginServlet");
					rd.forward(request, response);
					break;
					
					/*written by ddn*/
	            case "checkOTP":
	                rd = request.getRequestDispatcher("/checkOTP");
	                System.out.println("IN THE SUPER ADMIN CONTROLLER forgot password OTP CHECKING");
	                rd.forward(request, response);
	                break;

				case "addCompanyDetails":
					
					rd = request.getRequestDispatcher("/AddCompanyData");
					rd.forward(request, response);
					break;
				/*case "changePasswordDetails":
					rd = request.getRequestDispatcher("/ChangePassword");
					rd.forward(request, response);
					break;*/
				/*case "viewCompany":
					rd = request.getRequestDispatcher("/ViewCompanyData");
					rd.forward(request, response);
					break;*/
				/*case "editCompanyData":
					rd = request.getRequestDispatcher("/EditCompanyData");
					rd.forward(request, response);
					break;*/
				case "updateCompanyFormDetails":

					rd = request.getRequestDispatcher("/updateCompanyData");
					rd.forward(request, response);
					break;
				/*case "createNewSubAdmin":
					rd = request.getRequestDispatcher("/newSubAdmin");
					rd.forward(request, response);
					break;*/
				/*case "removeCompany":
					rd = request.getRequestDispatcher("/DeleteCompanyInfo");
					rd.forward(request, response);
					break;*/

				/*case "viewFarmerData":
					rd = request.getRequestDispatcher("/ViewFarmerData");
					rd.forward(request, response);
					break;*/
				/*case "editFarmerData":

					rd = request.getRequestDispatcher("/EditFarmerData");
					rd.forward(request, response);
					break;*/
				/*case "removeFarmerData":
					rd.forward(request, response);
					rd = request.getRequestDispatcher("/TrashFarmerData");
					break;*/
				/*case "updatefarmerDataForm":
					rd = request.getRequestDispatcher("/UpdateFarmerData");
					rd.forward(request, response);
					break;*/
				case "imageUpload":
					rd = request.getRequestDispatcher("/FileUploadHandler");
					rd.forward(request, response);
					break;
				default:
					break;
				}
			}
		} catch (NullPointerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
