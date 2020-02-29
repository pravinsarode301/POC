/**
 * 
 */
package com.shetkari_bazzar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.shetkari_bazzar.dao.db_utility;
import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.dto.LoginMasterDTO;

/**
 * @author PravTej
 *
 */
public class FarmerModelImpl implements FarmerModel {
	ResultSet rs = null;
	// db_utility db = new db_utility();
	int status = 0;
	Connection con = null;
	PreparedStatement ps = null;
	Statement stmt;
	FarmerDTO FDTO = new FarmerDTO();

	@Override
	public int ChangePassword(String SQL_QUERY) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FarmerDTO CountFarmers(String SQL_QUERY) {
		// TODO Auto-generated method stub

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			stmt = db_utility.createStatement(con);
			rs = db_utility.executeQuery(stmt, SQL_QUERY);

			while (rs.next()) {
				FDTO.setTotalFarmersRegistred(rs.getInt("totalregisterfarmer"));

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("empty statement which cause java.lang.NullPointerException");
		}

		return FDTO;

	}

	@Override
	public int DeleteFarmerDetail(String SQL_QUERY) {
		// TODO Auto-generated method stub

		try {
			con = db_utility.getConnection();
			ps = db_utility.preparedStatement(con, SQL_QUERY);
			status = ps.executeUpdate();

		} catch (Exception e) {

			e.getMessage();
		}

		return status;
	}

	@Override
	public ResultSet GetFarmerDetail(String SQL_QUERY) {
		// TODO Auto-generated method stub

		try {
			con = db_utility.getConnection();
			ps = db_utility.preparedStatement(con, SQL_QUERY);
			rs = ps.executeQuery();
		} catch (Exception e) {

			e.getMessage();
		}
		return rs;
	}

	@Override
	public FarmerDTO InsertFarmerDetail(FarmerDTO FDTO) {
		// TODO Auto-generated method stub

		System.out.println("role " + FDTO.getFarmerRole());
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

		String sql_query = "insert into `farmer_primary_signup` (`first_name`,`last_name`,`contact_number`,`email_id`,`password`,`created_date`) values (?,?,?,?,?,?)";
	/*	System.out.println(sql_query);*/
		pstmt = db_utility.preparedStatement(con, sql_query);

		try {
			pstmt.setString(1, FDTO.getFarmerFirstName());
			pstmt.setString(2, FDTO.getFarmerLastName());
			pstmt.setLong(3, FDTO.getFarmerContactNumber());
			pstmt.setString(4, FDTO.getFarmerEmailid());
			pstmt.setString(5, FDTO.getFarmerPassword());
			pstmt.setTimestamp(6, FDTO.getCreatedDate());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(sql_query);
		FDTO.setReturnStatus(db_utility.executeUpdate(pstmt));

		class innerInsertFarmerDetail {
			ResultSet rt = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			String SQL_QUERY=null;

			private FarmerDTO InsertFarmerDetail1(FarmerDTO FDTO) {
				/* required object */
				LoginMasterDTO LMDTO = new LoginMasterDTO();
				SQL_QUERY = "SELECT * FROM `farmer_primary_signup` where email_id='" + FDTO.getFarmerEmailid()+ "'";

				try {
					con = db_utility.getConnection();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				rt = GetFarmerDetail(SQL_QUERY);
				try {
					while (rt.next()) {
						FDTO.setFarmerId(rt.getInt("farmer_id"));
						LMDTO.setWelcomeName(rt.getString("first_name")+" "+rt.getString("last_name"));
						LMDTO.setUsername(rt.getString("email_id"));
						LMDTO.setPassword(rt.getString("password"));
						LMDTO.setSpecial_auth_password(rt.getString("password"));
						LMDTO.setRandom_password(rt.getString("password"));
					}

					
					LMDTO.setUserId(FDTO.getFarmerId());
					LMDTO.setUser_role(FDTO.getFarmerRole());
					

				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					System.out.println("rt is empty");
					e1.printStackTrace();
				}
				// LMDTO.setUser_role(FDTO.getFarmerRole());

				String sql_query = "insert into `farmer` (`farmer_id`,`first_name`,`last_name`,`contact_number`,`email_id`,`password`,`created_date`) values (?,?,?,?,?,?,?)";
				/* System.out.println(sql_query); */
				pstmt = db_utility.preparedStatement(con, sql_query);

				try {
					pstmt.setInt(1, FDTO.getFarmerId());
					pstmt.setString(2, FDTO.getFarmerFirstName());
					pstmt.setString(3, FDTO.getFarmerLastName());
					pstmt.setLong(4, FDTO.getFarmerContactNumber());
					pstmt.setString(5, FDTO.getFarmerEmailid());
					pstmt.setString(6, FDTO.getFarmerPassword());
					pstmt.setTimestamp(7, FDTO.getCreatedDate());

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("error in heree met inner");
				}
				// System.out.println(sql_query);

				UserModel UML = new UserModelImpl();
				LMDTO.setReturnIntStatus(UML.updateLoginMaster(LMDTO));

				FDTO.setInnnerClassReturnStatus(db_utility.executeUpdate(pstmt));

				if (FDTO.getInnnerClassReturnStatus() == 1 && LMDTO.getReturnIntStatus() == 1) {
					return FDTO;
				} else {
					FDTO.setInnnerClassReturnStatus(0);
					return FDTO;
				}

			}
		}

		innerInsertFarmerDetail in = new innerInsertFarmerDetail();
		FDTO = in.InsertFarmerDetail1(FDTO);
	/*	System.out.println("inner class return status" + FDTO.getInnnerClassReturnStatus());*/

		return FDTO;

	}

	@Override
	public FarmerDTO UpdateFarmerDetail(FarmerDTO FDTO) {
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

		String sql_query = "update `farmer` set `first_name`=?,`last_name`=?,`contact_number`=?,`email_id`=?,`address`=?,`country`=?,`state`=?,`district`=?,`city`=?,`landmark`=?,`pin_code`=?,`gender`=?,`date_of_birth`=? ,`profile_pic_path`=? where  farmer_id ='" + FDTO.getFarmerId() + "'";
		System.out.println(sql_query);
		pstmt = db_utility.preparedStatement(con, sql_query);

		try {
			pstmt.setString(1, FDTO.getFarmerFirstName());
			pstmt.setString(2, FDTO.getFarmerLastName());
			pstmt.setLong(3, FDTO.getFarmerContactNumber());
			pstmt.setString(4, FDTO.getFarmerEmailid());
			pstmt.setString(5, FDTO.getFarmerAddress());
			pstmt.setString(6, FDTO.getFarmerCountry());
			pstmt.setString(7, FDTO.getFarmerState());
			pstmt.setString(8, FDTO.getFarmerDistrict());
			pstmt.setString(9, FDTO.getFarmerCity());
			pstmt.setString(10, FDTO.getFarmerLandmark());
			pstmt.setInt(11, FDTO.getFarmerPincode());
			pstmt.setString(12, FDTO.getFarmerGender());
			System.out.println("sex"+FDTO.getFarmerGender());
			pstmt.setDate(13, FDTO.getFarmerDateOfBirth());
			System.out.println("dob"+FDTO.getFarmerDateOfBirth());
			pstmt.setString(14, FDTO.getProfilePicPath());
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(sql_query);
		FDTO.setReturnStatus(db_utility.executeUpdate(pstmt));

		return FDTO;
	}

}
