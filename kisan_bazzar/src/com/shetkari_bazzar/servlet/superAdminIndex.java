package com.shetkari_bazzar.servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;

/**
 * Servlet implementation class superAdminIndex
 */
@WebServlet("/superAdminIndex")
public class superAdminIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public superAdminIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
response.getWriter().append("Served at: ").append(request.getContextPath());
		
		FarmerDTO FDTO = new FarmerDTO();
		FarmerHelper FHELP = new FarmerHelperImpl();
		CompanyDTO CDTO = new CompanyDTO();
		CompanyHelper CHELP = new CompanyHelperImpl();
		
		RequestDispatcher rd;
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		/* to get total register farmer */

		FDTO = FHELP.totalRegistredFarmer();
		request.setAttribute("totalregistredfarmer", FDTO.getTotalFarmersRegistred());

		/* to get total Register companies */

		CDTO = CHELP.totalRegistredCompanies();
		request.setAttribute("totalregistredcompanies", CDTO.getTotalCompniesRegistred());

		rd = request.getRequestDispatcher(SuperAdminPanel + "/index.jsp");
		rd.forward(request, response);
		
		
	}

}
