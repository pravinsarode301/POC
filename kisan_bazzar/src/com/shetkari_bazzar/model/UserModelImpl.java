package com.shetkari_bazzar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.shetkari_bazzar.dao.db_utility;
import com.shetkari_bazzar.dto.FarmerResponceToCompanyPostDTO;
import com.shetkari_bazzar.dto.LoginDTO;
import com.shetkari_bazzar.dto.LoginMasterDTO;
import com.shetkari_bazzar.dto.subAdminDTO;

public class UserModelImpl implements UserModel {

	PreparedStatement ps = null;
	int i = 0;
	ResultSet rs = null;
	//db_utility db = new db_utility();
int status;
	Connection con = null;

	/* this method is written for fetch the user detail from the table */
	@Override
	public ResultSet Get_User_Detail(String sql) {
		try {
			con = db_utility.getConnection();
			ps = db_utility.preparedStatement(con, sql);
			rs = ps.executeQuery();
		} catch (Exception e) {

			e.getMessage();
		}
		return rs;
	}

	/* this method is written for the update the user detail */
	@Override
	public int Update_User_Detail(String sql) {
		try {
			con = db_utility.getConnection();
			ps = db_utility.preparedStatement(con, sql);
			i = ps.executeUpdate();
		} catch (Exception e) {

			e.getMessage();

		}
		return i;
	}

	@Override
	public int delete_User_Detail(String sql) {
		try {
			ps = con.prepareStatement(sql);
			i = ps.executeUpdate();
		} catch (Exception e) {

			e.getMessage();
		}
		return i;
	}

	/* This method id used for the insert user data into the table */
	
