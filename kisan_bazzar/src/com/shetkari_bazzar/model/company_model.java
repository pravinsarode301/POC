/**
 * 
 */
package com.shetkari_bazzar.model;

import java.sql.ResultSet;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.dto.subAdminDTO;

/**
 * @author PravTej
 *
 */
public interface company_model {

	public ResultSet grid_company_details(String sql_query);
	
	public int remove_company(String sql_query);
	
	public int CompanyRegistration(CompanyDTO ACGS); 
	
	public int update_company_info(CompanyDTO ACGT);
	
	public int deleteCompanyInfo(CompanyDTO CDTO);
	
	public int subAdminRegistration(subAdminDTO SADTO);
	
	public CompanyDTO CountCompanies(String SqlQuery);
	
	public CompanyRequirementDTO addUserRequirement(CompanyRequirementDTO PRDTO); 
	
	public ResultSet GridInbox(CompanyDTO CDTO);
	
	public CompanyDTO CheckCompanyDetails(CompanyDTO CDTO); 
	
}
