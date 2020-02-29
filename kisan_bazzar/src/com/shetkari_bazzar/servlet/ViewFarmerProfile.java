package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;

/**
 * Servlet implementation class EditFarmerData
 */
@WebServlet("/ViewFarmerProfile")
public class ViewFarmerProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewFarmerProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		FarmerHelper FHELP=new FarmerHelperImpl();
		ResultSet rt=null;
		
		FarmerDTO FDTO=new FarmerDTO();
		FDTO.setStatus(request.getParameter("status"));
		FDTO.setFarmerId(Integer.parseInt(request.getParameter("farmerId")));
		request.setAttribute("status", FDTO.getStatus());
		rt=FHELP.GridFarmer(FDTO);
		request.setAttribute("rt", rt);
		
		String UsersPanel = getServletContext().getInitParameter("UsersJsp");
		request.getRequestDispatcher(UsersPanel + "/viewFarmerProfile.jsp").forward(request, response);

	}

}
