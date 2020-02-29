package com.hotel.Service;

public class OrderDetailGetterSetter {
	
	private	String customer_name;
	private	String Order_Date;
	private	String table_no;
	private	String Order_no;
	private	String Captain_name;
	private	String Order_Menu_Name;
	private	String item_Quantity;
	private String total_bill_amount_done;
	private String countOrders;
	private String backup_tableno;
	
	
	public String getBackup_tableno() {
		return backup_tableno;
	}
	public void setBackup_tableno(String backup_tableno) {
		this.backup_tableno = backup_tableno;
	}
	public String getCountOrders() {
		return countOrders;
	}
	public void setCountOrders(String countOrders) {
		this.countOrders = countOrders;
	}
	
	public String getTotal_bill_amount_done() {
		return total_bill_amount_done;
	}
	public void setTotal_bill_amount_done(String total_bill_amount_done) {
		this.total_bill_amount_done = total_bill_amount_done;
	}
	/*getCustomerNname*/
	public String getCustomerNname() {
		return customer_name;
	}
	public void setCustomerNname(String customer_name) {
		this.customer_name = customer_name;
	}
	
	/*getOrderDate*/
	public String getOrderDate() {
		return Order_Date;
	}
	public void SetOrderDate(String Order_Date) {
		this.Order_Date = Order_Date;
	}
	
	/*getTableNo*/
	public String getTableNo() {
		return table_no;
	}
	public void setTableNo(String table_no) {
		this.table_no = table_no;
	}
	
	/*Order_no*/
	public String getOrderNo() {
		return Order_no;
	}
	public void setOrderNo(String Order_no) {
		this.Order_no = Order_no;
	}
	
	/*Captain_name*/
	public String getCaptainName() {
		return Captain_name;
	}
	public void setCaptainName(String Captain_name) {
		this.Captain_name = Captain_name;
	}
	
	/*Order_Menu_Name*/
	public String getOrderMenuName(){
		return Order_Menu_Name;
	}
	public void setOrderMenuName(String Order_Menu_Name){
		this.Order_Menu_Name = Order_Menu_Name;
		
	}

	/*item_Quantity*/
	public String getItemQuantity(){
		return item_Quantity;
	}
	public void setItemQuantity(String item_Quantity){
		this.item_Quantity = item_Quantity;
		
	}
	
}
