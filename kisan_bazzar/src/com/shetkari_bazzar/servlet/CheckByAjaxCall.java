package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.annotate.JsonMethod;
import org.json.simple.JSONObject;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.dto.changePasswordDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;
import com.shetkari_bazzar.model.company_model;
import com.shetkari_bazzar.model.company_model_impl;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;

/**
 * Servlet implementation class CheckSignupEmailId
 */
@WebServlet("/CheckByAjaxCall")
public class CheckByAjaxCall extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckByAjaxCall() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TestService test=new TestServiceImpl();
		company_model cm=new company_model_impl();
	
		String CustomQueryString=request.getParameter("customQueryString");
		changePasswordDTO CPDTO=new changePasswordDTO();
		Long companyRegId;
		LoginDTO LDTO=new LoginDTO();
		FarmerDTO FDTO = new FarmerDTO();
		HttpSession session=request.getSession(false);
		CompanyDTO CDTO=new CompanyDTO();
		switch (CustomQueryString) {
		case "userEmailIdForSignUp":
			LDTO.setUsername(request.getParameter("EmailId"));
			response.setContentType("application/json");
			response.getWriter().print(test.CheckUserEmailId(LDTO));
			
			break;
			
		case "userEmailIdForPasswordRecovery":
			LDTO.setUsername(request.getParameter("EmailId"));
			response.setContentType("application/json");
			response.getWriter().print(test.CheckUserEmailId(LDTO));
			break;
		case "companyRegIdForRegistration":
			
			CDTO.setCompanyRegId(request.getParameter("companyRegId"));
			
			CDTO=cm.CheckCompanyDetails(CDTO);
			response.setContentType("application/json");
			System.out.println(CDTO.isReturnStatus());
			response.getWriter().print(CDTO.isReturnStatus());
			break;
			
		case "AdminPanelCheckOldPassword":
			
			CPDTO.setOldPassword(request.getParameter("oldPassword"));
			CPDTO.setUserName((String)session.getAttribute("userName"));
			LDTO.setPassword(CPDTO.getOldPassword());
			LDTO.setUsername(CPDTO.getUserName());
			
			response.setContentType("application/json");
			response.getWriter().print(test.CheckUserPassword(LDTO));
			break;
		case "adminPortalIndexPageDetails":
			
			/* to get total register farmer*/ 
			
			FarmerHelper FHELP = new FarmerHelperImpl();
			FDTO =FHELP.totalRegistredFarmer();
			Map map=new HashMap<>(); 
			//request.setAttribute("totalregistredfarmer", FDTO.getTotalFarmersRegistred());
			
			map.put("totalregistredfarmer", FDTO.getTotalFarmersRegistred());
			/*to get total Register companies*/
			
			
			CompanyHelper CHELP = new CompanyHelperImpl();
			CDTO = CHELP.totalRegistredCompanies();
			map.put("totalregistredcompanies", CDTO.getTotalCompniesRegistred());
			JSONObject obj=new JSONObject(map);
			response.setContentType("application/json");
			response.getWriter().write(obj.toJSONString());
			
			//request.setAttribute("totalregistredcompanies", CDTO.getTotalCompniesRegistred());


			
			break;
			
		default:
			break;
		}
		
		
	}

}
