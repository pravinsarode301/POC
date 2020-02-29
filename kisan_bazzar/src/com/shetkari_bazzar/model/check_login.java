/**
 * 
 */
package com.shetkari_bazzar.model;

import java.sql.ResultSet;

import com.shetkari_bazzar.dto.LoginDTO;

/**
 * @author PravTej
 *
 */
public interface check_login {
	public ResultSet user_factory(String sql_query);
	
	public boolean checkAuthontication(LoginDTO dto);
    
    public int updateloginmaster(String sql);
    
}
