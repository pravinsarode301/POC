/**
 * 
 */
package com.shetkari_bazzar.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author PravTej
 *
 */
public class DateConvertor {

	public static Date sqlDateConvertor(String StringDate) throws ParseException {
		Date sqlDate = null;
		
		/*create simple date formatter*/
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		/*parse the string date into util date*/
		
		java.util.Date utilDate =  formatter.parse(StringDate);

		/*finally convert util date into sql date*/
		
		 sqlDate = new java.sql.Date(utilDate.getTime());
		
		return sqlDate;

	}

	public static Timestamp getCurrentTimestamp() {
		
		java.util.Date date = new java.util.Date();

		return new Timestamp(date.getTime());

	}

}

/*
 * date conversion ------------------------------------------ Date date = new
 * Date();//util date System.out.println(date); java.sql.Date datesql = new
 * java.sql.Date(date.getTime());//sql date System.out.println("sql date : "
 * +datesql);
 * 
 * 
 * System.out.println("util to sql conversion"); DateFormat df = new
 * SimpleDateFormat("dd/MM/yyyy"); // formated util date String text =
 * df.format(date); System.out.println(text);
 */


//dd/MM/


	/*	String string = Date;
		java.util.Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(string);
		date=new java.sql.Date(date1.getTime());
		*/
		
		/*String string = Date;
		 date = (java.sql.Date) new SimpleDateFormat("yyyy-MM-dd").parse(string);
		 	
		 	java.util.Date utilDate = new java.util.Date();
		    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		    System.out.println("utilDate:" + utilDate);
		*/
		