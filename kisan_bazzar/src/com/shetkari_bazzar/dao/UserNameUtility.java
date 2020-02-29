/**
 * 
 */
package com.shetkari_bazzar.dao;

/**
 * @author pravtej
 *
 */
public class UserNameUtility {

	
	public static String PortalUserName(String str){
		
		
			//String str="nilesh@gmail.com";

			String newStr = str.substring(0, str.indexOf("@"));
			System.out.println(newStr);
			String shetkari=(newStr+"@shetkari-bazzar.com");
			System.out.println(shetkari);
		
		
		return shetkari;
	}
	
	
	
	
	
	
	
}
