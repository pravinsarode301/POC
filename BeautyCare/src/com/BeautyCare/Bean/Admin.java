package com.BeautyCare.Bean;

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
@Table(name = "ADMIN")
@PrimaryKeyJoinColumn(name="USER_ID")
public class Admin  extends User  {
	@Column(name="ADMIN_NAME")
private String adminName;

public String getAdminName() {
	return adminName;
}

public void setAdminName(String adminName) {
	this.adminName = adminName;
}




public Admin() {
	// TODO Auto-generated constructor stub
}

public Admin(String adminName) {
	super();
	this.adminName = adminName;
}



	
	
}
