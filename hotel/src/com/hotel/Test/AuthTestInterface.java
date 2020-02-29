package com.hotel.Test;

import java.sql.ResultSet;
import java.util.List;

import com.hotel.Service.*;

public interface AuthTestInterface {

	
	public LoginformGetterSetter authenticate (String user_name,String password)throws Exception;
	
	public int InsertCaption(ContactFormGetterSetter iform) throws Exception;
	
	public ResultSet GridCaptain_detailShow() throws Exception;
	
	public int OrdersPlaceDetails(OrderDetailGetterSetter ODGS) throws Exception;
	
	public int AddNewItemDetails(AddItemGetterSetter AIGS) throws Exception;
	
	public int updateCaptainDetails(ContactFormGetterSetter iform) throws Exception;
	
	public int updateItemFormDetails(AddItemGetterSetter AIGS) throws Exception;
	
	public int updateOrderFormDetails(OrderDetailGetterSetter ODGS) throws Exception;
	
	public int updateNewPassword(LoginformGetterSetter LFGS)throws Exception;
	
	public int updateUserProfile(ContactFormGetterSetter CfGS)throws Exception;
	
	public ResultSet getDailyReport(ReportsGetterSetter RGS)throws Exception;
	
	public ResultSet getMonthlyReport(ReportsGetterSetter RGS)throws Exception;
}
