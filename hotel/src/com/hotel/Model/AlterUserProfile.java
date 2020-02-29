package com.hotel.Model;

import com.hotel.Service.ContactFormGetterSetter;

public class AlterUserProfile {

	public static int updateCaptainProfile(ContactFormGetterSetter CfGS) throws Exception {
		// TODO Auto-generated method stub
		
		
		String cap_name=CfGS.getCaptain_name();
		String cap_id=CfGS.getCaptain_id();
		String cap_dob=CfGS.getCaptain_dob();
		String cap_mob=CfGS.getCaptain_mobile();
		String cap_email=CfGS.getCap_email();
	
		String cap_addr=CfGS.getCaptain_address();
		
		String sql="update captain_detail set cap_name='"+cap_name+"',cap_dob='"+cap_dob+"',cap_mob='"+cap_mob+"',cap_email='"+cap_email+"',cap_addr='"+cap_addr+"' where cap_id="+cap_id+"";
		
		
		int s=DbModel.getConnection().createStatement().executeUpdate(sql);
		if(s==1){
			System.out.println("success");
		}else{
			System.out.println("failed");
		}
		return s;
	}
	
	
}
