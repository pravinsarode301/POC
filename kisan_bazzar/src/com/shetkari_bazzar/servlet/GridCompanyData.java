package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;

/**
 * Servlet implementation class GridCompany
 */
@WebServlet("/GridCompanyData")
public class GridCompanyData extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResultSet rt = null;
		//TestService test=new TestServiceImpl(); 
		CompanyHelper help=new CompanyHelperImpl();
		//companyHelper Help = new companyHelper();
		CompanyDTO CDTO = new CompanyDTO();
		
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		CDTO.setStatus(request.getParameter("status"));
		PrintWriter out=response.getWriter();
		//if (help.checkCompanyData(CDTO)) {
			rt = help.gridCompanyData(CDTO);
			request.setAttribute("rt", rt);
			try {
				if(rt!=null){
				while(rt.next())
				{
					
				System.out.println("session.setAttributecompany_name"+rt.getString("company_name"));
				}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request .getRequestDispatcher(SuperAdminPanel+"/companyList.jsp").forward(request, response);
			
		//}else{
//			request.getRequestDispatcher(SuperAdminPanel+"/errPage.jsp").forward(request, response);
		//}

	}

}
