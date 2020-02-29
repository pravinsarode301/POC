package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.helper.SuperAdminHelper;
import com.sun.org.apache.xml.internal.security.utils.HelperNodeList;

/**
 * Servlet implementation class RelevantCompaniesForProduct
 */
@WebServlet("/RelevantCompaniesForProduct")
public class RelevantCompaniesForProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RelevantCompaniesForProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		request.getParameter("subProductName");
		request.getParameter("subProductId");
		
		
		CompanyRequirementDTO CRDTO =new CompanyRequirementDTO();
		
		
		CRDTO.setSubProductId(Integer.parseInt(request.getParameter("subProductId")));
		
		
		SuperAdminHelper SAH=new SuperAdminHelper();
		ResultSet rt=SAH.viewReleavantCompaniesProductsRequirement(CRDTO);
		
		//request.setAttribute("releavantCompanies", rt);
		try {
			while(rt.next()){
				
				System.out.println(rt.getString("company_name"));
				System.out.println(rt.getString("comp_requirement_id"));
				System.out.println(rt.getString("product_name"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("null rt");
			e.printStackTrace();
		}
		
		String UsersPanel = getServletContext().getInitParameter("UsersJsp");
		request.setAttribute("releavantCompanies", rt);
     	request.getRequestDispatcher(UsersPanel+"/releavantCompaniesForProducts.jsp").forward(request, response);;
		
		
	}

}
