package com.shetkari_bazzar.helper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.model.check_login;
import com.shetkari_bazzar.model.check_login_impl;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;

public class CompanyHelperImpl implements CompanyHelper {

	check_login cl = new check_login_impl();
	TestService test = new TestServiceImpl();
	ResultSet rt = null;
	String SQL_QUERY;

	public boolean checkCompanyData(CompanyDTO CDTO) {
		ResultSet rt = null;

		
		String status = CDTO.getStatus();
		try {

			rt = test.gridCompany(status, CDTO);
			if (rt.next()) {
				return true;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("in controller");
		}

		return false;
	}

	public ResultSet gridCompanyData(CompanyDTO CDTO) {
		ResultSet rt = null;

		
		String status = CDTO.getStatus();
		try {

			rt = test.gridCompany(status, CDTO);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("in controller");
		}

		return rt;
	}

	@Override
	public LoginDTO validateUser(LoginDTO LDTO) throws SQLException {
		// TODO Auto-generated method stub
		

		boolean result = false;
		try {
			LDTO = test.login(LDTO);

		} catch (NullPointerException e) {
			// TODO Auto-generated catch block
			System.out.println("empty resultset in CompanyHelperImpl in validateUser()");
		}

		return LDTO;
	}

	@Override
	public int registerNewCompany(CompanyDTO CDTO) {
		// TODO Auto-generated method stub
		int result = test.registerData(CDTO);
		return result;

	}

	@Override
	public int updateCompanyData(CompanyDTO CDTO) {
		// TODO Auto-generated method stub
		

		return test.update_company_info(CDTO);
	}

	@Override
	public int DeleteCompanyData(CompanyDTO CDTO) {
		// TODO Auto-generated method stub
		
		return test.removeCompany(CDTO);
	}

	@Override
	public CompanyDTO totalRegistredCompanies() {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		

		CompanyDTO CDTO = new CompanyDTO();
		CDTO = test.totalRegCompany();
		return CDTO;

	}

	/* danny code */

	@Override
	public boolean forgotpass(LoginDTO dto) {
		String SQL_QUERY = "select * from  `login_master` ";
		System.out.println("i am before userfactory method");

		rt = cl.user_factory(SQL_QUERY);
		System.out.println("i am after userfactory method");
		System.out.println("this is setted username from login_DTO classs" + dto.getUsername());
		try {
			while (rt.next()) {

				if (dto.getUsername().equals(rt.getString(2))) {
					System.out.println("i am in true condution");
					return true;
				} else {
					return false;
				}

			}
		} catch (Exception e) {
			System.out.println("ERRO FROM COMPANY HELPER :" + e);
		}

		return false;

	}

	@Override
	public int storeRandompass(LoginDTO dto) {
		Statement st = null;

		String SQL = "UPDATE login_master set randompass='" + dto.getRandompass() + "' WHERE username='"
				+ dto.getUsername() + "'";
		int i = 0;

		System.out.println("random password from storepass method :  -" + dto.getRandompass());
		System.out.println("random username from storepass method :  -" + dto.getUsername());
		String pass = dto.getRandompass();
		String uname = dto.getUsername();

		System.out.println(uname + pass);
		/*
		 * ps.setString(1, pass); ps.setString(2, uname);
		 */

		System.out.println("i am before userfactory methodw");
		i = cl.updateloginmaster(SQL);
		System.out.println("i am updated in the randompass");
		return i;
	}
	
	
	@Override
	public CompanyRequirementDTO addRequirements(CompanyRequirementDTO PRDTO) {
		// TODO Auto-generated method stub
	
	PRDTO = test.addRequirement(PRDTO);
		
		return PRDTO;
	}
	
	
	
	@Override
	public ResultSet gridMyInbox(CompanyDTO CDTO) {
		// TODO Auto-generated method stub
	
	rt=	test.gridMyInbox(CDTO);
		return rt;
	}

}
