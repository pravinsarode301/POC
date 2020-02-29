package com.hotel.Model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;



import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;
	
	


public class DbModel {
static	String DB_Path="jdbc:mysql://localhost:3306/hotel_db";
static	String DB_Username="root";
static	String DB_Password="";
	
public static Connection getConnection() throws Exception {
	Connection con=null;
	
	
	
try{
	Class.forName("com.mysql.jdbc.Driver");
	con=(Connection)DriverManager.getConnection(DB_Path,DB_Username,DB_Password);
//	con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/hotel_db?user=root&password=");
	
} catch(ClassNotFoundException e) {

	e.printStackTrace();
	
	
}catch(SQLException e){
	
	e.printStackTrace();
	System.out.println("connection refused !");
}
return con;
}

/*public static Connection getConnection() throws Exception {
	// TODO Auto-generated method stub
	Connection con=null;
	try{
		
		 Class.forName("com.mysql.jdbc.Driver");		
	 
	} catch(ClassNotFoundException e) {
	
		e.printStackTrace();
		System.out.println("driver not loading");
		
	}
	//con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/hotel_db?user=root&password=");
	con=(Connection) DriverManager.getConnection(DB_Path,DB_Username,DB_Password);
	return con;
}
	*/

public static Statement createStatement(java.sql.Connection con) {
	// TODO Auto-generated method stub
	Statement stmt=null;
	try{
		stmt=(Statement) con.createStatement();
	}catch(SQLException e){
		e.printStackTrace();
	}
	return stmt;
}

public static PreparedStatement preparedStatement(Connection con,String sql) {
	// TODO Auto-generated method stub
	PreparedStatement stmt=null;
	try{
		stmt=(PreparedStatement) con.prepareStatement(sql);
	}catch(SQLException e){
		e.printStackTrace();
	}
	return stmt;
}



	public static ResultSet executeQuery(java.sql.Statement stmt, String sql) {
		// TODO Auto-generated method stub
	ResultSet result=null;
	try{
		result=(ResultSet) stmt.executeQuery(sql);
	}catch(SQLException e){
		e.printStackTrace();
	}
	return result;
			
}


	public static void executeUpdate(PreparedStatement stmt, String sql) {
		// TODO Auto-generated method stub
	int result=0;
	try{
		result=stmt.executeUpdate(sql);
	}catch(SQLException e){
		e.printStackTrace();
		
	}
	//	return result;
		
}

	public static void closeConnection(Connection con) {
		// TODO Auto-generated method stub
	try{
		con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
}