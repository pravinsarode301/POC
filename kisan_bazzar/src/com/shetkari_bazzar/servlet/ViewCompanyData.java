package com.shetkari_bazzar.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.ResultSet;
import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;

/**
 * Servlet implementation class ViewCompany
 */
@WebServlet("/ViewCompanyData")
public class ViewCompanyData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCompanyData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		CompanyHelper help = new CompanyHelperImpl();
		CompanyDTO CDTO = new CompanyDTO();
		
		CDTO.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
		CDTO.setStatus(request.getParameter("status"));
	ResultSet rt=(ResultSet) help.gridCompanyData(CDTO);
		request.setAttribute("rt", rt);
		request.getRequestDispatcher(SuperAdminPanel + "/viewCompany.jsp").forward(request, response);

	}

}
