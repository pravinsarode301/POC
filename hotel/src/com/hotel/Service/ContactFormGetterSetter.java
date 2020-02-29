package com.hotel.Service;

public class ContactFormGetterSetter {
	
private	String cap_name;
private	String cap_id;
private	String cap_dob;
private	String cap_mob;
private	String cap_email;
private	String cap_jdt;
private	String cap_addr;

//Captain_name
public String getCaptain_name() {
	return cap_name;
}
public void setCaptain_name(String cap_name) {
	this.cap_name = cap_name;
}

//Captain_id
public String getCaptain_id() {
	return cap_id;
}
public void setCaptain_id(String cap_id) {
	this.cap_id = cap_id;
}

//Captain_dob
public String getCaptain_dob() {
	return cap_dob;
}
public void setCaptain_dob(String cap_dob) {
	this.cap_dob=cap_dob;
}

//Captain_mobile

public String getCaptain_mobile(){
	return cap_mob;
}

public void setCaptain_mobile(String cap_mob) {
this.cap_mob=cap_mob;
}

//Captain_email
public String getCap_email(){
	return  cap_email;
}
public void setCap_email(String cap_email){
	this.cap_email = cap_email;
	
}

//Captain_address

public String getCaptain_address() {
	return cap_addr;
}
public void setCaptain_address(String cap_addr) {
	this.cap_addr=cap_addr;
}

//Captain joining date
public String getCaptain_JoingDate() {
	return cap_jdt;
}
public void setCaptain_JoingDate(String cap_jdt) {
	this.cap_jdt=cap_jdt;
}


}
