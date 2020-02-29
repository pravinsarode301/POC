package com.shetkari_bazzar.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shetkari_bazzar.dao.db_utility;
import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.dto.FarmerResponceToCompanyPostDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.dto.SubCategoryProductDTO;
import com.shetkari_bazzar.dto.changePasswordDTO;
import com.shetkari_bazzar.dto.productsDTO;
import com.shetkari_bazzar.dto.subAdminDTO;
import com.shetkari_bazzar.model.AdminModel;
import com.shetkari_bazzar.model.AdminModelImpl;
import com.shetkari_bazzar.model.FarmerModel;
import com.shetkari_bazzar.model.FarmerModelImpl;
import com.shetkari_bazzar.model.UserModel;
import com.shetkari_bazzar.model.UserModelImpl;
import com.shetkari_bazzar.model.check_login;
import com.shetkari_bazzar.model.check_login_impl;
import com.shetkari_bazzar.model.company_model;
import com.shetkari_bazzar.model.company_model_impl;

public class TestServiceImpl implements TestService {
	/* required object */

	FarmerDTO FDTO = new FarmerDTO();
	company_model cm = new company_model_impl();
	FarmerModel FM = new FarmerModelImpl();
	check_login cl = new check_login_impl();
	UserModel UM = new UserModelImpl();
	ResultSet rt = null;
	String SQL_QUERY;
	int returnStatus = 0;

	@Override
	public ResultSet gridCompany(String status_query_string, CompanyDTO CDTO) {
		// TODO Auto-generated method stub

		switch (status_query_string) {
		case "default":
			SQL_QUERY = "select * from  `companies`";
			rt = cm.grid_company_details(SQL_QUERY);
			break;
		case "comSpecsData":
			SQL_QUERY = "select * from  `companies` where company_id='" + CDTO.getCompanyId() + "'";
			rt = cm.grid_company_details(SQL_QUERY);
			break;

		default:
			break;
		}
		return rt;
	}

	@Override
	public int registerData(CompanyDTO CDTO) {
		// TODO Auto-generated method stub
		int i = 0;

		i = cm.CompanyRegistration(CDTO);

		return i;

	}

	public FarmerDTO registerData(FarmerDTO FDTO) {
		// TODO Auto-generated method stub
		int i = 0;
		FDTO = FM.InsertFarmerDetail(FDTO);

		return FDTO;

	}

	@Override
	public ResultSet view_company() {
		// TODO Auto-generated method stub

		return null;
	}

	@Override
	public int removeCompany(CompanyDTO CDTO) {
		// TODO Auto-generated method stub
		if ("currentCompany".equals(CDTO.getStatus()) && CDTO.getStatus() != null) {

			SQL_QUERY = "delete from  `companies` where company_id='" + CDTO.getCompanyId() + "'";

			int i = cm.remove_company(SQL_QUERY);

			return i;
		} else if ("allCompany".equals(CDTO.getStatus()) && CDTO.getStatus() != null) {

			SQL_QUERY = "TRUNCATE TABLE `companies`";

			int i = cm.remove_company(SQL_QUERY);

			return i;
		}

		return 0;
	}

	@Override
	public ResultSet View_comapny(String sql) {
		rt = cm.grid_company_details(sql);
		return rt;
	}

	@Override
	public int update_company_info(CompanyDTO ACGT) {
		// TODO Auto-generated method stub
		int i = cm.update_company_info(ACGT);

		return i;
	}

	@Override
	public LoginDTO login(LoginDTO LDTO) throws SQLException {
		// TODO Auto-generated method stub

		String backup_username = LDTO.getUsername();
		String backup_password = LDTO.getPassword();

		System.out.println(backup_username);
		System.out.println(backup_password);

		String SQL_QUERY = "select * from  `login_master` where username='" + LDTO.getUsername() + "' && password ='"
				+ LDTO.getPassword() + "'";

		System.out.println(SQL_QUERY);
		rt = cl.user_factory(SQL_QUERY);

		/*
		 * while(rt.next()){ System.out.println("am in rt");
		 * System.out.println(rt.getString(2));
		 * System.out.println(rt.getString(3));
		 * System.out.println(rt.getString("special_auth_password"));
		 * 
		 * LDTO.setSpecialAuthPassword(rt.getString("special_auth_password"));
		 * LDTO.setUsername(rt.getString("username")); LDTO.setPassword("'" +
		 * rt.getString("password") + "'");
		 * LDTO.setRole(rt.getString("user_role")); }
		 */

		if (rt.next()) {
			rt = cl.user_factory(SQL_QUERY);
			while (rt.next()) {

				LDTO.setWelcomeName(rt.getString("welcome_name"));
				LDTO.setUserId(rt.getInt("user_id"));
				LDTO.setUsername(rt.getString("username"));
				LDTO.setRole(rt.getString("user_role"));
				LDTO.setPassword(rt.getString("password"));
				LDTO.setSpecialAuthPassword(rt.getString(5));

				System.out.println("rt.getString(special_auth_password)" + rt.getString(5));
				System.out.println(rt.getString("password"));
				System.out.println("'" + rt.getString("password") + "'");
			}
		} else {
			System.out.println("empty username password & password");
			LDTO.setLoginStatus(false);
			return LDTO;
		}

		if (backup_username.equals(LDTO.getUsername()) && backup_password.equals(LDTO.getPassword())) {
			LDTO.setLoginStatus(true);
			return LDTO;

		} else {
			LDTO.setLoginStatus(false);
			return LDTO;
		}
	}

