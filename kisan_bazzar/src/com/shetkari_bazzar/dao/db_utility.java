package com.shetkari_bazzar.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

import com.mysql.jdbc.log.Log4JLogger;



public abstract class db_utility {

	/*
	 * this class for the connect the database and this class will be common for
	 * all the and every class so called static connection
	 */
	static	String DB_Path="jdbc:mysql://localhost:3306/shetkari_bazzar_db";
	static	String DB_Username="root";
	static	String DB_Password="";
			
	public  static Connection getConnection() throws Exception {
		Connection con=null;
		
		
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=(Connection)DriverManager.getConnection(DB_Path,DB_Username,DB_Password);
		
	} catch(SQLException e) {

		System.out.println(e+"Connection refused !");
	}
	
	return con;
	}
	
	/*check the database open status*/
	
	public final static boolean isDbConnected() throws Exception {
	    final String CHECK_SQL_QUERY = "SELECT 1";
	    boolean isConnected = false;
	    Connection con=getConnection();
	    try {
	        final PreparedStatement statement = db_utility.preparedStatement(con,CHECK_SQL_QUERY);
	        isConnected = true;
	    } catch (NullPointerException e) {
	        // handle SQL error here!
	    }
	    return isConnected;
	}
	
	
	
	/*
	 * To create the statement and return type Statement.
	 */
	
	public  static Statement createStatement(Connection con){
		Statement stmt=null;
		try{
			stmt=con.createStatement();
		}catch(SQLException e){
			System.out.println("empty statement which cause java.lang.NullPointerException");
		}
		return stmt;
	}
	
	/*
	 * To create the PreparedStatement and return type PreparedStatement.
	 */
	
	
	public final static PreparedStatement preparedStatement(Connection con,String sql) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		try{
			pstmt=con.prepareStatement(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return pstmt;
	}
	
	
	/*
	 * To create the executeUpdate and return type void.
	 */
	
	public final static int executeUpdate(PreparedStatement stmt) {
		// TODO Auto-generated method stub
	int result=0;
	try{
		result=stmt.executeUpdate();
	}catch(SQLException e){
		e.printStackTrace();
		
	}
		return result;
		
}
	
	/*
	 * To create the executeQuery funtion and return type ResultSet.
	 */
	
	public final static ResultSet executeQuery(Statement stmt,String sql)
	{
		
	ResultSet result=null;
	try{
		result=stmt.executeQuery(sql);
	}catch(SQLException e){
		e.printStackTrace();
	}
	return result;
		
	}
	
	/*
	 * To close the connection.
	 */
	
	public final static void closeConnection(Connection con){
		try{
		con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	
	
	/*danny code*/
	
	public final static int executeupdate(Statement stmt,String sql)
    {
        int i=0;
    ResultSet result=null;
    try{
        i = stmt.executeUpdate(sql);
    }catch(SQLException e){
        e.printStackTrace();
    }
    return i;
        
    }

}
