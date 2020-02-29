package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;

/**
 * Servlet implementation class GridFarmer
 */
@WebServlet("/GridFarmer")
public class GridFarmer extends HttpServlet {
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*required object*/
		
		FarmerHelper FHELP=new FarmerHelperImpl();
		ResultSet rt=null;
		FarmerDTO FDTO=new FarmerDTO();
		
		//FDTO.setFarmerId(Integer.parseInt(request.getParameter("customParameterString")));
		FDTO.setStatus(request.getParameter("status"));
		
		
		rt=FHELP.GridFarmer(FDTO);
		request.setAttribute("rt", rt);
		
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		request.getRequestDispatcher(SuperAdminPanel + "/farmerList.jsp").forward(request, response);
		
		
	}
}
