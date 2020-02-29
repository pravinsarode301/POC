package com.hotel.Model;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.hotel.Service.ContactFormGetterSetter;
import com.hotel.Service.OrderDetailGetterSetter;
import com.mysql.jdbc.Connection;

public class AlterOrderdetails {
	
	static int last_insert_id_order_no=0;
	static int customer_bill=0;
	static String payment_status="Done";
	 static int table_book_status=1;
	
	
		public static ResultSet getOrderdetails(String Order_ID) {
			ResultSet rt=null;
			try {
				String sql="select * from order_detail where order_no='"+Order_ID+"'";
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

		public static void deleteOrederFromBackupTable(OrderDetailGetterSetter ODGS){
			
			String Order_no=ODGS.getOrderNo();
			
			String sql="delete from backup_orders_details where order_no="+Order_no+"  && payment_status='Not_Done' ";
			
			try {
				Statement stmt=DbModel.getConnection().createStatement();
				
				stmt.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		public static int updateOrderDetails(OrderDetailGetterSetter ODGS) throws Exception {
			// TODO Auto-generated method stub
			String cureent_table_no;
			//String backup_tableno;
			String table_no;
			
			String customer_name=ODGS.getCustomerNname();
			String Order_Date=ODGS.getOrderDate();
			//String table_no=ODGS.getTableNo();
			cureent_table_no=ODGS.getTableNo();
			String Order_no=ODGS.getOrderNo();
			String Captain_name=ODGS.getCaptainName();
			String Order_Menu_Name=ODGS.getOrderMenuName();
			String item_Quantity=ODGS.getItemQuantity();
			int Order_no_int=Integer.parseInt(ODGS.getOrderNo());
			String Backup_tableno=ODGS.getBackup_tableno();
			int a=Integer.parseInt(Backup_tableno);
			int b=Integer.parseInt(cureent_table_no);
			
			if(a==b){
				table_no=cureent_table_no;
			}else{
				table_no=Backup_tableno;
			}
			
			
			//simulteneously update.
			deleteOrederFromBackupTable(ODGS);
			
			deleteOrder(table_no, Order_no);
			
			OrderFormDaoImpl odfk=new OrderFormDaoImpl();
			
			try {
				odfk.PlaceOrdersDetailsmodel(ODGS);
			} catch (ArrayIndexOutOfBoundsException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return 1;
		}
		
		
	
		
public static void updateStatusTable(int Order_no_int){
	
	final int table_unbook_status=0;
	int deletetableorder=0;
	String sql_query="update table_status set cureent_order='"+deletetableorder+"',table_status='"+table_unbook_status+"' where cureent_order="+Order_no_int+"";
	try {
		Statement stmt=DbModel.getConnection().createStatement();
		stmt.executeUpdate(sql_query);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			
			
		}
		
		
		/*update into respective table*/
		
		public static int updateOrderDetailsInRespTable(OrderDetailGetterSetter ODGS) throws Exception {
			// TODO Auto-generated method stub
			
			
			String customer_name=ODGS.getCustomerNname();
			String Order_Date=ODGS.getOrderDate();
			String table_no=ODGS.getTableNo();
			String Order_no=ODGS.getOrderNo();
			String Captain_name=ODGS.getCaptainName();
			String Order_Menu_Name=ODGS.getOrderMenuName();
			String item_Quantity=ODGS.getItemQuantity();
			int tble_no=Integer.parseInt(table_no);
			String table_number;
			
			switch (tble_no) {
			case 1:
				table_number="table_one";
				break;
			case 2:
				table_number="table_two";
				break;
			case 3:
				table_number="table_three";
				break;
			case 4:
				table_number="table_four";
				break;
			case 5:
				table_number="table_five";
				break;
			case 6:
				table_number="table_six";
				break;
			case 7:
				table_number="table_seven";
				break;
			case 8:
				table_number="table_eight";
				break;
			case 9:
				table_number="table_nine";
				break;
			
			default:
				table_number="table_ten";
				break;
			}
			
			int table_number1=0;
			String table_number2=null;
			ResultSet rt= AlterOrderdetails.getOrderdetails(Order_no);
			while(rt.next()){
				table_number1=Integer.parseInt(rt.getString(3));
			}
			
			switch (table_number1) {
			case 1:
				table_number2="table_one";
				break;
			case 2:
				table_number2="table_two";
				break;
			case 3:
				table_number2="table_three";
				break;
			case 4:
				table_number2="table_four";
				break;
			case 5:
				table_number2="table_five";
				break;
			case 6:
				table_number2="table_six";
				break;
			case 7:
				table_number2="table_seven";
				break;
			case 8:
				table_number2="table_eight";
				break;
			case 9:
				table_number2="table_nine";
				break;
			default:
				table_number2="table_ten";
				break;
			}
			
			/*First delete the order then reinsert it*/ 
			String sql_query="delete from "+table_number2+" where order_no='"+Order_no+"'";
			
			Statement stmt=DbModel.getConnection().createStatement();
			stmt.executeUpdate(sql_query);
			
			/*insert the respective table*/
			
			Connection con=DbModel.getConnection();
			String sql="insert into "+table_number+" (order_menu_item,quantity,customer_name,cap_name,order_no) values (?,?,?,?,?)";
			
			PreparedStatement pstmt=DbModel.preparedStatement(con, sql);
			
			pstmt.setString(1,Order_Menu_Name);
			pstmt.setString(2,item_Quantity);
			pstmt.setString(3,customer_name);
			pstmt.setString(4,Captain_name);
			pstmt.setString(5,Order_no);
			int resultbit=pstmt.executeUpdate();
			return resultbit;
			
			
		}
		
		
	public static int deleteOrder(String orderDeleteTable_no,String Order_ID) {
		int i=0;
		
		
		
		int	table_no=Integer.parseInt(orderDeleteTable_no);
		
		int table_book_status=0;
		int Order_ID1=Integer.parseInt(Order_ID);
		
		deleteOrderTable(orderDeleteTable_no, Order_ID);
		
		updateStatusTable(Order_ID1);
		
		try
		{
			String sql="delete from order_detail where order_no='"+Order_ID+"'";
			
			Statement stmt=DbModel.getConnection().createStatement();
			
			i=stmt.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return i;
		
	}
	
	
	public static void deleteOrderTable(String table_no, String Order_ID) {
		int final_tble_no;
		
		int tble_no=Integer.parseInt(table_no);
		String table_number=null;
		
		
		
		switch (tble_no) {
		case 1:
			table_number="table_one";
			break;
		case 2:
			table_number="table_two";
			break;
		case 3:
			table_number="table_three";
			break;
		case 4:
			table_number="table_four";
			break;
		case 5:
			table_number="table_five";
			break;
		case 6:
			table_number="table_six";
			break;
		case 7:
			table_number="table_seven";
			break;
		case 8:
			table_number="table_eight";
			break;
		case 9:
			table_number="table_nine";
			break;
		
		default:
			table_number="table_ten";
			break;
		}
		
		try
		{
			String sql="delete from "+ table_number +" where order_no='"+ Order_ID +"'";
			
			Statement stmt=DbModel.getConnection().createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
	}
	
public static int last_insert_id_order_no(){
		
		String query_last_insert_id_order_no="select LAST_INSERT_ID(order_no) as last_inser_value from order_detail";
		try {
			Statement stmt2=DbModel.getConnection().createStatement();
		ResultSet rst=stmt2.executeQuery(query_last_insert_id_order_no);
			while(rst.next()){
				
				last_insert_id_order_no=Integer.parseInt(rst.getString("last_inser_value"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return last_insert_id_order_no;
	}

public static void update_backup_orders_details(OrderDetailGetterSetter ODGS) throws Exception {
	// TODO Auto-generated method stub
	
	
	String customer_name=ODGS.getCustomerNname();
	String Order_Date=ODGS.getOrderDate();
	int table_no=Integer.parseInt(ODGS.getTableNo());
	int Order_no=Integer.parseInt(ODGS.getOrderNo());
	String Captain_name=ODGS.getCaptainName();
	String Order_Menu_Name=ODGS.getOrderMenuName();
	int item_Quantity=Integer.parseInt(ODGS.getItemQuantity());
	
	
	
	Connection  con=(Connection) DbModel.getConnection();
	
	String sql="update backup_orders_details set c_date='"+Order_Date+"',table_no='"+table_no+"',ord_menu='"+Order_Menu_Name+"',customer_bill='"+customer_bill+"',customer_name='"+customer_name+"',captain_name='"+Captain_name+"' where order_no="+Order_no+"";
	

		DbModel.getConnection().createStatement().executeUpdate(sql);
		
	
	
}

public static int update_bill_amount_backup_orders_details(OrderDetailGetterSetter ODGS) throws Exception {
	// TODO Auto-generated method stub
	
	int result=0;
	
	
	int table_no=Integer.parseInt(ODGS.getTableNo());
	int Order_no=Integer.parseInt(ODGS.getOrderNo());
	int Total_bill_amount_done=Integer.parseInt(ODGS.getTotal_bill_amount_done());
	
	String sql="update backup_orders_details set customer_bill='"+Total_bill_amount_done+"',payment_status='"+payment_status+"' where order_no="+Order_no+" && table_no='"+table_no+"' && payment_status='Not_Done' ";
	
result= DbModel.getConnection().createStatement().executeUpdate(sql);
	if(result>0){
	
	return 1;
	}
	else{
		return 0;
	}
	
}

	
	}

	

