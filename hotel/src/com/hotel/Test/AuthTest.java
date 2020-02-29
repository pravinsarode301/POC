package com.hotel.Test;
import com.hotel.Service.*;

import java.sql.ResultSet;
import java.util.List;

import com.hotel.Model.AlterCaptaindetails;
import com.hotel.Model.AlterItemDetails;
import com.hotel.Model.AlterOrderdetails;
import com.hotel.Model.AlterPassword;
import com.hotel.Model.AlterUserProfile;
import com.hotel.Model.CaptainFormDaoImpl;
import com.hotel.Model.LoginDaoImpl;
import com.hotel.Model.OrderFormDaoImpl;
import com.hotel.Model.OrderMenuDao;
import com.hotel.Model.Reports;
import com.hotel.Service.*;
//import com.hotel.Servlet.OrdersPlaceDetailsServlet;

	public class AuthTest implements AuthTestInterface{
		public  LoginformGetterSetter authenticate(String user_name, String user_password)
				throws Exception {
			// TODO Auto-generated method stub
		
			LoginformGetterSetter form = new LoginformGetterSetter();
			LoginDaoImpl LDI=new LoginDaoImpl();
			form = (LoginformGetterSetter) LDI.authenticate(user_name, user_password);
			
			return form;
		}
	
	@Override
	public int InsertCaption(ContactFormGetterSetter CFGS) throws Exception{
		// TODO Auto-generated method stub

		
			int result=0;
			
				try {
					CaptainFormDaoImpl CFDL=new CaptainFormDaoImpl();
					result=CFDL.insertCaptain(CFGS);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			return result;
	}
	
	
	@Override
	public  ResultSet GridCaptain_detailShow() throws Exception {
		// TODO Auto-generated method stub
		 
		CaptainFormDaoImpl dfgt=new CaptainFormDaoImpl();
		ResultSet rt=dfgt.GridCaptain_detail();
		
		return rt;
	}
	
	@Override
	public int OrdersPlaceDetails(OrderDetailGetterSetter ODGS)
			throws Exception {
		// TODO Auto-generated method stub
		OrderFormDaoImpl OFDI=new OrderFormDaoImpl();
		int s=OFDI.PlaceOrdersDetailsmodel(ODGS);
		System.out.println("OrdersPlaceDetails "+s );
		return s;
	}
	
	
	@Override
	public int AddNewItemDetails(AddItemGetterSetter AIGS) throws Exception {
		// TODO Auto-generated method stub
		
		OrderMenuDao ORDMD=new OrderMenuDao();
int resultbit=ORDMD.insertNewItems(AIGS);
		return resultbit;
	}
	
	@Override
	public int updateCaptainDetails(ContactFormGetterSetter iform)
			throws Exception {
		// TODO Auto-generated method stub
	int result;
	result=AlterCaptaindetails.updateCaptainDetails(iform);
	System.out.println("value of result"+result);
	return result;
	
	}
	
	
	@Override
	public int updateItemFormDetails(AddItemGetterSetter AIGS) throws Exception {
		// TODO Auto-generated method stub
		
		int s=AlterItemDetails.updateItemDetails( AIGS);
		return s;
		
	}
	@Override
	public int updateOrderFormDetails(OrderDetailGetterSetter ODGS)
			throws Exception {
		// TODO Auto-generated method stub
		int s=0;
		try {
			s = AlterOrderdetails.updateOrderDetails(ODGS);
		} catch (ArrayIndexOutOfBoundsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return s;
	}
	
	@Override
	public int updateNewPassword(LoginformGetterSetter LFGS) {
		// TODO Auto-generated method stub
		int i=AlterPassword.alterOldPassword(LFGS);

		
		return i;
		
		
		
	}
	
	@Override
	public int updateUserProfile(ContactFormGetterSetter CfGS)
			throws Exception {
		// TODO Auto-generated method stub
		
		AlterUserProfile.updateCaptainProfile(CfGS);
		
		
		return 0;
	}
	
	
	@Override
	public ResultSet getDailyReport(ReportsGetterSetter RGS) throws Exception {
	// TODO Auto-generated method stub
		
	Reports rt=new Reports();
	ResultSet rs=rt.Daily_reports(RGS);
		
	return rs;
	}
	
	@Override
	public ResultSet getMonthlyReport(ReportsGetterSetter RGS) throws Exception {
	// TODO Auto-generated method stub
		
		
		Reports rt=new Reports();
		ResultSet rs=rt.Monthly_reports(RGS);
		
	return rs;
	}
	
}
