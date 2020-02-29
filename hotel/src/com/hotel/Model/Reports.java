package com.hotel.Model;

import java.sql.ResultSet;

import com.hotel.Service.ReportsGetterSetter;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class Reports {
	
	
	public ResultSet Daily_reports(ReportsGetterSetter RGS) throws Exception {
		
		String report_date=RGS.getDaily_report_date();
	
		
		Connection con=(Connection)DbModel.getConnection();
		Statement st=(Statement) DbModel.createStatement(con);
		
		String sql="SELECT * FROM `backup_orders_details` where `c_date`= '"+ report_date +"'";
		
		ResultSet rt=DbModel.executeQuery(st, sql);
		
		
		return rt;
		
	}
	
public ResultSet Monthly_reports(ReportsGetterSetter RGS) throws Exception {
		
		String From_month_report_date=RGS.getFrom_month_report_date();
		String To_month_report_date=RGS.getTo_month_report_date();
	
		
		Connection con=(Connection)DbModel.getConnection();
		Statement st=(Statement) DbModel.createStatement(con);
		
		String sql="SELECT * FROM `backup_orders_details` where DATE_FORMAT(`c_date`,'%Y-%m') BETWEEN '"+From_month_report_date+"' and '"+To_month_report_date+"'";
		//System.out.println(sql1);
		//String sql="SELECT GROUP_CONCAT(`ord_menu`)  as a FROM `backup_orders_details` where `order_no`=2";
		System.out.println(sql);
		ResultSet rt=DbModel.executeQuery(st, sql);
		
		
		return rt;
		
	}
	
	

}
