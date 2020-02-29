package com.hotel.Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.List;

import com.hotel.Service.*;
import com.hotel.Model.*;

public class LoginDaoImpl implements LoginDao{

	public LoginformGetterSetter authenticate(String user_name, String password) throws Exception {
    int rollid=0;
    ResultSet rs=null;
    DbModel DBI=new DbModel();
  LoginformGetterSetter lf=new LoginformGetterSetter();
  try{
	  Connection con=DBI.getConnection();
	  Statement stmt=DBI.createStatement(con);
	  
	  String sql="select * from login_table where email='"+user_name+"' and password='"+password+"'";
	  rs=DBI.executeQuery(stmt,sql);
	  if(rs!=null){
	  while(rs.next())
	  {
		  
		  lf.setUser_name(rs.getString("email"));
		  lf.setUser_password(rs.getString("password"));
		  lf.setAssignedRoll(rs.getString("role"));
		  lf.setRoll_id(Integer.parseInt(rs.getString("Id")));
	  }
	  }else{
		
	  }
	  
	  
  }catch(Exception e)
  {
	  e.printStackTrace();
  }
  
  
		return lf;
	}

}


