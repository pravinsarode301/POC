package com.hotel.Model;

import java.sql.SQLException;

import com.hotel.Service.LoginformGetterSetter;

public class AlterPassword {

	public static int alterOldPassword(LoginformGetterSetter LFGS){
		
		String user_name=LFGS.getUser_name();
		String user_password=LFGS.getUser_password();
		
		String sql_query="update login_table set password='"+user_password+"' where email='"+user_name+"'";
		int s=0;
		try {
			s = DbModel.getConnection().createStatement().executeUpdate(sql_query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return s;
		
	}
	
	
}
