package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.model.company_model_impl;
import com.sun.org.apache.xml.internal.security.utils.HelperNodeList;

/**
 * Servlet implementation class deleteCompanyInfo
 */
@WebServlet("/DeleteCompanyInfo")
public class DeleteCompanyInfo extends HttpServlet {
	

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		
		CompanyDTO CDTO=new CompanyDTO();
		ResultSet rt=null;
		System.out.println(request.getParameter("companyId"));
		CDTO.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
		CDTO.setStatus(request.getParameter("comSpecsData"));
		CompanyHelper help=new CompanyHelperImpl();
		System.out.println(CDTO.getStatus());
		int result=help.DeleteCompanyData(CDTO);
		
		
		
		if(result==1){
			CDTO.setStatus("default");
			rt = help.gridCompanyData(CDTO);
			request.setAttribute("rt", rt);	
			request.setAttribute("deleteStatus", "Company data has been successfully deleted");
			
		
		}else{
			
			request.setAttribute("deleteStatus", "Error occured ,While deleting company data");
			
		}
		
		request.getRequestDispatcher(SuperAdminPanel + "/companyList.jsp").forward(request, response);	
		
	}

}
