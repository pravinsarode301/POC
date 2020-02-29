package com.hotel.Model;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hotel.Service.AddItemGetterSetter;
import com.hotel.Service.ContactFormGetterSetter;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class OrderMenuDao {
	public static ResultSet GridOrderMenu_detail() throws Exception{
		Connection con=(Connection) DbModel.getConnection();
		Statement st=(Statement) DbModel.createStatement(con);
		String sql="select * from item_detail";
		ResultSet rt=DbModel.executeQuery(st, sql);	
		return rt;
			
	}

	public int insertNewItems(AddItemGetterSetter AIGS) throws Exception {
		// TODO Auto-generated method stub
		
		
			String item_name=AIGS.getItem_name();
			String item_id= AIGS.getItem_id();
			String item_cost=AIGS.getItem_cost();
			String item_add_timedate=AIGS.getItem_add_timedate();
		
		
		
		Connection  con=DbModel.getConnection();
		
		String sql="insert into item_detail(item_name,item_id,item_amount,item_add_dt) values (?,?,?,?)";
		PreparedStatement pstmt=DbModel.preparedStatement(con, sql);
		
		pstmt.setString(1,item_name);
		pstmt.setString(2,item_id);
		pstmt.setString(3,item_cost);
		pstmt.setString(4,item_add_timedate);

		int resultbit=pstmt.executeUpdate();
		return resultbit;
	}
	
}
