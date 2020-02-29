package com.hotel.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.hotel.Service.ContactFormGetterSetter;
import com.mysql.jdbc.Connection;



public class AlterCaptaindetails {
	public static ResultSet getCaptaindetails(String captain_id) {
		ResultSet rt=null;
		try {
			String sql="select * from captain_detail where cap_id='"+captain_id+"'";
			Connection con = null;
			try {
				con = (Connection)DbModel.getConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Statement st=(Statement) DbModel.createStatement(con);
			 rt=DbModel.executeQuery(st, sql);
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return rt;	
}

	
	public static int updateCaptainDetails(ContactFormGetterSetter CfGS) throws Exception {
		// TODO Auto-generated method stub
		
		
		String cap_name=CfGS.getCaptain_name();
		String cap_id=CfGS.getCaptain_id();
		String cap_dob=CfGS.getCaptain_dob();
		String cap_mob=CfGS.getCaptain_mobile();
		String cap_email=CfGS.getCap_email();
		String cap_jdt=CfGS.getCaptain_JoingDate();
		String cap_addr=CfGS.getCaptain_address();
		
		String sql="update captain_detail set cap_name='"+cap_name+"',cap_dob='"+cap_dob+"',cap_mob='"+cap_mob+"',cap_email='"+cap_email+"',cap_jdt='"+cap_jdt+"',cap_addr='"+cap_addr+"' where cap_id="+cap_id+"";
		
		
		int s=DbModel.getConnection().createStatement().executeUpdate(sql);
		if(s==1){
			System.out.println("success");
		}else{
			System.out.println("failed");
		}
		return s;
	}
	
	
	
	
public static int deleteCaptain(String captain_id) {
	int i=0;
	try
	{
		String sql="delete from captain_detail where cap_id='"+captain_id+"'";
		
		Statement stmt=DbModel.getConnection().createStatement();
		i=stmt.executeUpdate(sql);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return i;
	
}
public static int last_insert_id_Captain(){
	int last_insert_id_Captain_ID=0;
	String query_last_insert_id_Captain="select LAST_INSERT_ID(cap_id) as last_inser_value from captain_detail";
	try {
		Statement stmt2=DbModel.getConnection().createStatement();
	ResultSet rst=stmt2.executeQuery(query_last_insert_id_Captain);
		while(rst.next()){
			
			last_insert_id_Captain_ID=Integer.parseInt(rst.getString("last_inser_value"));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return last_insert_id_Captain_ID;
}



}
