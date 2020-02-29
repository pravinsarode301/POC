/**
 * 
 */
package com.shetkari_bazzar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.shetkari_bazzar.dao.db_utility;
import com.shetkari_bazzar.dto.LoginDTO;

/**
 * @author PravTej
 *
 */
public class check_login_impl implements check_login {
	
	UserModel usermodel= new UserModelImpl();
	
	@Override
	public ResultSet user_factory(String sql_query) {
		// TODO Auto-generated method stub
		ResultSet rt=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		Statement stmt=null;

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		 
		
		try {
			stmt=db_utility.createStatement(con);
			rt=db_utility.executeQuery(stmt, sql_query);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("empty statement which cause java.lang.NullPointerException");
		}
		
		return rt;
		
	}
	
	
	
	/*danny code*/
	
	
	@Override
    public int updateloginmaster(String sql) {
        int i=0;
        Connection con = null;
        PreparedStatement pstmt = null;
        Statement stmt=null;

        try {
            con = db_utility.getConnection();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

         
        
        try {
            stmt=db_utility.createStatement(con);
            i=db_utility.executeupdate(stmt, sql);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("EXCEPTION OCCURED WHILE UPDATING QUERY : "+e);
        }
        
        return i;
        
    }
	
	
	
	
	@Override
    public boolean checkAuthontication(LoginDTO dto) {
        Statement st=null;
        ResultSet rt= null;
        String sql = "select * from login_master WHERE username='"+dto.getUsername()+"'";
        System.out.println("i am in checkAuthontication : -"+dto.getRandompass());
        System.out.println("i am in checkAuthontication : -"+dto.getUsername());
        
        
        try {
            rt =usermodel.Get_User_Detail(sql);
            while(rt.next()){
                String username = rt.getString(2);
                String randompass = rt.getString(4);
            if(username.equalsIgnoreCase(dto.getUsername())){
                System.out.println("from data base  :- "+rt.getString(2));
                System.out.println("from data base  :- "+rt.getString(4));
                System.out.println("i  am in the checkAuthontication method");
                return true;
                
                
            }else{
                return false ;
            }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        
        return true;
        
    }
	
	

}
        
        
        
