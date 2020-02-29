/**
 * 
 */
package com.shetkari_bazzar.helper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.dto.LoginDTO;


/**
 * @author PravTej
 *
 */
public interface CompanyHelper {

	public boolean checkCompanyData(CompanyDTO CDTO);
	
	public ResultSet gridCompanyData(CompanyDTO CDTO);
	
	public LoginDTO validateUser(LoginDTO LDTO) throws SQLException;
	
	public int registerNewCompany(CompanyDTO CDTO);
	
	public int updateCompanyData(CompanyDTO CDTO);
	
	public int DeleteCompanyData(CompanyDTO CDTO);
	
	public CompanyDTO totalRegistredCompanies();
	
	/*danny code*/
	public boolean forgotpass(LoginDTO dto);
    
	public int storeRandompass(LoginDTO dto);
    
    public CompanyRequirementDTO addRequirements(CompanyRequirementDTO PRDTO);
	
    public ResultSet gridMyInbox(CompanyDTO CDTO);
    
    
	
}
