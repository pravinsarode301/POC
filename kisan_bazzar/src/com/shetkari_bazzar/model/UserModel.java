	package com.shetkari_bazzar.model;
	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;

import com.shetkari_bazzar.dto.FarmerResponceToCompanyPostDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.dto.LoginMasterDTO;
import com.shetkari_bazzar.dto.subAdminDTO;

	public interface UserModel {

		// this method is used for 
		public int Insert_userDetail(subAdminDTO SADTO);
		
		//This method is used get the result from registration table
		public ResultSet Get_User_Detail(String SQL_QUERY);
		
		//This method is used for the update the user detail
		public int Update_User_Detail(String SQL_QUERY);
		
		//This method id used for the delete the record from the table
		public int delete_User_Detail(String SQL_QUERY);
		
		public int changePassword(String SQL_QUERY);
		
		public int updateLoginMaster(LoginMasterDTO LMDTO); 
		
		public FarmerResponceToCompanyPostDTO addResponceToPost(FarmerResponceToCompanyPostDTO FRTCPDTO);
		
		boolean CheckSignupEmailIdModel(String str);
		
		public boolean checkUserDetails(String SQL_QUERY);
		/*danny code*/
		
		//This method is used for the update the user detail
       // public int Update_User_Detail(String sql);
		
	}


