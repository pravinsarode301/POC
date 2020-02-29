package com.hotel.Model;

import java.util.List;

import com.hotel.Service.*;



public interface LoginDao {
	
    public LoginformGetterSetter authenticate(String user_name,String password) throws Exception;


}
