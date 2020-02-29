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
 * Servlet implementation class ViewFarmerData
 */
@WebServlet("/ViewFarmerData")
public class ViewFarmerData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewFarmerData() {
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
		
		String id = request.getParameter("farmerId");
		int idd = Integer.parseInt(id);
		
		FDTO.setStatus(request.getParameter("status"));
		///System.out.println("before set farmer is in viewfarmer class  "+id );
		FDTO.setFarmerId(Integer.parseInt(request.getParameter("farmerId")));
		//System.out.println("in the viewfarmerServlet...");
		rt=FHELP.GridFarmer(FDTO);
		request.setAttribute("rt", rt);
		
		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		request.getRequestDispatcher(SuperAdminPanel + "/viewFarmer.jsp").forward(request, response);
		
		
		
	}

}
