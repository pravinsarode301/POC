package com.hotel.Model;


	

	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;

	import com.hotel.Service.AddItemGetterSetter;
	import com.hotel.Service.ContactFormGetterSetter;
import com.mysql.jdbc.Connection;



	public class AlterItemDetails {
		public static ResultSet getItemdetails(String Item_ID) {
			ResultSet rt=null;
			try {
				String sql="select * from item_detail where item_id='"+Item_ID+"'";
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

		
		public static int updateItemDetails(AddItemGetterSetter AIGS) throws Exception {
			// TODO Auto-generated method stub
			
			
			String item_name=AIGS.getItem_name();
			String item_id= AIGS.getItem_id();
			String item_cost=AIGS.getItem_cost();
			String item_add_timedate=AIGS.getItem_add_timedate();
			
			String sql="update item_detail set item_name='"+item_name+"',item_amount='"+item_cost+"',item_add_dt='"+item_add_timedate+"' where item_id="+item_id+"";
			
			
			int s1=DbModel.getConnection().createStatement().executeUpdate(sql);
			
			return s1;
		}
		
		
		
		
	public static int deleteItem(String Item_ID) {
		int i=0;
		try
		{
			String sql="delete from item_detail where item_id='"+Item_ID+"'";
			
			Statement stmt=DbModel.getConnection().createStatement();
			i=stmt.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
		
	}

	

}
