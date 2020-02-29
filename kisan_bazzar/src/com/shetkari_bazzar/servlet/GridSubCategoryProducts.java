package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.shetkari_bazzar.dto.SubCategoryProductDTO;
import com.shetkari_bazzar.dto.productsDTO;
import com.shetkari_bazzar.helper.SuperAdminHelper;
import com.sun.org.apache.xml.internal.security.utils.HelperNodeList;

/**
 * Servlet implementation class GridSubCategoryProducts
 */
@WebServlet("/GridSubCategoryProducts")
public class GridSubCategoryProducts extends HttpServlet {
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println(Integer.parseInt(request.getParameter("searchFor")));
		HttpSession session=request.getSession(false);
		
		SuperAdminHelper SAH=new SuperAdminHelper();
		SubCategoryProductDTO SCPDTO=new SubCategoryProductDTO();
		
		SCPDTO.setMainCategoryProductId(Integer.parseInt(request.getParameter("searchFor")));
		
		ResultSet rt=	SAH.viewSubCategoryPortalProducts(SCPDTO);
		
		
		
		request.setAttribute("gridSubCategory", rt);
		
		String UserPanel = getServletContext().getInitParameter("UsersJsp");
		
		request.getRequestDispatcher(UserPanel + "/serachForSubCategory.jsp").forward(request, response);
		
		
	}
	
	
	
	
	
	
}
