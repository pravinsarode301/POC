package com.hotel.Model;

import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.Connection;

public interface DbModelInterface {

	public Connection getConnection();
	public  Statement createStatement(Connection con);
	public  ResultSet executeQuery(Statement stmt,String sql);
	public  void closeConnection(Connection con);
	
}
