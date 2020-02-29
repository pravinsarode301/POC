package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.util.ResultSetUtil;
import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.sun.org.apache.xml.internal.security.utils.HelperNodeList;

/**
 * Servlet implementation class CompanyInbox
 */
@WebServlet("/CompanyInbox")
public class CompanyInbox extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyInbox() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*for security userId rename as PageId*/
		CompanyDTO CDTO=new CompanyDTO();
		System.out.println(request.getParameter("PageId"));
		
		CDTO.setCompanyId(Integer.parseInt(request.getParameter("PageId")));
		CompanyHelper CH=new CompanyHelperImpl();
		ResultSet rt=null;
		rt=CH.gridMyInbox(CDTO);
		
	request.setAttribute("rt", rt);
	
	
	String UsersPanel = getServletContext().getInitParameter("UsersJsp");
	request.getRequestDispatcher(UsersPanel+"/companyInbox.jsp").forward(request, response);;
	}

}
