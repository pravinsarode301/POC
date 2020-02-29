package com.hotel.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.hotel.Service.*;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
public class CaptainFormDaoImpl {

	public static ResultSet GridCaptain_detail() throws SQLException{
		
		
		Connection con = null;
		try {
			con = (Connection)DbModel.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Statement st=(Statement) DbModel.createStatement(con);
		String sql="select * from captain_detail";
		ResultSet rt=DbModel.executeQuery(st, sql);	
		return rt;
			
	}
	
	
	public int insertCaptain(ContactFormGetterSetter CfGS) throws Exception {
		// TODO Auto-generated method stub
		
		
		String cap_name=CfGS.getCaptain_name();
		String cap_id=CfGS.getCaptain_id();
		String cap_dob=CfGS.getCaptain_dob();
		String cap_mob=CfGS.getCaptain_mobile();
		String cap_email=CfGS.getCap_email();
		String cap_jdt=CfGS.getCaptain_JoingDate();
		String cap_addr=CfGS.getCaptain_address();
		final	String cap_role="captain";
		
	
	
			DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date captains_jdt = (Date)formatter.parse(cap_jdt);
			
			    java.sql.Date sqlDate = new java.sql.Date(captains_jdt.getTime());
		
		Connection  con=DbModel.getConnection();
		
		String sql="insert into captain_detail(cap_name,cap_id,cap_dob,cap_mob,cap_email,cap_jdt,cap_addr,role) values (?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=DbModel.preparedStatement(con, sql);
		
		pstmt.setString(1,cap_name);
		pstmt.setString(2,cap_id);
		pstmt.setString(3,cap_dob);
		pstmt.setString(4,cap_mob);
		pstmt.setString(5,cap_email);
		pstmt.setDate(6,sqlDate);
		pstmt.setString(7,cap_addr);
		pstmt.setString(8,cap_role);
		
		int s=pstmt.executeUpdate();
		
		return s;
	}
	
	public static void giveCaptainLogin(){
		
		
		
		
	}
	
	
}
