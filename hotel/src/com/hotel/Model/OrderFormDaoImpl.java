package com.hotel.Model;


import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.hotel.Service.*;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class OrderFormDaoImpl {

			static String table_number=null;
			static String payment_status="Not_Done";
			final int table_book_status=1;
			static int customer_bill=0;
		public static ResultSet GridOrderForm_detail() throws Exception{
			Connection con=(Connection)DbModel.getConnection();
			Statement st=(Statement) DbModel.createStatement(con);
			
			String sql="SELECT * FROM `table_status` where cureent_order!=0";
			ResultSet rt=DbModel.executeQuery(st, sql);
			
			return rt;
				
		}
		
		
		
		public int PlaceOrdersDetailsmodel(OrderDetailGetterSetter ODGS) throws Exception {
			// TODO Auto-generated method stub
			int s=0;
			
			String customer_name=ODGS.getCustomerNname();
			String Order_Date=ODGS.getOrderDate();
			int table_no=Integer.parseInt(ODGS.getTableNo());
			int Order_no=Integer.parseInt(ODGS.getOrderNo());
			String Captain_name=ODGS.getCaptainName();
			String Order_Menu_Name=ODGS.getOrderMenuName();
	
			Connection  con=(Connection) DbModel.getConnection();
			
		//	simultenously update
			
			try {
				insertTableResp(ODGS);
			} catch (ArrayIndexOutOfBoundsException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			setTableStatusDetails(table_no,Order_no,table_book_status);
			backup_orders_details(ODGS);
			
			
			
			DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date captains_jdt = (Date)formatter.parse(Order_Date);
			java.sql.Date sqlDate = new java.sql.Date(captains_jdt.getTime());
			
			String [] s2=Order_Menu_Name.split("#|:");
			int j = 0;
			
			while(j<s2.length){
				
				String sql="insert into order_detail(c_date,order_no,table_no,ord_menu,quantity,customer_name,captain_name,table_status) values (?,?,?,?,?,?,?,?)";	
				PreparedStatement pstmt=DbModel.preparedStatement(con, sql);
				
				pstmt.setDate(1, sqlDate);
				pstmt.setLong(2,Order_no);
				pstmt.setLong(3,table_no);
				pstmt.setString(4,s2[j]);
					j+=1;
				pstmt.setString(5,s2[j]);
				pstmt.setString(6,customer_name);
				pstmt.setString(7,Captain_name);
				pstmt.setLong(8,table_book_status);
			 s=pstmt.executeUpdate();					
				
				j++;
		
			}	
			return s;
		}
	
		/*set table status*/
		
		public static void setTableStatusDetails(int table_no,int order_no,int table_book_status) {
	
			try {
				String sql="update table_status set table_status='"+table_book_status+"',cureent_order='"+order_no+"' where table_no="+table_no+"";
				
				DbModel.getConnection().createStatement().executeUpdate(sql);
			}catch (Exception e) {
				// TODO: handle exception
			}
				
	}
		
		/*table unbook status table*/
		public static ResultSet getTableStatusDetails() {
			ResultSet rt=null;
			int table_unbook_status=0;
			try {
				String sql="select * from  table_status where table_status="+table_unbook_status+"";
				Connection con=(Connection)DbModel.getConnection();
				Statement st=(Statement) DbModel.createStatement(con);
				
				 rt=DbModel.executeQuery(st, sql);
			}catch (Exception e) {
				// TODO: handle exception
			}
				return rt;
	}

		
		// insert order in respective table
		
	public	void insertTableResp(OrderDetailGetterSetter ODGS)throws Exception {
			
			String customer_name=ODGS.getCustomerNname();
			int table_no=Integer.parseInt(ODGS.getTableNo());
			int Order_no=Integer.parseInt(ODGS.getOrderNo());
			String Captain_name=ODGS.getCaptainName();
			String Order_Menu_Name=ODGS.getOrderMenuName();
			
			switch (table_no) {
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
			
			String [] s2=Order_Menu_Name.split("#|:");
			int j = 0;
			
			while(j<s2.length){
				
			String sql="insert into "+ table_number +"(order_no,cap_name,customer_name,order_menu_item,quantity) values (?,?,?,?,?)";
			
			Connection  con=(Connection) DbModel.getConnection();
			PreparedStatement pstmt=DbModel.preparedStatement(con, sql);
			
			pstmt.setLong(1,Order_no);
			pstmt.setString(2,Captain_name);
			pstmt.setString(3,customer_name);
			pstmt.setString(4,s2[j]);
			j+=1;
			try {
				pstmt.setString(5,s2[j]);
			} catch (ArrayIndexOutOfBoundsException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pstmt.executeUpdate();
			j++;
			}
		}
		
		// create backup for order table
	
	public void backup_orders_details(OrderDetailGetterSetter ODGS) throws Exception {
		// TODO Auto-generated method stub
		
		
		String customer_name=ODGS.getCustomerNname();
		String Order_Date=ODGS.getOrderDate();
		int table_no=Integer.parseInt(ODGS.getTableNo());
		int Order_no=Integer.parseInt(ODGS.getOrderNo());
		String Captain_name=ODGS.getCaptainName();
		String Order_Menu_Name=ODGS.getOrderMenuName();
	
		//System.out.println("Order_Menu_Name"+Order_Menu_Name);
		
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date captains_jdt = (Date)formatter.parse(Order_Date);
		java.sql.Date sqlDate = new java.sql.Date(captains_jdt.getTime());
		
		Connection  con=(Connection) DbModel.getConnection();
		String [] s2=Order_Menu_Name.split("#|:");
		int j = 0;
		
/*while(j<s2.length){*/
		
		String sql="insert into backup_orders_details(c_date,order_no,table_no,ord_menu,customer_bill,customer_name,captain_name,payment_status) values (?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=DbModel.preparedStatement(con, sql);
		
		pstmt.setDate(1, sqlDate);
		pstmt.setLong(2,Order_no);
		pstmt.setLong(3,table_no);
		//pstmt.setString(4,s2[j]);
		pstmt.setString(4,Order_Menu_Name);
	//	j+=1;
		pstmt.setLong(5,customer_bill);
		//pstmt.setString(6,s2[j]);
		pstmt.setString(6,customer_name);
		pstmt.setString(7,Captain_name);
		pstmt.setString(8,payment_status);
		
	pstmt.executeUpdate();
	//j++;
	
		/*}*/
	}

}
