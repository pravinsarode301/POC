package com.hotel.Model;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class OrderMenuTotal {
	public static ResultSet GridOrderMenu_detail(String table_no) throws Exception{
	
		
		
		
		Connection con=(Connection) DbModel.getConnection();
		Statement st=(Statement) DbModel.createStatement(con);
		String sql="SELECT od.order_no,od.c_date,od.table_no ,od.quantity,(od.quantity*itde.item_amount) as amount ,od.ord_menu FROM order_detail od , item_detail itde WHERE itde.item_name=od.ord_menu and od.table_no=";
		PreparedStatement ps=DbModel.preparedStatement(con, sql);
		DbModel.executeUpdate((com.mysql.jdbc.PreparedStatement) ps, sql);
		ResultSet rt=DbModel.executeQuery(st, sql);	
		return rt;
	
	}
}
