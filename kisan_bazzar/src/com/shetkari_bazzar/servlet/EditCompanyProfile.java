package com.shetkari_bazzar.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.ResultSet;
import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;

/**
 * Servlet implementation class editCompanyProfile
 */
@WebServlet("/EditCompanyProfile")
public class EditCompanyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCompanyProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String UsersPanel = getServletContext().getInitParameter("UsersJsp");
		CompanyHelper help = new CompanyHelperImpl();
		CompanyDTO CDTO = new CompanyDTO();
		HttpSession session = request.getSession(false);
		int abc = (Integer) session.getAttribute("userId");
		System.out.println("int" + abc);

		System.out.println("userId" + abc);
		CDTO.setCompanyId((Integer) session.getAttribute("userId"));
		CDTO.setStatus(request.getParameter("status"));
		ResultSet rt = (ResultSet) help.gridCompanyData(CDTO);
		request.setAttribute("rt", rt);

		if(rt!=null){
		System.out.println("editCompanyProfile ahe re");
		}else{
			System.out.println(" editCompanyProfile nahi re");
		}
		
		
		request.getRequestDispatcher(UsersPanel + "/editCompanyProfile.jsp").forward(request, response);
		
	}

}
