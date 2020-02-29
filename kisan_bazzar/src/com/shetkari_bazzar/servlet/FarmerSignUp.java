package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.management.modelmbean.RequiredModelMBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;

/**
 * Servlet implementation class FarmerSignUp
 */
@WebServlet("/FarmerSignUp")
public class FarmerSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FarmerSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("hlo am in farmer reg");
		
		Enumeration<String> enm=request.getParameterNames();
		
		while (enm.hasMoreElements()) {
			String filedName = (String) enm.nextElement();
		//	response.getWriter().println(filedName);
			
			/*Required object*/
			
		}
			FarmerDTO FDTO=new FarmerDTO();
			
			FDTO.setFarmerFirstName(request.getParameter("farmerFirstName"));
			FDTO.setFarmerLastName(request.getParameter("farmerLastName"));
			FDTO.setFarmerEmailid(request.getParameter("farmerEmailId"));
			FDTO.setFarmerContactNumber(Long.parseLong(request.getParameter("farmerContactNo")));
			FDTO.setFarmerPassword(request.getParameter("farmerPassword"));
			
			FarmerHelper help=new FarmerHelperImpl();
			
			FDTO=help.registerFarmer(FDTO);
			System.out.println("returndata"+FDTO.getReturnStatus());
			if(FDTO.getReturnStatus()==1){
				
				request.setAttribute("registrationSuccessMsg", "Your are successfully registred with shetkari bazzar portal");
				
				String SuperAdminPanel = getServletContext().getInitParameter("UsersJsp");
				
				request.getRequestDispatcher(SuperAdminPanel + "/index.jsp").forward(request, response);
				
			}
		}
		
		
	

}
