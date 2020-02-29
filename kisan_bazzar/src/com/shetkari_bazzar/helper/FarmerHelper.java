/**
 * 
 */
package com.shetkari_bazzar.helper;

import java.sql.ResultSet;

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.FarmerDTO;

/**
 * @author PravTej
 *
 */
public interface FarmerHelper {
	
	public ResultSet GridFarmer(FarmerDTO FDTO);
	
	public FarmerDTO totalRegistredFarmer();
	
	public int removeFarmerDetails(FarmerDTO FDTO);

	public FarmerDTO updateFarmerData(FarmerDTO FDTO);
	
	public FarmerDTO registerFarmer(FarmerDTO FDTO);
	
	
	
}
