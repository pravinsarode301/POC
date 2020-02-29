package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;

/**
 * Servlet implementation class UpdateFarmerProfile
 */
@WebServlet("/EditFarmerProfile")
public class EditFarmerProfile extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		FarmerDTO FDTO = new FarmerDTO();
		FDTO.setStatus(request.getParameter("status"));
		FDTO.setFarmerId(Integer.parseInt(request.getParameter("farmerId")));	

		FarmerHelper FHELP = new FarmerHelperImpl();
		ResultSet rt = null;

		request.setAttribute("status", FDTO.getStatus());
		rt = FHELP.GridFarmer(FDTO);
		request.setAttribute("rt", rt);

		String UsersPanel = getServletContext().getInitParameter("UsersJsp");
		RequestDispatcher rd = request.getRequestDispatcher(UsersPanel + "/editFarmerProfile.jsp");
		rd.include(request, response);
	}

}