	@Override
	public int Insert_userDetail(subAdminDTO SADTO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		LoginMasterDTO LMDTO=new LoginMasterDTO();
		UserModel UML=new UserModelImpl();
		LMDTO.setUsername(SADTO.getSubAdminUserName());
		LMDTO.setPassword(SADTO.getSubAdminPassword());
		LMDTO.setUser_role(SADTO.getSubAdminRole());
		LMDTO.setSpecial_auth_password(SADTO.getSubAdminPassword());
		LMDTO.setRandom_password(SADTO.getSubAdminPassword());
		
		/*to update the login master table */
		
		result=UML.updateLoginMaster(LMDTO);
		 System.out.println(SADTO.getSubAdminRole());
		 System.out.println(result);
		System.out.println("reult:"+SADTO.getSubAdminPassword());
		
		String sql = "insert into `subadmin` (`firstName`,`middleName`,`lastName`,`userName`,`password`,`landmark`,`city`,`contactNo`,`emailId`,`dist`,`state`,`country`,`created_by`,`created_date`,`gender`,`address`,`subAdminProfilePic`,`Role`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	System.out.println(sql);	
		pstmt = db_utility.preparedStatement(con, sql);

		try {
			pstmt.setString(1, SADTO.getSubAdminFirstName());
			pstmt.setString(2, SADTO.getSubAdminMiddleName());
			pstmt.setString(3, SADTO.getSubAdminLastName());
			pstmt.setString(4, SADTO.getSubAdminUserName());
			pstmt.setString(5,SADTO.getSubAdminPassword());
			pstmt.setString(6, SADTO.getSubAdminLandmark());
			pstmt.setString(7, SADTO.getSubAdminCity());
			pstmt.setLong(8, SADTO.getSubAdminContactNumber());
			pstmt.setString(9, SADTO.getSubAdminEmailId());
			pstmt.setString(10, SADTO.getSubAdminDivision());
			pstmt.setString(11, SADTO.getSubAdminState());
			pstmt.setString(12, SADTO.getSubAdminCountry());
			pstmt.setString(13, SADTO.getSubAdminCreatedBy());
			pstmt.setTimestamp(14,SADTO.getCurrentTimeStamp());
			pstmt.setString(15, SADTO.getSubAdminGender());
			pstmt.setString(16, SADTO.getSubAdminAddress());
			pstmt.setString(17, SADTO.getSubAdminProfilePic());
			pstmt.setString(18, SADTO.getSubAdminRole());
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("there is some empty in Insert_userDetail method");
		}
		int i = db_utility.executeUpdate(pstmt);
		return i;
		/*if(result==i){
		return 1;
		}else{
			return 0;
		}*/
	}

	
	@Override
	public int changePassword(String SqlQuery) {
		// TODO Auto-generated method stub
		try {
			con=db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			status=db_utility.createStatement(con).executeUpdate(SqlQuery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
		
		
	}
	
	
	@Override
	public int updateLoginMaster(LoginMasterDTO LMDTO) {
		// TODO Auto-generated method stub
	
		
		System.out.println("role "+LMDTO.getUser_role());
		System.out.println("usernaame "+LMDTO.getUsername());
		
		String SQL_QUERY = "insert into `login_master` (`user_id` ,`username`,`password`,`user_role`,`special_auth_password`,`randompass`,`welcome_name`) values (?,?,?,?,?,?,?)";
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		pstmt = db_utility.preparedStatement(con, SQL_QUERY);

		try {
			pstmt.setInt(1, LMDTO.getUserId());
			pstmt.setString(2, LMDTO.getUsername());
			pstmt.setString(3, LMDTO.getPassword());
			pstmt.setString(4, LMDTO.getUser_role());
			pstmt.setString(5, LMDTO.getSpecial_auth_password());
			pstmt.setString(6, LMDTO.getRandom_password());
			pstmt.setString(7, LMDTO.getWelcomeName());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("there is some empty in Insert_userDetail method");
		}
		int i = db_utility.executeUpdate(pstmt);
		return i;	
		
		
	}
	
	@Override
	public FarmerResponceToCompanyPostDTO addResponceToPost(FarmerResponceToCompanyPostDTO FRTCPDTO) {
		// TODO Auto-generated method stub
		
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	String	SQL_QUERY="INSERT INTO `user_response_to_post`(`companyId`, `companyName`, `subProductId`, `compRequirementId`, `userFullName`, `productQuantity`, `userContactNumber`, `userGender`, `userAddress`, `ProductForCity`, `productAddedDate`, `productExpectedCost`, `postRespsonceAddedDate`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = db_utility.preparedStatement(con, SQL_QUERY);
		
		
		try {
			pstmt.setInt(1, FRTCPDTO.getCompanyId());
			pstmt.setString(2, FRTCPDTO.getCompanyName());
			pstmt.setInt(3, FRTCPDTO.getSubProductId());
			pstmt.setInt(4, FRTCPDTO.getCompRequirementId());
			pstmt.setString(5, FRTCPDTO.getUserFullName());
			pstmt.setLong(6, FRTCPDTO.getProductQuantity());
			pstmt.setLong(7, FRTCPDTO.getUserContactNumber());
			pstmt.setString(8, FRTCPDTO.getUserGender());
			pstmt.setString(9, FRTCPDTO.getUserAddress());
			pstmt.setString(10, FRTCPDTO.getProductForCity());
			pstmt.setDate(11, FRTCPDTO.getProductAddedDate());
			pstmt.setDouble(12, FRTCPDTO.getProductExpectedCost());
			pstmt.setTimestamp(13, FRTCPDTO.getPostRespsonceAddedDate());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("there is some empty in Insert_userDetail method");
		}
		FRTCPDTO.setReturnIntStatus(db_utility.executeUpdate(pstmt));
			
		
		return FRTCPDTO;
	}
	
@Override
	public boolean CheckSignupEmailIdModel(String str){
		// TODO Auto-generated method stub
	 Statement stmt=null;
     ResultSet rt= null;
	try {
		con = db_utility.getConnection();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	 String sql_query="SELECT * FROM `login_master` WHERE `username`='"+str+"'";
	// System.out.println(sql_query);
	
	try {
		stmt=db_utility.createStatement(con);
		rt=db_utility.executeQuery(stmt, sql_query);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("empty statement which cause java.lang.NullPointerException");
	}
	
	try {
		if(rt.next()){
		
			return true;
		}else{
		
		
			return false;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
		
		
		return false;
	
}
	
@Override
public boolean checkUserDetails(String SQL_QUERY) {
	// TODO Auto-generated method stub

	
	 Statement stmt=null;
     ResultSet rt= null;
	try {
		con = db_utility.getConnection();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	
	// System.out.println(sql_query);
	
	try {
		stmt=db_utility.createStatement(con);
		rt=db_utility.executeQuery(stmt, SQL_QUERY);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("empty statement which cause java.lang.NullPointerException");
	}
	
	try {
		if(rt.next()){
		
			return true;
		}else{
		
		
			return false;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
		
		
		
	return false;
}

	
	
}
