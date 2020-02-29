/**
 * 
 */
package com.shetkari_bazzar.model;

import java.sql.ResultSet;

import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.dto.subAdminDTO;

/**
 * @author PravTej
 *
 */
public interface FarmerModel {

	// this method is used for 
			public FarmerDTO InsertFarmerDetail(FarmerDTO FDTO);
			
			//This method is used to get the result from registration table
			public ResultSet GetFarmerDetail(String sqlQuery);
			
			//This method is used for the update the user detail
			public FarmerDTO UpdateFarmerDetail(FarmerDTO FDTO);
			
			//This method id used for the delete the record from the table
			public int DeleteFarmerDetail(String sqlQuery);
			
			public int ChangePassword(String sqlQuery);
			
			public FarmerDTO CountFarmers(String sqlQuery);
	
}