	@Override
	public boolean AddCompanyDetails(CompanyDTO CDTO) {
		// TODO Auto-generated method stub

		return false;
	}

	@Override
	public int updateNewPassword(changePasswordDTO CPDTO) {
		// TODO Auto-generated method stub

		SQL_QUERY = "UPDATE login_master SET password='" + CPDTO.getNewPassword() + "' where username ='"
				+ CPDTO.getUserName() + "'";
		System.out.println(SQL_QUERY);
		int status = UM.changePassword(SQL_QUERY);

		return status;
	}

	@Override
	public int addUser(subAdminDTO SADTO) {
		// TODO Auto-generated method stub

		int i = UM.Insert_userDetail(SADTO);

		return i;
	}

	@Override
	public ResultSet GridFarmer(FarmerDTO FDTO) {
		// TODO Auto-generated method stub

		// SQL_QUERY = "select * from `farmer`";
		// rt = FM.GetFarmerDetail(SQL_QUERY);
		String STATUS_QUERY_STRING = FDTO.getStatus();

		switch (STATUS_QUERY_STRING) {
		case "default":
			SQL_QUERY = "select * from  `farmer`";
			rt = FM.GetFarmerDetail(SQL_QUERY);
			break;
		case "farmSpecsData":
			SQL_QUERY = "select * from  `farmer` where farmer_id='" + FDTO.getFarmerId() + "'";
			System.out.println(SQL_QUERY);
			rt = FM.GetFarmerDetail(SQL_QUERY);
			break;

		default:
			break;
		}
		return rt;

	}

	@Override
	public FarmerDTO totalRegFarmer() {
		// TODO Auto-generated method stub

		SQL_QUERY = "SELECT count(*) AS `totalregisterfarmer` FROM `farmer`";

		FDTO = FM.CountFarmers(SQL_QUERY);
		return FDTO;
	}

	@Override
	public CompanyDTO totalRegCompany() {
		// TODO Auto-generated method stub
		CompanyDTO CDTO = new CompanyDTO();
		SQL_QUERY = "SELECT count(*) AS `totalregistercompanies` FROM `companies`";

		CDTO = cm.CountCompanies(SQL_QUERY);
		return CDTO;
	}

	@Override
	public int removeFarmer(FarmerDTO FDTO) {
		// TODO Auto-generated method stub

		if ("currentFarmer".equals(FDTO.getStatus()) && FDTO.getStatus() != null) {
			SQL_QUERY = "delete from  `farmer` where farmer_id='" + FDTO.getFarmerId() + "'";
			System.out.println(SQL_QUERY);
			returnStatus = FM.DeleteFarmerDetail(SQL_QUERY);

		} else if ("allFarmer".equals(FDTO.getStatus()) && FDTO.getStatus() != null) {

			SQL_QUERY = "TRUNCATE TABLE `farmer`";
			System.out.println(SQL_QUERY);
			returnStatus = FM.DeleteFarmerDetail(SQL_QUERY);

		}

		return returnStatus;
	}

	@Override
	public FarmerDTO updateFarmerDetails(FarmerDTO FDTO) {
		// TODO Auto-generated method stub

		FDTO = FM.UpdateFarmerDetail(FDTO);

		return FDTO;
	}

	@Override
	public productsDTO addProductsDetails(productsDTO PDTO) {
		// TODO Auto-generated method stub

		AdminModel AM = new AdminModelImpl();

		return PDTO=AM.addProducts(PDTO);
	}

	@Override
	public ResultSet gridProducts() {
		// TODO Auto-generated method stub
	
		String SQL_QUERY="SELECT * FROM `portal_products(main category)`";
		AdminModel AM=new AdminModelImpl();
	rt=AM.gridProductsDetails(SQL_QUERY);
	
		return rt;
	}
	
