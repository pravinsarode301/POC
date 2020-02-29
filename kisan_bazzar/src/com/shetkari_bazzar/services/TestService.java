package com.shetkari_bazzar.services;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.dto.FarmerResponceToCompanyPostDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.dto.SubCategoryProductDTO;
import com.shetkari_bazzar.dto.changePasswordDTO;
import com.shetkari_bazzar.dto.productsDTO;
import com.shetkari_bazzar.dto.subAdminDTO;


public interface TestService {

	public int registerData(CompanyDTO CDTO);
	
	public FarmerDTO registerData(FarmerDTO FDTO);
	
	public ResultSet gridCompany(String status_query_string, CompanyDTO CDTO);

	public ResultSet view_company();
	
	public int removeCompany(CompanyDTO CDTO);
	
	public ResultSet View_comapny(String sql);
	
	public int update_company_info(CompanyDTO CDTO);
	
	public LoginDTO login(LoginDTO LDTO) throws SQLException;
	
	public boolean AddCompanyDetails(CompanyDTO CDTO);
	
	public int  updateNewPassword(changePasswordDTO CPDTO);
	
	public int addUser(subAdminDTO SADTO);
	
	public ResultSet GridFarmer(FarmerDTO FDTO);
	
	public FarmerDTO totalRegFarmer();
	
	public CompanyDTO totalRegCompany();
	
	public int removeFarmer(FarmerDTO FDTO);
	
	public FarmerDTO updateFarmerDetails(FarmerDTO FDTO);
	
	public productsDTO addProductsDetails(productsDTO PDTO);
	
	public ResultSet gridProducts();
	
	public CompanyRequirementDTO addRequirement(CompanyRequirementDTO PRDTO);
	
	public ResultSet gridSubCategoryProducts(SubCategoryProductDTO SCPDTO);
	
	public SubCategoryProductDTO addProductsDetails(SubCategoryProductDTO SCPDTO);
	
	public ResultSet gridCompanyRequirementsForProducts(CompanyRequirementDTO SCPDTO);
	
	public FarmerResponceToCompanyPostDTO addUserResponceToPost(FarmerResponceToCompanyPostDTO FRTCPDTO);
	
	public ResultSet gridMyInbox(CompanyDTO CDTO);
	
	public boolean CheckUserEmailId(LoginDTO LDTO);
	
	public boolean CheckUserPassword(LoginDTO LDTO);
	
	public CompanyDTO CheckcompanyDetails(CompanyDTO CDTO);
}
