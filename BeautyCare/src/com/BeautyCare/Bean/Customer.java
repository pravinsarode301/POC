package com.BeautyCare.Bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * @author pravtej
 *
 */

@Entity
@Table(name = "CUSTOMER")
@PrimaryKeyJoinColumn(name="USER_ID")
public class Customer extends User {

	
	@Column(name="REGISTRATION_DATE")
	private Date regDate;
	
	public Customer() {
		// TODO Auto-generated constructor stub
	}


	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
	
	
	
	
	
	
	

}