	@Override
	public CompanyRequirementDTO addRequirement(CompanyRequirementDTO PRDTO) {
		// TODO Auto-generated method stub
	
		PRDTO =cm.addUserRequirement(PRDTO);	
		
		
		return PRDTO;
	}
	
	@Override
	public ResultSet gridSubCategoryProducts(SubCategoryProductDTO SCPDTO) {
		// TODO Auto-generated method stub
	
		String SQL_QUERY="SELECT main.`Product_name` as mainProductName,sub.`sub_product_name` as subProductName,sub.`sub_product_image_path`as subProductImagePath ,main.`product_image`as mainProductImagePath,main.`product_description`as mainProductDescr,sub.`sub_product_description` as subProductDescr,sub.`created_date` as addedDate,sub.`sub_product_id` as subProductId FROM `portal_products(main category)` main inner join`portal_products(sub category)` sub on sub.main_product_id=main.product_id where main.`product_id` ='"+SCPDTO.getMainCategoryProductId()+"' ";
		System.out.println(SQL_QUERY);
		
		AdminModel AM=new AdminModelImpl();
		rt=AM.gridProductsDetails(SQL_QUERY);
		
		return rt;
	}
	
	@Override
	public SubCategoryProductDTO addProductsDetails(SubCategoryProductDTO SCPDTO) {
		// TODO Auto-generated method stub
		AdminModel AM = new AdminModelImpl();

		 SCPDTO=AM.addSubCategoryProducts(SCPDTO);

		return SCPDTO;
		
	}
	
	
@Override
public ResultSet gridCompanyRequirementsForProducts(CompanyRequirementDTO SCPDTO) {
	// TODO Auto-generated method stub

	/*SQL_QUERY="SELECT * FROM `companies_requirement` WHERE `sub_product_id`= '"+SCPDTO.getSubProductId()+"'";*/
	SQL_QUERY="select comp.`company_name`,	compr.`comp_requirement_id`,	compr.`company_id`,	compr.`product_name`,	compr.`product_id`,	compr.`sub_product_name`,	compr.`sub_product_id` ,	compr.`product_quantity`,	compr.`product_unit`,	compr.`min_rate`,	compr.`max_rate`,	compr.`city`,	compr.`start_date`,	compr.`end_date`,	compr.`description`,	compr.`image_path`,	compr.`requirement_added_date`	from companies comp inner join companies_requirement compr on comp.company_id=compr.company_id where compr.sub_product_id='"+SCPDTO.getSubProductId()+"'";
	System.out.println(SQL_QUERY);
	AdminModel AM=new AdminModelImpl();
	rt=AM.gridProductsDetails(SQL_QUERY);
	
	return rt;
	
	
}

@Override
public FarmerResponceToCompanyPostDTO addUserResponceToPost(FarmerResponceToCompanyPostDTO FRTCPDTO) {
	// TODO Auto-generated method stub
	
	
	

	FRTCPDTO=UM.addResponceToPost(FRTCPDTO);

	return FRTCPDTO;
}

	
@Override
public ResultSet gridMyInbox(CompanyDTO CDTO) {
	// TODO Auto-generated method stub
	
	
	
	return cm.GridInbox(CDTO);
}

@Override
public boolean CheckUserEmailId(LoginDTO LDTO) {
	// TODO Auto-generated method stub
	 String SQL_QUERY="SELECT * FROM `login_master` WHERE `username`='"+LDTO.getUsername()+"'";
	return UM.checkUserDetails(SQL_QUERY);
	
}

/*@Override
public boolean CheckUserDetails(LoginDTO LDTO) {
	// TODO Auto-generated method stub
	 String sql_query="SELECT * FROM `login_master` WHERE `username`='"+str+"'";
	 UserModel um=new UserModelImpl();
		return um.CheckSignupEmailIdModel(str);
	return false;
}
*/

@Override
public CompanyDTO CheckcompanyDetails(CompanyDTO CDTO) {
	// TODO Auto-generated method stub
	
	CDTO=cm.CheckCompanyDetails(CDTO);
	
	
	return CDTO;
}
@Override
public boolean CheckUserPassword(LoginDTO LDTO) {
	// TODO Auto-generated method stub
	  //SQL_QUERY="SELECT * FROM `login_master` WHERE (SELECT * FROM `login_master`)``='"+LDTO.getUsername()+"'";
	  
	  
	  SQL_QUERY="SELECT * FROM `login_master` WHERE `password`= (SELECT `password` FROM `login_master` WHERE `username`='"+LDTO.getUsername()+"') && `username` =(SELECT username` FROM `login_master` WHERE `password` ='"+LDTO.getPassword()+"')";
	  System.out.println(SQL_QUERY);
		return UM.checkUserDetails(SQL_QUERY);
	
	
}


}
