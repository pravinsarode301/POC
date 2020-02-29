package com.shetkari_bazzar.model;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.management.modelmbean.RequiredModelMBean;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import java.sql.Date;

import com.shetkari_bazzar.dao.db_utility;
import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.dto.LoginMasterDTO;
import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.dto.subAdminDTO;

public class company_model_impl implements company_model {
	Connection con = null;
	ResultSet rt = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	CompanyDTO CDTO = new CompanyDTO();
	String SQL_QUERY;

	public ResultSet grid_company_details(String sql_query) {

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		stmt = db_utility.createStatement(con);
		rt = db_utility.executeQuery(stmt, sql_query);

		return rt;
	}

	public int remove_company(String sql_query) {

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		pstmt = db_utility.preparedStatement(con, sql_query);
		int i = db_utility.executeUpdate(pstmt);

		System.out.println("am in service " + i);

		return i;

	}

	public int CompanyRegistration(CompanyDTO CDTO) {

		/* Required object to update login master for new company */
		UserModel UM = new UserModelImpl();
		LoginMasterDTO LMDTO = new LoginMasterDTO();
		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/* System.out.println(ACGS.getCompany_name()); */
		 SQL_QUERY = "insert into `companies` (`company_name`,`company_registred_id`,`authorised_person_name`,`authorised_person_mo_number`,`authorised_person_email_id`,`company_website`,`company_email_id`,`company_contact_number`,`company_fax_number`,`landmark`,`city`,`state`,`country`,`registration_date`,`profile_pic`,`company_register_address`,`company_current_address`,`created_by`,`created_date`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		pstmt = db_utility.preparedStatement(con, SQL_QUERY);

		try {
			pstmt.setString(1, CDTO.getCompanyName());
			pstmt.setString(2, CDTO.getCompanyRegId());
			pstmt.setString(3, CDTO.getAuthorisedPersonName());
			// System.out.println("mo
			// no"+CDTO.getAuthorisedPersonMobileNumber());
			pstmt.setLong(4, CDTO.getAuthorisedPersonMobileNumber());
			pstmt.setString(5, CDTO.getAuthorisedPersonEmail());
			pstmt.setString(6, CDTO.getCompanyWebsite());
			pstmt.setString(7, CDTO.getCompanyEmail());
			pstmt.setLong(8, CDTO.getCompanyContactNumber());
			pstmt.setLong(9, CDTO.getCompanyFaxNumber());
			pstmt.setString(10, CDTO.getCompanyLandmark());
			pstmt.setString(11, CDTO.getCompanyCity());
			pstmt.setString(12, CDTO.getCompanyState());
			pstmt.setString(13, CDTO.getCompanyCountry());
			pstmt.setString(14, CDTO.getCompanyRegistrationDate());
			// System.out.println("am in model "+CDTO.getProfilePic());
			pstmt.setString(15, CDTO.getProfilePic());
			pstmt.setString(16, CDTO.getCompanyRegisterAddress());
			pstmt.setString(17, CDTO.getCompanyCurrentAddress());
			pstmt.setString(18, CDTO.getCreatedBy());
			pstmt.setTimestamp(19, CDTO.getCurrentTimeStamp());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int i = db_utility.executeUpdate(pstmt);
		
		class createCompanyLogin {

			private CompanyDTO updateCompanyLoginMaster(CompanyDTO CDTO) {

				 SQL_QUERY = "SELECT * FROM `companies` WHERE `company_registred_id`='" + CDTO.getCompanyRegId()+ "'";

				rt = grid_company_details(SQL_QUERY);
				try {
					while (rt.next()) {

						System.out.println(rt.getInt("company_id"));
						LMDTO.setWelcomeName(rt.getString("company_name"));
						LMDTO.setUserId(rt.getInt("company_id"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				LMDTO.setUser_role(CDTO.getCompanyRole());
				LMDTO.setUsername(CDTO.getCompanyEmail());
				System.out.println("\\\\\\\\\\\\\\\\\\\\\\\\\\");
				LMDTO.setPassword(CDTO.getCompanyPassword());
				LMDTO.setRandom_password(CDTO.getCompanyPassword());
				LMDTO.setSpecial_auth_password(CDTO.getCompanyPassword());
				System.out.println(LMDTO.getUser_role());
				System.out.println(LMDTO.getUsername());
				System.out.println(LMDTO.getPassword());
				System.out.println("\\\\\\\\\\\\\\\\\\\\\\\\\\");
				CDTO.setInnnerClassReturnStatus(UM.updateLoginMaster(LMDTO));
				return CDTO;
			}

		}
		createCompanyLogin CCL = new createCompanyLogin();

		CDTO = CCL.updateCompanyLoginMaster(CDTO);

		

		if (i == 1) {
			if (CDTO.getInnnerClassReturnStatus() == 1) {
				return 1;
			} else {
				return 0;
			}
		} else {
			return 0;
		}
	}

	@Override
	public int update_company_info(CompanyDTO CDTO) {
		// TODO Auto-generated method stub

		ResultSet rt = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		 SQL_QUERY = "update `companies` set `company_name`=?,`company_registred_id`=?,`authorised_person_name`=?,`authorised_person_mo_number`=?,`authorised_person_email_id`=?,`company_website`=?,`company_email_id`=?,`company_contact_number`=?,`company_fax_number`=?,`landmark`=?,`city`=?,`state`=?,`country`=?,`registration_date`=?,`profile_pic`=? where  company_id='"
				+ CDTO.getCompanyId() + "'";
		System.out.println(SQL_QUERY);
		pstmt = db_utility.preparedStatement(con, SQL_QUERY);

		try {
			pstmt.setString(1, CDTO.getCompanyName());
			pstmt.setString(2, CDTO.getCompanyRegId());
			pstmt.setString(3, CDTO.getAuthorisedPersonName());
			pstmt.setLong(4, CDTO.getAuthorisedPersonMobileNumber());
			pstmt.setString(5, CDTO.getAuthorisedPersonEmail());
			pstmt.setString(6, CDTO.getCompanyWebsite());
			pstmt.setString(7, CDTO.getCompanyEmail());
			pstmt.setLong(8, CDTO.getCompanyContactNumber());
			pstmt.setLong(9, CDTO.getCompanyFaxNumber());
			pstmt.setString(10, CDTO.getCompanyLandmark());
			pstmt.setString(11, CDTO.getCompanyCity());
			pstmt.setString(12, CDTO.getCompanyState());
			pstmt.setString(13, CDTO.getCompanyCountry());
			pstmt.setString(14, CDTO.getCompanyRegistrationDate());
			pstmt.setString(15, CDTO.getProfilePic());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(sql_query);
		int i = db_utility.executeUpdate(pstmt);

		return i;
	}

	@Override
	public int subAdminRegistration(subAdminDTO SADTO) {
		// TODO Auto-generated method stub

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		 SQL_QUERY = "insert into `subadmin` (`firstName`,`middleName`,`lastName`,`userName`,`password`,`landmark`,`city`,`contactNo`,`emailId`,`dist`,`state`,`country`,created_by`,`created_date`,`gender`,`address`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = db_utility.preparedStatement(con, SQL_QUERY);

		try {
			pstmt.setString(1, SADTO.getSubAdminFirstName());
			pstmt.setString(2, SADTO.getSubAdminMiddleName());
			pstmt.setString(3, SADTO.getSubAdminLastName());
			pstmt.setString(4, SADTO.getSubAdminUserName());
			pstmt.setString(5, SADTO.getSubAdminPassword());
			pstmt.setString(6, SADTO.getSubAdminLandmark());
			pstmt.setString(7, SADTO.getSubAdminCity());
			pstmt.setLong(8, SADTO.getSubAdminContactNumber());
			pstmt.setString(9, SADTO.getSubAdminEmailId());
			pstmt.setString(10, SADTO.getSubAdminDivision());
			pstmt.setString(11, SADTO.getSubAdminState());
			pstmt.setString(12, SADTO.getSubAdminCountry());
			pstmt.setString(13, SADTO.getSubAdminCreatedBy());
			pstmt.setTimestamp(14, SADTO.getCurrentTimeStamp());
			pstmt.setString(15, SADTO.getSubAdminGender());
			pstmt.setString(16, SADTO.getSubAdminAddress());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int i = db_utility.executeUpdate(pstmt);
		return i;

	}

	@Override
	public int deleteCompanyInfo(CompanyDTO CDTO) {
		// TODO Auto-generated method stub

		return 0;
	}

	@Override
	public CompanyDTO CountCompanies(String SqlQuery) {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			stmt = db_utility.createStatement(con);
			rt = db_utility.executeQuery(stmt, SqlQuery);

			while (rt.next()) {
				CDTO.setTotalCompniesRegistred(rt.getInt("totalregistercompanies"));

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("empty statement which cause java.lang.NullPointerException");
		}

		return CDTO;

	}
	
	@Override
	public CompanyRequirementDTO addUserRequirement(CompanyRequirementDTO PRDTO) {
		// TODO Auto-generated method stub
	
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SQL_QUERY="INSERT INTO `companies_requirement`(`company_id`, `product_name`, `product_id`, `sub_product_name`, `sub_product_id`, `product_quantity`, `product_unit`, `min_rate`, `max_rate`, `city`, `start_date`, `end_date`, `description`, `image_path`, `requirement_added_date`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = db_utility.preparedStatement(con, SQL_QUERY);
		
		
		try {
			pstmt.setInt(1, PRDTO.getCompanyId());
			pstmt.setString(2, PRDTO.getProductName());
			pstmt.setInt(3, PRDTO.getProductId());
			pstmt.setString(4, PRDTO.getSubProductName());
			pstmt.setInt(5, PRDTO.getSubProductId());
			pstmt.setInt(6, PRDTO.getProductQuantity());
			pstmt.setString(7, PRDTO.getProductUnit());
			pstmt.setDouble(8, PRDTO.getProductMinRate());
			pstmt.setDouble(9, PRDTO.getProductMaxRate());
			pstmt.setString(10, PRDTO.getProductForCity());
			pstmt.setDate(11, PRDTO.getStartDateOfProduct());
			pstmt.setDate(12, PRDTO.getEndDateOfProduct());
			pstmt.setString(13, PRDTO.getProductDescription());
			pstmt.setString(14, PRDTO.getProductImagePath());
			pstmt.setTimestamp(15, PRDTO.getRequirement_added_date());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PRDTO.setReturnIntStatus(db_utility.executeUpdate(pstmt));
		
		return PRDTO;
	}

	@Override
	public ResultSet GridInbox(CompanyDTO CDTO) {
		// TODO Auto-generated method stub
		/*SQL_QUERY="SELECT * FROM `user_response_to_post` WHERE `companyId`='"+CDTO.getCompanyId()+"'";*/
		
		SQL_QUERY="SELECT comreq.`comp_requirement_id`,comreq.`company_id`,comreq.`product_name`,comreq.`product_id`, comreq.`sub_product_name`, comreq.`sub_product_id`, comreq.`product_quantity`, comreq.`product_unit`, comreq.`min_rate`, comreq.`max_rate`, comreq.`city`,comreq.`start_date`, comreq.`end_date`,comreq.`description`,comreq.`image_path`, comreq.`requirement_added_date`,pd.`sub_product_name`FROM `companies_requirement` comreq inner join `portal_products(sub category)` pd on comreq.sub_product_id=pd.sub_product_id where comreq.company_id='"+CDTO.getCompanyId()+"'";
		//SQL_QUERY="SELECT * FROM `user_response_to_post` urp inner join `portal_products(sub category)` pd on urp.subProductId=pd.sub_product_id where urp.companyId='"+CDTO.getCompanyId()+"'";
		
		
		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		stmt = db_utility.createStatement(con);
		rt = db_utility.executeQuery(stmt, SQL_QUERY);

		return rt;
	}
	
	
	@Override
	public CompanyDTO CheckCompanyDetails(CompanyDTO CDTO) {
		// TODO Auto-generated method stub
	
		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		SQL_QUERY="SELECT * FROM `companies` WHERE `company_registred_id`='"+CDTO.getCompanyRegId()+"'";
		
		stmt = db_utility.createStatement(con);
		rt = db_utility.executeQuery(stmt, SQL_QUERY);

		try {
			if(rt.next()){
				CDTO.setReturnStatus(true);
				return CDTO;
			}else{
				CDTO.setReturnStatus(false);
				return CDTO;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return CDTO;
	}
	
}
