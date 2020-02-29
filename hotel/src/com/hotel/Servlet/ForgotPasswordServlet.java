package com.hotel.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.Model.DbModel;
import com.hotel.Service.LoginformGetterSetter;
import com.hotel.Test.AuthTest;
import com.hotel.Test.AuthTestInterface;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");  
		PrintWriter out=response.getWriter();
		String user_name=request.getParameter("email");
		String user_new_password=request.getParameter("newpassword");
		String user_re_new_password=request.getParameter("renewpassword");
		String user_password=null;
		
		
		
	    ResultSet rs=null;
	    DbModel DBI=new DbModel();
	    try{
	  	  Connection con=DBI.getConnection();
	  	  Statement stmt=DBI.createStatement(con);
	  	  //Statement stmt=DBI.createStatement(con);
	  	 // con.setAutoCommit(false);
	  	  String sql="select * from login_table where email='"+user_name+"'";
	  	  rs=DBI.executeQuery(stmt,sql);
	  	  if(rs!=null){
	  	  while(rs.next())
	  	  {
	  		  
	  		System.out.println(rs.getString("email"));
	  		out.println(rs.getString("email"));
	  	  }
	  	  }else{
	  		  System.out.println("Sorry!Unable to load the database,empty resultset ");
	  	  }
	  	  
	  	  
	    }catch(Exception e)
	    {
	  	  e.printStackTrace();
	    }
	    
	    
		
		
		
		
		
		
		
		if(user_new_password.equals(user_re_new_password)){
			
			user_password=user_new_password;
			
		}
		
		LoginformGetterSetter LFGS=new LoginformGetterSetter();
		LFGS.setUser_name(user_name);
		LFGS.setUser_password(user_password);
		
		AuthTestInterface ATF=new AuthTest();
		
		try {
			int i=ATF.updateNewPassword(LFGS);
			if(i==1){
				request.setAttribute("updatePswdSuccessMsg", "Your password has been successfully updated !");
				
				
				
			}else{
				request.setAttribute("updatePswdErrorMsg", "Your password not been update !");
			}
			RequestDispatcher rd=request.getRequestDispatcher("ForgotPassword.jsp");
			rd.include(request,response); 
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
		
		
	}
}
