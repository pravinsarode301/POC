package com.shetkari_bazzar.filters;

import java.io.IOException;
import java.sql.ResultSet;

import javax.naming.ldap.Rdn;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;
import com.shetkari_bazzar.helper.SuperAdminHelper;

@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

	private ServletContext context;

	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("AuthenticationFilter initialized");

	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		// String SuperAdminPanel = context.getInitParameter("SuperAdminJsp");
		HttpSession session=request.getSession(false);
		String SuperAdminPanel = request.getServletContext().getInitParameter("SuperAdminJsp");
		String UserPanel = request.getServletContext().getInitParameter("UsersJsp");

		// pass the request along the filter chain
		ResultSet rt = null;
		SuperAdminHelper SAH = new SuperAdminHelper();
		rt = SAH.viewPortalProducts();
		request.setAttribute("productGrid", rt);
	
		if (request instanceof HttpServletRequest) {
		    String url = ((HttpServletRequest)request).getRequestURL().toString();
		//	System.out.println("url"+url);
		}
	
	/*	 to get total register farmer 
		FarmerDTO FDTO = new FarmerDTO();
		FarmerHelper FHELP = new FarmerHelperImpl();
		FDTO =FHELP.totalRegistredFarmer();
		request.setAttribute("totalregistredfarmer", FDTO.getTotalFarmersRegistred());
		
		 to get total Register companies 
		CompanyDTO CDTO = new CompanyDTO();
		CompanyHelper CHELP = new CompanyHelperImpl();
		CDTO = CHELP.totalRegistredCompanies();
		request.setAttribute("totalregistredcompanies", CDTO.getTotalCompniesRegistred());
*/

		chain.doFilter(request, response);
	
	}
	public void destroy() {
		// close any resources here
	}

}
